Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id AD2DA6C3AA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 15:43:08 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id a48so2687729qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=9awIWCA11m1j0U1IlBXqnrEcAtsXUbgzBYzGvYvEQYw=;
	b=EU9wIrXSr0USKcHT0b/ioiDr+ANmtY24v0pBARMoi1nV30lrpUslD6FnyD4+yhqCbQ
	dcjmLYSC9obSMfm5Yq552SeCoeqcnMdfYVQeh96bQgzSoQ/y7tn0ioXNs5LBqoVnVAFn
	xkte28QC5MtPDqseizGy1nsyJjFuu+gT2Zg54d7AviKFx3bC9AzB+5sYWz5k8kQGQ4Zg
	gB2dvVKzBLwJfwb2Rmb2O0/Nl7yY1bMQ9EM5DuIv5KJC+1SlEVdr2oo4YfpPlAvCGEqF
	CbqA0drlOXAVthBMEB7gacjCn1gu3dM3Kb0ls8/FZBuaYs71R/GLAJmsOgQOcGN7BRds
	894Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=9awIWCA11m1j0U1IlBXqnrEcAtsXUbgzBYzGvYvEQYw=;
	b=UTkmzJYgGcp6O00PWlBqqRppY/yQZ1KWksgM/NcikqaemNWo6+XnUVD3HuzhMHsDBb
	sDE7u4bWG58h7MNtgiineNDZ3XQlqm9ozdrq17p2qrIsY+v68eWw14RNNzqpSIRJ25y3
	4W9i4lN4qn6ncq4+wgGNnpBnNd7w906sT+Y+z+bcC/peknSiTDzihlEcqX88N9Ap89pz
	vKHkcWIhq1uUrU8nkskUQblTocGTQB7FNbi3X+1Khc/l7aQ2H1UXGkCEVzPkvXRa1u6L
	rwNrjK6EtW+rTlF5/ht2TXGVO/xX5Gdo5+efeCrO49hSMaEC/gCCRPTLpy/04AGEJZuq
	BsOw==
X-Gm-Message-State: APjAAAWFUEpp4Q7mRr6VyMTFV/vqPNcTeNPsJzGT5bSHBxoqrOCoP6W+
	zWmwI3jwJhtbv81nbdbO+TvasvR8u7SGLPmfrEY=
X-Google-Smtp-Source: APXvYqyz17TX+yAJQua4Tf7R7YAMS1nbG1VxDAhaWVd9cmf49o1iMt+7NUv1F6EcjlAi62ECkcfOg+v8bXykxDi34Uc=
X-Received: by 2002:a0c:b645:: with SMTP id q5mr11333862qvf.194.1551627789390; 
	Sun, 03 Mar 2019 07:43:09 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
	<CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
	<CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
	<CAMKF1sp+Fx-K=1gdVS79zx8-j7ZgcHL12eg1FSgtJ7k2S8QKdA@mail.gmail.com>
	<CAB2nKc888f44raha5KbjV_orsu+Yu+vgpiKgxMLFFF1zy4psoQ@mail.gmail.com>
In-Reply-To: <CAB2nKc888f44raha5KbjV_orsu+Yu+vgpiKgxMLFFF1zy4psoQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Mar 2019 07:42:43 -0800
Message-ID: <CAMKF1sps-UgMWzyuWAVDvR75P5HgKVgrHhc_VyexNbRmhqA7bA@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
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
X-List-Received-Date: Sun, 03 Mar 2019 15:43:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 3, 2019 at 2:45 AM Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Khem,
>
> I'm not sure if we considere this issue as closed or if we need to dig ro=
ot-cause here?
>
> I don't have any Go stuff on my build machine nor build docker.
> Also, those random crashes came with Thud version, I didn't have any in S=
umo, but there was a lot of changes between these two versions.
>
> Please tell me if I can help,

I think it needs some root causing, but we know the symptoms. So
debugging to crash and some backtraces might help

> Vincent
>
>
> Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 19:24, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :
>>
>> On Thu, Feb 28, 2019 at 10:19 AM Damien Riegel <damien.riegel@gmail.com>=
 wrote:
>> >
>> > Hi,
>> >
>> > On Thu, 28 Feb 2019 at 09:04, Vincent Prince
>> > <vincent.prince.fr@gmail.com> wrote:
>> > >
>> > > Hi Khem,
>> > >
>> > > GO_DYNLINK_x86-64 =3D "" solution works as well,
>> > >
>> > > Best regards,
>> > > Vincent
>> > >
>> > > Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.co=
m> a =C3=A9crit :
>> > >>
>> > >> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
>> > >> <vincent.prince.fr@gmail.com> wrote:
>> > >> >
>> > >> > Hi Damien,
>> > >> >
>> > >> > With GO_LINKSHARED =3D "" it work fine.
>> > >> >
>> > >>
>> > >> Please set
>> > >> GO_DYNLINK_x86-64 =3D "1"
>> > >> to
>> > >> GO_DYNLINK_x86-64 =3D ""
>> > >> in goarch.bbclass
>> >
>> > Well, making a change in the goarch.bbclass is way more intrusive than
>> > changing the value in a single recipe, so it would be nice to (at leas=
t)
>> > give some justification about this solution.
>> >
>>
>> this will make static binaries instead, so I wonder if its doing some
>> linking from host.
>>
>> > >>
>> > >> > I'm very new to Go, does it mean that there is a mixing issue in =
go modules from Yocto and from node_exporter vendor folder, so it links wro=
ngly at runtime?
>> >
>> > As to why the GO_LINKSHARED =3D"" works, I cannot tell. I just noticed
>> > that our application was linked differently on my machine (where it
>> > worked) and in Yocto (where it didn't work), so I tweaked link flags
>> > until I got it to work.
>> >
>> > Cheers,
>> > Damien

