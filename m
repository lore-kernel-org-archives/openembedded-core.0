Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0242C60621
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 18:29:40 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id i184so3360502itf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 11:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hCNrOcKgfXmf3BR7JsO8Qw5OuCwAauvoyRVLVJPEy8A=;
	b=J5IggfZb3K9NBvinJthqeBnSOkVHbqdgT0+dJMrZeDmqs9VLi4GHjz5Wd4TaYOeTnO
	ootAVm6trJ9N9lwVSF9va11SgVVyX5mqhiIfmUljkVzwMUUqF/Jb6r3xBx9wdvbAvJoV
	mDkGvWtq3WAv7TDUhdAQ15cb8VsAYDmDDjl3E5F6qofvatLWR7EwwY5G7rEskiupYuG5
	9INs3VYZ/nh/d/nbtuEkPrMS0jcKybtcLGS69ktAjjyrZavhF0VPoNfsjvncjO9iFUY/
	PQv5hzbrgF2B+nNG3g+GzQl5JehQEJHZZVFtA+ewtVqNE9Esq31d64yQoz04HLlFEKzq
	Bmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=hCNrOcKgfXmf3BR7JsO8Qw5OuCwAauvoyRVLVJPEy8A=;
	b=eYYGLukzShd7VYVgl3LcY5k6GEtL7lBWDBqny6M6WvvxE9Sd2yBcJGk2RUeTpAO3pL
	zJ4zzEsDC5iTBKXE/szKmmXU/Ng1idpfVSmeyyDKwkDhoUfhhuh2j0fuCYGVTkhYiQY3
	IQSNze3vkOS/D+8+zdgkVnM8l/Ji6WoavwLdcq2G0CfjGoUQVdLz3i4qbvKp47sFZogI
	Fudg9ohTNj/Z3RBveqPXwMtBIm7dlQy15jC37119LW5P+BJ4daNfcpLOrsyHAQWhDe1O
	+hK1L3zPMU9vMMAA+Y5vuguH+627W3j4s9V+WBWgnSvbS7sZ7JODInYdQbUxnyA9WBkN
	OKVQ==
X-Gm-Message-State: AE9vXwN9dHX86HSjO93DCbHeBKn7db/qot36+wNCy20tKgQcFNlmRkzEDRNOI9ZlrquQqAZHAozj5Qg9Zf32wA==
X-Received: by 10.157.45.23 with SMTP id v23mr1207080ota.167.1473359381139;
	Thu, 08 Sep 2016 11:29:41 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 8 Sep 2016 11:29:20 -0700 (PDT)
In-Reply-To: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
References: <1473353924-21627-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 8 Sep 2016 11:29:20 -0700
X-Google-Sender-Auth: U7P3qZM-_1MpTMsvLYac17la6Ig
Message-ID: <CABcZAN=EN4rHOX=Mt-4HEWrYf3JJzGB6eAHKEyCW+6OUBKagPA@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts: add tool to scan for bashisms recipe shell scripts
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
X-List-Received-Date: Thu, 08 Sep 2016 18:29:41 -0000
Content-Type: multipart/alternative; boundary=001a113df5d08a1855053c03360f

--001a113df5d08a1855053c03360f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2016 at 9:58 AM, Ross Burton <ross.burton@intel.com> wrote:

> +    fn =3D tempfile.NamedTemporaryFile(mode=3D"w+t")
> +    fn.write(script)
> +    fn.flush()
> +
> +    try:
> +        subprocess.check_output(("checkbashisms.pl", fn.name),
> universal_newlines=3DTrue, stderr=3Dsubprocess.STDOUT)
> +        # No bashisms, so just return
> +        return
>

Afaik, you should be using =E2=80=98with=E2=80=99 to ensure the temporary f=
iles are cleaned
up after use.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113df5d08a1855053c03360f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 8, 2016 at 9:58 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":47h" cla=
ss=3D"a3s aXjCH m1570abd0702dda1a">+=C2=A0 =C2=A0 fn =3D tempfile.NamedTemp=
oraryFile(<wbr>mode=3D&quot;w+t&quot;)<br>
+=C2=A0 =C2=A0 fn.write(script)<br>
+=C2=A0 =C2=A0 fn.flush()<br>
+<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 subprocess.check_output((&quot;<a href=3D"http=
://checkbashisms.pl" rel=3D"noreferrer" target=3D"_blank">chec<wbr>kbashism=
s.pl</a>&quot;, <a href=3D"http://fn.name" rel=3D"noreferrer" target=3D"_bl=
ank">fn.name</a>), universal_newlines=3DTrue, stderr=3Dsubprocess.STDOUT)<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # No bashisms, so just return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return</div></blockquote></div><br>Afaik, you =
should be using =E2=80=98with=E2=80=99 to ensure the temporary files are cl=
eaned up after use.<br>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a113df5d08a1855053c03360f--
