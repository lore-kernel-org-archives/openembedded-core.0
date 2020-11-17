Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web08.14764.1605647927629444241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 13:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oq9qe5yL;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id o21so31470034ejb.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jv00MEN0FrdMvfKrP36AdoWI6FD/4siouf0hwiz74CY=;
        b=oq9qe5yLDgdCD8c+Ltk5HStqcDTQ8Md8j4FE81Ekbo+pnA3oDi5fxfvHi1h6wvUsrR
         Vb0aAVIIQ3AyHYd5SvzECyiFYV4kW9W6xjURjAId+2hj3ftZUSfRoaa64RhKSH8NYVQR
         b84RwqO0Jt9sJO7u/OOEWwAaIMKiQ64PSuOXsTDO2ufpvdkmjjdmccfpXRbymPhpCd5S
         VTwcsdeOG4BhuqpfJSawAphcay+sUjoDDQquaKUxjGTRQc2lQ4k46pz5ctG1UB6Ni+0e
         XdjkTGYSX+SvXOVLWnNG3ZrefOzIIM+/N+ad22SeHzNXN4fKWP++mwXgxj4HVgrUkVlP
         hfQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jv00MEN0FrdMvfKrP36AdoWI6FD/4siouf0hwiz74CY=;
        b=W1D0ok5v6rsKZzySPMbGv47NzGTku+6hVbmmPBU8119cH7aCKvPfX4HXUgsTmqq/oh
         qS5SOMwIhkDMQhrkVc2EhF4hvM+tlSk5dBAJ9V9sChxYyfZjXsoPR2hNF6f8UhOLQ5BI
         bstRBILUnxjiXMjnYkvg2H3zrqejChmdVibQ8PI1ZOSw9gi0cNxfahSGh3yrCf/nmrPS
         AdCYDtKg1KsQkRcKhd2peJmTN5G7vusb2us2UI07gqyl58sZYmTO2yHwdk/mCZtDwuI1
         F74R88lP8If6D4kKhC8bSS8xjs6/qcXlMyHQQhsgwcZjK+QojFEDjFqMqrN6pcLYkbRB
         t9ow==
X-Gm-Message-State: AOAM5317P6IV+MTRJiIMeee6Jp6Qashg7l7rHhaSF0zLsI33WOKQ8Udj
	Zl8puDIpqq5nr/7hFUF0HYFjgvqitjWbWUjYV1w=
X-Google-Smtp-Source: ABdhPJydGyuY1NTo9yI7PebG/8MY26FXLBmDfH8KcrvgFnn0mZgZz7/CMRvfpGpDWRO7AxFUqrcPzMg572uItsjvJik=
X-Received: by 2002:a17:906:aacb:: with SMTP id kt11mr22632763ejb.12.1605647926079;
 Tue, 17 Nov 2020 13:18:46 -0800 (PST)
MIME-Version: 1.0
References: <20201117180441.296304-1-raj.khem@gmail.com> <CANPvuRkvCVF8nV5Gpo0LYkGs4d8So4Pvukp-YpDxK1=1vS116Q@mail.gmail.com>
 <CA+chaQdPKhwuw197c=cHesYPmS5weQc6jc6SQi-1iisEGdHSeg@mail.gmail.com>
 <CANPvuRnK2v4SwZ722=Phhp_C6PGphB7ygMYOzMaCDbbXcSzUsw@mail.gmail.com> <CA+chaQdJ79DA8zB9DFkqbVWzumABb+aF5jXgPu0s4pdqXQ7UTg@mail.gmail.com>
In-Reply-To: <CA+chaQdJ79DA8zB9DFkqbVWzumABb+aF5jXgPu0s4pdqXQ7UTg@mail.gmail.com>
From: "Jose Quaresma" <quaresma.jose@gmail.com>
Date: Tue, 17 Nov 2020 21:18:34 +0000
Message-ID: <CANPvuR=k3b+oiObtgixKTS2nX=sbFkdeaQ44GcmHDU=rrD12LQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3targetconfig.bbclass: Make py3 dep and tasks only for target recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
17/11/2020 =C3=A0(s) 20:24:
>
> Then you will need space in:
> EXTRA_PYTHON_DEPENDS_append_class-target =3D " python3"
> as well.

right.

>
> I don't expect EXTRA_PYTHON_DEPENDS to be often (if at all) outside the =
bbclass, but IMHO it's good convention to just use leading space wherever y=
ou append to space separated list (less surprises for people who might even=
tually set something like EXTRA_PYTHON_DEPENDS in their recipes - even from=
 wrong reasons).
>

if EXTRA_PYTHON_DEPENDS is don't expect to be often (if at all)
outside the bbclass, a clean solution can be:

-DEPENDS_append =3D " python3"
+DEPENDS_append_class-target =3D " python3"

> On Tue, Nov 17, 2020 at 9:18 PM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>>
>> Martin,
>>
>> you're right. if EXTRA_PYTHON_DEPENDS is set outside of the bbclass it
>> break the DEPENDS.
>>
>> Sorry Khem for my suggestion, your initial was right.
>>
>> +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
>> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>>
>> But in this case (when EXTRA_PYTHON_DEPENDS is set outside of the bbcla=
ss)
>> it will don't have any effect for the overwrite class-target because
>> EXTRA_PYTHON_DEPENDS_class-target=3D"python3" always will set
>> EXTRA_PYTHON_DEPENDS=3D"python3"
>>
>> I think I have see another problem now and something like this is bette=
r:
>>
>> +EXTRA_PYTHON_DEPENDS_append_class-target =3D "python3"
>> +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>>
>> Martin Jansa <martin.jansa@gmail.com> escreveu no dia ter=C3=A7a,
>> 17/11/2020 =C3=A0(s) 19:56:
>> >
>> > I don't mind this change, but why do you think space in the variable =
is better in this case (where we don't mind extra space being added for nat=
ive/nativesdk case?)
>> >
>> > If someone sets EXTRA_PYTHON_DEPENDS =3D "foo" for whatever reason in=
 some recipe, then the space will be missing.
>> >
>> > On Tue, Nov 17, 2020 at 7:36 PM Jose Quaresma <quaresma.jose@gmail.co=
m> wrote:
>> >>
>> >> Khem Raj <raj.khem@gmail.com> escreveu no dia ter=C3=A7a, 17/11/2020=
 =C3=A0(s) 18:04:
>> >> >
>> >> > python3targetconfig append target python3 to dependencies
>> >> > unconditionally, and here its inherited unconditionally too but
>> >> > distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other=
 not-target
>> >> > recipes as well. Hence the change added via 9c8f666097802cb594a759=
989edcf01603a22df3
>> >> > is now bridging the native dependencies with target python3 and th=
ats
>> >> > resulting all sorts of rebuilds for multimachine builds e.g.
>> >> >
>> >> > MACHINE=3Dqemuarm bitbake python3-scons-native
>> >> > MACHINE=3Dqemumips bitbake python3-scons-native
>> >> >
>> >> > results in rebuilds for python3-scons-native
>> >> >
>> >> > bitbake-diffsigs shows
>> >> >
>> >> > Hash for dependent task python/python3-scons-native_3.1.2.bb:do_po=
pulate_sysroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa2903314=
6b405153f73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>> >> > 0e3b97bd058d162065
>> >> >     Hash for dependent task python/python3-scons-native_3.1.2.bb:d=
o_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4f=
b11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>> >> > 229cb0f5ebb11
>> >> >         Hash for dependent task python/python3-scons-native_3.1.2.=
bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb62608a59760879=
3336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>> >> > 7cc9769194c43eae1
>> >> >             Hash for dependent task python/python3-scons-native_3.=
1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266=
dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee778f848acdfaa2
>> >> > b346650fbdf114ac70ab57b
>> >> >                 Hash for dependent task python/python3-scons-nativ=
e_3.1.2.bb:do_prepare_recipe_sysroot changed from 958910037856ff5d5eb2b5162=
b3cdd02a3a710fc543b933cfeba771ee095cb72 to 474333fb565f908992fd3716
>> >> > 4935aaecf31a79e867826fe634cde4f44171d8e7
>> >> >                     Hash for dependent task python/python3_3.9.0.b=
b:do_populate_sysroot changed from 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e=
2e32f2c9e485e7f5975fecf8 to 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>> >> > 08777e46a6fa6e417c0445018
>> >> >
>> >> > ...
>> >> >
>> >> > Therefore limit effects of this class only for target recipes.
>> >> >
>> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> > Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>> >> > Cc: Martin Jansa <Martin.Jansa@gmail.com>
>> >> > ---
>> >> > v2: Mark depends conditional instead
>> >> > v3: Export _PYTHON_SYSCONFIGDATA_NAME only for target
>> >> >     and mark tasks with target override
>> >> >
>> >> >  meta/classes/python3targetconfig.bbclass | 10 ++++++----
>> >> >  1 file changed, 6 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/meta/classes/python3targetconfig.bbclass b/meta/class=
es/python3targetconfig.bbclass
>> >> > index 640d0c97b6..fc1025c207 100644
>> >> > --- a/meta/classes/python3targetconfig.bbclass
>> >> > +++ b/meta/classes/python3targetconfig.bbclass
>> >> > @@ -1,15 +1,17 @@
>> >> >  inherit python3native
>> >> >
>> >> > -DEPENDS_append =3D " python3"
>> >> > +EXTRA_PYTHON_DEPENDS ?=3D ""
>> >> > +EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
>> >> > +DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>> >>
>> >> -EXTRA_PYTHON_DEPENDS_class-target =3D "python3"
>> >> -DEPENDS_append =3D " ${EXTRA_PYTHON_DEPENDS}"
>> >> +EXTRA_PYTHON_DEPENDS_class-target =3D " python3"
>> >> +DEPENDS_append =3D "${EXTRA_PYTHON_DEPENDS}"
>> >>
>> >> add a space before python3 is better than always add it to DEPENDS
>> >>
>> >> >
>> >> > -do_configure_prepend() {
>> >> > +do_configure_prepend_class-target() {
>> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >> >  }
>> >> >
>> >> > -do_compile_prepend() {
>> >> > +do_compile_prepend_class-target() {
>> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >> >  }
>> >> >
>> >> > -do_install_prepend() {
>> >> > +do_install_prepend_class-target() {
>> >> >          export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
>> >> >  }
>> >> > --
>> >> > 2.29.2
>> >> >
>> >> >=20
>> >> >
>> >>
>> >>
>> >> --
>> >> best regards,
>> >> Jos=C3=A9 Quaresma
>>
>>
>>
>> --
>> best regards,
>> Jos=C3=A9 Quaresma



--=20
best regards,
Jos=C3=A9 Quaresma
