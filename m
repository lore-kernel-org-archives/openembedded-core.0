Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id AD7A473E89
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 20:25:09 +0000 (UTC)
Received: by qcbdu2 with SMTP id du2so6787279qcb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 13:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jHDe1D+CxX6pD042sy+Rzba9hf/DEta/cmwvJIredmM=;
	b=m15NMq+pCIsx3XF8nrxEkeyKzfhK30BU3axBVP6nUnyFIYWLYyW+Vpktii999JjaKS
	hZFY3meayEoO/MEyPmFIHh80/WhIc/gA8RzmuJmvgFm0VE34GABsuJZ/zyLNLaeY/lSg
	oC5cwKRvDWNECqwhj2meLpGxaOx4n90Dg7PpPtrD2aHNn1tHQ39USF8mnwDm9/DlxZqh
	mCWkcp5zZcWkKzRBUAMe8dVXn15IgsTXBu+yZFuciYHWufuoOC3btvNvpOZXPixfRooX
	IhV1ez/0ZPMRClkUXNFsAqrZJAd0Vfd64/+dTM2lkxkDTTWe/b8tD0TOMzbpleEV8sXa
	n64g==
X-Gm-Message-State: ALoCoQl7jisvKxKD48SkVkI3fhWNrKxc1ZVyZsWmvNIY6e8ifxlcQyRX5jbXXX9nEo++k1GmJU46
X-Received: by 10.140.149.147 with SMTP id 141mr14502090qhv.17.1430511911080; 
	Fri, 01 May 2015 13:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 13:24:50 -0700 (PDT)
In-Reply-To: <1429814827.26983.119.camel@linuxfoundation.org>
References: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
	<2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZd_CSOVW9j07d19fARwvkFuj3LgaizQO7Dr3xg_mpd-A@mail.gmail.com>
	<1828695.sPIXEUjWsd@peggleto-mobl.ger.corp.intel.com>
	<1429814827.26983.119.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 21:24:50 +0100
Message-ID: <CAJTo0LbBMnBK-mFZCLS40_OJTQTmcJAnoB=yAXTM5zydaNOVAQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] testimage: regenerate rootfs before testing
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
X-List-Received-Date: Fri, 01 May 2015 20:25:11 -0000
Content-Type: multipart/alternative; boundary=001a113768164eab0e05150b024a

--001a113768164eab0e05150b024a
Content-Type: text/plain; charset=UTF-8

On 23 April 2015 at 19:47, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> This was discussed long ago and there are two different tasks as a
> compromise. testimage_auto runs automatically after a rootfs is built
> and has the correct dependencies. "testimage" is triggered manually. The
> autobuilder actually uses testimage so it can be explicit about which
> images get tested.
>

The use-case was Cristi editing a recipe and running bitbake myimage -c
testimage with the expectation that the image gets rebuilt before testing.
This isn't unreasonable at currently the only way to do this is bitbake
myimage && bitbake myimage -c testimage.

If testimage_auto is merged with testimage I presume there'll be some
variable to control the behaviour.  Could we extend it to have an option to
make the image depend on the rootfs generation to cover all three use-cases?

Ross

--001a113768164eab0e05150b024a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
3 April 2015 at 19:47, Richard Purdie <span dir=3D"ltr">&lt;<a href=3D"mail=
to:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie@lin=
uxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":5hq" class=3D"a3s" style=3D"overflow:hidden">This was discussed l=
ong ago and there are two different tasks as a<br>
compromise. testimage_auto runs automatically after a rootfs is built<br>
and has the correct dependencies. &quot;testimage&quot; is triggered manual=
ly. The<br>
autobuilder actually uses testimage so it can be explicit about which<br>
images get tested.</div></blockquote></div><br>The use-case was Cristi edit=
ing a recipe and running bitbake myimage -c testimage with the expectation =
that the image gets rebuilt before testing.=C2=A0 This isn&#39;t unreasonab=
le at currently the only way to do this is bitbake myimage &amp;&amp; bitba=
ke myimage -c testimage.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">If testimage_auto is merged with testimage I presume the=
re&#39;ll be some variable to control the behaviour.=C2=A0 Could we extend =
it to have an option to make the image depend on the rootfs generation to c=
over all three use-cases?</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a113768164eab0e05150b024a--
