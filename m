Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD1560670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 01:10:42 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id r72so120631030wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 18:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to;
	bh=IuzYKQRPHumXYoHsL6LgGjLxL4ddFACryfeo+enAqog=;
	b=DPd/qrye22YMIHTDzq8MqXvNx7kfnfr174HumfHvKMHSFgYpam6/ntMrr9GWxXrvoA
	+8L1NXbRMKmgES0q2wuJZ73nI1iHRQD9wBV0VovnNAvyQxzvNev2p4pYMgD/im0Eq2pL
	DIUHv6hwVsWp/ZlZvyTj35TWiD0uHajyHbDGCBiREANDclw8Cv/rR2ivpuLhh9H/CUty
	cdCrKiZBC8DmQAlGKxNLqfUqWe/pJB8J0x9sElcJYdN5L+IV3gNXqB5ws3Oaphzt8OP+
	QVqOhvy49VnEJxOOejg7pBlnylDRcDnc9KKplCIIt2841UEF4sh5FJl4jDjyMO6bjNkR
	MXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=IuzYKQRPHumXYoHsL6LgGjLxL4ddFACryfeo+enAqog=;
	b=iMaSIrP2PwajkEX4lPenRpbl6a09StnaSvf9zxHYXOr+hJ7WgSUnUoBg2JHc5qc3I3
	C7XsgC+45oSRyBKcs5vDjf0XOI9iXx81f8FXShDBlcuCM4hsi98YJHvRaQ8DyhqNlqaO
	eJyvVdj6ebgDPEOeQqw+TCPfjYkJddDgBQ65ZdYhsGKaMtbr2KQWpJmhTyuEfLr+kNOK
	Pe5Ykgkv300ZvBpiCJDinoLnQWXXkMs4YL5TBxHDfFsnq07vpyYd1in2Z0gNi7HTye0e
	HKQTqUR5IhYSa6egNqnfoNfrt78jTmwq+kDkk5RMjaWNGjdH5Bo+JOOevK0x8xUkHs9x
	leRw==
X-Gm-Message-State: AD7BkJIcGiYItIWQiRL4ocxZ6WNZeLzBqYw5SeEJJ9He6MU+1QPa5oiYJP4At6VycNy+y97lR/cJU/jhBLUQvg==
MIME-Version: 1.0
X-Received: by 10.28.59.87 with SMTP id i84mr25713865wma.61.1459386642662;
	Wed, 30 Mar 2016 18:10:42 -0700 (PDT)
Received: by 10.194.201.104 with HTTP; Wed, 30 Mar 2016 18:10:42 -0700 (PDT)
Date: Wed, 30 Mar 2016 18:10:42 -0700
Message-ID: <CAJ86T=U_-bZ1J08wmxsPGpNP+yH7U9WAYY0eDjtfb3tW9Lh+tA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Is HOSTTOOLS_WHITELIST_GPL-3.0 ever used?
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
X-List-Received-Date: Thu, 31 Mar 2016 01:10:44 -0000
Content-Type: text/plain; charset=UTF-8

Support for HOSTTOOLS_WHITELIST_GPL-3.0 (originally named
GPLv3_HOSTTOOLS_WHITELIST) was first added here:

  http://git.openembedded.org/openembedded-core/commit/?id=179e056519c5ad761b2d942d7196664874c155e4

The implementation in base.bbclass has been tweaked a few times since
then, but even in the original, it looks like license checking was
skipped for native recipes (and anything else which could be described
as a "host tool"), so providing a whitelist of specific host tools
looks redundant. The current version does the same.

Does anyone know how HOSTTOOLS_WHITELIST_GPL-3.0 is intended to be
used or when it might be necessary?

Any objections to a patch to remove it?

