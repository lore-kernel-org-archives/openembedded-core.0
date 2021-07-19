Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.24752.1626680096300966859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 00:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZT/cuHA0;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id qa36so5686878ejc.10
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/+1klgeozZ9xUkVfZOTa5+TYKQb5FcNY1RW/yVAO3gc=;
        b=ZT/cuHA0Z/y9GKWsAksFxK/W3nP5Afc3vEXM5I3/JQmsqEqTJZznF+Rfw4DEtKFAOL
         N8xoRxJhCtLUjMHdzQdv1ik9ufwHbaK8LfWmfQM+mBCmnOyFvnEUipadaQFkQiPOhOvC
         ZpiKVcwIEDVKjcY1hgvChgjwK2LMlLJfYhKAIttI888bzKk4ffEHeu0r8fcFWvnKeO4e
         1Uhjg66TC3LwpHUYXGuQm1/y1TQylfGQwCs3XzYVfLSxRTzirEOb077Y8WwvI0JwRw15
         lz4SqKJiFF7K95FOOq9yFrEfFe2GRqokXp5t+mt9dyssQm2Vz1rPn86TP1Fslmwer1EI
         XhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/+1klgeozZ9xUkVfZOTa5+TYKQb5FcNY1RW/yVAO3gc=;
        b=U+3K6f9HkrunjjDwU+k171zxPntBR7xAee9s2gSOwucbjFec335T/MFIdgx61Vd+RQ
         suMslqqzUlTfOHLStx3BKGkEQ6GNMkfke8FPjjYmhRVhLN1SovvOHdoku5JbSDgk/EFf
         VZDJvgx19HfFuVMc05gQlAzKyUebdR6HH07E5K3XkLcOjliVyL7mFCsip9K+3t6sle8G
         xa3XXJKBf2ifITMqpJwTZMzf3o+LzxrSMWsOmIvJJegMaFnXFhUjNJYU9reREzunmS4V
         A/ZXeaEeRGoN9P7Y6VBxj768G+zfYqX/fg2bsdK/t4yqmLjpKjz/6Ef91uvM0FzZprBK
         KqAg==
X-Gm-Message-State: AOAM533xwFOH42lewImEmtI4/NHpPQJF8XwOOeHND9JPhw79DrZ1VIc/
	cjJ4SPB5jtE4RQ2rk2rwtEXxTn74fym5NJpyQ9g=
X-Google-Smtp-Source: ABdhPJwNC47dA7J9mq4zEx4Ht7wO4xVchQJHDp+H8jzIrQmPwt8tevudYfoVI2iaCaoxCQQS9kvBjiqSN0/oIjEkmwA=
X-Received: by 2002:a17:906:2450:: with SMTP id a16mr25753649ejb.137.1626680094630;
 Mon, 19 Jul 2021 00:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626652989.git.timothy.t.orling@intel.com>
In-Reply-To: <cover.1626652989.git.timothy.t.orling@intel.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 19 Jul 2021 09:34:43 +0200
Message-ID: <CA+chaQcn3SPu=vf+iXCAbAOS=Azyukgit9HCNKUO5L_A6dqOOQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 0/1] libxml2: Update to 2.9.12
To: Tim Orling <ticotimo@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Tony Tascioglu <tony.tascioglu@windriver.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Tim Orling <timothy.t.orling@intel.com>, Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000342dab05c774f976"

--000000000000342dab05c774f976
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 19, 2021 at 2:15 AM Tim Orling <ticotimo@gmail.com> wrote:

> Cherry-pick/back port commit from master.
>
> Since 2.9.10, upstream libxml2 has enabled fuzz testing and MANY
> commits have been added with fixes and security patches.
>
> Of the 239 commits since 2.9.10, 94 have "Fix" in the shortlog.
> A quick scan of the rest of the commits (see below) shows that the
> vast majority are bug fixes or security related.
>
> While we have been patching individual CVEs in the past, it seems
> like 2.9.12 contains enough significant value from a security
> perspective to warrant the version update in dunfell.
>

Does it have compatible ABI with 2.9.10 currently in dunfell? Unfortunately
https://abi-laboratory.pro/index.php?view=timeline&l=libxml2
ends with 2.9.10 version, but previous patchfix releases were also often
incompatible, so if 2.9.12 changes are even bigger, it might cause issues
for people with prebuilt binaries on dunfell.

--000000000000342dab05c774f976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Jul 19, 2021 at 2:15 AM Tim Orlin=
g &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Cherry-pick/back port commit from master.<br>
<br>
Since 2.9.10, upstream libxml2 has enabled fuzz testing and MANY<br>
commits have been added with fixes and security patches.<br>
<br>
Of the 239 commits since 2.9.10, 94 have &quot;Fix&quot; in the shortlog.<b=
r>
A quick scan of the rest of the commits (see below) shows that the<br>
vast majority are bug fixes or security related.<br>
<br>
While we have been patching individual CVEs in the past, it seems<br>
like 2.9.12 contains enough significant value from a security<br>
perspective to warrant the version update in dunfell.<br></blockquote><div>=
<br></div><div>Does it have compatible ABI with 2.9.10 currently in dunfell=
? Unfortunately</div><div><a href=3D"https://abi-laboratory.pro/index.php?v=
iew=3Dtimeline&amp;l=3Dlibxml2">https://abi-laboratory.pro/index.php?view=
=3Dtimeline&amp;l=3Dlibxml2</a></div><div>ends with 2.9.10 version, but pre=
vious patchfix releases were also often incompatible, so if 2.9.12 changes =
are even bigger, it might cause issues for people with prebuilt binaries on=
 dunfell.=C2=A0</div></div></div>

--000000000000342dab05c774f976--
