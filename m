Return-Path: <george.mccollister@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id EFE257D5C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 11:53:36 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id h144so12985236iof.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 04:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r+2d+atbKT5PLw8YBD67K/fix6+manJ7iPjKQq+HXUw=;
	b=eTplLe7F7g294nCYarEtNrqg+uaCAuBTTs3TOmDBSDjw7SlOzvKkDXbHyY1Mb6Qo2b
	CRJtbrmFJWt9H43u6LvBhmTgrVxNMoxoIcAcLNah2vv5fthjfur17DxK+wA34ap/ex8N
	UYkHyQz9KjlHpe6gSg+MFiejWFJ2r0vkpr9DaREzK5i+xSxCcnbi84BcZ4GBpnV59aY3
	hXH2HkIVl7TF+8Ml5Iy+QiZVOiGud0ORLckpOsEG6Kp9tiVXnDQ7SVqQFkZnjUcFR1qn
	ZLtO2ut738jHunt9QlrCww0B2vJnO2jNtJcFiyzFuwiwmymsg8C/adxVWO4flsavj6xZ
	fL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=r+2d+atbKT5PLw8YBD67K/fix6+manJ7iPjKQq+HXUw=;
	b=NelTqn2C7Pi2wfupv6fuKRUWtzq3+tcKnynfKh4DtnaOhqCqwKyzOXD6SeyZOGZTFj
	100GIK8nt8t6Euok9PSj6iFGGJcXmOiE1S5JiYODaO6MJDIXgZ5Rc1IELttP8LhWJY9n
	/6mvBQAcd7/JaLeWkjQnHFRN+VaAlApR2eFmvGsii+omFPOWZYQN4/xddwSa0whRbpYK
	38SfWHOAdd3FsEcU8RzrvjxPZc5heWThU41fGcWJ20lkvK8GXkn88xS80lymIwcWtuH+
	qdT3x4kwJnYZxVjUAXmf1/vZ0E9r3O9H0i6yUoGCXOBWnEwkYgD/QuX3BCj3nXNdzwPK
	uIHQ==
X-Gm-Message-State: APjAAAW/xuvJZuEWDUmYKJbjx/D62DRMVvfZvR7Nzid7d8JzR1foqmn8
	Ev94Z8sSArRgTo7g1x2N7Nes5lw=
X-Google-Smtp-Source: APXvYqx1jQyVF4uyi76ETWYam3abeUoaq7W+2IJZqlVAmkLuOOsdM68fOwlFpqa5sYZUWQmQTENfTg==
X-Received: by 2002:a02:2302:: with SMTP id u2mr4823038jau.70.1569412417679;
	Wed, 25 Sep 2019 04:53:37 -0700 (PDT)
Received: from george-i7.novatech-llc.com ([216.21.169.52])
	by smtp.gmail.com with ESMTPSA id
	x12sm4441332ioh.76.2019.09.25.04.53.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Sep 2019 04:53:37 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Sep 2019 06:52:58 -0500
Message-Id: <20190925115259.26437-1-george.mccollister@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 0/1] make OPENSSL_ENGINES match install path
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
X-List-Received-Date: Wed, 25 Sep 2019 11:53:37 -0000
Content-Transfer-Encoding: 8bit

Set OPENSSL_ENGINES in the openssl 1.1 recipe to the path where engines
are actually installed. This should be cherry-picked to warrior and
probably anything older with an openssl 1.1 recipe. I've not tested it
with anything older than warrior so someone else can make that call.

George McCollister (1):
  openssl: make OPENSSL_ENGINES match install path

 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.22.0


