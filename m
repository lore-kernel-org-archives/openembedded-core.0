Return-Path: <leobsd@gmail.com>
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail.openembedded.org (Postfix) with ESMTP id E1DBE7C5C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 16:42:32 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id l10so2986681lfh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JNGql08jVYUYfZyo8s+qlPeBz1V8QNoEscHVnjylHxU=;
	b=ZwfNdGYD+tnK3gehEL8dQRwgKQQNe5TED5peCoC15BPRsbUQTgq6cMSlfwiFhqjcpc
	VpdEhM1zKr4poAWwTgIH69EiDCcziavJE3WdCZc5l252fvaWchRC5qHMfFonP0oDvPBD
	P6nnSh7YQp1/53GU2aYI45vviqRL3ECsWD6UI+/FsHh0ZM0bDDfddVpGFa5162HbDuzr
	rwvOBSrCb+bC//BZgy+dEZ7dD/eZQxsSS8y0wtFUfpUZN7bHrv2nWrsk5PthW42nLfj2
	4bgywRbA/6dU/w2QF+n+CU3xFyKAo6wEJKCmngH/i7Eo6LxAd4u86MWI7E67Q29NgR7/
	VGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JNGql08jVYUYfZyo8s+qlPeBz1V8QNoEscHVnjylHxU=;
	b=Do4psicQ17f29E9DkfRMcILm5jlkEkEJ0/9ZijhJQot+guesPyf6ysAsGwy5LQTwpH
	wXV1guuoXTsAYgYVxkpp4pyBt5Opq8FVfM2r9HnRo1T80owCikcdLFmy4nstKVnM0Hwh
	kHAxEx0BbC372tXYYSfC7Fdt8WRM2VWbkQ/rJyD0sl7nJY9X9XVnj/xEDlaBw7g+RaCi
	8X3CM1d1qHZmUdZJH0pzJF00nSVrXgywWNbQ0bqYIijA25n9T8KGqruQP9jii4yjYCts
	bRM39Akbmsr3Wf6uGvwOUTkUZ23D/WTSzd7wIdJ+OJZHq47PYHKHtHuk5usdfhE3mM7b
	VcwQ==
X-Gm-Message-State: AHQUAub1EY74hNEO9dHGCShxo5GXEgOb+lVhgYpnv0FYeIXnpy2KOWIu
	6Tkmr5JX3hB8P/jXbUuJ5LUiTLPYS4K40Dz8ZWc=
X-Google-Smtp-Source: AHgI3Ia9lFOLW60M1Qvu5uTfKiZI+P0gz0UZ9WhjSo1Vb7OwEhtJuZtggEINPYRdireOYfizj21Iou1u+tmfB9j48B4=
X-Received: by 2002:a19:915d:: with SMTP id y29mr1085819lfj.92.1549644153372; 
	Fri, 08 Feb 2019 08:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20190208082005.24173-1-leobsd@gmail.com>
	<7e6b799899ca0c0e9e07998add5ccd7a7d508c3b.camel@andred.net>
In-Reply-To: <7e6b799899ca0c0e9e07998add5ccd7a7d508c3b.camel@andred.net>
From: Leonardo Rangel <leobsd@gmail.com>
Date: Fri, 8 Feb 2019 08:41:56 -0800
Message-ID: <CAN7MDW9=O76k6difPuidh3ybQqAkq5Z_jNiP2Si0pzD5k0vktA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] Fix cp's target path for ext* filesystems
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
X-List-Received-Date: Fri, 08 Feb 2019 16:42:34 -0000
Content-Type: multipart/alternative; boundary="0000000000004a4814058164a5c9"

--0000000000004a4814058164a5c9
Content-Type: text/plain; charset="UTF-8"

> On Fri, 2019-02-08 at 00:20 -0800, Leonardo Augusto wrote:
[...]
> >
> > diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> > index 4662c665c0..b4be796752 100644
> > --- a/scripts/lib/wic/engine.py
> > +++ b/scripts/lib/wic/engine.py
> > @@ -331,7 +331,7 @@ class Disk:
> >      def copy(self, src, pnum, path):
> >          """Copy partition image into wic image."""
> >          if self.partitions[pnum].fstype.startswith('ext'):
> > -            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
> > +            cmd = "echo 'cd {}\nwrite {} {}' | {} -w {}".\
>
> This causes some shell's echos to output a literal \n (two characters,
'\'
> and 'n').
>
> The solution should be to use printf instead of echo...

Yes, indeed. I've just sent out a v3 based on your suggestion.

Thanks!

--0000000000004a4814058164a5c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">&gt; On Fri, 2019-02-08 at 00:20 -0800, L=
eonardo Augusto wrote:<br>[...]<br>&gt; &gt;<br>&gt; &gt; diff --git a/scri=
pts/lib/wic/engine.py b/scripts/lib/wic/engine.py<br>&gt; &gt; index 4662c6=
65c0..b4be796752 100644<br>&gt; &gt; --- a/scripts/lib/wic/engine.py<br>&gt=
; &gt; +++ b/scripts/lib/wic/engine.py<br>&gt; &gt; @@ -331,7 +331,7 @@ cla=
ss Disk:<br>&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def copy(self, src, pnu=
m, path):<br>&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;&quot;&quot;Copy partition image into wic image.&quot;&quot;&quot=
;<br>&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if sel=
f.partitions[pnum].fstype.startswith(&#39;ext&#39;):<br>&gt; &gt; -=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D &quot;=
echo -e &#39;cd {}\nwrite {} {}&#39; | {} -w {}&quot;.\<br>&gt; &gt; +=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D &qu=
ot;echo &#39;cd {}\nwrite {} {}&#39; | {} -w {}&quot;.\<br>&gt; <br>&gt; Th=
is causes some shell&#39;s echos to output a literal \n (two characters, &#=
39;\&#39; <br>&gt; and &#39;n&#39;).<br>&gt; <br>&gt; The solution should b=
e to use printf instead of echo...<br><br>Yes, indeed. I&#39;ve just sent o=
ut a v3 based on your suggestion.<br><br>Thanks!<br></div></div>

--0000000000004a4814058164a5c9--
