Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9D26C73772
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 09:03:37 +0000 (UTC)
Received: by qkhu186 with SMTP id u186so57892118qkh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 02:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=l3xqVrnHaHu6ZALuGrzN3hd0BV4THuSIhBNlD4Bany8=;
	b=lLOSYkgGRysYWZehoF6+ke9vGl6leGsqOvK63t5bpq949RDzxd93P4I0NllzefDXZV
	6RXhLjuZpj0+rBjII3XBYDjSPflb6GhJF/nF3eplfkGgHnLJjE2wwr47BY5yz9GZ6EqC
	QbVHOgQi0YP/3Tx+qYONz9Q7s3d+3Mi4qCrL9PQclbQGVTK0WWNwONicm38pRB/R4NMx
	kb4nd6XKEEGf3gC4+g19gRy2Yp31c8swL9MobObKz7bq1jYcR9hivb+SYFPqu4OSEbdm
	ryB0QOWo/0vN7KRBMRWGYVT9si2g3nB8C1S3DZcG/sukH4bC0WzRvIYooF0TYlYloR7M
	xzoQ==
X-Gm-Message-State: ALoCoQmpQQ84Dr/DqR3qbXM4MxOeNc/qSR2nNPtg44APLOMmwitJN2Kl9rEEuR1RS6JLNWzdlCrT
X-Received: by 10.55.43.130 with SMTP id r2mr33618299qkr.14.1434704618051;
	Fri, 19 Jun 2015 02:03:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 19 Jun 2015 02:03:17 -0700 (PDT)
In-Reply-To: <5582EA4D.2010100@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
	<25c4ff3c454ec38bec5e68498d7230e6aaf8dc64.1434259784.git.akuster808@gmail.com>
	<CAJTo0LZ5uHLs-aP266_MYNkaBikPZ9=LDmOM+Vvr7SBkAqvJbw@mail.gmail.com>
	<5582EA4D.2010100@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jun 2015 10:03:17 +0100
Message-ID: <CAJTo0LbJAvLNcQXV=vNDyx7sz12SL6ZgjjD2V8mWhNcj1SPV4A@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] gnutls: update to 3.4.1
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
X-List-Received-Date: Fri, 19 Jun 2015 09:03:39 -0000
Content-Type: multipart/alternative; boundary=001a1147afb01de4fa0518db334a

--001a1147afb01de4fa0518db334a
Content-Type: text/plain; charset=UTF-8

On 18 June 2015 at 16:57, akuster808 <akuster808@gmail.com> wrote:

>  I could not reproduce these warnings but found a configure option to
> build without libidn so I added that in my last submit.
>

It would be a simple:

$ bitbake libidn
$ bitbake gnutls -ccleansstate
$ bitbake gnutls

Ross

--001a1147afb01de4fa0518db334a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 June 2015 at 16:57, akuster808 <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:akuster808@gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">=
=C2=A0I could not reproduce these warnings but found a configure option to =
build without libidn so I added that in my last submit.<br></div></blockquo=
te></div><br>It would be a simple:</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">$ bitbake libidn</div><div class=3D"gmail_extr=
a">$ bitbake gnutls -ccleansstate</div><div class=3D"gmail_extra">$ bitbake=
 gnutls</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a1147afb01de4fa0518db334a--
