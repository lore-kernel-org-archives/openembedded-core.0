Return-Path: <>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id DFC197F9A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:29:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id w9so2223133wmm.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=+GTMFVXyLRVnP4Dsw/4AAxUlsP3P1Mu0bynd9BECTY4=;
	b=nos2CRKTJg/Z5CqqR+SKQJ/2McPAVmO3qoye8V6HJXjdt+vVJ9dsGn1ELe6NPteSyz
	oZQEpYOqia5gLeHDq8BxMIEHzyjbXfrSSgvfd6Cb9gYqnWAW/J5EqfbDU5jqwX+T2ZOF
	UdMLuutyXtr/czgDwbrPD2g77KovaauyS047WwXJ8Sg5WYuuplaImw/pN2PZbKaDTS3u
	Qk98hOP4rPwzZgI3ezaejerDRGEm9fXsMh6ysi2Gs5W4eUXrne5RpA5oouuQ6/RVijQ8
	/B8Y7FDQW3qYEVtShrO3wQO90BByFgAU3pZTt76rqsWov7JoV3Puc35v6NAQehwNozuE
	z5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=+GTMFVXyLRVnP4Dsw/4AAxUlsP3P1Mu0bynd9BECTY4=;
	b=b/aaD42E3a6Chd95uUO2jLMVPQUeXAXYwR36IdoRHvrMGEUY+kABC5YC44wJlYINwo
	VROv1CbaXOAvGc5PYHjd4hurlY1mptwDKVsJOnbz5D2SJ/kwm5hLJezbopezSAshTLqC
	B46J/bYC8MiXPtt8Kb9PghPGVHSGTLfeh31c9i83/AZysjpxOg7n/kWopR3HNtJXtJxd
	/oqp7xlOpLyCZyLtSbr/hPJ+PDAmYWEyzWkCkbh/oT/gKKSUuLeqxVG+xLh5XxIAmtH1
	9W5/OQINei5ut7DES7JdLaVEWH0bavWj2TLmoWwOKfFdXjld0yv7XAHvjO1mou5iImfV
	29Zg==
X-Gm-Message-State: APjAAAUDqcCkIMgDGEun14eyCJ082O/2wFPLChtDSa0KEYY5NU6KgKTs
	Pel4x18UvQ3L4K1eY6tp1sDxeIkH
X-Google-Smtp-Source: APXvYqyE8PgsAfxfhE5QSAtXmHu4+SlMOEmLqSNCWKg/ifGsmErP8GMOXsxP4yTFuncpjyw2Fx0Usg==
X-Received: by 2002:a1c:814b:: with SMTP id c72mr6180211wmd.167.1571938170345; 
	Thu, 24 Oct 2019 10:29:30 -0700 (PDT)
Received: from localhost.localdomain ([117.55.204.18])
	by smtp.gmail.com with ESMTPSA id
	p10sm28141824wrx.2.2019.10.24.10.29.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Oct 2019 10:29:29 -0700 (PDT)
From: Alexander Kube <alexander.j.kube@gmail.com>
X-Google-Original-From: Alexander Kube
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 21:59:05 +0430
Message-Id: <20191024172908.68056-1-alexander.j.kube@gmail.com>
X-Mailer: git-send-email 2.17.1 (Apple Git-112)
Subject: Add recipes for Go v1.13
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
X-List-Received-Date: Thu, 24 Oct 2019 17:29:30 -0000

This patch set adds various go-1.13 recipes and changes the
poky GOVERSION to 1.13%. It leaves the existing go-1.12
recipes untouched and available for existing users of
those recipes.



