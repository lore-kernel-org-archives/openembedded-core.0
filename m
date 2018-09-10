Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9B42079813
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:35:58 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id l202-v6so38833246oig.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 02:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OpvVfdnuMUvv+8hyHvJxpf+V0q016hYIzJ5nyNdWnHU=;
	b=vVs++PyTO4jAhuNfjHaambRXh2u6Xh0557F3pBhReIIxwyOlHJvAstuD3aJhksK/v4
	k45LPk1X+qSKMlj7mIdtsZ81fRFhSrPdIMCDxRdZQstAKdAZ44GzARwZbo+6iv76vVpk
	wyyM/e5y/P2P00wFdvSnd5SgPc60bJTXsbGmeCOQdVvnZP2vZHPsPXRqBeq3xR1cpR+B
	vh9RE5AjNPdz5rKUI7gb+ZA1Fw6FSGISrDbZL3jzXUTz3A7ThVIKUNn2yMh+FjSdBL9p
	EkUpByEO5BsnyjdgUw2CbRejTStsf6ZSBC5CypHjATpZodl9MKXA4qVR9y3JFQc85Pcv
	yZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OpvVfdnuMUvv+8hyHvJxpf+V0q016hYIzJ5nyNdWnHU=;
	b=WG4s1B5r+ny4X65R6HImJUrRZ7KdI0nyb4Xhj6CkMZUe3DZxA4tAttDbfm4PuGqmtz
	tjbOpod48Y/9Bv1k6JtGsLgNUJywSQMF8TBhXwDBgXw19BU9Rje5yUln0OU1qouktTlL
	76QBZzPYZQAIm+ENmjpGE3JI1vVwObGd5q9kD74xdZ22LZKAq6UIMsvHWnmr2eVBf+V+
	3jbT6U8/qieX7AYxjKSLXQs3C78EmT6kwxjSqVqz+iSZXRFZKKiZ1oa3S81aZY/QOL5M
	iWc3bDPSNH7qL9MIaruNRxJeV1rsH5qLZF+RoMWPAo68z7jdnSEb6rjAyFqkV+s6OP8H
	0gmQ==
X-Gm-Message-State: APzg51BNDcuBSs9C+zZdpqpOqFlQC/0nqE7Y1VhI9qCRycih2Qr9nLsI
	zbfZpm71x0j/vTvqlq23zpXaOoYtbW5jvvYT5/w=
X-Google-Smtp-Source: ANB0VdbysiaRMphkDAa5nEH4ghZm0Un0CY7/K5QcBBO4A0SOOMXsBO1J8vK83sVDgxMMs4QENYze8RsmKSrZbeWMnwE=
X-Received: by 2002:aca:5cd4:: with SMTP id
	q203-v6mr19364024oib.217.1536572159648; 
	Mon, 10 Sep 2018 02:35:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Mon, 10 Sep 2018 02:35:59
	-0700 (PDT)
In-Reply-To: <CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 10 Sep 2018 11:35:59 +0200
Message-ID: <CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: Jens Rehsack <sno@netbsd.org>,
	=?UTF-8?Q?Sven_H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
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
X-List-Received-Date: Mon, 10 Sep 2018 09:35:58 -0000
Content-Type: text/plain; charset="UTF-8"

Large parts of dnf and friends have been rewritten in c++. I have not
yet updated and reviewed that, that will happen in the next cycle.
There's already enough disruption to deal with (postinsts errors,
openssl 1.1, both caused by me :)

Good that we got all the way to do_rootfs though with 3.7.

Alex

2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com>:
> I did not review the patches closely, but I did try to build
> core-image-full-cmdline with the tip of poky and these patches applied.
> Everything was fine until do_rootfs... I've attached the log.
>
> Essentially, there are some bits of dnf and so on which are not ready for
> Python 3.7. We have dnf version 2.7.5, but the latest upstream release is
> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
> helped.
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

