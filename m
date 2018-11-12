Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B1CA26C2CB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 10:29:46 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id a205-v6so6251693itd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Nov 2018 02:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EH0jQ5QpM5EwdNyjiwXu71f1XsAe3maYcyp9rqHOeDQ=;
	b=aUlgwCVuj0J+kwbiS7HA8ufyonOQ/3Pmv3FW+z+j8JR3UfTOt6hCrNvE00usJ6qlFb
	06HuG0oghezZVUcOsG02SX6E8mzW9ENEajzDKvW36tkNKlCRt7mz+B7A3sSO+sKOmSAz
	9Fr8gyHDBpdSxBZSog5YiLnbbFMuUUFKlFHQaEf1NKCtnS+U2Sh7hemRR4AJaBVerypw
	s19sP6QiH8qhDnoFpUShxJ2rIwE93ieEy5v9ZeW5OyLp7q24fWzRb72vxT11qTvBhb5O
	mSIfB/ZL6YyBEuwJShCKsK0aCH2BPZ9nseozqD/KtcE9ozZ3AdEJbx/zTMsEhPCkvCeW
	7l3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EH0jQ5QpM5EwdNyjiwXu71f1XsAe3maYcyp9rqHOeDQ=;
	b=dqqDIAiD/Mygye1rHl5TqXUhwF3kPqAaEK/fSDWgDQkSWs8R6ssd96BbA8LKDTPaG6
	dzcmlh7BW6C5+jA/KAIo9EgKbdRv1k/KHp+ekqdNBp/rOPgSySfC5ziPStWR+rKm/vPN
	EwAGOJaA/EsGeIswrR9b7YKuWN9dSiclT84TvuXXp2Yl77srbvswoPNveDkgHQKbC3h5
	AyJi7RXUuattwMGctd/oS6MMFwdgjj0sxYLibz9sCn9XFi9SoEPl6BaZDO0LZSVZwczf
	hOX3ewSMYI4y8hqWwGe6WAFQEl+80AKtTZzdeGb2sdV+p1cgYOGIgcgpvCBfOuOXzoTk
	mDNA==
X-Gm-Message-State: AGRZ1gKr1z4JTvzOEPIIRRgjZoV57DuCEJJ8FSyGcitXRkXIu5+3NJMb
	qPhxSSLSsluZZAThy3masV88qbmeOGngR4DkmDu23A==
X-Google-Smtp-Source: AJdET5fAdHB1BYCqiUpCklJRDEFB0Zva6/a5AVS1qJ4GODh2ve4QUTVf1gFfvpd7goysodCOniuQDjcKMCZbpHsgJ50=
X-Received: by 2002:a24:1d8e:: with SMTP id
	136-v6mr10415652itj.62.1542018587833; 
	Mon, 12 Nov 2018 02:29:47 -0800 (PST)
MIME-Version: 1.0
References: <f9d3e588-e159-f31c-1698-1903ebb4b0a5@dev.rtsoft.ru>
	<be39ebc7-47fe-07df-a419-b5725e43f7ac@dev.rtsoft.ru>
In-Reply-To: <be39ebc7-47fe-07df-a419-b5725e43f7ac@dev.rtsoft.ru>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Nov 2018 10:29:36 +0000
Message-ID: <CAJTo0LY_0iUNfRGE0-fLuaPPQcQcHDf_N0haivyVDvP4ojJu=w@mail.gmail.com>
To: mvanyulin@dev.rtsoft.ru
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] patch for bug #12814
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
X-List-Received-Date: Mon, 12 Nov 2018 10:29:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please rewrite the commit message to follow the guidelines in
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#New_Devel=
opment.
The bug  reference is correct but should be at the end before your
SOB.  Something like:

python: fix contents of python-xmlrpc package

Add missing files etc etc.

[ YOCTO #1234 ]

Signed-off-by: Foo Bar <foo@bar>

Also the patch needs rebasing onto master, the manifest was
reformatted since your patch was created.

Thanks,
Ross
On Mon, 12 Nov 2018 at 06:59, Mikhail Vanyulin <mvanyulin@dev.rtsoft.ru> wr=
ote:
>
> Adds a missing file to python-xmlrpc package.
>
> --
> Best regards, / =D0=A1 =D1=83=D0=B2=D0=B0=D0=B6=D0=B5=D0=BD=D0=B8=D0=B5=
=D0=BC,
> Mikhail       / =D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB
>
>

