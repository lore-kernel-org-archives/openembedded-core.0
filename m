Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id A2C2F7FD1A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 18:06:04 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q9so9840733wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 10:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=jn9n+cMujo3HLldWfjU1Ed2yAHFVik5wAPe6jtc+Hks=;
	b=f08Va5FmduGh7JwFn2IWnj7hnp7ycG9zNtqbCWW1VFkcubXgmKu7tmH9HgOeuYYz/M
	l+nUGszh+ZFZFq+DpFEbEnPQPdLDlppS0PAdxgMF9E036k/bNk92Ths+5xYgh+RO4M7m
	WULVKicuMEdJnNNLXVdnqCjEBC52yVXTb1G5HSe8Qefojq85dEPXn5UMSSMcxR2BZLwJ
	XvtffXGh9fM97jmeI3sJ/1+ogP6T/69juy0eouV6NUb1vVjpNfBSqndf3WDZpVh3cMBB
	QzK+9bXo6NlXU2+QNj1qlj2IArJLCylzG5o/TeK4ohPMRZaDRId0ijtcE2kgIfvcf4vO
	b9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=jn9n+cMujo3HLldWfjU1Ed2yAHFVik5wAPe6jtc+Hks=;
	b=tw60/YB0qyRU9wJfsbsxn7gZ5ATNrGXBeemGD3cdS8CLP2zbzQyuN828P8XV30aGI3
	BHYzVhIyaEPq1LyG4R/oXLTparOECYugUW5+C60nvVkpsFGuat/dQfX0UZS7tvgNKqbc
	8o/sy6rXTeWxiQCYxxECRaI5+aLTFEpijvuO0+3jFKQy92vnjQnA3kQ1FgYPV+CBHFrD
	8vktYBhTv1FCsK5th/1ic4CFq3gWCiX6iTh+UMpRIN92sOo7wYyqPfZA/c8JL8o3WOgc
	SZ2HPp7Un6dI81W5MDGC5yERHruidpXUYJL0ktbLVNEPKAvQf0QXDBj20+FI+1QtMjUD
	sdTA==
X-Gm-Message-State: APjAAAXC4dGwqWhYzGDQeyRNIkPeHjCLJOkj9jfHmco5v1CnfcZLM/VU
	br2AyYGR9u8cF0IVrJnLsCSvYeX8
X-Google-Smtp-Source: APXvYqxTx24y4PYVTIGifw5QuYiAXfGbHPi3oPYeeSCfQFVLz98elfRr6ahbB1mu8xvMMZyOWNfsRg==
X-Received: by 2002:a05:600c:2c7:: with SMTP id
	7mr17071809wmn.87.1576865165190; 
	Fri, 20 Dec 2019 10:06:05 -0800 (PST)
Received: from ?IPv6:2a01:598:b106:ffe1:4dcb:e786:23df:72bf?
	([2a01:598:b106:ffe1:4dcb:e786:23df:72bf])
	by smtp.gmail.com with ESMTPSA id
	a1sm10381399wmj.40.2019.12.20.10.06.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Dec 2019 10:06:04 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <bf8452d4e9f63bc463f676ff9b48ca1d573ef7d0.camel@gmail.com>
Date: Fri, 20 Dec 2019 19:06:03 +0100
Message-Id: <B03D51F9-00D1-4D8A-8A21-3CF357D9DACA@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-7-alex.kanavin@gmail.com>
	<3cd13d50-b437-2438-582a-4c149711a966@intel.com>
	<bf8452d4e9f63bc463f676ff9b48ca1d573ef7d0.camel@gmail.com>
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/25] nss: update to 3.48
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
X-List-Received-Date: Fri, 20 Dec 2019 18:06:04 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

My problem with this kind of fixing is that I have to do it blindly, and it m=
ay or may not uncover further issues on the AB. I=E2=80=99d much rather just=
 drop Centris 7 and have ppl who actually use it fix the issues they see as t=
hey push the master revision ahead in their development process.

Alex

> On 20 Dec 2019, at 18.44, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>> On Fri, 2019-12-20 at 11:00 +0000, Ross Burton wrote:
>> Breaks on Centos 7:
>>=20
>> nsinstall.c: In function =E2=80=98main=E2=80=99:
>> nsinstall.c:201:5: warning: implicit declaration of function
>> =E2=80=98getopt=E2=80=99=20
>> [-Wimplicit-function-declaration]
>>      while ((opt =3D getopt(argc, argv, "C:DdlL:Rm:o:g:t")) !=3D EOF) {
>>      ^
>> nsinstall.c:203:20: error: =E2=80=98optarg=E2=80=99 undeclared (first use=
 in this
>> function)
>>     case 'C': cwd =3D optarg; break;
>>                     ^
>> nsinstall.c:203:20: note: each undeclared identifier is reported
>> only=20
>> once for each function it appears in
>> nsinstall.c:225:13: error: =E2=80=98optind=E2=80=99 undeclared (first use=
 in this
>> function)
>>      argc -=3D optind;
>>              ^
>>=20
>=20
> another C99 issue I guess perhaps  #include <getopt.h> in nsinstall.c
> will fix it.
>=20
>> Ross
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

