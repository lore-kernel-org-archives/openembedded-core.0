Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 08983731CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:04:49 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id n21so8458091qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 05:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BdmnIFo+/eFjUBAnXJ34/UjLDRaC8+bLMk0iGGcVjdc=;
	b=swRYioO5mzGEx1b49IsEySfo54IjKYngP8OoS4yEB54tm/KbMfoqNZdrjNIaavwZ0O
	IDjCy3rUmYDO9HfFOk17XgiUCqXsGPWSn+e4KrrA1LXAoFFQUznW0WryaKk28Tj7L7qj
	AMd0KE6+ajGGbXaoIgbz7E+QOQx9kpbbXvb/lM2I/kLiUqNrM84yA2ztT7HUWy7hJzeB
	jcg4SYXDcAqTBfZQXfm9qEAhW26Xck3QxSOLXy/5jT/ANsXfOmQrMJeFgoce0nA/P8Qq
	mRLYMyA7ig3qqixTVOVjoIWoLX38Vrrvpd1dEZQk5KIG6tWObbiJJr5SGFFmW2cvQvE8
	HujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BdmnIFo+/eFjUBAnXJ34/UjLDRaC8+bLMk0iGGcVjdc=;
	b=eH5UUwH53GBqx0NZw+ThzJwyHxjIo3HdxnOKfFQjVx43UEmH2c7ldB0wtTlOR7Epig
	PpyMO+ipnh/cRSgQ1SNARRjADpCCBu6eDKXtdoyDI9V6mJ3ztdVBW7GohoFCx4/PFMig
	yjLNya1syd5V2pRh8y0f1YH7k8DdRUvtAiXa293K84h/U8aFBu+dBGC6mrjNWHcQVRZs
	LxllRlN+q6fISC0whlQhmKalbVMTcG73iRZxGQ6eLHUwIMmasNvxH0CtWFeDx077kXPC
	BkXqLy8/0qXIt5Z1Gz+mjuYdoVj6GMVhgdYjSyAfIXiYeWUhJyIyeCydb8V5fbQXqFQl
	qkGQ==
X-Gm-Message-State: AIkVDXIvvyQxiFMNom6FUoJ6WIaqR3xAJb0sri10cIKjcqW6diID3ng+7kIIegtwzzeeF14WsUMEvXLCzXxsaWZw
X-Received: by 10.55.5.145 with SMTP id 139mr147854qkf.77.1482152691192; Mon,
	19 Dec 2016 05:04:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 19 Dec 2016 05:04:30 -0800 (PST)
In-Reply-To: <14EB1FFCA0C8D24A8B04EDEC1EA78C2453D84890@XSJ-PSEXMBX01.xlnx.xilinx.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<14EB1FFCA0C8D24A8B04EDEC1EA78C2453D84890@XSJ-PSEXMBX01.xlnx.xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 19 Dec 2016 13:04:30 +0000
Message-ID: <CAJTo0LaqOXdN7ASeT6gnGFqnptyB4NYAycR0w6kPG=7yTtNF-w@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Mon, 19 Dec 2016 13:04:50 -0000
Content-Type: multipart/alternative; boundary=001a114c8f84a9a0ef05440290fa

--001a114c8f84a9a0ef05440290fa
Content-Type: text/plain; charset=UTF-8

On 15 December 2016 at 22:28, Manjukumar Harthikote Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

> This has not been added to master, is there something wrong with the patch
> ?
>

You'd marked it for morty, so I'd assumed that it wasn't for master.

Ross

--001a114c8f84a9a0ef05440290fa
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 December 2016 at 22:28, Manjukumar Harthikote Matha <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:manjukumar.harthikote-matha@xilinx.com" target=3D"_b=
lank">manjukumar.harthikote-matha@xilinx.com</a>&gt;</span> wrote:<br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div id=3D":2kb" class=3D"a3s aXjCH m1590525d7a3a=
affa">This has not been added to master, is there something wrong with the =
patch ?<br></div></blockquote></div><br>You&#39;d marked it for morty, so I=
&#39;d assumed that it wasn&#39;t for master.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114c8f84a9a0ef05440290fa--
