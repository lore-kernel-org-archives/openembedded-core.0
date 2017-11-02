Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 402E97822C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 08:46:55 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id z3so9550402wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 01:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=58aHnimfLh49umSLaD050MhW601oZMU6G28xvpOn/Kc=;
	b=HjtYuPiUx5YHEBg1vRbhL9p/9Sj19kFEKMeJ1cNyiwdXjzfL4uHC0vv9L09P0Rq8tq
	wPwg16SlHs8WJ0I32dZxT3kKC2uCGjhLJPk/e5dzdq2O/ZKgKNU7w+TrPtOUe0cB4GOg
	VebyeCMnOFalVEBgWpm9dMCQP6pd8JrFJ/LzSxR7HlbzZg9VG16jZg0eq7mhZXIuXww2
	rxFjjEr7519STCz8qjmnkw0MDyWJGJtn/VBsS0XCtMxFCG9dFriFTiBRKYfYNpuMpVlt
	HUwihfDb+n2Dq6rIzqayWHdBLeFHcwH/quXPfolpzUWpTmsGHssHsL2KmjEbWdtBLK12
	wFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=58aHnimfLh49umSLaD050MhW601oZMU6G28xvpOn/Kc=;
	b=Xom9C2Cc63dZkYmhvV6BKsmvQhm2mhASv0ytKjcytJUcKE1Zz1DXivtz3AS503Jrv6
	n2vYMRJ+q9Ny2CJ5pneUzaXhD/rvhNs3rSseAobV3nW/WD23MfGFwZ9Ewfj9sZNLRHgm
	CohQBLmu/B1yEFvOiUhss0/02JS2b8Vhy21wFQofuSFfytI7K7lI1U7QIZPCs3dwj7fr
	4sMWPX2HoTBioEKB9I0arFnx7RBZ2+/SCfcE2g87EhG12JLUadqOchmgiYguNtDjl8iQ
	Wumb6tyI62eJcvJt4UJDfk/iuloCBYlIE7lJF8AtAQzshFJK+vvtlaDKKZm55fZOs86T
	b8AA==
X-Gm-Message-State: AMCzsaW94sc6gbnK0eVv9+fKaNYNMOF5BHqw9FKakS1gjbR1iGOeKrZl
	6Tcrw1MtFF3ZcvVEAlWuFiU+uhfZfeTPQaRVy0Urfg==
X-Google-Smtp-Source: ABhQp+S7BQf9rCsTsrzw35/YXWBdhA8aLBBfNsxL184mfS06Uma+Y0q9GwURVD4IpTxwS+UJUTUc0Pd50DOh8mYwtc4=
X-Received: by 10.80.188.18 with SMTP id j18mr3442369edh.189.1509612416753;
	Thu, 02 Nov 2017 01:46:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.204.200 with HTTP; Thu, 2 Nov 2017 01:46:56 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 2 Nov 2017 09:46:56 +0100
Message-ID: <CAAQYJAvQo_buybnL8OUmwYfhezzuxx-dTO8wzuM=aQvKGYW+5Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Backport gcc7 fixes for armv5e [ARM] PR 82445
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
X-List-Received-Date: Thu, 02 Nov 2017 08:46:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

the gcc7 shipped with rocko produces unbootable kernels on armv5e [1].
Bug was fixed recently, apparently in revision 253892 [2]

Khem, please take care of this, thanks.

Cheers
Andrea

[1] https://www.spinics.net/lists/arm-kernel/msg594654.html
[2] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=82445

