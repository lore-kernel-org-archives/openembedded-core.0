Return-Path: <kergoth@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 160AA73569
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 15:55:35 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 10so12955380ykt.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 07:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=VtwYjtaZDoWubGUgB2y2mbfpkksc/s9fKLw9tYFCOVQ=;
	b=znOc8Dh+WZmLWLHVm7c7Up/8VZKRutmAwrmly/GsNWOaSDBWkzYco60B6rY5sQlyYm
	AgaWoehip9/p/Nl13M+O0qjHEysy+Ucj+rzeJ0J2kqjRALEIN1qHjpAlii998MvnBIBz
	/rxUtvIvzeHN2KQTNCH5iahnSJAzhqIRlxzT9qegNOkmNquQ6mu1RUmwCXioOF9RxJYO
	eCQDg47rMPmEDJ4VeUBr/H3NY+Ut5MA2Oek5k5PwPSV4TdV0DG6oWKU587s5aFRXGsMt
	e8s7sFWF7DRz7LwZE1EyuCtwfftx7Nb4HiOgmgJtwMO7qARYEIgxPZqq5jeu2mM8JzXV
	dydg==
X-Received: by 10.236.21.163 with SMTP id r23mr2743005yhr.141.1424188536912;
	Tue, 17 Feb 2015 07:55:36 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.170.120.4 with HTTP; Tue, 17 Feb 2015 07:55:16 -0800 (PST)
In-Reply-To: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 17 Feb 2015 08:55:16 -0700
X-Google-Sender-Auth: FUDme3iDX7IUGHiVTalD43VoRW8
Message-ID: <CABcZANmxWG1Vg5L0y8LWG_=WA-BCevD0f_Y_6NhPj_9zq82azg@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Tue, 17 Feb 2015 15:55:38 -0000
Content-Type: multipart/alternative; boundary=089e015371c8d5ff57050f4abbae

--089e015371c8d5ff57050f4abbae
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 17, 2015 at 6:42 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> +            # Treat all symlinks to directories as normal files.
> +            # os.walk() lists them as directories.
> +            for i, entry in enumerate(dirs):
> +                if os.path.islink(os.path.join(rootpath, entry)):
> +                    del dirs[i]
> +                    files.append(entry)
> +
>

You're deleting elements of a list while you're iterating over it. I'm
fairly certain that will lead to pain, unless you explicitly ensure you're
operating against a copy: for i, entry in enumerate(list(dirs)):
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e015371c8d5ff57050f4abbae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 17, 2015 at 6:42 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":qk" cl=
ass=3D"a3s" style=3D"overflow:hidden">+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 # Treat all symlinks to directories as normal files.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # os.walk() lists them as direct=
ories.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i, entry in enumerate(dirs):=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(=
os.path.join(rootpath, entry)):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 del =
dirs[i]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
s.append(entry)<br>
+</div></blockquote></div><br>You&#39;re deleting elements of a list while =
you&#39;re iterating over it. I&#39;m fairly certain that will lead to pain=
, unless you explicitly ensure you&#39;re operating against a copy: for i, =
entry in enumerate(list(dirs)):<br>-- <br><div class=3D"gmail_signature">Ch=
ristopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEm=
bedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mento=
r Graphics</div>
</div></div>

--089e015371c8d5ff57050f4abbae--
