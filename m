Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id B02FC601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 22:47:55 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id 11so123812094qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Zw8uqhRZ/yu3MJ/4OrchM8gzPcqveEHEQEl8a46Szv4=;
	b=sds06Hl39ZoVms6oJfyjL6vmy5YbW/lEvV7g8fCeYtGOGUIf+WBb02ynj4PhoB5US1
	J8pi5xqr/cdKPHOrzZY6tIDrneaigvmGIPCvZfK1CAVO4SoBwk7Brqda+7cOZpDSj3Rp
	nBbL8pTKFwm+fCzWx2CXQ/PpUnSgc5NQBJ8Uxc7XSVz8Cptsy3nMGMobbCmqUcuAq4PE
	+qtQuSjVHXb7UObCVh/XOh5BQLEDikuBZ4iWYnxpJGg3ZMn3M29013UlOD7bA2m4MlBE
	hVGHi37QOfwNNboFJJHmde07BAD8kX4IewaKTSsTFszSXIpNLUltl0YrbobMUq3tOfjD
	Zirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Zw8uqhRZ/yu3MJ/4OrchM8gzPcqveEHEQEl8a46Szv4=;
	b=OpsCQ5gQuoJUMeUew9KA5DgPltAXnWTUhAlw2vSJOYZsnwz26CsAh9rKoELIgDpGCq
	6K8M4hWekKj9d4zoNkG7l3dgmnDuEuk3qK6wuSdJD9FDrHv5MQDnkSWrEfg6V3qK8SOm
	foMR0HfBOcL3+To35U+vXZFgrurdkSRQDYTDPWogeBIbeqm90pqvnPtjY/yYMPjADVxC
	oc9leV9P4OaaSm477KZPdDk1milWENyOsxr2sA/C5EbBOGcOJ1KntK0mo2tLlgQ5FNUd
	Rkx5dSpeN95xUT5y/4COkc2eMf4hrrfKD1Zm8s3HDCPGuYUKllk8VgUK4MobmmgUd+SO
	lVFQ==
X-Gm-Message-State: AIkVDXJRRGHg+v97TmYn3bkJBGCtAlDVdrUdUPU3/tKL8fEqLgIDy7+BP86Ickx8QgTaeEMbtRgps/92c10e+Rpi
X-Received: by 10.55.183.133 with SMTP id h127mr35572qkf.121.1484693275699;
	Tue, 17 Jan 2017 14:47:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 17 Jan 2017 14:47:35 -0800 (PST)
In-Reply-To: <1484264021-28569-1-git-send-email-sgw@linux.intel.com>
References: <1484264021-28569-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Jan 2017 22:47:35 +0000
Message-ID: <CAJTo0Lapvqydn_Yv8Cqg5tqYwgZDN299sWc3Pu-EQH1Ja6K5oQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Tue, 17 Jan 2017 22:47:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600564c90680546521714

--94eb2c0600564c90680546521714
Content-Type: text/plain; charset=UTF-8

On 12 January 2017 at 23:33, Saul Wold <sgw@linux.intel.com> wrote:

> To enable glamor, we need to also enable both dri3 and xshmfence as
> dependencies.
>

Of course musl's lack of lazy loading bits xserver again:

[     8.655] (EE) Failed to load
/usr/lib/xorg/modules/drivers/modesetting_drv.so: Error relocating
/usr/lib/xorg/modules/drivers/modesetting_drv.so: glamor_set_screen_pixmap:
symbol not found

xserver-xf86-config has a config fragment that loads a set of modules on
startup if musl is enabled, I'm guessing glamoregl should be on that list?

Ross

--94eb2c0600564c90680546521714
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 January 2017 at 23:33, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex"><div id=3D"gmail-:g0" class=3D"gmail-a3s gmai=
l-aXjCH gmail-m15995088f719b7e3">To enable <span class=3D"gmail-il">glamor<=
/span>, we need to also enable both dri3 and xshmfence as dependencies.<br>=
</div></blockquote></div><br></div>Of course musl&#39;s lack of lazy loadin=
g bits xserver again:<br><br>[ =C2=A0 =C2=A0 8.655] (EE) Failed to load /us=
r/lib/xorg/modules/drivers/modesetting_drv.so: Error relocating /usr/lib/xo=
rg/modules/drivers/modesetting_drv.so: glamor_set_screen_pixmap: symbol not=
 found<div><br></div><div>xserver-xf86-config has a config fragment that lo=
ads a set of modules on startup if musl is enabled, I&#39;m guessing glamor=
egl should be on that list?</div><div><br></div><div>Ross</div></div>

--94eb2c0600564c90680546521714--
