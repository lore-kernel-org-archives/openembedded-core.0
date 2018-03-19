Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id CBD8178944
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 07:09:16 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id w82so1204398vkd.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ghOl+EqaFN1Du2ouxXzaymkjU/E0mQl5OY6f3arrC2M=;
	b=DBbXuiCMddBUUh5sWlTIeowVsvq7ANZKrYdgO2zKf+DVBqPH4iLOjDEyIPSbr2FKbP
	9UCT/HzRKdsVr3rrQLVAKpuMMdPv6UzNRKjzQd0PNS1Jw7vQGb0d1bNmCDOUn6oXJtJj
	XV/d0GlbvcZeuxqOOtBMaZRG1v80Pdkc/PtRDHqWNaDbcd+79r9iTrh6x0dVLupzMB1T
	qEqdScV5mBymS1EaVCeMToVuW2bzw4jFpCH/BdKq+7aubbdiy7xaiKYaRp/+Uyu9f/GE
	pr0qKBQU+Ytjb0RwI6aCd3Ipjtm9C/N9fq6fnRgHExG2OmApuMEwMiheCyaNfOWphVK2
	Yl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ghOl+EqaFN1Du2ouxXzaymkjU/E0mQl5OY6f3arrC2M=;
	b=h2dQp68xSv6buA952VNQ7mGPBgle67fvIJRDoVHLrSwYdjAk7BraiJyrzUge48poTF
	4JA0ItXTp7F/8frN2K3BSgCLh57m+fQDR6lkbUzjPvuE8Gqp6FCN7EkJHd61EBwSXiG0
	mAuk+pLlrfX4XoJzMgdeR3iQPHVFCOqTy/2wHHlsBLHbyz6DUqq7KEHobPBveGowtVj/
	0kSQMXQ4rNdLNjzB4UmjXUqrFNdcb14L3YMs9dedZ72IHNa1LaP5GcJcSgaklu3s+Wqt
	5xWzKApmxEJnv/otEdg2csYmD/4dDNEGf2wa9qfh1600/rRVS0hPhrdLdb1IbYypJl3f
	SQoQ==
X-Gm-Message-State: AElRT7G6xssbkZozdcFJOgsnJomikSv8AlsTmfvYwAX6CpKgDpwXMJmE
	oPoiGbJ0JXL0nbbTTgi/s9kFaJ1+ctUp6VnSLRQhtw==
X-Google-Smtp-Source: AG47ELsZruIJ9A5p8Xka027K117n6gwdTvFW7zZ0vLV5WK1DiRKSSn3hOx7ijxj7QGtdrweLkb5UZSK6nBCuv4dTeLU=
X-Received: by 10.31.134.147 with SMTP id i141mr6848101vkd.128.1521443357224; 
	Mon, 19 Mar 2018 00:09:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.34.4 with HTTP; Mon, 19 Mar 2018 00:09:16 -0700 (PDT)
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Mon, 19 Mar 2018 12:39:16 +0530
Message-ID: <CAPGMVzGzrN+1benKKTjnDtbFgAkjqmqcUit09mEEmKLKXAwZNA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Building keras and tensor flow on yocto
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
X-List-Received-Date: Mon, 19 Mar 2018 07:09:17 -0000
Content-Type: multipart/alternative; boundary="001a11411038da73bc0567bea27a"

--001a11411038da73bc0567bea27a
Content-Type: text/plain; charset="UTF-8"

I have been trying to build keras and tensor flow packages on yocto's image
that is poky but not able to do so.

Until now I have tried looking for their respective recipe but couldn't
find.
What's the way to add keras and tensor flow packages to poky?

--001a11411038da73bc0567bea27a
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br clear="all"><div><div class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><p dir="ltr">I have been trying to build keras and tensor flow packages on yocto&#39;s image that is poky but not able to do so.</p>
<p dir="ltr">Until now I have tried looking for their respective recipe but couldn&#39;t find.<br>
What&#39;s the way to add keras and tensor flow packages to poky?</p><br></div></div></div>
</div>

--001a11411038da73bc0567bea27a--
