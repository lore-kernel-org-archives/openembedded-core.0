Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id BEEA66AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 15:53:59 +0000 (UTC)
Received: by qkx62 with SMTP id 62so88313291qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:54:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6AB7X0/p0lvj1/IKwg0LGz1TqDWHA0nwdjS2u2E1b0I=;
	b=LnX48cp7/Hx9Paax25CUjWWF4udvtfIVDE1BLBZQeCFf0TNYzxXx9R/QPV2fXucJzq
	/lzXVJUommFGiSyzcWJOXCEjquMMpHYWcoJ5KYXs2/gJMtEsgYDyl+2Ew7QY299+YX3R
	ss+fvwrw9KACFDARMa2VLx+lRFLaUGOoyFhHMm5SK9v33mmlTxCyWiXVFhOaf64kx61P
	R5ssvcKl1JpZ3FopIta7WZxShS91GL/WZzgjM6+cfMP5UBu1wPkgLPg9B4rZPCJC7UNq
	Iwzia1AYcVAb8pZwuAwUgpwQ8V35MOPm39ExbQhwC3S90Vk1mQItcZtjVY0stO4Yha9n
	KBWg==
X-Gm-Message-State: ALoCoQkwTf94PCGyr4fxDcQK9fsIFhSeYSohO5l0f7aPrUs5pgHZHzB497d3GzBXdObdgEf7vpys
X-Received: by 10.55.20.10 with SMTP id e10mr53785519qkh.36.1429113215627;
	Wed, 15 Apr 2015 08:53:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 08:53:15 -0700 (PDT)
In-Reply-To: <1429112256.4407.8.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-5-git-send-email-bruno.bottazzini@intel.com>
	<CAHiDW_F8MKf1yWW3y=QOxX02Jjgs1HdZn1PDgL9bFLuMJh+jfA@mail.gmail.com>
	<1427892736.17257.8.camel@bottazzini-ThinkPad-T430>
	<CAJTo0LbHCBbBWoponKB=HEqGGDTY4bb_XtW011--yBO5LXEmjQ@mail.gmail.com>
	<1429112256.4407.8.camel@bottazzini-ThinkPad-T430>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 16:53:15 +0100
Message-ID: <CAJTo0LY5pU6zSG9RcL_jEECBMnMYSL-UH8bXnB7ifmfsLAoCSA@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] systemd: v219 with stable fixes
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
X-List-Received-Date: Wed, 15 Apr 2015 15:53:59 -0000
Content-Type: multipart/alternative; boundary=001a1137de328fc87d0513c559d0

--001a1137de328fc87d0513c559d0
Content-Type: text/plain; charset=UTF-8

On 15 April 2015 at 16:37, Bottazzini, Bruno <bruno.bottazzini@intel.com>
wrote:

> No problem, I will change the patch to use it the stable branch which I
> think it will be better.
>
> I will send this asap...
>

Patches for the stable branch are generally only accepted once they've been
proven in master, so a patch changing the master systemd to use the git
branch to verify they don't break something is the first step.

Ross

--001a1137de328fc87d0513c559d0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 16:37, Bottazzini, Bruno <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruno.bottazzini@intel.com" target=3D"_blank">bruno.bottazzini@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2gr" class=3D"a3s" style=3D"overflow:hidden">No problem, I will change=
 the patch to use it the stable branch which I<br>
think it will be better.<br>
<br>
I will send this asap...<br></div></blockquote></div><br>Patches for the st=
able branch are generally only accepted once they&#39;ve been proven in mas=
ter, so a patch changing the master systemd to use the git branch to verify=
 they don&#39;t break something is the first step.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1137de328fc87d0513c559d0--
