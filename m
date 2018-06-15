Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6B6B47540F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 04:27:23 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id c15-v6so9638233otl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 21:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=g73Q/33PjT7tmpKRaHLfAkYauwjvmxhQ+trKAeDyNtw=;
	b=sZtdBRxTGby0huztox2hOOIBuX7vngZgSAc+NWWuiuWz/DA7wnCkJNsAiJkfSzNk3Q
	NY0riEE2CaOOoSzbcLfZfghPfvLdVdqEaHcx6wFrPfQIu324At0tlV9ahK2IIIq7IzDF
	7QFCGSszWlLWl99DYi94yUPTFVspFeh2yarqtvHztyO9lj01fSia9hJVxY7n91TydPaQ
	5GUoivJ5w2Iz2pkRiYF4zK5+m94qal4TXYzb5488x6mea6TGvq4eTV8FkHhmBqv/IHd0
	4GUAAE3yqngCJUqTZMwno3GmIlEnvrqCEfM3xzlr5q762O9SAWNrHQKIuRec7oKq6C9/
	NLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=g73Q/33PjT7tmpKRaHLfAkYauwjvmxhQ+trKAeDyNtw=;
	b=lnjfCNpDKpCD4Y+774LKivioepnVPcntKGYIp2Zhys0vqrY0OzhqdAXJTaxedTwHJY
	C5qrMp1K5IXtbJ3dGiyheHxBkNBz16tMdIsREVy5OWPs03jo3vmgU7pyxkh0aNLX9uUz
	rG6wyYx5+E2SblrqUUPCp3i43bvtVgo58pRhCmxHdZc/bVzblnoyTpRW/dFpSxBd6AwD
	bd7CMH02YoBxNYtKIG3n8N8q/tdJinj7gfgbVf3Iw5xFjvfTEn/7OaD/YgJtxQpdZpzt
	3CJQp0Z2R89h3PipGP7Oq672j9pqib1Quz1Ad54pT8ntx4YWluXOyhSSXO3Mc6DitoPb
	Mn8Q==
X-Gm-Message-State: APt69E2Jg3n/OTS0H/OoAq6EdKaDZjeekmd2qhiLPP/kCZOaxc73E4b3
	VXhPpOZ6IrH5iXT7uEKkQlq1wiqLJjsW6tcbaMQ=
X-Google-Smtp-Source: ADUXVKIDdZun9aGAyMvm57JJ9oqNdkDLIB7/yTyYJNU8SsGfBZi81qLOn3SvClIYAybk2BLnIrT6GdQEfG6kqDI9bdI=
X-Received: by 2002:a9d:1f3b:: with SMTP id x56-v6mr29829otd.369.1529036844387;
	Thu, 14 Jun 2018 21:27:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Thu, 14 Jun 2018 21:27:23
	-0700 (PDT)
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
References: <1527502858-81691-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LZVcc+_ocfuYEUBKK0Hbr0SaZEH7CUYKK17gMk+CXwxwg@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9A7F@G08CNEXMBPEKD01.g08.fujitsu.local>
	<CANNYZj-ege3VdhZ_AR=CpTmOZc3yyO55BOpt0YZNMk+Ww2BpJA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF7363AE9E2F@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jun 2018 07:27:23 +0300
Message-ID: <CANNYZj-xJa=pQwc3ORfzjOXqvOyKWHbOFVFPh=oH1J-urrZmKg@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Fri, 15 Jun 2018 04:27:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What you describe is exactly what image creation does (either directly
through bitbake, or via 'devtool build-image'). What benefits are in
running dnf by hand from command line? If the idea is to hand pick
packages to add to an image, then it's better to just modify the image
recipe or use 'devtool build-image' if you are developing apps in a
workspace.

Alex

2018-06-15 4:39 GMT+03:00 Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>:
> Hi Alex:
>
> These packages are taken from yocto build system, and they will be instal=
led in your host as root file system, then you can deploy the root file sys=
tem to your embedded device.
>
> --
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> -----Original Message-----
> From: Alexander Kanavin [mailto:alex.kanavin@gmail.com]
> Sent: Thursday, June 14, 2018 3:03 PM
> To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu.c=
om>
> Cc: Burton, Ross <ross.burton@intel.com>; OE-core <openembedded-core@list=
s.openembedded.org>
> Subject: Re: [OE-core] [PATCH] meta-toolchain: Added dnf-nativesdk into c=
ross-development toolchain.
>
> 2018-06-14 6:38 GMT+03:00 Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com>:
>> I submitted this patch aim to use dnf out of Yocto build system to manag=
e packages.
>
> Please explain this in detail. Where are the packages taken from, and whe=
re are they installed?
>
> Alex
>
>
>
>

