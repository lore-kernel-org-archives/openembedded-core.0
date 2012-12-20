Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TlhcC-0004Qg-Cj
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 16:00:53 +0100
Received: from mail-qc0-f198.google.com ([209.85.216.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 06:46:06 -0800
Received: by mail-qc0-f198.google.com with SMTP id l35so4916091qco.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 06:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ljhCj9L+Q5HRfWWanWE9KTpiFc/DzGGc1wSZmzczjgk=;
	b=MmZVu64l4DLO2Rn2RefI5vQqNkwa0489bnT0yOg5BSEEUfx1A7/0RRaL2zBtxlo8Wc
	wnXj6DOaH9eK4R+GDPr9HGi/bXzo+SsPrxqnTZF6pUFp69rSaVUM0w1RLdELAmad7j0k
	pVqb4sATenDRugut2nyNhuGgwMUn4VEtLK3MFz4SPvOOibOKDhxUzZ4OV65kt9jPIQie
	sSm3E9Q/736rLGYN6Uj/NtF9NXBakw12DXs+tpipQpXC8Zhj/QTVxqBwajWN0GLn03vI
	U6NHdDxvwmBHuhPnreGU+8DWi75LemKSNGKYAo+5uIDrPucLcydMFL1ei5XuD8w1KL6M
	0cpg==
X-Received: by 10.220.219.145 with SMTP id hu17mr14487471vcb.52.1356014765533; 
	Thu, 20 Dec 2012 06:46:05 -0800 (PST)
Received: by 10.220.219.145 with SMTP id hu17mr14487269vcb.52.1356014763329;
	Thu, 20 Dec 2012 06:46:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 06:45:43 -0800 (PST)
In-Reply-To: <1356009340-15874-3-git-send-email-laurentiu.palcu@intel.com>
References: <1356009340-15874-1-git-send-email-laurentiu.palcu@intel.com>
	<1356009340-15874-3-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 14:45:43 +0000
Message-ID: <CAJTo0LYma0w+_--ptZ5Tsrwqgc9CJOvGWCpKdWW30reOCXQoig@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQk7tFJtty4UMlZcPcXmS2A07HqzVxdrWszaZd8P7WKF04VSceE8qWV137PYD6OhQZlWTB7au0rDOMy9F8GPAyuI94OfQDbTDe0pHjW5p2PXrrHlZPB72KsxVjrgMLQQ69e0dhFSjc2Zs5GJ4fOLW5SlsaVFCIh+Nd9GSck98VAlh2mMUOTLxQLhsiihu6xnzaDo2fKw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/3] gtk-immodules-cache.bbclass: allow for offline cache generation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Dec 2012 15:00:55 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> In order to support a RO rootfs, the cache generation during postinstall
> has to be done on host. However, gtk-query-immodules application will
> only be able to parse shared objects from the same ELF class.
> In order not to have a native package for all the recipes providing
> an input method, so we can generate the cache file natively, run
> gtk-query-immodules through qemu emulator.

Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross


