Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 37E4471CB4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 11:13:58 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id 1so9704497qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 04:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LFLtB9vCIcjJsZ4QExFVJN0Br7JmejeBZk5uE9MG43k=;
	b=dl1zouwBN9hQZaieLAa6CvrmYLbrFolfKfe0PEOfc3Jf1Z30yxm+yr7Ju5iVQw9yQW
	Mkp6qvD+8eT4nW6TWYf3aYMlv1Myfg5MiEgDsklduC3cXr79SONcR3IXmYR/X/UbPY7e
	mBeRVpei2Bi8yeM0B9j7nZizXZR01Dttbuo/rpxCwJiEyqifg3GKefZ8S3QyvyhQ7DPM
	IE8mGUyvuiVzJLEAOiPgL93hpPAOMyFQuRpgzGkXdzLMYPVFeD9/Ek+2ZTPiEK/ZjTda
	84wtLOQ1PVMztZ5FhDu8XZlaqd8wloUIlKMl8pzGMAwNpPlqnraLUAtGnRtVuMAlgXYn
	P5uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LFLtB9vCIcjJsZ4QExFVJN0Br7JmejeBZk5uE9MG43k=;
	b=o1XI2V/tY+sfE6BaYOVT+IUZPxS12N2Iol0gebh1duyRLnZ07jR3hc3pmQEZzHMEnZ
	eDpjo2t7fqdpT0+yYWaSn0q4osgmO/AAExQ5Xh/05h1h8fIylByruTKC7MITH3suik7F
	1XgmGWO3Bt4iFMaZcmYKvtT1goDuPZAWn0hKF5Awvhrx+BpDAhqIpiRPIx7rkR/pVRW1
	KPgSoyJ6HmRP6ik1gkavOJ4+zUZQBVqNSA8pPrhuE8PBbZ94bihG9iTtXmyJDwPxn6vL
	50mLjvQJKxfSy+lN32T6E1ng4E5CrryZ0iLc3cuOZi+yEktZh5WUYu+dvA16K8lE23+g
	5J7Q==
X-Gm-Message-State: AFeK/H3dpZn8UdVw3JvRjn+9BYyPoVudLGSkCUCe4744Yy29RPUx00Juxt5rQ7Wqg67glQIBcryL+fC37KeBPNwM
X-Received: by 10.55.221.1 with SMTP id n1mr1927626qki.221.1489576440021; Wed,
	15 Mar 2017 04:14:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Wed, 15 Mar 2017 04:13:39 -0700 (PDT)
In-Reply-To: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
References: <20170314172749.6643-1-alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Mar 2017 11:13:39 +0000
Message-ID: <CAJTo0LY4pN1n2s9Qe1FSesSRFUcWFLdsQQ6Z2J8-DZqGeBK14Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] rpm: add support for remote package feeds via PACKAGE_FEED_URIS variable
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
X-List-Received-Date: Wed, 15 Mar 2017 11:13:59 -0000
Content-Type: multipart/alternative; boundary=001a1149d7dc92ec8a054ac30abd

--001a1149d7dc92ec8a054ac30abd
Content-Type: text/plain; charset=UTF-8

On 14 March 2017 at 17:27, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> +        cls.repo_server.port = 8080
>

What if parallel selftests are running at once?  Can this service be
started before the image is created, so the right port can be written into
the image?

Ross

--001a1149d7dc92ec8a054ac30abd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2017 at 17:27, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=
=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.k=
anavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":xy" class=3D"a3s aXjCH m15acdddd20314464">+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cls.repo_server.port =3D 8080<br></div></blockquote></div><br=
>What if parallel selftests are running at once?=C2=A0 Can this service be =
started before the image is created, so the right port can be written into =
the image?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1149d7dc92ec8a054ac30abd--
