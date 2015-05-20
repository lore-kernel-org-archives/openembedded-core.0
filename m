Return-Path: <lpapp@archlinux.us>
Received: from mail-vn0-f51.google.com (mail-vn0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id D57C2601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 11:55:43 +0000 (UTC)
Received: by vnbg62 with SMTP id g62so3327962vnb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 04:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:content-type;
	bh=6OXix1MMyiWuCIzjBxt/+RxvjWWZS58M3FN6x6tZGrI=;
	b=NIDv9Is89AjsYhvVPWY2ltTLRabw4/vBlGrgGMfxBJnotgz/lAFgUvWXRKzQMvZ5t/
	ROwbwL9CobamKPjN/kGE4I+S/xoXqqWwZVAvOo0nTg4ZRjNglIKW4DvzmcISoGcgGuOt
	HY+u9K3WTAqpnMCjXr3BybVVE7fENeWHD6yLjQN3KRZs1oVtumTtTnkKljEk+gVo6sOg
	ffFp7LW6zxUpCM+KOATsQmnegPQDbqdLnuyHOuSoUzikXW+DYa+CCIX5LyzxJBH2Nevk
	YbDl2Gd+SHIT9zA2iRpGs+ycu8yISRjV+7ant1dS9Isg6OXfQUR0pLqaFdepzK1BZ9Tl
	Hnvg==
X-Gm-Message-State: ALoCoQmaFBf4H6N1EB1rTcIjkT1+rqaSuQBiExNR4WT7pa+VJXPWHnni1PUEd9a7b7DtP6u7PxyM
MIME-Version: 1.0
X-Received: by 10.52.139.113 with SMTP id qx17mr33474338vdb.59.1432122944994; 
	Wed, 20 May 2015 04:55:44 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.53.6.12 with HTTP; Wed, 20 May 2015 04:55:44 -0700 (PDT)
Date: Wed, 20 May 2015 12:55:44 +0100
X-Google-Sender-Auth: vcGESoQVssJsDM8CdMmRqwDvBPY
Message-ID: <CAOMwXhNUPtaJfKHDuHPWoioyD2Sp8Abb_++Tdp3NAYN7-TGUcg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: busybox: passwd: applet not found
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
X-List-Received-Date: Wed, 20 May 2015 11:55:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am a bit confused why busybox passwd does not work with daisy. It
used to work with dylan. When I try to use "busybox passwd", I am
getting the following output:

    passwd: applet not found

Is something wrong with the busybox maintainer script or somewhere
else? For instance, "busybox pwd" can be located as well as some other
applets that I have quickly run.

Apparently, this does not seem to be in the migration guide either, so
I presume that I am doing something wrong, but what exactly?

Fwiw, "busybox passwd" works just fine on my desktop, too, as expected.

As for completeness, "passwd" does work (without the busybox prefix),
but that is not what I am aiming for. I am always trying to be
explicit because I always want to use busybox's applet, no matter
what.

So what can I do to overcome this?

Ys, L.

