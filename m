Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 664956C154
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 12:09:52 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so8179317ita.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 04:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=x23AmRuVUZBBYv0/6N5bqeQ1/bqNrewWN6U9WC1CslM=;
	b=kKb/u6/Xh3aLMatgHauZoofvjY1IuypXXDD9SjRKXFsj9FppjLLSsFKyGUAQPMjPwB
	NPJ269lVZyJeRHkdIBib13vE4BpJd3RLeMzXm+0FVLJTrwNnuCmnKs/8E3yYwvHtvOUO
	R/dnDIifmFnn29G4yby+SErbvDyab9vRwJtuvJtOVRDiqBIwoB02jNRVMUgKHY97whWc
	a/cJ9cbdpup1kT6ekMDkOZiPM4NMSOMwFLUVHxhVUbPxspGhJhvTCuOHxN+pKukEOIpL
	5GbQYIH3mH/e7D4OZ7M7R1P0LK8nyzhcgxH0kBHKsV8l5zhW2aMVKpqOPOpcvozpXC97
	UFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=x23AmRuVUZBBYv0/6N5bqeQ1/bqNrewWN6U9WC1CslM=;
	b=ozgww8ojLKxZ8V3RW6FMREK1J5aPefxn9gpzZXJYzoegswRU7sVtu4d4BqcyDPLBhA
	ntS7CTPghrWoN6DdQTYvSpQk5CO/o13dKqeII/m9VnUCLzqjoNbmA0fBfvveZIo8Q3ZI
	Y+QvjdxVXB/SL29cYI/8zbnfLrND6AeXsdKhrKnmHpTR2uXXWGWjF8eMvQajDzMYekC2
	zIaWOzP3uMwIq1EATq4M6P/iSY2xwgHynehv9WPxAtypro+YadJD0e3uBOyDubxJHA8L
	JbAUUQ6H0e9e706hcExpz8bjoe9AmOaL7xFc4rHqKwueeAEwThNSOaDQ3J62cFotXua7
	heSg==
X-Gm-Message-State: AHQUAubnuNxSCSLdCTR+HxLlQ5640Y9jfAgEmNW1CywR6cr1REk4Lp73
	nG+mmt/i/KdD32oja+jT9kBx2mlksu9SzYcBDfk=
X-Google-Smtp-Source: AHgI3IYhnW5D2gvdDWRtrlswl3sJh/M7mrs3aN4W0SN6P0tHGiuGquGQM20Og2PCecSwEKspxv0WpxAS58HBKDTcw4M=
X-Received: by 2002:a5d:954e:: with SMTP id a14mr12509462ios.176.1549627793186;
	Fri, 08 Feb 2019 04:09:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1547087830.git.Qi.Chen@windriver.com>
	<59a4bff6f969b511bf8eb453472bcfffa91a2daa.1547087830.git.Qi.Chen@windriver.com>
In-Reply-To: <59a4bff6f969b511bf8eb453472bcfffa91a2daa.1547087830.git.Qi.Chen@windriver.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 8 Feb 2019 13:09:40 +0100
Message-ID: <CAB2nKc_26qh+UJbqPyM0AyaDG3VM2vsRgBo5VdLhJo7TxG83jA@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] target-sdk-provides-dummy: add more perl modules to avoid populate_sdk failure
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
X-List-Received-Date: Fri, 08 Feb 2019 12:09:52 -0000
Content-Type: multipart/alternative; boundary="00000000000025a563058160d6d9"

--00000000000025a563058160d6d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I also added those to my target-sdk-provides-dummy.bappend to get it work:

    perl-module-config \
    perl-module-warnings-register \

Maybe we could add ALLOW_EMPTY in perl recipe or add every empty
perl-module* ?

Regards,
Vincent

Le jeu. 10 janv. 2019 =C3=A0 03:30, Chen Qi <Qi.Chen@windriver.com> a =C3=
=A9crit :

> When 'adduser' package, which is from meta-perl layer, is added to rootfs=
,
> we will get do_populate_sdk failure like below.
>
> Error:
>  Problem: package perl-module-cwd-5.24.4-r0.core2_64 requires
> perl-module-dynaloader, but none of the providers can be installed
>    - package perl-module-file-temp-5.24.4-r0.core2_64 requires
> perl-module-cwd, but none of the providers can be installed
>    - package perl-module-dynaloader-5.24.4-r0.core2_64 requires
> perl-module-config, but none of the providers can be installed
>    - package adduser-3.118-r0.core2_64 requires perl-module-file-temp, bu=
t
> none of the providers can be installed
>    - package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_target
> conflicts with perl provided by perl-5.24.4-r0.core2_64
>
> This is because adduser depends on some perl modules which are not
> listed in target-sdk-provides-dummy.
>
> So add these perl modules to avoid such failure.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index edf07c4..26716ac 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -23,11 +23,14 @@ DUMMYPROVIDES =3D "\
>      perl-module-file-glob \
>      perl-module-file-path \
>      perl-module-file-stat \
> +    perl-module-file-temp \
>      perl-module-getopt-long \
>      perl-module-io-file \
> +    perl-module-overload \
>      perl-module-posix \
>      perl-module-thread-queue \
>      perl-module-threads \
> +    perl-module-warnings \
>      /bin/sh \
>      /bin/bash \
>      /usr/bin/env \
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000025a563058160d6d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi all,<br></div><div><br></div><div=
>I also added those to my target-sdk-provides-dummy.bappend to get it work:=
</div><div><br></div><div>
=C2=A0=C2=A0=C2=A0 perl-module-config \

</div><div>=C2=A0=C2=A0=C2=A0 perl-module-warnings-register \<br></div><div=
><br></div><div></div><div>Maybe we could add ALLOW_EMPTY in perl recipe or=
 add every empty perl-module* ?<br></div><div><br></div><div>Regards,</div>=
<div>Vincent<br></div></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 10 janv. 2019 =C3=A0=C2=A003:30,=
 Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com=
</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">When &#39;adduser&#39; package, which is from meta-perl layer,=
 is added to rootfs,<br>
we will get do_populate_sdk failure like below.<br>
<br>
Error:<br>
=C2=A0Problem: package perl-module-cwd-5.24.4-r0.core2_64 requires perl-mod=
ule-dynaloader, but none of the providers can be installed<br>
=C2=A0 =C2=A0- package perl-module-file-temp-5.24.4-r0.core2_64 requires pe=
rl-module-cwd, but none of the providers can be installed<br>
=C2=A0 =C2=A0- package perl-module-dynaloader-5.24.4-r0.core2_64 requires p=
erl-module-config, but none of the providers can be installed<br>
=C2=A0 =C2=A0- package adduser-3.118-r0.core2_64 requires perl-module-file-=
temp, but none of the providers can be installed<br>
=C2=A0 =C2=A0- package target-sdk-provides-dummy-1.0-r0.sdk_provides_dummy_=
target conflicts with perl provided by perl-5.24.4-r0.core2_64<br>
<br>
This is because adduser depends on some perl modules which are not<br>
listed in target-sdk-provides-dummy.<br>
<br>
So add these perl modules to avoid such failure.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dummy.bb=
" rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb</a> | 3=
 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-d=
ummy.bb" rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb<=
/a> b/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dummy.bb=
" rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb</a><br>
index edf07c4..26716ac 100644<br>
--- a/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dummy.bb=
" rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb</a><br>
+++ b/meta/recipes-core/meta/<a href=3D"http://target-sdk-provides-dummy.bb=
" rel=3D"noreferrer" target=3D"_blank">target-sdk-provides-dummy.bb</a><br>
@@ -23,11 +23,14 @@ DUMMYPROVIDES =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0perl-module-file-glob \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-file-path \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-file-stat \<br>
+=C2=A0 =C2=A0 perl-module-file-temp \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-getopt-long \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-io-file \<br>
+=C2=A0 =C2=A0 perl-module-overload \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-posix \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-thread-queue \<br>
=C2=A0 =C2=A0 =C2=A0perl-module-threads \<br>
+=C2=A0 =C2=A0 perl-module-warnings \<br>
=C2=A0 =C2=A0 =C2=A0/bin/sh \<br>
=C2=A0 =C2=A0 =C2=A0/bin/bash \<br>
=C2=A0 =C2=A0 =C2=A0/usr/bin/env \<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000025a563058160d6d9--
