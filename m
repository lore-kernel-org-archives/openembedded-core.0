Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 15AEE72F6C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:24:21 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id 4so644695itv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mSn7mPkRSloWZwF2BECeogfL3b03bxivO9TV13GJe+4=;
	b=kjAKiduFbAKmM5tLiOpjq/CmM2RpdMiw/vDrABXKnhxzYSWuBYPv6rTT2aoWsOICxa
	yDwlANX6C7G5aXp6fE0ROnPQczyJUowCg0wgFw9LmnxDI9zwLDDFzsAMd2KEUxuftjcV
	letFnT1sDgEC60IaJibzoCUFTEgo9TwZcjyHoWgw0AQjUhxcIQutt/OJmzDDS/wVeM7X
	satCJqSwP/EOjdhP1tvol6qsN1WTdwpqQCnEulVJE74IL3F+H1zy/hNaFT1OZymTNulA
	+9M7Zvuc7HPy4SdM/IYO8nAOlu95GdzQ/uuWxTbWKvppMzf2EqGsvhZk5Yr/hSgaExIs
	v6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mSn7mPkRSloWZwF2BECeogfL3b03bxivO9TV13GJe+4=;
	b=MbrGfBto6w40ZgNOU5IudYpS1IK2Z1HZk5gUR1N8pZ4WKznCI7h9RGTzQd/JDo32zS
	AUYgQYv/CZRiGYVZfI7fj/NZnzTloATrcg/aJpCPjSfie5w8YA5ZKZFEs1GYvgPBxPsc
	KGRMH9t9tw4K3IAr3xOO6NddFDeLMdQniKjAkfKeYQPCikN7I4eHQ8d9bx44mmExAm/0
	MnbPAB+T61Fn/ttoWK9Fx14fqxUgZMCjjl4PKzZshPFysNIDtJ4R5zXo5osnJywEbl6U
	LA0u9nptpsxYelkoZs+yk+7fNIoVkx9lb3qc7rmQka+sqOb709st8s6rnIZWHQWX70vp
	E4LQ==
X-Gm-Message-State: AHPjjUgBBMxEMyCy6QYyBp9uSLTogKwj8uRX1kekrexwcCaf6rtvD+2G
	tm9U08DCKqEH3PBXmDuiIDlL92TBVNv++VZy7y5cKg==
X-Google-Smtp-Source: AOwi7QD9i8e20FY6ckfveK+Tc8JFvHFt4mhSoejjyLsR10ohvdvoDcVp9oviRXHULibik0vvnkrW16StOIj9kTKrUkI=
X-Received: by 10.36.150.4 with SMTP id z4mr805929itd.48.1506594263157; Thu,
	28 Sep 2017 03:24:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 28 Sep 2017 03:24:02 -0700 (PDT)
In-Reply-To: <617e9e3d-e7a4-ea73-9f9c-10ca4c46c441@siemens.com>
References: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
	<CAJTo0LYxVmQidhcuq9VeSBzb7y1KPcgqN6_R97d7PNf51C094g@mail.gmail.com>
	<1ebb3564-9e52-9480-c1c8-9f959d9e9416@siemens.com>
	<CAJTo0LYwUhk9tHNHZ7DACOC5WXKW_x=1vrNd7pArCxP7-Pe_dA@mail.gmail.com>
	<b48b82e6-bb1d-2e7a-ab50-609bd39c93d8@siemens.com>
	<239a2cfd-1507-b8dc-0d85-0ab7afa98c71@siemens.com>
	<CAJTo0LbR-sLX4YY4F1myb2EcEGQ3qSZjQL5OPOh5jut2_h4djg@mail.gmail.com>
	<59fecff0-d359-a4ea-3d3c-cb0064f0e70d@siemens.com>
	<CAJTo0LYnEPOs3k0UTRHQdq_Mn=MZVWXbUNhEbJcpP_exHjcJXA@mail.gmail.com>
	<617e9e3d-e7a4-ea73-9f9c-10ca4c46c441@siemens.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Sep 2017 11:24:02 +0100
Message-ID: <CAJTo0LaNBhZMR5ufy8=f2h4mHD2u_j8uLxWhs_TdWTMNNPM=xQ@mail.gmail.com>
To: Andrej Valek <andrej.valek@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Thu, 28 Sep 2017 10:24:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea98e0a21a055a3d4f92"

--94eb2c07ea98e0a21a055a3d4f92
Content-Type: text/plain; charset="UTF-8"

On 28 September 2017 at 11:14, Andrej Valek <andrej.valek@siemens.com>
wrote:

> Of course, but there is a problem with mailing list encoding. This is
> the reason, why is pushed into branch.
>

I understand, and I will be pulling from the branch, but review is on the
list so patches need to be on the list.

Ross

--94eb2c07ea98e0a21a055a3d4f92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 September 2017 at 11:14, Andrej Valek <span dir=3D"l=
tr">&lt;<a href=3D"mailto:andrej.valek@siemens.com" target=3D"_blank">andre=
j.valek@siemens.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Of course, but there=
 is a problem with mailing list encoding. This is<br>
the reason, why is pushed into branch.<br></blockquote><div><br></div><div>=
I understand, and I will be pulling from the branch, but review is on the l=
ist so patches need to be on the list.</div><div><br></div><div>Ross=C2=A0<=
/div></div></div></div>

--94eb2c07ea98e0a21a055a3d4f92--
