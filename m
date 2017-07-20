Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C664C78303
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:31:05 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id l7so12407952iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wJvbXkZ2TvSvw/VWkR3IgQR00fo5v272ir0SuECahPc=;
	b=fi7WRjbyvbMLWMPstLYBL6bl7DusuvN4Cu6Yz5bkQHlBhf4jsjbEW8Zw4dCdUfT2i1
	yGIg9rAvPD/ebY59fA0HIC9rlGM1usEjPmp+J9QN/HrJ7vCOPnZ4FFnl9lMhv3goHpxo
	XORvkgC94ESU7OR7NiX1CC7pN5j6yNvkFZ4yTvvTklc2pIKhZqOzjzvoQvqcg+RzLMwc
	wH0e1iN0TINACyYiGSWWDQMRGTIH6veO1tkHDj/qOzhuM54/B3uAi99gMU8LoVskGFV5
	I4Pdx3GWefre5w+4jiriHKEShn2+latzCZKknWZFQxQRsremNLQ7QOSXTkNew5X1Hohk
	dLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wJvbXkZ2TvSvw/VWkR3IgQR00fo5v272ir0SuECahPc=;
	b=UWe3s5GvMTv9N3z8Rcd1J4/k2wJtNDy97uWDlHFKf9hvhHxemnNr9LxmvX2cnlrUGd
	dOfLF0tiM6Vgp01jBiZ0f/iiWPuT9muCkq80D/suT7hi+pu6DHVB00eUbxOgxxkNaqvm
	8S8O7XOwYk8Hpv2NPV6XxTjKztkMS3hqvJAb94aK+oFSm6dT0PxLa3c2C7BA8QBq0npx
	frkuUUZE21WiMituSZt6o3kIX6F3/CGrlQlgSR49obGbFNGoSSTZsQbPdRE9ZHoMiqQ+
	5/upfeE4unc3okR1A8m2jZlVuEwEgTfS/bWlBTMN3D4e2MjIrOnIBrGOzqZEbVSNXhPU
	+K/g==
X-Gm-Message-State: AIVw110Dm0o/IC9ABqIZt0mnLiBjhFRrzo5YSB7yxbFZbtWy9VEYllZz
	gTAMItJd3CldkSJDVMFda1LSCIJdJaHj
X-Received: by 10.107.160.132 with SMTP id j126mr3837716ioe.224.1500561066643; 
	Thu, 20 Jul 2017 07:31:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 07:30:46 -0700 (PDT)
In-Reply-To: <CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAMKF1sqOWkSJqqcj4ZW+NB40pJvpuC2NtKJH2Ea3iCwzxwE-8g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 15:30:46 +0100
Message-ID: <CAJTo0LYGGAPLrw5599fhHzdHsrhrJoDPP_FDxDdHxZSESw3_jg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 14:31:05 -0000
Content-Type: multipart/alternative; boundary="001a1140da6657703c0554c09929"

--001a1140da6657703c0554c09929
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 13:54, Khem Raj <raj.khem@gmail.com> wrote:

> There is a proposal to repace pkgconfig with pkgconf, and I hope it
> will create a symlink to provide pkg-config
>

Yes, it does.

Ross

--001a1140da6657703c0554c09929
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 13:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":2hq" class=3D"a3s aXjCH m=
15d6046cb994f193">There is a proposal to repace pkgconfig with pkgconf, and=
 I hope it<br>
will create a symlink to provide pkg-config<br></div></blockquote></div><br=
>Yes, it does.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a1140da6657703c0554c09929--
