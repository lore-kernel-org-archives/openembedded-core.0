Return-Path: <srifenbark@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 532F479C85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 15:33:51 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z12-v6so8224734edp.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 08:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eB2jZ2VU5O2fKWlQqC8QAWaigxrSxTnlisHVfTAIz+U=;
	b=G0pL+qeT+S9hYdUSjnS7ROFap+uGws0CHuESXgq4jRCXbyDgGvKXF66KbpJhFQIAlF
	1SdeUp5MQoBTTrQldviwGaqohA+F/QLMWGsXG9YtLYwHdV+S6g6wtaKoLY3LmGO+9+cl
	zJP4Hh2Uu4MXEBvIzWFydGvOo6z0V3FMdEu7MaAMDw3jC+HJZl/XHk/dw29skpmbQs5K
	RRxhBE2s9J90F4xK9QEB+vfYG2Vz8I7JujvFu9b/pCVm8DkYtT6gcD+RzLl2roIIPs7X
	HLPtEstGqSv/kQ0PbkAe5VI2QR6iuTWcx/J0UJwq5o9R954/JcnwPGh2Rqaz2xRxVGU8
	IZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eB2jZ2VU5O2fKWlQqC8QAWaigxrSxTnlisHVfTAIz+U=;
	b=JqW9JIUYuL/LyJhb5AR5UanKGmWuZek1IIWHWg4OAbQdROYTjiS0usmpFPppzAUd8I
	z+qqzhwaUiAtg7bdSwjGHFr6wglvS+AlLnYhxaAIl58CxqAyjG53SdNhnrCbhrbwoQVe
	Rn8YgGYhJ/sUOd4j1O6rC36Q2fhojwYf+ZljwAAtuHqZpvRniJ8FGzhYsJQia28YDH8y
	SCccgvR7T64qmRke4tEbNyQo3Utiqhbb/jj23fbwVrUi+SNqaOMgkwOSGhCqlHQlP/iz
	p2K+QgdHHSulF446e6s6FkkeDr9AGa98TJaAUDl+NS00409ggNMeZukcRgtVGw3+7918
	y+PA==
X-Gm-Message-State: AGRZ1gIDpcWAfbSkuTe0/Rp9RtmdVhntKEOywmMZeSoiTBaiUfz4PGaH
	ub1G7QpDMUMA0ybIOTvUnfOIlfW1hrV85O+ecmU=
X-Google-Smtp-Source: AJdET5c4esamMr8ci3XJhZCul2jt6gYqip023VND3wrvTjkXZh50BDD45D0+f33wOJfhgqTspDclHy1Qyf4jgSPMI2w=
X-Received: by 2002:a17:906:1a49:: with SMTP id
	j9-v6mr1932903ejf.45.1541000032013; 
	Wed, 31 Oct 2018 08:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <2829165.0Ht5z2aexs@localhost.localdomain>
	<CAFNP8OvFy2n7SMe5de66EcdM3URFm-b+dpcqS09hW0CMa9rNaA@mail.gmail.com>
	<25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
In-Reply-To: <25f056c7-d6ba-499f-8bf4-b8d1470fff4b@gmail.com>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Wed, 31 Oct 2018 08:33:40 -0700
Message-ID: <CAFNP8OtRYQQ4_YL+wfVutXfb8u6T0gufKOY78-Rw8oRnpnQzSQ@mail.gmail.com>
To: yocto.user.mailinglist@gmail.com
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Re: [yocto] 2.6 migration guide
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
X-List-Received-Date: Wed, 31 Oct 2018 15:33:51 -0000
Content-Type: multipart/alternative; boundary="00000000000081d08b057988072c"

--00000000000081d08b057988072c
Content-Type: text/plain; charset="UTF-8"

Thanks Robert...  I will do that.

Scott

On Wed, Oct 31, 2018 at 12:15 AM Robert Berger <
yocto.user.mailinglist@gmail.com> wrote:

> Hi Scott,
>
> On 31.10.18 00:06, Scott Rifenbark wrote:
> >
> > I have an initial section at
> >
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to-the-yocto-project-2.6-release,
>
> > which is based on Richard's input.  I am sure there are more items.
>
> You might want to add a link to the bitbake manual or some example from
> there for the new functionality of _remove operator:
>
>
> http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=c0a23dd9155c50a6b7df796980bc7b612cac7994#n334
>
> FOO = "123 456 789 123456 123 456 123 456"
> FOO_remove = "123"
> FOO_remove = "456"
>
> FOO is now: "  789 123456    " instead of "789 123456"
>
> >
> > Thanks,
> > Scott
>
> Regards,
>
> Robert
>
>

--00000000000081d08b057988072c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Robert...=C2=A0 I will do that.</div><div><br>=
</div><div>Scott<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Wed, Oct 31, 2018 at 12:15 AM Robert Berger &lt;<a href=3D"mailto:y=
octo.user.mailinglist@gmail.com">yocto.user.mailinglist@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">Hi Scott,<br>
<br>
On 31.10.18 00:06, Scott Rifenbark wrote:<br>
&gt; <br>
&gt; I have an initial section at <br>
&gt; <a href=3D"https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.htm=
l#moving-to-the-yocto-project-2.6-release" rel=3D"noreferrer" target=3D"_bl=
ank">https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#moving-to=
-the-yocto-project-2.6-release</a>, <br>
&gt; which is based on Richard&#39;s input.=C2=A0 I am sure there are more =
items.<br>
<br>
You might want to add a link to the bitbake manual or some example from <br=
>
there for the new functionality of _remove operator:<br>
<br>
<a href=3D"http://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual=
/bitbake-user-manual-metadata.xml?id=3Dc0a23dd9155c50a6b7df796980bc7b612cac=
7994#n334" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org=
/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-metadata.xml?id=
=3Dc0a23dd9155c50a6b7df796980bc7b612cac7994#n334</a><br>
<br>
FOO =3D &quot;123 456 789 123456 123 456 123 456&quot;<br>
FOO_remove =3D &quot;123&quot;<br>
FOO_remove =3D &quot;456&quot;<br>
<br>
FOO is now: &quot;=C2=A0 789 123456=C2=A0 =C2=A0 &quot; instead of &quot;78=
9 123456&quot;<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Scott<br>
<br>
Regards,<br>
<br>
Robert<br>
<br>
</blockquote></div>

--00000000000081d08b057988072c--
