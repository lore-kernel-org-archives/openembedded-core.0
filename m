Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 11CCB60556
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 15:17:19 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id n8so12833904qaq.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 07:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TxpVmojt0WaeNmZ0GYeSTYrXlPU/dzkYbfcXrcXf7LQ=;
	b=AiLFul9ykTbCDQTFCxbKD/45/CvPxDUNRYJVsCsT1nBtXuZ44LJjky/WChboSeg3mb
	8UfLnrXiK1F2QhXevQkSlwR4d7K+5DYM1aBjPDq/BXWilsmJnphLBllRVrHITYA2neCX
	f0JFloCW5eZFnGwYCgDmTBsaLRTpffrHWHD7lezA5aL4h/TIvqqoPIjuDSRz37+JvAyf
	WjVnmgwbecX3CqZxmwJ99ZPLZEZMA33PoUSpmR7Mjqc90DfBbFDv3oYmeoQGN3Pg0wT+
	zeynovmTMQfIWhIJR/RHCFCy/zXOwlz8/Mk2T3YapiB8GtaRXmUctDWIrhpKaKHMeH23
	AClg==
X-Gm-Message-State: ALoCoQmeFVuT/ZG7+26n2EApKV1NEBxajaSvgpft5WlLK+Os67aNkKiAn0Xk2gQb6Z7RiUD1ZJQT
X-Received: by 10.140.150.87 with SMTP id 84mr2607857qhw.64.1423840641044;
	Fri, 13 Feb 2015 07:17:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 07:17:00 -0800 (PST)
In-Reply-To: <20150213065621.GA7102@windriver.com>
References: <1423699224-19243-1-git-send-email-paul.gortmaker@windriver.com>
	<54DC2479.7050507@urbanec.net> <20150213065621.GA7102@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Feb 2015 15:17:00 +0000
Message-ID: <CAJTo0LaNZM_X9KeHS9DWqQ_uEbxw5=Bh7JPWLJoyZJDnzueBiQ@mail.gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mozjs: fix build failure due to missing dependency on libxt
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
X-List-Received-Date: Fri, 13 Feb 2015 15:17:20 -0000
Content-Type: multipart/alternative; boundary=001a1135492ea06c2a050ef9bb3d

--001a1135492ea06c2a050ef9bb3d
Content-Type: text/plain; charset=UTF-8

On 13 February 2015 at 06:56, Paul Gortmaker <paul.gortmaker@windriver.com>
wrote:

> DEPENDS_append =
> "${@bb.utils.contains('DISTRO_FEATURES','x11','libxt','',d)}"
>
> ...or perhaps:
>
> EXTRA_OECONF_X = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> '--with-x', '--without-x', d)}"
>

I'm mostly surprised the mozjs has an X11 dependency at all, but yes
something like respecting DISTRO_FEATURES to enable/disable X11 is
sensible, unless the X11 support is so meaningless it might as well be
disabled globally.

Also, wrong list - this is in meta-oe so should go to the
openembedded-devel@ list.

Ross

--001a1135492ea06c2a050ef9bb3d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2015 at 06:56, Paul Gortmaker <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@w=
indriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":hpg" class=3D"a3s" style=3D"overflow:hidden">DEPENDS_append =3D &quot=
;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,&#39;x11&#39;,&#39;libxt&#3=
9;,&#39;&#39;,d)}&quot;<br>
<br>
...or perhaps:<br>
<br>
EXTRA_OECONF_X =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;x11&#39;, &#39;--with-x&#39;, &#39;--without-x&#39;, d)}&quot;</div></bl=
ockquote><div><br></div><div>I&#39;m mostly surprised the mozjs has an X11 =
dependency at all, but yes something like respecting DISTRO_FEATURES to ena=
ble/disable X11 is sensible, unless the X11 support is so meaningless it mi=
ght as well be disabled globally.</div><div><br></div><div>Also, wrong list=
 - this is in meta-oe so should go to the openembedded-devel@ list.</div><d=
iv><br></div><div>Ross</div></div></div></div>

--001a1135492ea06c2a050ef9bb3d--
