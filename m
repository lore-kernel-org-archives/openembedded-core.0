Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D690460684
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Sep 2018 19:12:45 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id s12-v6so5587624wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2018 12:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AInUlBUp8v+jnEJ7hB9pInZ8LFo7Fl7h0IBO6i0B0tg=;
	b=IJ/NZAs7sKX31tPcSb1rBGyx+jnMKZrLaRIUB7vZ5I6AYSOnTk3V5y0+39yEpOkrYI
	z3i/uev1vEDVPGDxCx2r8wQB9UaFjq8RizLSmdwOAKV9ZPs82g1qtWQQlgg4Wnyta/+s
	wjptYZu9GdUfuOfEzNhWU14nPtctFeF5hiS2G+0/0WcnZ5uyB4mkIg9gDheGdA9q6x56
	8/XuTzBOnt9YKC0UfMO/9G2wahpWI8BkgTWpSqZ06tTly2AjdR8ftACO/GTDRnmA8B7H
	k+X3J8K3xGn7FcELqZidHp+9ORDk9hw/MTKdiVot2avXvrYAaotW1Cwpdcds+P56A0b6
	XQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AInUlBUp8v+jnEJ7hB9pInZ8LFo7Fl7h0IBO6i0B0tg=;
	b=Ih/gx6WYijpf2jjD9lo/00mjsnHmWbZNk1BgHRCE9yOieDY3Zr+Y+MJkm6N8gT+YYn
	4vsNz9mB6C3QfDsjIu1I3RibBq+LtSdy53/rGGhJnmIr/wcygXoB7KEM6PsyyOrrl1RJ
	ac7jmfPgwtnc2FiYNLa4vdqV6s1+xVxK9oCsMXf+qHVAKXJmA5tpqGVMKUMLFmnbAxw9
	Lf8aqtRqYkb/0kV4RTxQR3og5xtVmDLsJb02a79cZ5LUwXUD6pRrwCcsWrEOQd6Cq/Du
	ByynRXOk+szRGu572QAXjkiqnBJ7D9aL/efi9DdyQVOdKwxpU0chQTC1iKMXMS5usRhh
	qYTg==
X-Gm-Message-State: APzg51DF8zXsLm5cB4iy8J6t8Zr4dcQOFppWiu0mSZMekHP+xxO1b65+
	lE4fq6kCQoj4A8q8UIROgaoV8kNm3kfM2j0Ld4o=
X-Google-Smtp-Source: ANB0VdbNtYmRoI9HiC1ek0kXA0Sx8UIVUAIn44/YwOkMjvds+NzcZo8QJmUtidJwEDoDE1a37oQzhVJiIia4yZS5OY0=
X-Received: by 2002:a1c:3413:: with SMTP id
	b19-v6mr3363316wma.21.1536088366563; 
	Tue, 04 Sep 2018 12:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
In-Reply-To: <b0f6196af47cab59f634fbffea7121a684dd4ad0.1535451643.git.alex.kanavin@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Sep 2018 21:12:35 +0200
Message-ID: <CA+chaQfSBfzWoDKkWH0arU388zqewFMVKQ+bJwo4TMABZhAiog@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/6] openssl: rename openssl 1.0.x to openssl10 and make openssl 1.1.x the default version
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
X-List-Received-Date: Tue, 04 Sep 2018 19:12:46 -0000
Content-Type: multipart/alternative; boundary="0000000000006ec7f40575107138"

--0000000000006ec7f40575107138
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 12:23 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>
> I believe the time has come to do this: openssl 1.0 upstream support stops
> at the end
> of 2019, and we do not want a situation where a supported YP release
> contains an
> unsupported version of a critical security component.
>
> Openssl 1.0 can still be utilized by depending on 'openssl10' recipe.
>

This still isn't true for most recipes, as long as there is something
depending on openssl in the dependency tree, it will
cause do_prepare_recipe_sysroot failures like last time

ERROR: The file /usr/lib/libssl.so is installed by both openssl10 and
openssl, aborting
DEBUG: Python function extend_recipe_sysroot finished
DEBUG: Python function do_prepare_recipe_sysroot finished
ERROR: Function failed: extend_recipe_sysroot

From 15 failures caused by openssl-1.1 detected in my builds, just changing
DEPENDS from openssl to openssl10 didn't help in any case.

Regards,

--0000000000006ec7f40575107138
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><div dir=3D"ltr">On Tue, Aug 28, 2018 at 12:23 PM Alexander Kanavin &lt;=
<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Alexa=
nder Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com" targe=
t=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;<br>
<br>
I believe the time has come to do this: openssl 1.0 upstream support stops =
at the end<br>
of 2019, and we do not want a situation where a supported YP release contai=
ns an<br>
unsupported version of a critical security component.<br>
<br>
Openssl 1.0 can still be utilized by depending on &#39;openssl10&#39; recip=
e.<br></blockquote><div><br></div><div>This still isn&#39;t true for most r=
ecipes, as long as there is something depending on openssl in the dependenc=
y tree, it will cause=C2=A0do_prepare_recipe_sysroot failures like last tim=
e</div><div><br></div><div>ERROR: The file /usr/lib/libssl.so is installed =
by both openssl10 and openssl, aborting</div><div>DEBUG: Python function ex=
tend_recipe_sysroot finished</div><div>DEBUG: Python function do_prepare_re=
cipe_sysroot finished</div><div>ERROR: Function failed: extend_recipe_sysro=
ot</div><div><br></div><div>From 15 failures caused by openssl-1.1 detected=
 in my builds, just changing DEPENDS from openssl to openssl10 didn&#39;t h=
elp in any case.</div><div><br></div><div>Regards,</div></div></div></div><=
/div>

--0000000000006ec7f40575107138--
