Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC63731B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 10:52:04 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id y204so93801144oie.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 03:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jRdgtCQva1ntA3MDLYIg41Qoo28t5TznLB4TN801IJA=;
	b=J5LODFVHjXCCOThgyMC7Pm/wLbmeNW/qS3NGtXIsHLuGdevQbqaI97XRCkJLP1VIty
	DF70H1SqxymZVfKHWVvzyeNvNEE9F27QLXtE3KZ21CqzJSXnYTrxdIZt2HlJbB5H9aUP
	RKsTGHS+2Zr/GkEz7sCHe8lR6Y9qED7Wgu1E5HsbgSnQPOdgN5ZIVjSugKIscOh1PK4x
	1pOY4Xw3BhzvQHfX0jegEorkORz2TK1NZBkBcZNisatv8FDX03LjL3EPEglRFQcu14tW
	GtIaSJF2wlm5vt+Vjr0s26jATmxnE/418nEAPCpwCNwP8RpWGlvHzi48+KThT8pbfKKS
	b9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jRdgtCQva1ntA3MDLYIg41Qoo28t5TznLB4TN801IJA=;
	b=WusvADzbvGqDHdVL1S3Y8VudHhSKI56m9fomKMHge4Kphlo/JZcchxlq9sfrChUDdm
	3BqsF/2/j77I6+aBzc0zZtD8OjWSgeBeKABqffFKzIvd4XGNCgBdCISEOohAkSJyEj81
	iy/wAsUTxdhk6JVFQLSpK862DK6eGqzTrnbtW5RhNAPkvcyrzkYkKSpIhncWc7T5s1mX
	Ruf3AnhphDzLSfFreh01gDTuFrOvxn3HV3uUMVtybVn2pqgnJiCq9XZjjxOZyTLuJeAO
	mGFw8k0vV+7yZZ6OA8SsG/0xDaymQHmTc1MGjBmssJqtvi9TLZHxIQcXbXHujpK2syFZ
	7j0Q==
X-Gm-Message-State: AD7BkJLz0uRobVLasejbe702wOep73Lcu2bdn1eyokCqFFXqhbMkCez4q/ADrlEpyzu2SbIh1A1yZLU4nOCTuZBX
X-Received: by 10.202.75.194 with SMTP id y185mr1040624oia.100.1460026325237; 
	Thu, 07 Apr 2016 03:52:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.173.77 with HTTP; Thu, 7 Apr 2016 03:51:35 -0700 (PDT)
In-Reply-To: <BF87E273B05A4CE7A838874136B2D7CA@RD3>
References: <188BD465D20643E496811D07CF7FDF9C@RD3>
	<CAJTo0LYhW-_8nC5DEi+uHnpE7TicR+rmrJQ+m5_0b_jdq--sSw@mail.gmail.com>
	<BF87E273B05A4CE7A838874136B2D7CA@RD3>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Thu, 7 Apr 2016 13:51:35 +0300
Message-ID: <CAHiDW_H89VSESuYBf9Csr+NEBdVij9LZ=KdY85PBqmn97W-uCg@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem in Third party Software (Navit) integration
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
X-List-Received-Date: Thu, 07 Apr 2016 10:52:07 -0000
Content-Type: multipart/alternative; boundary=001a1134f55c7a95e6052fe2de07

--001a1134f55c7a95e6052fe2de07
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Your question:  you may need to install more than just the navit package.
> Answer : I don=E2=80=99t have idea, what are the package I need to instal=
l and
how to install? I have added  IMAGE_INSTALL_append =3D " navit"  in
/build/conf/local.conf  .... Do you have any procedure to install
additional packages?

In addition to what Ross said, quick look at the navit recipe reveals it
seems to build without any graphics toolkit dependencies by default -- that
probably means there's no gui by default. You will have to familiarize
yourself with the build options of the program, and then set the
PACKAGECONFIG that uses the options you need.

Jussi

--001a1134f55c7a95e6052fe2de07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Your question: =C2=A0you may need to install more tha=
n just the navit package.<br>&gt; Answer : I don=E2=80=99t have idea, what =
are the package I need to install and how to install? I have added =C2=A0IM=
AGE_INSTALL_append =3D &quot; navit&quot; =C2=A0in /build/conf/local.conf =
=C2=A0.... Do you have any procedure to install additional packages?<br><br=
><div>In addition to what Ross said, quick look at the navit recipe reveals=
 it seems to build without any graphics toolkit dependencies by default -- =
that probably means there&#39;s no gui by default. You will have to familia=
rize yourself with the build options of the program, and then set the PACKA=
GECONFIG that uses the options you need.</div><div><br></div><div>Jussi</di=
v></div>

--001a1134f55c7a95e6052fe2de07--
