Return-Path: <yann.dirson@blade-group.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7976D79AEA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:43:31 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id e17-v6so21431162oig.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YBVlQaWqU7d9XjK/RHDC8Az6+DRdeDPh+iGru+RiJGQ=;
	b=MUNX3HycQbLC079exMJbNrpFU7XlxPzkLyWXSwFx1kjWWEvYzIVJeAKePk/5QS5kk2
	FlYdVdcydbGR0DM4QjpbfwOmOtslmYzotStq6llyqtE2LAxApyheMkGikBACPAORLsG3
	qD7DkJ5asC7rmADdoCRmeku9wxQjqwlzpkFOKzvQ6nDHzBQd9C4lqaznhNWHdwvpbWrI
	I5DKq7JTeHbiZJk8Vih/P7lRfZXow4x8oQheDpjOmIXyGG0jaa+KP887cLCG0MhgczwU
	LSmi0eo95OjPfIjNnotM2GtrJS+FMx560q6Dl4pO3JNNi2X3BQ831NvV2M06CzxOIfVA
	VEQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YBVlQaWqU7d9XjK/RHDC8Az6+DRdeDPh+iGru+RiJGQ=;
	b=I3M2N2qHIfxqlrVSot9QmMzrWqhvqr2LKGksvPSciflfW6c+NlOPlvMYDs2AcOXlbW
	HcruSM/utN0C1Y8fLmgPLMEEBLlA1mdaYwYlqKe6UT46v5M76wQAHooBMp1XuvzHJOaF
	ckTFUdhKPcQxOPJOyB5Ape1qZquIjJPpB6u9IEJcNktrEZjZDLX0z7IKBKwYFAAhuZSi
	BjQ4y8V16Z1E2ry+MCnkqnYN4HLxuqa9Rl/ON/110V2BvZ7epVcrzsZ7ZodhoK99FB8A
	SedyUju8IK8wBKl43LM7hXklAIgGSOmIqih4j7kYQI+AC1WfD9Vu6t4AFgACcJL4DBrA
	p0yQ==
X-Gm-Message-State: ABuFfoiWawaVU4djjt1ah2PMh1oguO1Jh3IH8LfKgA55Dk2wRAJY75Y+
	Q3M961ih83YYGRk3q6PSKG3rHumDriNwDLk+vU/vOw==
X-Google-Smtp-Source: ACcGV63IDRNt/VN8CW2FGjf2WfbcGQkTQIyOHLA5FD8Gt+CtTGe2Iw2eHJW5JOujSZ/VktDo/WSElGB5rR9M6e4wzKM=
X-Received: by 2002:aca:a809:: with SMTP id
	r9-v6mr13539959oie.64.1539791012439; 
	Wed, 17 Oct 2018 08:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20181017150757.14591-1-yann@blade-group.com>
	<CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
In-Reply-To: <CA+chaQekOHi4H=YYwvRvHv6AxV1UT909AOdmcTj+J_LJ4uRz-A@mail.gmail.com>
From: Yann Dirson <yann.dirson@blade-group.com>
Date: Wed, 17 Oct 2018 17:43:20 +0200
Message-ID: <CA+4=imbf=QA9B_pUA3dcqnjB4vM0XjiTvk2VozNMtne64r+n7Q@mail.gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packagegroup-tools-bluetooth: work as advertized on distro without bluez* support
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
X-List-Received-Date: Wed, 17 Oct 2018 15:43:31 -0000
Content-Type: multipart/alternative; boundary="000000000000533f2705786e88aa"

--000000000000533f2705786e88aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yeah, that looks like a better idea.

Le mer. 17 oct. 2018 =C3=A0 17:27, Martin Jansa <martin.jansa@gmail.com> a
=C3=A9crit :

> What about using some less confusing default BLUEZ value? RDEPENDS_ looks
> wrong.
>
> BLUEZ ??=3D "no-bluetooth"
> RDEPENDS_no-bluetooth =3D ""
>
> Might be a bit more clear.
>
> On Wed, Oct 17, 2018 at 5:08 PM <yann.dirson@blade-group.com> wrote:
>
>> From: Yann Dirson <yann@blade-group.com>
>>
>> Otherwise the build fails with:
>>
>>   NOTE: Runtime target '${RDEPENDS_}' is unbuildable, removing...
>>   Missing or unbuildable dependency chain was: ['${RDEPENDS_}']
>>
>> This restores some truth in the "Otherwise install nothing" comment in
>> the recipe.
>>
>> Signed-off-by: Yann Dirson <yann@blade-group.com>
>> ---
>>  .../packagegroups/packagegroup-tools-bluetooth.bb               | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> b/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> index 0ede5e57b..e81516fef 100644
>> --- a/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> +++ b/meta-oe/recipes-connectivity/packagegroups/
>> packagegroup-tools-bluetooth.bb
>> @@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D " \
>>          '', d)} \
>>  "
>>
>> +RDEPENDS_ =3D ""
>> +
>>  # Install bluez4 tools or bluez5 tools depending on what is specified i=
n
>> the distro.
>>  # Otherwise install nothing.
>>  RDEPENDS_${PN} =3D "${RDEPENDS_${BLUEZ}}"
>> --
>> 2.19.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--=20
Yann Dirson <yann@blade-group.com>
Blade -- 38 rue du Sentier, 75002 Paris

--000000000000533f2705786e88aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yeah, that looks like a better idea. <br></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">Le=C2=A0mer. 17 oct. 2018 =C3=A0=C2=A0=
17:27, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.ja=
nsa@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr">What about using some less confusing default BLUEZ =
value? RDEPENDS_ looks wrong.<div><br></div><div>BLUEZ ??=3D &quot;no-bluet=
ooth&quot;</div><div>RDEPENDS_no-bluetooth =3D &quot;&quot;</div><div><br><=
/div><div>Might be a bit more clear.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr">On Wed, Oct 17, 2018 at 5:08 PM &lt;<a href=3D"mailto:=
yann.dirson@blade-group.com" target=3D"_blank">yann.dirson@blade-group.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Yann Dirson &l=
t;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yann@blade-grou=
p.com</a>&gt;<br>
<br>
Otherwise the build fails with:<br>
<br>
=C2=A0 NOTE: Runtime target &#39;${RDEPENDS_}&#39; is unbuildable, removing=
...<br>
=C2=A0 Missing or unbuildable dependency chain was: [&#39;${RDEPENDS_}&#39;=
]<br>
<br>
This restores some truth in the &quot;Otherwise install nothing&quot; comme=
nt in the recipe.<br>
<br>
Signed-off-by: Yann Dirson &lt;<a href=3D"mailto:yann@blade-group.com" targ=
et=3D"_blank">yann@blade-group.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-tools-bluetooth.bb" =
rel=3D"noreferrer" target=3D"_blank">packagegroup-tools-bluetooth.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://p=
ackagegroup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packag=
egroup-tools-bluetooth.bb</a> b/meta-oe/recipes-connectivity/packagegroups/=
<a href=3D"http://packagegroup-tools-bluetooth.bb" rel=3D"noreferrer" targe=
t=3D"_blank">packagegroup-tools-bluetooth.bb</a><br>
index 0ede5e57b..e81516fef 100644<br>
--- a/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
+++ b/meta-oe/recipes-connectivity/packagegroups/<a href=3D"http://packageg=
roup-tools-bluetooth.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-=
tools-bluetooth.bb</a><br>
@@ -32,6 +32,8 @@ RDEPENDS_bluez5 =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
<br>
+RDEPENDS_ =3D &quot;&quot;<br>
+<br>
=C2=A0# Install bluez4 tools or bluez5 tools depending on what is specified=
 in the distro.<br>
=C2=A0# Otherwise install nothing.<br>
=C2=A0RDEPENDS_${PN} =3D &quot;${RDEPENDS_${BLUEZ}}&quot;<br>
-- <br>
2.19.1<br>
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
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>Ya=
nn Dirson &lt;<a href=3D"mailto:yann@blade-group.com" target=3D"_blank">yan=
n@blade-group.com</a>&gt;<br>Blade -- 38 rue du Sentier, 75002 Paris<br></d=
iv></div></div>

--000000000000533f2705786e88aa--
