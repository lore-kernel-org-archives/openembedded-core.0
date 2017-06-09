Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A969A780F3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 13:07:40 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u101so6717441wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Jun 2017 06:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wvt0ARzUw6LX8QaLSqEjUB6Qom0yB0Va6EDFYdUV4AQ=;
	b=LnSRN90585Z4qTXiCv9YNf0z/zpytHyesQUXMijQtatw7iPCZ/iz9feB9A7+pYbgzo
	kT9IEEsxQqUVZd8CURi5/xPfX3ugS9J+X5vGMJ3dpxskdPdr7mnA5VTgWzrPdVUoTMaR
	QSg63sbrlyB7VkXrv64PUm/ineZtMhAdwovBxQz3qOBHefhVkKurPAaC8PfBJ2dgCtnA
	lyrQjA10qiUrQUgzMt/3bu5nLO/TCO8jpwV+2dQr8JzNcqrngUtintNEULo6aa5sVCxE
	+NJM4p0/Rq+uf8It1lYcRMDgtaHuBQwI+C3Aq70EdkCJMVgq2ESroTP1qlBaj40yGGY4
	EDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wvt0ARzUw6LX8QaLSqEjUB6Qom0yB0Va6EDFYdUV4AQ=;
	b=mCFBlJrGCevxng2sc9npoFMIeHj8LZavPvSFjhJV/hlswjQiRRtolJp4e6akZ6tWhB
	fIt1rNdK6U0QmiHlIKE1Iiy3ZsG4d/gC4DT5lXIofsSaRPUJj6q+IAPwjW6HySdQi15W
	717R7197yTq6VAKfPPI9idT7AJqZQdA9smOOXeQ4gMNj7IJd+z519lcI/fZcRZ3+cA7R
	lkTogjMLA9cXINsejE5gREsv1HmT8SDD/43c6mJvbkMXQSVrZzQIuh6iBY+OHXeTZ4Jy
	xFE0Hyv5R9uSNbwOInGFgryOK2YL+SuwUav24nsRMQnbcLWBjB0Dsqjs63LW6t6lHGp7
	ApKQ==
X-Gm-Message-State: AODbwcCqoXVpwMQJFSY8G4es/pd7E9KbM6O/4uPdy5Vc+F98wh7EhJwU
	ldhYWfD7uxDGLAjzbOvBXanqe23Mwg==
X-Received: by 10.80.144.68 with SMTP id z4mr18711099edz.143.1497013662131;
	Fri, 09 Jun 2017 06:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1496979431.git.raj.khem@gmail.com>
	<c0e598696af9be3f567751a8641effb08431a7d2.1496979431.git.raj.khem@gmail.com>
	<CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
In-Reply-To: <CAJTo0La6u=Tzzsow5ZYwqmWHY8RzyvgVqT=J4J9UpKy8uKbb9A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 09 Jun 2017 13:07:31 +0000
Message-ID: <CAMKF1srdVU0p-e4gPJx5rNEhk4aQdsiELuz+-1AsD_tgG6b_Gw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] pulseaudio: disable PIE flags when hardened flags are enabled
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
X-List-Received-Date: Fri, 09 Jun 2017 13:07:43 -0000
Content-Type: multipart/alternative; boundary="f403045c2b788e2b98055186a77f"

--f403045c2b788e2b98055186a77f
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 9, 2017 at 5:56 AM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 9 June 2017 at 04:41, Khem Raj <raj.khem@gmail.com> wrote:
>
>> +SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
>>
>
> These tend to go into security-flags.inc, not the recipe.
>

I know that's been the case but I think having a global file is error prone
its better to have it in recipe context since it can get attention at
upgrade time to test if this has been fixed in new release etc

>
> Ross
>

--f403045c2b788e2b98055186a77f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div>On Fri, Jun 9, 2017 at 5:56 AM Bur=
ton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On 9 June 2017 at 04:41, Khem =
Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.k=
hem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D"m_5414921058085105056:23f" class=3D"m_5414921058085105056a3s m_541492=
1058085105056aXjCH m_5414921058085105056m15c8af326bfa5d56">+SECURITY_CFLAGS=
 =3D &quot;${SECURITY_NO_PIE_CFLAGS}&quot;<br></div></blockquote></div><br>=
These tend to go into security-flags.inc, not the recipe.</div></div><div><=
div class=3D"gmail_extra"></div></div></blockquote><div><br></div><div>I kn=
ow that&#39;s been the case but I think having a global file is error prone=
 its better to have it in recipe context since it can get attention at upgr=
ade time to test if this has been fixed in new release etc</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc soli=
d;padding-left:1ex"><div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div></blockquote></div></div>

--f403045c2b788e2b98055186a77f--
