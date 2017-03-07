Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4B23371A6B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 17:06:16 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id y76so14208950qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 09:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zseTct5xsiJFvoWqZ1JYNHUGol3/qz4wzNqRBAFZkj8=;
	b=pNA3FG1MQYR0KdMb/AYkYOCeLk2bdNWyOUf4HHedOi/vMgpGQfNaCj2e5Xdxx1EPtl
	aS9wYXYN82Gbh3Io5LzygmNcEzZgkfDrN0NFqiAOMgJk5GwYPa0Hl0HFHZxZs51P8My3
	mljoUdKVeoJfceT0CEmt9RFcdCy+uVjcixR0jbT/RmIAHk2wGs5x/8KJnIC8XIyPD8sc
	rtlEfPJoOF/2mcXiDgx97rYmwxKBZGTESGH/OG8DPE4pkR8gw/50m4EkY5P/TMcWNnGt
	0ssiaqeZEaoGypClful6EHEucBYGOlV3hGvdgcjawgNwt6Jx5gvdty9m46OiNVyazAsd
	ADwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zseTct5xsiJFvoWqZ1JYNHUGol3/qz4wzNqRBAFZkj8=;
	b=AoptW8d9IZKWvb9blAh1ZwklmBcDGBxCkRs2sEDgfNR8nNLD7ozwPmesSFxgNMnGS1
	YvjrVJHraiKB53VqZHcjv9sfGCKhEWvxOUuc5l2AaA4svDrIA5WLpTZc6ILRTjA9XENs
	Vi42q+VftBaHB3oTJ+0176iItr6Y0jErEdMbMA9ZX0dyyEBwBKcozQUifdFc9zCdCL3p
	PZFzdXiJ9vbqeE+1lx5IgOAtaJnz1zld3VIKqWEEA8IeWfjrZxjKTEIdEaV3E8+gDJw2
	N/oeIz/NES0DaCSYnGuc2z7CvHNFfIooJmn1MnHhTSTWknWhf+2t5Y7HTDcmFW1QzZTf
	R/hA==
X-Gm-Message-State: AMke39l8QtWxJn5CK2zpWUviPIVyE0Ito7dXUbFSGpJf2NX6vNZ9+V2v0LGbrVQkcYB8sz+DCzWtbI8+vzqt963R
X-Received: by 10.55.3.151 with SMTP id 145mr1607781qkd.244.1488906377896;
	Tue, 07 Mar 2017 09:06:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Tue, 7 Mar 2017 09:05:57 -0800 (PST)
In-Reply-To: <CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Mar 2017 17:05:57 +0000
Message-ID: <CAJTo0Lb2tLqJs0RrpiuyYO4nY3khct0scHkXqU=YbokP52ChSA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Tue, 07 Mar 2017 17:06:18 -0000
Content-Type: multipart/alternative; boundary=94eb2c0b93a0c2e5a7054a2707a7

--94eb2c0b93a0c2e5a7054a2707a7
Content-Type: text/plain; charset=UTF-8

On 7 March 2017 at 10:35, Burton, Ross <ross.burton@intel.com> wrote:

> If we're going to assert "LFS by default" do we want a sanity check to
> verify it was used?
>

So I don't forget, Debian looks for linkage to the following symbols in
32-bit binaries and warns if they are used:

https://github.com/Debian/lintian/blob/master/data/binaries/lfs-symbols

Ross

--94eb2c0b93a0c2e5a7054a2707a7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2017 at 10:35, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div class=3D"gmail_extra">If we&#39;re g=
oing to assert &quot;LFS by default&quot; do we want a sanity check to veri=
fy it was used?</div><div class=3D"gmail_extra"></div></blockquote></div><b=
r>So I don&#39;t forget, Debian looks for linkage to the following symbols =
in 32-bit binaries and warns if they are used:</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra"><a href=3D"https://github.com/Debi=
an/lintian/blob/master/data/binaries/lfs-symbols">https://github.com/Debian=
/lintian/blob/master/data/binaries/lfs-symbols</a><br></div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0b93a0c2e5a7054a2707a7--
