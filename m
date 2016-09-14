Return-Path: <andre.draszik@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45A36731E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 19:50:29 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id x192so2535267itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZZRPNvQPXYC8yM6x4jNNTVYjVrvJvnIE1XsSmMcc9vw=;
	b=VPDKGhqDqCFUgYOUH0yU7UBgtgsMytFVsaJoDCb3mTCk69/QRbExdkFF5YKzXH4zd5
	LFhHqSB0/vyp4iproBhcJ3L0TUMGkXUPsZrsAJxCe4txMzmitF5OK2RUwS/fgDhXKQNo
	9nYtU4dO1gk0G90ldtiPQT51ap4AEQqB4JUsVeYHHPPGeSPHMGDQES3XztyyVmuaecCM
	8qnZyPZruSpokzKfkl3pxsWhdrc7BbhwwEwMbC9qczew00fpUSYkj3Jno2zppReGG0fX
	3FUNoYg1sTUqYmElGgTLDwoqBbYQW3q3yshnI7/Shc3lP5uh5adsuCbGjlm/cbGWw1Mp
	B2Sw==
X-Gm-Message-State: AE9vXwPbMjRZ8bAVW+hwczvbzNAtWPWOFt0zlsHjs4HVJl5A4QskcQAazj1rhVrz0Xgdaw==
X-Received: by 10.107.136.27 with SMTP id k27mr9143896iod.94.1473882630183;
	Wed, 14 Sep 2016 12:50:30 -0700 (PDT)
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com.
	[209.85.214.45])
	by smtp.gmail.com with ESMTPSA id y133sm166547ioy.8.2016.09.14.12.50.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Sep 2016 12:50:30 -0700 (PDT)
Received: by mail-it0-f45.google.com with SMTP id r192so60701678ita.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 12:50:29 -0700 (PDT)
X-Received: by 10.107.174.142 with SMTP id n14mr9215145ioo.197.1473882629566; 
	Wed, 14 Sep 2016 12:50:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.36 with HTTP; Wed, 14 Sep 2016 12:50:28 -0700 (PDT)
Received: by 10.64.70.36 with HTTP; Wed, 14 Sep 2016 12:50:28 -0700 (PDT)
In-Reply-To: <20160914162519.16212-1-patrick@stwcx.xyz>
References: <20160914162519.16212-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Wed, 14 Sep 2016 20:50:28 +0100
X-Gmail-Original-Message-ID: <CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
Message-ID: <CAKUP++va+C=1wLQPMdb+=Pd-CLGigC=RREQb0OfnFnwh5fzJJA@mail.gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: configure with enable-symlink
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
X-List-Received-Date: Wed, 14 Sep 2016 19:50:30 -0000
Content-Type: multipart/alternative; boundary=001a1144822e93ab2f053c7d0a61

--001a1144822e93ab2f053c7d0a61
Content-Type: text/plain; charset=UTF-8

On 14 Sep 2016 5:40 p.m., "Patrick Williams" <patrick@stwcx.xyz> wrote:
>
> The /sbin/fsck.ext[234] programs currently installed are all
> the same binary as e2fsck.  The package provides an option to
> have fsck.ext[234] be symlinked to /sbin/e2fsck instead.  This
> reduces the uncompressed footprint of this package by ~1MB on ARM.

They were all hardlinks last time I checked not long ago. Why do hardlinks
increase the footprint?

A.

>
> Add --enable-symlink-install to EXTRA_OECONF to enable.
>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> index f4855bc..d6db612 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> @@ -18,7 +18,8 @@ UPSTREAM_CHECK_GITTAGREGEX =
"v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
>                  --enable-elf-shlibs --disable-libuuid --disable-uuidd \
> -                --disable-libblkid --enable-verbose-makecmds"
> +                --disable-libblkid --enable-verbose-makecmds \
> +                --enable-symlink-install"
>
>  EXTRA_OECONF_darwin = "--libdir=${base_libdir} --sbindir=${base_sbindir}
--enable-bsd-shlibs"
>
> --
> 2.9.0
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1144822e93ab2f053c7d0a61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 14 Sep 2016 5:40 p.m., &quot;Patrick Williams&quot; &lt;<=
a href=3D"mailto:patrick@stwcx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br>
&gt;<br>
&gt; The /sbin/fsck.ext[234] programs currently installed are all<br>
&gt; the same binary as e2fsck.=C2=A0 The package provides an option to<br>
&gt; have fsck.ext[234] be symlinked to /sbin/e2fsck instead.=C2=A0 This<br=
>
&gt; reduces the uncompressed footprint of this package by ~1MB on ARM.</p>
<p dir=3D"ltr">They were all hardlinks last time I checked not long ago. Wh=
y do hardlinks increase the footprint?</p>
<p dir=3D"ltr">A.</p>
<p dir=3D"ltr">&gt;<br>
&gt; Add --enable-symlink-install to EXTRA_OECONF to enable.<br>
&gt;<br>
&gt; Signed-off-by: Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xy=
z">patrick@stwcx.xyz</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb">e2fsprogs_1.43.bb</a> | 3 ++-<br>
&gt; =C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fspro=
gs_1.43.bb">e2fsprogs_1.43.bb</a> b/meta/recipes-devtools/e2fsprogs/<a href=
=3D"http://e2fsprogs_1.43.bb">e2fsprogs_1.43.bb</a><br>
&gt; index f4855bc..d6db612 100644<br>
&gt; --- a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb">e2fsprogs_1.43.bb</a><br>
&gt; +++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb">e2fsprogs_1.43.bb</a><br>
&gt; @@ -18,7 +18,8 @@ UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt=
;\d+\.\d+(\.\d+)*)$&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF +=3D &quot;--libdir=3D${base_libdir} --sbindir=3D${=
base_sbindir} \<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable=
-elf-shlibs --disable-libuuid --disable-uuidd \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-lib=
blkid --enable-verbose-makecmds&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --disable-lib=
blkid --enable-verbose-makecmds \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable-syml=
ink-install&quot;<br>
&gt;<br>
&gt; =C2=A0EXTRA_OECONF_darwin =3D &quot;--libdir=3D${base_libdir} --sbindi=
r=3D${base_sbindir} --enable-bsd-shlibs&quot;<br>
&gt;<br>
&gt; --<br>
&gt; 2.9.0<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br></p>

--001a1144822e93ab2f053c7d0a61--
