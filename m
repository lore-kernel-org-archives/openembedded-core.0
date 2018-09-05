Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id 292E479491
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 22:38:20 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id y207-v6so16774015oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 15:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=GoUbgLbIx0AKS5YLJyHOISPounAeiX7ug9KHkX/lr1E=;
	b=GobCqRJZisAfLLOq93IfPBceocLew4zRTgO2cXn7sSSYnE6gSECvPuiHxsE325sVzB
	+MCJ+7c9klBYjf+Huz3oEqwsD1x8ArJHb26TQNEkzdSIwHVTt7Bk8mMhbrZzcvBCeD6U
	9pjpsxFFT7aaVDipYSYMMqJJHPfReDSzMiZf273A+8VhpJG7rt5nlsbxD5KEeZijEumG
	Qj0ZW8AE1vcLPqqRmYTbiJ5lSFRNtLskc97U+YvPht6AT8DsS6JVTlLbfqoDLF8O4Hpr
	oXkVMv2qzARbZo86PvwA+Nkc4CHA8sds1y698C4P1Tb3WrmbT/02FHd0U+pcTfUTrVW6
	UF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=GoUbgLbIx0AKS5YLJyHOISPounAeiX7ug9KHkX/lr1E=;
	b=muVEoTtKrO/x8yvWWp5PCcsoJAZY+o5Zp7Z5UfG0gYxDgZHP5H5h7RDGGytFjycZEy
	XE/lqJyLDARviiaWJwGiVlwcKIyM7rvkdf0gLbWRsJjeeyvR9/lpFVU7cCFQAthlE/HD
	Vh4S5ZSJcCRteOyIG6OuCQeWUz3QjmyoaFFjNDBRMHIXTve1wQGMmM4LhjvqB6BVpsxg
	4UqCY2QDfW6nDgR1aK+iMqim6x/ZcrQV+cQlRFDqx8WSgIJhrSN/ZCCEy8gsiQTTMW4U
	CWWGnF14XQqo55WhQ1Vmd02aC7YFXnF4P5RLFoKHODPZtmxxJCCTL/vYQNvH8/1WnBRk
	FZXA==
X-Gm-Message-State: APzg51CwuHfcc2oGmfotImPzBfEcbdHf69B9nMBuWJN0Kjqqzc/BBYUL
	IHlO+JjQgPbYpKRDQR5fUF3molPfdMQrpQ==
X-Google-Smtp-Source: ANB0Vda3t8ehhzfFF3k9UQ961//F1vPlAXXfzsFCT2bESxQwhDawM0oOxrmmBlbtVLPcSsQRmZ1vEg==
X-Received: by 2002:aca:a12:: with SMTP id
	18-v6mr32755610oik.292.1536187100620; 
	Wed, 05 Sep 2018 15:38:20 -0700 (PDT)
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com.
	[209.85.218.50]) by smtp.gmail.com with ESMTPSA id
	p15-v6sm1799227oip.6.2018.09.05.15.38.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 15:38:19 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f50.google.com with SMTP id l202-v6so16830795oig.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 15:38:19 -0700 (PDT)
X-Received: by 2002:aca:db09:: with SMTP id
	s9-v6mr30982260oig.339.1536187098682; 
	Wed, 05 Sep 2018 15:38:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180830232604.10850-1-otavio@ossystems.com.br>
	<CAMKF1sozB+uN8h3YcEXSnRvuQOWdYYzRC2iOrr54h-5VYnQUMA@mail.gmail.com>
	<CAP9ODKopW2QbA0qvf4kdmq9j3vme_LO4y-43h1Uq5tspErb0Gw@mail.gmail.com>
	<CAMKF1sr8BRcKEgQQYnfROQrrZ=0PocpWW11bFd_9X7RPuNpC5Q@mail.gmail.com>
	<CAP9ODKoLPC-BNnfqjoUzbDM+EPo1jmwGoqyk7=cMD4vord2Kyw@mail.gmail.com>
	<CAMKF1sr9+bzRBVfV5J=ad4v_m1kQ5hLg=qDqX_dyEUWcFeocAQ@mail.gmail.com>
	<CAP9ODKpfrTs+vQQcG=TyTO6nPZHR8U3xHyg4i_xsn17eOKc41A@mail.gmail.com>
	<CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
In-Reply-To: <CAMKF1sq7UQMb7qGtEZhXiB5W09sTxYQdt1ZMq6cEUic6UcCd_g@mail.gmail.com>
Date: Wed, 5 Sep 2018 19:38:05 -0300
X-Gmail-Original-Message-ID: <CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
Message-ID: <CAP9ODKom3jT=M_X6wrz5WKRat3yRxtukm5Hrg3FnEtJUiis_vA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Update 3.11.4 -> 3.12.1
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
X-List-Received-Date: Wed, 05 Sep 2018 22:38:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 5, 2018 at 12:18 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Sep 5, 2018 at 6:42 AM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >
> >
> >
> > On Tue, Sep 4, 2018 at 8:43 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> Here is one failiure that is seen in meta-oe with updates cmake
> >>
> >> http://errors.yoctoproject.org/Errors/Details/190510/
> >
> >
> > I am looking at it...
> >
> > Seems not related. I built poco using cmake bump and OE master.
> >
> > Seems related to the musl update on master-next.
> >
>
> here is glibc failure log
> http://errors.yoctoproject.org/Errors/Details/190886/

I did build against master and master-next and couldn't reproduce it.
I saw you are using 'bec' distribution and I used 'oel' so it might be
changing the end result.

Any idea what might be causing the problem?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

