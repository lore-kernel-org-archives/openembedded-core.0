Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9C8617016E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 15:25:44 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o80so25280019wme.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 08:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jTRLH0oTKfmtnlRrAsZyXL3UO4J7kOEi0c+hbwe/wMk=;
	b=bLsQPhinlyZWzNRWBMZxFvcXldnB0yEQBE1utM7R/fS+d/cIn8cfqb7izCi1nBb4sv
	phsyFt19i+t5W4scQq23C2HQ3vLgykw6uzwRSykFIAub1xXdQboSl/xuUGyhGWvEf0Ii
	y5HmpbIWULLEAXW+j01JJ/Ng4yWe5wG/FPVdsfgIHhJZtjhlrcJKkihstgJoaGgK2hRV
	qT06hE0KqvLT2/WWmGhhFs2hVfo5ijKXnf5HLTz+ymLdpDF19cwLR2aWBEPCkO3uhqpS
	EaZDLFEcCCXP9pZ9hQCjbOV8yF3yl6T3OSOCNWK+am5UzkMklw7GZJ87OGvR9LeR4mZs
	aAFQ==
X-Gm-Message-State: AEkoouu2EUd72MLP39du2uBYkVzoLnxmf1KzyLqmw5c40RCSMPF56AGmg9AaXAukOD8tWQ==
X-Received: by 10.194.118.132 with SMTP id km4mr42977913wjb.158.1471447544333; 
	Wed, 17 Aug 2016 08:25:44 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a21sm27188657wma.10.2016.08.17.08.25.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Aug 2016 08:25:43 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 16:25:36 +0100
Message-Id: <20160817152538.14181-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH 0/2] fixing kernel module cross-recipe dependency
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
X-List-Received-Date: Wed, 17 Aug 2016 15:25:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

In a situation where multiple external kernel modules are built
from multiple independent recipes, we currently don't generate
correct runtime dependencies of the packages created.

This (small) series of patches attempts to address this.

It's working well for me but there'll likely be cases I haven't
considered.

Cheers,
Andre'


