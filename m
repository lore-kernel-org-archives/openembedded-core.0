Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id C1FEC7C764
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 15:16:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 98so17107710oty.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5b4uc/YWHc8eCwTyUhImu01BeuHWOaq283jSQv1oItM=;
	b=bP4O20GMxPpONrUKwQOWbSBmqmyur3z1M/qN3Bae5hlBzzIEjffiTkuhRqu6Gr4JJ1
	lchynGwxK28OM0Tw0mRRWbr47nvvXdrYKuItevXb9GzkZRDOfcOdgKHnyJ+CyWdX8uHV
	DYwomK/zwxXD+/U3frlapjShftQVBuzJN9bZNzu2UvSstCTYvN56c2E/lHkN+A6802r5
	SBd8uSaD2j1dLs061w4blX9eh72K41qo8hlHtaQnsAbzjahngSl4gzTNBT8eSndEZ+rd
	KJ/1pF/GeVNrZr9oecGb2ngEfrxZokZt2DcXlT7saobhh8pF3OrT3VTsMVkQFyOGlPnh
	5c3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5b4uc/YWHc8eCwTyUhImu01BeuHWOaq283jSQv1oItM=;
	b=itb7XcuWhBQIt4F37qTYjeR6Y+O5POLffTLLC3jMwF2ULFyNQQl7/z96WoaATVCNvx
	iIKrk2Iza4rrFr6dF9OfBal6egrdIWxeBJrlnz/ZMwfymQgzXMCvtqLqMfldVYb934bw
	QfLI/c1TCevaR0kFKOASVvI5klVF+MMvegW1AvDR/b0Z8FiPHpJDNyWkeNDGwq3afQyt
	8YCheEWTIhcORMDBRofgyN6yN8P6IKF7jbtpUNBrbEe6F4x4kp4fwDFMU3uRRKl42vyk
	zt6rrQbnG12FFtCp9/vZyw4xRE9RAbfd98vm+Y1dktJpLxFjOp/ZIn0TFS+tCGNmuYJa
	Vx4w==
X-Gm-Message-State: AHQUAuZX2eG+2L0yS8A5TbJjW0ehcSAX9yeDwoTv8LDLY4UO3CDE5h/J
	VXfhNMusLP6obPPGxbwVe1F0OwT+WfQisw==
X-Google-Smtp-Source: AHgI3IYHC349xhD5gSAI+AKaAyHk1u0awvupiwygGyJenp7BaF0gaj1O/hmTNrlWqx9RUaOSbRDXRQ==
X-Received: by 2002:aca:c2c3:: with SMTP id s186mr5874672oif.173.1550243804350;
	Fri, 15 Feb 2019 07:16:44 -0800 (PST)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com.
	[209.85.210.46]) by smtp.gmail.com with ESMTPSA id
	r184sm1820881oia.11.2019.02.15.07.16.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 07:16:44 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f46.google.com with SMTP id g1so16975361otj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 07:16:43 -0800 (PST)
X-Received: by 2002:a9d:754f:: with SMTP id b15mr5892791otl.231.1550243802712; 
	Fri, 15 Feb 2019 07:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
	<CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
	<CANNYZj89mDDm6cPRgEjJe-n7Jn=rCGQyUb+cnBBLsDBNh+BXgg@mail.gmail.com>
	<be4efd67-1b40-70de-29c0-9e0fdcc7deae@pr.hu>
In-Reply-To: <be4efd67-1b40-70de-29c0-9e0fdcc7deae@pr.hu>
Date: Fri, 15 Feb 2019 13:16:30 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqn67CQuO=pSGrdYDX-uJHOtQ7CCoa8QsVrwAbM+qxCNw@mail.gmail.com>
Message-ID: <CAP9ODKqn67CQuO=pSGrdYDX-uJHOtQ7CCoa8QsVrwAbM+qxCNw@mail.gmail.com>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 15:16:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 15, 2019 at 12:36 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n via
Openembedded-core <openembedded-core@lists.openembedded.org> wrote:
>
> 2019. 02. 15. 14:26 keltez=C3=A9ssel, Alexander Kanavin =C3=ADrta:
> > On Fri, 15 Feb 2019 at 14:21, Fabio Berton
> > <fabio.berton@ossystems.com.br> wrote:
> >> In my opinion, there is no relation with an update and change build
> >> system, once we can use mesa 18.3.3 without meson.
> >
> > Please see:
> > https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DMesa-19.0-Depre=
cates-Autotools
> >
> > We might as well switch to meson now. The patches are ready and
> > (mostly) working.
>
> I have read the mesa-dev list constantly regarding this change.
>
> The deprecation process was painful and issues in the meson
> build system still turn up occasionally.
>
> 19.0 will still have a configure option to opt-in for autotools.
> In this upcoming release they have worked out all known issues
> for meson but I would in no way want to use meson for older main
> releases because these changes are not backported offically.
>
> So, either keep autotools for 8.3.3 or wait for 9.0 and switch to meson.

If the switch is made in another commit, we can easily revert it in
case it causes issues.

I don't see urgency in to do the convertion so if there is more people
which wishes to keep autotools for this release, we can skip it for
19.0.1 upgrade.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

