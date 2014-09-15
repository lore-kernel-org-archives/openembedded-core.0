Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id F3F947143F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:02:03 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id m5so3784331qaj.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WBdLcpM8wmEpqAyemgKw4UAu7hMdsy+qZ48XU9lG47U=;
	b=isyzEnCkw0poC5X9jD77ZBBQWGcjAeg1mhHKYKOnQGyeJJ1sI/GSu24+O4ok4bDb7Y
	8tLEDXDv1aOz8qksgpeBBymDcIdKM8ydmI5A9z4UQZFTtdJX+9FBCvdLVFjI7dC1Q/+u
	ywP6E7H2h8hdEvENqFy1ku0LuYbcmJUcE6c64hU2PTDalNBPkWXsXswP7VjqRmr/MHEy
	PK6YMnuKdhtuO55EITTod2aEHKa5bsVLp7XMnTcJyMj1Tzj4bRlNpGrXuPPFUA8hZlAg
	bYp0UEh1aoXvnC3l2Rl2mw+3UzYd/yBsRTtU72orVNz/zepASq4sAWonn7ESm18tq1/7
	cyrQ==
X-Gm-Message-State: ALoCoQnAs1jYvqoQXaeHZLtTyCGI4DjTX4+U3nY/3GSUS34ALL1sIbzKIqMSMN9psb0cwJLjROaW
X-Received: by 10.224.103.65 with SMTP id j1mr36889666qao.17.1410789722409;
	Mon, 15 Sep 2014 07:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:01:42 -0700 (PDT)
In-Reply-To: <5416E407.4050703@windriver.com>
References: <cover.1410247971.git.liezhi.yang@windriver.com>
	<b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
	<CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
	<5416E407.4050703@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:01:42 +0100
Message-ID: <CAJTo0LZsfdkvr7vsyvCzdK8mvn81jLk-FBdQf6D0SOhOvANuOA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and enable libxml2-python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Sep 2014 14:02:04 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 14:05, Robert Yang <liezhi.yang@windriver.com> wrote:
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[python] =
> +EXTRA_OECONF_class-native = "--with-python=${PYTHON} --without-legacy
> --without-docbook --with-c14n --without-lzma --with-zlib"

You should remove the python arguments from all overrides of
EXTRA_OECONF and instead have PACKAGECONFIG overrides to add them
back.  With this patch, native builds are passed --without-python
--with-python (one from EXTRA_OECONF, one from the disabled
PACKAGECONFIG).

Ross

