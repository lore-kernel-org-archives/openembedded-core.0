Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8B04865E43
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 13:18:57 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id k14so5345462wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 06:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=/9lgM2ZVkDuBquJZCHXnTNhgfqNIq80Lwgt2qdXQoTM=;
	b=Xzcq4j+zTpIqwW8OCi6z7im3GeDTueZ4LGVZ/gS287BJuJeoFhuDy8FKGju7hRNuEv
	Q9MjXmJt1oqtpM8maAZXd4O1S3e6WULuuzE6/ykacSqWHFx4t88emZ1JqUvdwUbDKUq8
	3QYgoh8mnzeziQ0SH3lPuhhyaTFRbVhKaRIjIENKe6Hjbueo6VDJUiWx+njtWYTBelTz
	/o6BM90SE07cCdqUeEZPv9/OoBtm4fjchJS4L+sUaWM+BUQK96WOmywjIV6BHFVRZlGj
	cdyi1ylennRAxsfk9hnVptevSur7pIMJXncEnqZwEkxIgIv2kEw+Co+nqDD+RTYUyV/t
	eqNA==
X-Gm-Message-State: ALoCoQmVc1a7zjYrGMqwOGoMQqdgQupWrXWMwvasNZkxOtLtjhqL7mRZ5rOXU1//CkJwmthjXNVe
X-Received: by 10.180.11.36 with SMTP id n4mr3564785wib.4.1397222337936;
	Fri, 11 Apr 2014 06:18:57 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id
	cl9sm11279548wjc.25.2014.04.11.06.18.56 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 11 Apr 2014 06:18:56 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <dc876f2fd4fb312364f86f07fd1bd9267bca973b.1395887206.git.Qi.Chen@windriver.com>
Date: Fri, 11 Apr 2014 15:18:55 +0200
Message-Id: <5B1F98BC-E5AF-44D5-A6F7-760D05CC98C9@dominion.thruhere.net>
References: <cover.1395887206.git.Qi.Chen@windriver.com>
	<dc876f2fd4fb312364f86f07fd1bd9267bca973b.1395887206.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: replace rootfs with /dev/root
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
X-List-Received-Date: Fri, 11 Apr 2014 13:18:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 mrt. 2014, om 03:29 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:

> Replace 'rootfs' with '/dev/root' in read_only_rootfs_hook function
> to match the latest change in fstab file from the base-files recipe.
>=20
> The related commit is as follows.
>=20
> commit e8bc7a136a81a0d8df2d32dfba0920c1b2835141
>    base-files: use /dev/root in /etc/fstab for systemd support

That commit doesn't exist in OE-core, I think you mean =
c509f948d9c575c45af8c5ed1cb1692c0ca5dade

This change went in already, but with a broken commit message :(=

