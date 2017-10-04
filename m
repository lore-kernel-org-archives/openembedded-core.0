Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9CB7A77822
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Oct 2017 15:11:16 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id v62so5917743itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Oct 2017 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3MMaMiGA+no18DzHP0qlu+aYARY2hY6F6kppDAcXsds=;
	b=h3xtXdE8pwxQ6Qz/I0xNiQivZkRksgE7QCZWdvMgH79lNrRKjnvbcX8boKqaxY6Qdy
	Psw6Ky2nohSA69UsryvLemCxTB/Lqf7tQitscv+Kx1v8pBeYFmWsyWpDlKEpXno9+4zt
	VQfwiCF78/8bvzTdZOUmHh+CJivS828YEByLpLxOQu879Rzz4uEGxyOUxw/m8iaq1eWg
	9RuzN5kkQmj0U1BMF31WFUgdE6mus615ZPToWS2Iyu1PlMl6pPKKzYfTrtOXmFOmkast
	OU0DY7REznk8bBK6P93fA9NBZLOCiuO6wDh5ReBALkSL7JRg/eIaZT3YF/AS0wY/YF5z
	lIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3MMaMiGA+no18DzHP0qlu+aYARY2hY6F6kppDAcXsds=;
	b=cPXK3BxgB3al/AWErx5+kekeDMxOMOboyTS/rz4Vka1jT42jXtEgFZbtOk7RVk5zSO
	py1HWu/bd8ym6+Y6jAZue1YyxLtiXYOA+hTkVKoWxOGJvpOG2+TvXVXot04w8qndexZc
	zzebt+ZLNvontSxRd+hfYvdSw69/lE6lrI6G39v9roEVlyvJOK2Y05M1Xo7j3y++4C/3
	r+ALGMoR9o/gJbToqRAJHXU255w0jwXCh9l6VmwpEP4B77Gy+TaYoOakqSNi7HfoxPYZ
	vFti9FVe+HEGQZiUyGgSkDxv68I9a97qUJLONZieTv75mwLLFPkxF8ro8U58HDV3f34C
	tcsw==
X-Gm-Message-State: AHPjjUjBDacXmOuK4CQZU5qWtXDeXxMhavTi2RL7u992UgZHqozNF6l7
	cYAzchNBSa+cUH0zfI2BQeZuFK+IVYVZ0SqK4uvwmw==
X-Google-Smtp-Source: AOwi7QDi2QiwyJ9UflhuSNtMCTX6LSYQaHrcq9tOZbv07iTWx8t8uehqsWTn6p5MlwaquJr9GcCl+V8X+HTwinaxdqI=
X-Received: by 10.36.178.1 with SMTP id u1mr31475374ite.120.1507129877474;
	Wed, 04 Oct 2017 08:11:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.134 with HTTP; Wed, 4 Oct 2017 08:10:56 -0700 (PDT)
In-Reply-To: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
References: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Oct 2017 16:10:56 +0100
Message-ID: <CAJTo0LaAzpHbaqcDSNF3TQ0J+X=07be8YK8DKfLXpWSaGef=AQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Oddness regarding file locks in package.bbclass
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
X-List-Received-Date: Wed, 04 Oct 2017 15:11:16 -0000
Content-Type: multipart/alternative; boundary="f403045d9c0efa4fff055aba0427"

--f403045d9c0efa4fff055aba0427
Content-Type: text/plain; charset="UTF-8"

On 3 October 2017 at 19:17, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> > +     # Take shared lock since we're only reading, not writing
> >       lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
>
> Here, however, it is not changed, even though a comment is added to
> say that it is. Was this intentional, or just an oversight?
>
> > +     # Take shared lock since we're only reading, not writing
> >       lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
>
> Here again a comment is added, but the code is not changed to match.


I'm no expert on this piece of code but that definitely looks like an
oversight.


> Also, what is the ${PACKAGELOCK} lock file actually protecting? With
>
the exception of the two questionable cases above, I cannot see that
> the lock is taken privately anywhere else. And since it looks as the
> code in package_do_shlibs() and package_do_pkgconfig() is not what
> needs protection (based on the added comments above), what is?
>

Good point.  The sstate locks are also shared.

Richard was involved in all of these changes so lets wait for him to return
from his holiday...

Ross

--f403045d9c0efa4fff055aba0427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 3 October 2017 at 19:17, Peter Kjellerstedt <span dir=
=3D"ltr">&lt;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blan=
k">peter.kjellerstedt@axis.com</a>&gt;</span> wrote:<br><div class=3D"gmail=
_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">&gt; +=C2=A0 =C2=A0 =
=C2=A0# Take shared lock since we&#39;re only reading, not writing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lf =3D bb.utils.lockfile(bb.data.<wbr>expand=
(&quot;${PACKAGELOCK}&quot;, d))<br>
<br>
Here, however, it is not changed, even though a comment is added to<br>
say that it is. Was this intentional, or just an oversight?<br>
<br>&gt; +=C2=A0 =C2=A0 =C2=A0# Take shared lock since we&#39;re only readi=
ng, not writing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lf =3D bb.utils.lockfile(bb.data.<wbr>expand=
(&quot;${PACKAGELOCK}&quot;, d))<br>
<br>
Here again a comment is added, but the code is not changed to match.</block=
quote><div><br></div><div>I&#39;m no expert on this piece of code but that =
definitely looks like an oversight.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
Also, what is the ${PACKAGELOCK} lock file actually protecting? With<br></b=
lockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,=
204,204);padding-left:1ex">
the exception of the two questionable cases above, I cannot see that<br>
the lock is taken privately anywhere else. And since it looks as the<br>
code in package_do_shlibs() and package_do_pkgconfig() is not what<br>
needs protection (based on the added comments above), what is?<br></blockqu=
ote><div><br></div><div>Good point.=C2=A0 The sstate locks are also shared.=
</div><div><br></div><div>Richard was involved in all of these changes so l=
ets wait for him to return from his holiday...</div><div><br></div><div>Ros=
s</div><div>=C2=A0</div></div></div></div>

--f403045d9c0efa4fff055aba0427--
