Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 807A677D24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:54:57 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id a72so131939783qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7G4aZLxDsAWxxaRNne1l63f000emXM6uQkCiUwwJqXI=;
	b=dYY6c8G/hXglP6d1Ac8iA36XVWauV8x8jFYz7Flda61a9RqEAUQx3ZSpY7gCNAuBoz
	dg3G8RCOy00WoXzBrcfJQ3cKI74OcEThp9XXw4frB2ae4G4VGmqkFgIibpdyw5CzgiJG
	UvkJEwaYOmPc+LH1+YNL0MmoG1IHYmr4suIi+9UkKcuDRQwAF9KLdQmm9SYK26O4wzuH
	OrjDnW2/p0Hanp4FTZCS452fkc34qM/Fj9I7JNDe+RbVsuzCn04dQIVBBF0KmsLKz8io
	rc3A199BLZ2Qzbob0xBxft8KMMbS3iUkbiISklBNHjYTS3lYPqNEtMRc6J6sbkBIFd8z
	tlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7G4aZLxDsAWxxaRNne1l63f000emXM6uQkCiUwwJqXI=;
	b=s2Bx2nsR5kvRbaZTsFRg1vmgNOcU7GwQOSjXQuhHaMWwjJ7V29bjV6sHrbVI8S6pKf
	hMtNhT7IHPAfR1OuQe81ywvmsVcdEIsPzmC2gxOtH5aFUwzWSewVJPIXNMpMCrZviv+O
	uOo77PpeiAfJ8pbhHNvNxmz8+CPaP9j82DCKWJHSXrJ2z/q786Znt3HXqzkrK/AwALyZ
	NaOiNgwaGstd4e8xde0sHpjp16fyl9wA6UUlISPzEzRdqvxlNNU9zEqAJ3gF2zZSqT7l
	IpaOq4nT4g33NaIjRbYdb7eQJotfs+eHyKgUruQMlQ1uas7C6zd+cNoDtqEqcvDpuDLf
	8qoA==
X-Gm-Message-State: AODbwcB9kj0OfxSN7JUHqUS1I+jZz/YjWg3vG+6aYJvnBPA4A8vzPGXQ
	tiObumO1CA1eRV25tuRPeUB45u1dTkMW
X-Received: by 10.55.24.158 with SMTP id 30mr24419562qky.171.1495551299355;
	Tue, 23 May 2017 07:54:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 07:54:38 -0700 (PDT)
In-Reply-To: <CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
	<CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
	<CAJTo0Lbig6eUAOHX_UCLU7VM8QUG-Cj2JZoBzsfwbd7vpLKRdA@mail.gmail.com>
	<CAMKF1sp01SVCaG=g4=UKRM23OwYC1LpQSBmwde7j0GugV3R6Fg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 15:54:38 +0100
Message-ID: <CAJTo0LZGdaYq-pXN6Y32UBMMWQtUOZ86vf6BJKMWqybXEx+yqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/15] db: Add --tag=CC to cross libtool invocation
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
X-List-Received-Date: Tue, 23 May 2017 14:54:58 -0000
Content-Type: multipart/alternative; boundary="001a113b38e8f11f340550322b9c"

--001a113b38e8f11f340550322b9c
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 15:48, Khem Raj <raj.khem@gmail.com> wrote:

> no its better, it reintroduced the deps and this time also on libgcc
> which probably was latent. it worked because someone else pulled
> libgcc into image. can you check readelf -d | grep DT_NEEDED output
> from bins/solibs in db package. ?
>

Well, and libstdc++ to the not-C++ bit.

I'll do the readelf shortly.

Ross

--001a113b38e8f11f340550322b9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 15:48, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
aj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":19v" class=3D"a3s aXjCH m1=
5c35c87f3aa027d">no its better, it reintroduced the deps and this time also=
 on libgcc<br>
which probably was latent. it worked because someone else pulled<br>
libgcc into image. can you check readelf -d | grep DT_NEEDED output<br>
from bins/solibs in db package. ?</div></blockquote></div><br>Well, and lib=
stdc++ to the not-C++ bit.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">I&#39;ll do the readelf shortly.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113b38e8f11f340550322b9c--
