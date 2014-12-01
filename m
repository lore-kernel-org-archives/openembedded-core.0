Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8877865E1A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Dec 2014 15:21:06 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id bm13so7230390qab.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Dec 2014 07:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LwbVVNObRxubHWmRZiJCZPlW4wJj01eCJreirMVLbtM=;
	b=RZG4h23JMtUrIqxijBfV2azVBeNWZJ+DXTiPRRdXn8jTYT8FfykEB9YRRewDNdgMJn
	Ps5QGKNHVVm46NBtWhMgczWYFEIcu1K//xDanbTJOsSEjZVPxAkLvrBIeIfVvFMz0pW/
	ie+tpR7yvzYlfo8e8/pBrGgdY5DI4O2T5Gsjht3PfcgB59kECwc0e3KD5XAz6rie9Thv
	+sBa/UsimB1fU0lLpoOpS3bBUvjIl8l2T2OY7KuFAhxYz+E9hEgrkVLOMdkmbtAj4Tfu
	QKq1/3OsdYfCVXVZHVGDpid/+pCpV69gYAIWhRYxwQDVujCoffPGlR0GO7/cIal1cmBI
	8+kg==
X-Gm-Message-State: ALoCoQkDC2BLP1dqcJHWv570YhibSDLWHIJYXwsLJd1aoOngY7eFBWVxHTNjh61zJNHT28ZNpVFD
X-Received: by 10.140.96.101 with SMTP id j92mr85729415qge.87.1417447266445;
	Mon, 01 Dec 2014 07:21:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 1 Dec 2014 07:20:46 -0800 (PST)
In-Reply-To: <1417446810.15614.28.camel@linuxfoundation.org>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<201409190914.03281.marex@denx.de> <1411111512.4736.11.camel@ted>
	<201409211802.17872.marex@denx.de>
	<CAJTo0Lbk2eOtBbOFj5d8oEpW6N9p3wmuw5kUMEqzsRKPyakt6w@mail.gmail.com>
	<1417446810.15614.28.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Dec 2014 15:20:46 +0000
Message-ID: <CAJTo0LYV6poNs3YNvNsthcPa2VYuqYDb-e_BkEDyDVRvSuOtXQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Marek Vasut <marex@denx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
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
X-List-Received-Date: Mon, 01 Dec 2014 15:21:10 -0000
Content-Type: multipart/alternative; boundary=001a113a9d8ace211f05092928f4

--001a113a9d8ace211f05092928f4
Content-Type: text/plain; charset=UTF-8

On 1 December 2014 at 15:13, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Make nativesdk-python-core RRECOMMEND python-modules?
>

Makes sense, and is clean.  Patch incoming.

Ross

--001a113a9d8ace211f05092928f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 December 2014 at 15:13, Richard Purdie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.pu=
rdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":o2" class=3D"a3s" style=3D"overflow:hidden">Make nativesd=
k-python-core RRECOMMEND python-modules?<br></div></blockquote></div><br>Ma=
kes sense, and is clean.=C2=A0 Patch incoming.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a9d8ace211f05092928f4--
