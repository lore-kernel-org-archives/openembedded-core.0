Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7B96177D94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:32:49 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id 99so50354759lfu.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Bw+Ok3ILltGinn+XtSjXD6mvNtW7KNgRQXRnntHH7VU=;
	b=JKEbvKtrZ7gFutU0BqS5O5eT2l0kbsnYK+hUz02J1XwACq08HSkAF0tKxedrA40rDc
	sDoeww3/IedvqpJVY77/8Z26OfGDqI/zIMRpDrbRkYdNxzdqhr51Flj/DkEQcLwGL7M0
	EYsYS7nXV3J9/AFWCkC3lxHxUAWTm97QSqUFdE1Fpq2xvUC4nOlE/dcGTwf88Nddb8gR
	xxJ3biSrj8/cLP5M2IShoW9IMTbwLkn7emmDhXH7JEp0lOOUFkhSM8mtDeVYMtEuRZ3t
	zdf9sGxiTuivsHAQ8nV0Mikpx6cWclZc16P3wl4t7PyNUdlcWblskDM3X9GmD9haO1Og
	QPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Bw+Ok3ILltGinn+XtSjXD6mvNtW7KNgRQXRnntHH7VU=;
	b=R0FKzDPsv7RsKRoullN/0oCC0/6LBxDjPFTvL143W8C1PVvfYDeWzezFXXW4XOqNSw
	IGNyrNg+7qz8ff4KAhvzplRXwkVekGQYLZ0qhlN7WhqtvxSrB63VZEQgMMqSUB1B1yft
	8zcj51i3ldpo8WRe7ymm+5w0B2eTd2Ske8XAnPPcnoTp4HGFO65yeeMHel/cYG6apXIR
	1pYZeBp/44JMY0NjIN1wD7gKgH2QYB0h1R7gjOvmeA/z55fxMwJdj4nmRE97fUqFdijq
	bdB/mePQh2PPuZzR1O03t5Cw4ES/XH52i2x5OobaP9MY00eS6iD3uVpW/Y5wAA1obSBN
	2uDw==
X-Gm-Message-State: AODbwcCrZU25h28+KI57BiDtA77vvmHOfGiAGDFYLehC04QJSqWDTKSH
	KaY/pcA4VZzL5t/mygy7vvIHj88V+g==
X-Received: by 10.80.137.56 with SMTP id e53mr21637097ede.67.1495549969944;
	Tue, 23 May 2017 07:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-10-raj.khem@gmail.com>
	<CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
In-Reply-To: <CAJTo0La8fX-H==K-R37j2uTG2s_a5ww0hmNqtLNOEox8C-EZuQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 23 May 2017 14:32:38 +0000
Message-ID: <CAMKF1sqQfmxrG+jOHoeS-kizz127zY1vDbO3Xo4qRVnqZD8cvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 23 May 2017 14:32:49 -0000
Content-Type: multipart/alternative; boundary="f403045c283eb3d5b5055031dc62"

--f403045c283eb3d5b5055031dc62
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 6:14 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 22 May 2017 at 06:00, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +EXTRA_OEMAKE_append_class-target = "
>> LIBTOOL='${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool --tag=CC'"
>>
>
> packages/corei7-64-poky-linux/db/db-cxx: RDEPENDS: removed all items
> "libstdc++ (['>= 6.3.0'])"
>
> This doesn't seem right (happy to be told otherwise).
>


I think you are right we have c++ here can you try with --tag=CXX

>
> Ross
>

--f403045c283eb3d5b5055031dc62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Tue, May 23, 2017 at 6:14 AM Bu=
rton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 22 May 2017 at 06:00, Kh=
em Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">ra=
j.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"m_577=
3552085834513958gmail-:1qu" class=3D"m_5773552085834513958gmail-a3s m_57735=
52085834513958gmail-aXjCH m_5773552085834513958gmail-m15c2e8a521b462ce">+EX=
TRA_OEMAKE_append_class-target =3D &quot; LIBTOOL=3D&#39;${STAGING_BINDIR_C=
ROSS}/${HOST_SYS}-libtool --tag=3DCC&#39;&quot;<br></div></blockquote></div=
><br></div></div><div><div class=3D"gmail_extra">packages/corei7-64-poky-li=
nux/db/db-cxx: RDEPENDS: removed all items &quot;libstdc++ ([&#39;&gt;=3D 6=
.3.0&#39;])&quot;<br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">This doesn&#39;t seem right (happy to be told otherwise).<=
/div></div></blockquote><div><br></div><div><br></div><div>I think you are =
right we have c++ here can you try with --tag=3DCXX</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div><div class=3D"gmail_extra"></div></div><div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></blo=
ckquote></div></div>

--f403045c283eb3d5b5055031dc62--
