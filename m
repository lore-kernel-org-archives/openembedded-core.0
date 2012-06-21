Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1ShioK-0002op-Ox
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 16:56:41 +0200
Received: from mail-qa0-f51.google.com ([209.85.216.51])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 07:45:29 -0700
Received: by qaea16 with SMTP id a16so1658681qae.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 07:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Ip5zBRq315hdi8QJbScVV6Y+LsEa9VBZeJ67NsJYSrU=;
	b=knri1R2gD7cptS0ksIHGdgfiC2zaM3ZDZ0pvSpLJzmoOpfPEQ6AB/B32jhBfK02v7U
	GYvpDUWXP+gbwWiCz/DKtRDrSwwv/SLcGkPEgzZLFJVYO65XvM3sxmySIXTv3LXBY6zK
	xHNy6J2/BVl5cfvndQFOy/R82rq3VdnrmouGNJcNC4O4oFBDQzW//WjfoqpEcBh06yBO
	CP1xHAo8EL2X11rpRLjibbK1foXM6zk+mqypTHlPeTyZK3Y/PciB6/V4l1sElgN7F/Mg
	wjxt+052XHWN5LdKATuglkjirVLSbtpk+nkzb7fkSun453qzcbOgXK1dWo+M8nMN9P6M
	qc/g==
Received: by 10.224.187.11 with SMTP id cu11mr40540622qab.24.1340289927792;
	Thu, 21 Jun 2012 07:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.101.202 with HTTP; Thu, 21 Jun 2012 07:45:07 -0700 (PDT)
In-Reply-To: <6BA43A2F-5293-4CBD-9DE7-39D3ABD0AF88@dominion.thruhere.net>
References: <CAJTo0LZc57=-7fEto_2dEL=yjDDoKH=HntQQFLTzZo=tqBSxcw@mail.gmail.com>
	<6BA43A2F-5293-4CBD-9DE7-39D3ABD0AF88@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jun 2012 15:45:07 +0100
Message-ID: <CAJTo0LaF6SdeTgJSJw8gh7ETDSqgQrLdi_8e1a+jCjAx39m=_w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkfsH7ZdOevF3elie3wOGTXCOiFoVDFI57/tYRkRgw9ZXNUHSQzsiuYiF66qdyWMME8wZE2
Subject: Re: [RFC] Fetching single files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Jun 2012 14:56:41 -0000
Content-Type: text/plain; charset=UTF-8

On 21 June 2012 15:30, Koen Kooi <koen@dominion.thruhere.net> wrote:
> We didn't do single file fetches/checkouts in the past because it's a svn 1.6.x feature. I would be really happy if we declare that 1.6.x is the minimum we support. I would be even happier if we just fetch webkit (completely) from git :)

1.6.0 was released in 2009, that seems old enough now.  Even Debian
Stable ships 1.6.12. :)

WebKit from git is still a good 3GB to clone[1], and more importantly
only mirrors WebKit trunk so the 1.8.x series isn't even on it.

Ross

[1] well, a colleague puts his WebKit/.git/ at 3.3G, which much
approximate the download size


