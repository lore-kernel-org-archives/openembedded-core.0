Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8D5B177A37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 11:34:23 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id f11so35257110qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pg+Gxb2ocxklnNTYmQU3N4Qfl//5X0EPoExfSLmq7Ok=;
	b=EsT2BkuYKYs4WtgaAMkz2Z0NXZk9MQhfNf+tKb3SO+hX7Gix73/ESdyh7Zz+MQeyc/
	/thMSREDmTG6xb7+lXWJ1fwPGge5/ldgK5fpAnU4Dltj28gYEsU+pJxMBSdC2E8uIGHu
	OcLmIPL4OgOLmBEzqydUSXpOfrKWPy9Ec9jrUYbEd/031OMP9zzMAYycP+TxHkG/0wk/
	raln9XMQ7TDCWLKth6aKGkugvD2OA9pKE3qfKHMXx4J8+zEjgRS73ZEb1YRkB5wifZRC
	Qhaa66kr1ymcR2qGAyuuUwZT22y3bU1Awa78/Xt1nQ+fO3iL7hpwQAIshcTke8TFZupw
	XZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pg+Gxb2ocxklnNTYmQU3N4Qfl//5X0EPoExfSLmq7Ok=;
	b=MmRWlJRHAZDFZmQJ82zokZNiuTYqMd/51jIWiXMUvnjgZjyXR2u6CWSZP2XlfFKILK
	TLPhhoZCFxr5SUPfuNheqvXNqci+fpUQvUq7JHEwemXvz5UIBmyyynDiJHPUM68BBAII
	Ed/TkqmW1X0SQ5LoQuRzdrRJH32ka6VSzkbskgAREUamaNboAtH55fzt9+mD23D8lLWt
	MqrnaL7rJHvr/l6H+4hWjfLxR36XMoayiZtfkeDbTReW0BMHz01N9PxT2KzWyNMAI+3E
	AIA9eH6LT8xt3LFv+ZHufxQDZfgAIJfIoiJlLFrpd/hkGotl47CskjSyPPo7mc16UDJN
	D/Pg==
X-Gm-Message-State: AFeK/H0MWBXP6EVt4INfeAWBd07MWdkQjBsPW+0RVOPKC9+53ELciu4sO8WVhFNYrjeiaC3lvstm0XwvPvL+KFad
X-Received: by 10.55.108.195 with SMTP id h186mr22194640qkc.36.1490614464417; 
	Mon, 27 Mar 2017 04:34:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 27 Mar 2017 04:34:03 -0700 (PDT)
In-Reply-To: <2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
References: <cover.1490610854.git.liezhi.yang@windriver.com>
	<2f711e48736f36ead014a28d077975ab457fae99.1490610854.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Mar 2017 12:34:03 +0100
Message-ID: <CAJTo0La_-yycaRdiYZFpSO7w+ZHRUoKu1CNfw0OXTtojGWo9ag@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] bitbake.conf: add sudo to HOSTTOOLS
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
X-List-Received-Date: Mon, 27 Mar 2017 11:34:23 -0000
Content-Type: multipart/alternative; boundary=001a114fe79aa663f7054bb4b920

--001a114fe79aa663f7054bb4b920
Content-Type: text/plain; charset=UTF-8

On 27 March 2017 at 11:34, Robert Yang <liezhi.yang@windriver.com> wrote:

> [snip]
> /bin/sh: sudo: command not found
> runqemu - ERROR - Failed to setup tap device. Run runqemu-gen-tapdevs to
> manually create.
> [snip]
>

This only happens if the tapdevs haven't already been generated, in which
case sudo isn't required.  Should it be a NONFATAL tool?

Ross

--001a114fe79aa663f7054bb4b920
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 March 2017 at 11:34, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3t4" cl=
ass=3D"a3s aXjCH m15b0f55980480a27">[snip]<br>
/bin/sh: sudo: command not found<br>
runqemu - ERROR - Failed to setup tap device. Run runqemu-gen-tapdevs to ma=
nually create.<br>
[snip]<br></div></blockquote></div><br>This only happens if the tapdevs hav=
en&#39;t already been generated, in which case sudo isn&#39;t required.=C2=
=A0 Should it be a NONFATAL tool?</div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div></div>

--001a114fe79aa663f7054bb4b920--
