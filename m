Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D713F7DE75;
	Tue, 21 May 2019 19:16:53 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j12so30995170eds.7;
	Tue, 21 May 2019 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yLgo/4xHt3vIF3aeLgwhyjvZmtOw9l4ROOglmDtoM80=;
	b=AWL8+CuD9s1VXtO2x6pPvECLA6tLluWZOmhxNyELZZZixRZOEmSPxlcf78L+C6GVzY
	tuLXSeTtnOtEMg+p6KjxgGL9XwhqMyWaIgQuif7p6Mnktkh8RzNi8XMp08Wc8bV216U+
	8upiHm3mMvcy9Bf9JLDQ2KUGMIOoHm/p8CTEEtrijGQSICBzUgqKKFsLNzq879HL+rhy
	XMH+obF0jJCjkN135WOFTx00KpdNaJQDC6SSnXozoeBMw5EVQMU0btwZei5T0izVzEzd
	wS4G7UF7MTTNzmsQXULQil6uuvwAoMnjL0oYW+Ws2Gz5yWLzwMSjf7BYEnC1eOepFOsW
	7ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yLgo/4xHt3vIF3aeLgwhyjvZmtOw9l4ROOglmDtoM80=;
	b=SN9sZPrw75304zQyCspbYjmn8/0WJVARXDg8F5CpCTpJcl2Fen9UJCO0CXUTD3sscG
	3DA4xknRf+D/WgLUdI1O/XUcGtamkxFFkSfQcj0kY8gzewptGDVpaeBDXQx3nQpRuPE7
	nlGbAdoF0lYE5JLybaRD2pmmGjIiH9cbvQ2aNX8iBpaqMtPT3gIRazAYMkl2ypsJm91n
	ER3p4ebLUeUpcms++9ESa9t1mGO4W6VjOz+0tBxK6bCbOSx8hl+SBVwAF38SsafCL0xv
	+2fUoAmL7q0FtghL9qB+DuM46Th6/QJ6qFAgKCKNJYbjCKv7C0L+6YSO6H/97KRDd+TY
	ZsDg==
X-Gm-Message-State: APjAAAUxMXWN3EIEIYo7LzFYO2/7pANv6lI6j4JD+86AmDWhIIydQaby
	AW8PG8DLsvX6h2L4gkMw8iw+gzE3UraJex3x2b4=
X-Google-Smtp-Source: APXvYqwC9LtnBK5+l/pJqyr1Y2YUAcpA5tfJR2Ox/03xz7AgTkUfk6MBTVbOM7BvQZDTfs4TIjSpiTyAbJYtPJMnGf0=
X-Received: by 2002:a17:906:60c7:: with SMTP id
	f7mr40509354ejk.107.1558466214517; 
	Tue, 21 May 2019 12:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <155835954710.1385.17313223441723245564@git.openembedded.org>
	<20190520133908.14001235301@git.openembedded.org>
In-Reply-To: <20190520133908.14001235301@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 21 May 2019 21:16:52 +0200
Message-ID: <CA+chaQfRhi2jaTgTnUNzE637-vP6MreC_ojyAe3xsO=e20YX7Q@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 19/24: acpica: use update-alternatives for acpidump
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
X-List-Received-Date: Tue, 21 May 2019 19:16:54 -0000
Content-Type: multipart/alternative; boundary="0000000000001c5fe405896ab110"

--0000000000001c5fe405896ab110
Content-Type: text/plain; charset="UTF-8"

This seems to be causing:
WARNING: acpica-20180508-r0 do_package: acpica: alternative target
(/usr/bin/acpidump or /usr/bin/acpidump.acpica) does not exist, skipping...
WARNING: acpica-20180508-r0 do_package: acpica: NOT adding alternative
provide /usr/bin/acpidump: /usr/bin/acpidump.acpica does not exist
WARNING: acpica-20180508-r0 do_package: acpica: alt_link == alt_target:
/usr/bin/acpidump == /usr/bin/acpidump

because the 20180508 version in warrior unlike the 20190405 in master
doesn't install acpidump binary.

Please revert from warrior.

On Mon, May 20, 2019 at 3:39 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch warrior
> in repository openembedded-core.
>
> commit c3a325b5c2d9315629d014e5ebba552fe045171c
> Author: Hongxu Jia <hongxu.jia@windriver.com>
> AuthorDate: Mon May 6 10:37:27 2019 +0800
>
>     acpica: use update-alternatives for acpidump
>
>     acpidump is both provided by acpica and pmtools, so use
>     update-alternatives to fix conflicts:
>     ...
>     |Error: Transaction check error:
>     |  file /usr/bin/acpidump conflicts between attempted installs of
>     pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-r0.i586
>     ...
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-extended/acpica/acpica_20180508.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/acpica/acpica_20180508.bb
> b/meta/recipes-extended/acpica/acpica_20180508.bb
> index b5c89fa..cd5f466 100644
> --- a/meta/recipes-extended/acpica/acpica_20180508.bb
> +++ b/meta/recipes-extended/acpica/acpica_20180508.bb
> @@ -29,7 +29,7 @@ S = "${WORKDIR}/acpica-unix2-${PV}"
>  inherit update-alternatives
>
>  ALTERNATIVE_PRIORITY = "100"
> -ALTERNATIVE_${PN} = "acpixtract"
> +ALTERNATIVE_${PN} = "acpixtract acpidump"
>
>  EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
>
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--0000000000001c5fe405896ab110
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This seems to be causing:<div>WARNING: acpica-20180508-r0 =
do_package: acpica: alternative target (/usr/bin/acpidump or /usr/bin/acpid=
ump.acpica) does not exist, skipping...</div><div>WARNING: acpica-20180508-=
r0 do_package: acpica: NOT adding alternative provide /usr/bin/acpidump: /u=
sr/bin/acpidump.acpica does not exist<br></div><div>WARNING: acpica-2018050=
8-r0 do_package: acpica: alt_link =3D=3D alt_target: /usr/bin/acpidump =3D=
=3D /usr/bin/acpidump<br></div><div><br></div><div>because the 20180508 ver=
sion in warrior unlike the=C2=A020190405 in master doesn&#39;t install acpi=
dump binary.</div><div><br></div><div>Please revert from warrior.</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On M=
on, May 20, 2019 at 3:39 PM &lt;<a href=3D"mailto:git@git.openembedded.org"=
>git@git.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">This is an automated email from the git hooks/post=
-receive script.<br>
<br>
rpurdie pushed a commit to branch warrior<br>
in repository openembedded-core.<br>
<br>
commit c3a325b5c2d9315629d014e5ebba552fe045171c<br>
Author: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=
=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
AuthorDate: Mon May 6 10:37:27 2019 +0800<br>
<br>
=C2=A0 =C2=A0 acpica: use update-alternatives for acpidump<br>
<br>
=C2=A0 =C2=A0 acpidump is both provided by acpica and pmtools, so use<br>
=C2=A0 =C2=A0 update-alternatives to fix conflicts:<br>
=C2=A0 =C2=A0 ...<br>
=C2=A0 =C2=A0 |Error: Transaction check error:<br>
=C2=A0 =C2=A0 |=C2=A0 file /usr/bin/acpidump conflicts between attempted in=
stalls of<br>
=C2=A0 =C2=A0 pmtools-20130209+git0+3ebe0e54c5-r0.i586 and acpica-20190405-=
r0.i586<br>
=C2=A0 =C2=A0 ...<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@wi=
ndriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@=
gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/acpica/<a href=3D"http://acpica_20180508.bb" re=
l=3D"noreferrer" target=3D"_blank">acpica_20180508.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-extended/acpica/<a href=3D"http://acpica_20180508=
.bb" rel=3D"noreferrer" target=3D"_blank">acpica_20180508.bb</a> b/meta/rec=
ipes-extended/acpica/<a href=3D"http://acpica_20180508.bb" rel=3D"noreferre=
r" target=3D"_blank">acpica_20180508.bb</a><br>
index b5c89fa..cd5f466 100644<br>
--- a/meta/recipes-extended/acpica/<a href=3D"http://acpica_20180508.bb" re=
l=3D"noreferrer" target=3D"_blank">acpica_20180508.bb</a><br>
+++ b/meta/recipes-extended/acpica/<a href=3D"http://acpica_20180508.bb" re=
l=3D"noreferrer" target=3D"_blank">acpica_20180508.bb</a><br>
@@ -29,7 +29,7 @@ S =3D &quot;${WORKDIR}/acpica-unix2-${PV}&quot;<br>
=C2=A0inherit update-alternatives<br>
<br>
=C2=A0ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br>
-ALTERNATIVE_${PN} =3D &quot;acpixtract&quot;<br>
+ALTERNATIVE_${PN} =3D &quot;acpixtract acpidump&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;CC=3D&#39;${CC}&#39; &#39;OPT_CFLAGS=3D-Wall&#=
39;&quot;<br>
<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--0000000000001c5fe405896ab110--
