Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id DFBD778259
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 16:27:53 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id g2so195221pgn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Feb 2018 08:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Eqd58FRXaljDuzFIgZCKYWBMakGxQVgGTgENQyWxOMQ=;
	b=j87R6J4W+KSNAwReRkE/qVwdLNYCcBppglK2VIWvGJuXjX0yH8SBBEcOc9ZUaFhTwR
	nth+3P4lWLJLrzi5YOrMOH74T5xwrpCdJ75vvh8QoND01odhaojpruxcWLDwETA0JBel
	+C6hdhRnrMIVbJ0DaBzQ4Ovd8UpMJdwXWXYKITVuRS1kCUa2huLPDN8ualwb5+KGRBWb
	R7ETur9EErq3y8JQSVBFqHLY27kRYcNH8IZhA+wiM49V981Y1e4T2IV9r9PIMn2I1r2C
	n7ESoeu4WAjXHfABvfE9eFQOuvZ3CpLxkoEVWdLd2ppvs51lW1Pydrq6in4ze8ZrJtI+
	mB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Eqd58FRXaljDuzFIgZCKYWBMakGxQVgGTgENQyWxOMQ=;
	b=j9xCj1k2wKi0sCQ9DrCsNb1S911l3KkHPeVGJdStLaLeKztbara+cNe6/rx9sLoq0G
	cxLWspvq4bbCBPBTNLhNeXT/StXtNtzSCg85+qhfHUuXv7/zQ2S1ZMV6r6KLj0s3Pco2
	ScNulx/A0RF9BMhs4ZIVCQCdSr8THNoW7fLhU/l4WjXpx4Eo8rvoyVTdcRO6ORHlVJxw
	yEW9RDpevOCM+pOc8pCOqBQNxJrNiEzwePBlDDFSpjyTpY8uIEpoWPKaIILnSbBRlAgF
	pXvyAQSAsqx7Ze8WHPvJ7qdjVSxwNBkcefOYG/dk0Hocpwv71vc6W8PHCXPO3K1gU2VH
	FnHw==
X-Gm-Message-State: APf1xPDaKpnpl65nFyM29frTYDzkoBBViw71D0FG6c8OE5lNV2g96fZ2
	Gk9/qPM2kb9pMZ5fYNcBwz8tHg==
X-Google-Smtp-Source: AH8x224yeqYlJQWBkle76ZY/EtRHi6vbmwxH/pxw6/ez9yQ8iVd9OIKpDTwKW1h0oVWfnrs6AFQELw==
X-Received: by 10.98.86.27 with SMTP id k27mr1795971pfb.174.1518539274788;
	Tue, 13 Feb 2018 08:27:54 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:44c8:48fa:566e:84f9?
	([2601:202:4000:1184:44c8:48fa:566e:84f9])
	by smtp.gmail.com with ESMTPSA id
	x4sm32394755pgo.15.2018.02.13.08.27.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Feb 2018 08:27:54 -0800 (PST)
To: robert_joslyn@selinc.com, openembedded-core@lists.openembedded.org
References: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <00ccda06-5caf-0aad-9df8-df46a8b40a9f@gmail.com>
Date: Tue, 13 Feb 2018 08:27:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <OFDC897003.15BD668A-ON88258232.006ED4D2-88258232.00742260@selinc.com>
Subject: Re: Backport OpenSSL 1.0.2n
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
X-List-Received-Date: Tue, 13 Feb 2018 16:27:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 02/12/2018 01:08 PM, robert_joslyn@selinc.com wrote:
> I'm working with the pyro release, and noticed that it's still using=20
> openssl 1.0.2k. The latest version in the 1.0.2 series is 1.0.2n, which=
 is=20
> already available on master. Is there a reason that the newer version=20
> hasn't made it back to pyro (or rocko, which is on 1.0.2m)?=20
openssl 1.1 was added and the openssl files got restructured making
simple cherry-picking not an option for older releases.

1.0.2n hit master 7 days ago, sorry for the delay.

1.0.2n is now in stable/rocko-next and will migrate to rocko when
appropriate.


> I know new=20
> package versions are not normally backported, but looking at the change=
=20
> log, I only see one change mentioned that is not a CVE fix (the 1.0.2l =

> release):
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.openssl.org_=
-3Fp-3Dopenssl.git-3Ba-3Dblob-3Bf-3DCHANGES-3Bh-3Df2fc31a25c54b12fc7db40c=
03d39f9a68b9ec0e5-3Bhb-3De5bba24cd8bb3e5127a578b85c6edf013a38ea6d&d=3DDwI=
BAg&c=3DzVFQZQ67ypsA9mYKSCqWmQHiVkCCaN-Gb60_N6TVnLk&r=3Dak_pMnzuMKndrbvJG=
ok-seoFenjTGhP3oPNUzKUOwzHhGpNMwSJsaHunyXDlBGjO&m=3D3JjPoO2FeIBSz3wggiqKG=
tYceKB5t__oSe8p6yDsQfM&s=3DoeCHfmZkkXVFW1aoMZsolXeFvKI9RTUtbdGBj61kheQ&e=3D=

>
> I can send patches to bring 1.0.2n to rocko and pyro if they will be=20
> accepted.
patches welcome

- Armin
>
> Thanks,
> Robert



