Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E293780AA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Feb 2018 10:21:21 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id c17so25540325iod.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Feb 2018 02:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UlJVMAtxly0wQDrzxTimxGiNrM9ZITMtsyD0xCDlwp0=;
	b=a+1fwRmKXgTwfJIeHCQ2oi4Mm8JHjVZ9yRji2se3GOjkznMBJYxNkz3exeFYBK+7qT
	q2e0tOXBvoty4T+H7efV0PCLnJ5uCQnK2hEdWy/DqsD8LeqTkqqstTMWYIGAw+MSyNJf
	ROxBwsjqFtZRzFO9sE2FykiUws/agWQb3K8SUKRJesy/1WXY56xmAiCiLTRmiFcxgLNC
	USEdvdlBaK3thZnxJBvr8mdnZOGTkYi482t2fzFQ2gSatuxc0BR2wCkQR9KXOm7kQnvT
	AST7ovlOPbCHLW54tSoj7SfNcYFGwqAPKafWsz5g/OjrlAG+ZdAPgW9jgUdF+PeR0Qz7
	6Gpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UlJVMAtxly0wQDrzxTimxGiNrM9ZITMtsyD0xCDlwp0=;
	b=jGUJPPrPXlXJeSHgHd7gx3aGT5RscRDB4joC7JYHvJxpNnU5UeXNtCnm07l1rqgu+x
	dl0f8s5df735v9zV6mWzqY06iyN9ZVBqlWnyPHvLemXcILxYGrBc9aWTkrp5WWQ4eWX+
	T4rHXr1RqFlhVg1Y+NgZqwnP3ajpFTsWJK2DPsjh4yalmRzJIcCxTPWWDNMHQpCNSVX6
	0nO2q4kAaywk8RhEsEuZRqsP51pSoY/QomrCwOctpsuTVyE9ajHhCJeIydSRVIKiQrhf
	TP4sA80urg9jHDosqXvIFTy5EX6Sg+ssSj55M5g96KaMWmWgABSxm4HHfBZMZjGehS19
	mcLA==
X-Gm-Message-State: AKwxyteaE7+qraRNW02hkLpWkW/YmnBDOel48JkbfwhB3in05NQOU1u3
	D3pC6VWL9dvYtYU4PYkQwuqaOTN9MA1mSC6zrZktAw==
X-Google-Smtp-Source: AH8x227vr2qifmmWdLSCreQmuy+FZMDATBX/0b6D2DLep/hGc5kAg4BS1YYQdecI6iGDKG3yd7qZeCq3q63Wrd4jW98=
X-Received: by 10.107.175.8 with SMTP id y8mr46796865ioe.37.1517653282824;
	Sat, 03 Feb 2018 02:21:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Sat, 3 Feb 2018 02:21:02 -0800 (PST)
In-Reply-To: <aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
References: <cover.1517524576.git.raj.khem@gmail.com>
	<aa96375d5517a1f0170609aac7283bd71566f46a.1517524576.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 3 Feb 2018 10:21:02 +0000
Message-ID: <CAJTo0Lax4NpwLPN2Ly_9seKFLYp-qCVJCuyzXhtN6aiXKgVKRg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.27 release
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
X-List-Received-Date: Sat, 03 Feb 2018 10:21:21 -0000
Content-Type: multipart/alternative; boundary="001a1144a268d0c13a05644c3044"

--001a1144a268d0c13a05644c3044
Content-Type: text/plain; charset="UTF-8"

Getting there: https://autobuilder.yocto.io/tgrid

Just two actual problems:
- The non-gplv3 build failed as the make fix needs to be backported to
meta-gplv2
- The eSDK selftests all failed with en_US.UTF-8 problems, the new glibc
shouldn't be causing a problem with uninative so this is interesting, maybe
the new one is behaving slightly differently.  Should be easy to
replicate.  The same problem caused selftest to fail.

Ross

--001a1144a268d0c13a05644c3044
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Getting there: <a href=3D"https=
://autobuilder.yocto.io/tgrid">https://autobuilder.yocto.io/tgrid</a><div><=
br></div><div>Just two actual problems:</div><div>- The non-gplv3 build fai=
led as the make fix needs to be backported to meta-gplv2</div><div>- The eS=
DK selftests all failed with en_US.UTF-8 problems, the new glibc shouldn&#3=
9;t be causing a problem with uninative so this is interesting, maybe the n=
ew one is behaving slightly differently.=C2=A0 Should be easy to replicate.=
=C2=A0 The same problem caused selftest to fail.</div><div><br></div><div>R=
oss</div></div></div>

--001a1144a268d0c13a05644c3044--
