Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TcM8a-0000Cc-Dg
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Nov 2012 21:15:43 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 24 Nov 2012 12:01:29 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so6683617iec.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Nov 2012 12:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=tvySNtH5IEzEu43ka2/a2dJjWJib1XA34BxQWEBFEKs=;
	b=J67fpD/RtSZqJmQDrUrAUfSA/3Jp2/tYDIk8InOs3nv5U/JUc6PRoQz7NWNCrXhy3E
	arYg/t3uAF63VBP5MMITgn9cEGDwpGOGVnCl6+vFedVX3/NVwMB27eBFpcmMCn9YtCWg
	ddL/PUfgBViJN3ca6aHhA0JQRQnrGsiFIluCdKmFyfAwob+v5WMB6EcBa/SYK+xIS/lv
	HvI86+vE2RAcjxrtdxbFZrm25WhrRAsl/1D1Ti9xh0CEH4IUL22JKhxfBXZ2i7EIr5SD
	WX0uYgqRkaMETVxmxcN5IbLL5jLlKnH4xUR5taejJBjQAG53bKv2e//ciso560/Pc0OI
	hotg==
Received: by 10.60.25.132 with SMTP id c4mr5748323oeg.63.1353787288270;
	Sat, 24 Nov 2012 12:01:28 -0800 (PST)
Received: by 10.60.25.132 with SMTP id c4mr5748320oeg.63.1353787288129; Sat,
	24 Nov 2012 12:01:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Sat, 24 Nov 2012 12:01:08 -0800 (PST)
In-Reply-To: <50B0B96A.5050100@communistcode.co.uk>
References: <1353749685-12585-1-git-send-email-cazfi74@gmail.com>
	<20121124102959.GA63007@gmail.com>
	<50B0B96A.5050100@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 24 Nov 2012 20:01:08 +0000
Message-ID: <CAJTo0LYYZTu3gW=x9Dz==56hn0QPxWpPSMRekMB3xbDArgf2TQ@mail.gmail.com>
To: ml@communistcode.co.uk
X-Gm-Message-State: ALoCoQlo69jFbenwD20vny91GD9m8NFmlyrWsNJckRjgBFqgC/n5OCvWJqhtxl6PoEV7fOz5e/FwOnEaZR60T3Bn66Yrhob9rWMhxT/jk0AYYup/5TN2KJWSPjPWsBW3YpiAjQwhvH6A9nMDvTkzSb2jFyp4C9xv1z2nC9sC5SzPZzKjaagG7W+uPu4eNOSzi72EN6UHL49t
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] automake: update to upstream version 1.12.5
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
X-List-Received-Date: Sat, 24 Nov 2012 20:15:43 -0000
Content-Type: text/plain; charset=UTF-8

On 24 November 2012 12:11, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> Shouldn't it be "r0" for packages that change version?
> Or even nothing at all in the initial version I believe.

Nothing at all will default to "r0".

Whether to include the redundant PR=r0 in the bb, or whether to have
it appearing/disappearing in the logs, is hopefully an argument we'll
never have again when oe-core 1.4 has the PR service integrated.

Ross


