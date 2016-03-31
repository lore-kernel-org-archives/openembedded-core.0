Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f193.google.com (mail-ig0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7501260796
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 18:13:17 +0000 (UTC)
Received: by mail-ig0-f193.google.com with SMTP id sy18so8665261igc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7+zL+3H3DzxMMkYUT64AKNeJcej7iig8Au8axHchjgA=;
	b=MZLI1i14g53kgdvf/eCUFZR28FAEVehnLo7XK+f4oJ7USQu/EjzKphYUegGj109WWy
	mFg8l0EVfpRqqgFppeerorqsKFRXOkYjyKpO7VVhqyhxh/IYRRD89JjiabwO57QEj1kV
	ZosB0b+/pzJth14zAxYTr0OpCuNXlJBtP4PoVam3TwGcRR74RwHbiSK6u8fkZM2eE1xh
	5CYcBgORVoQYFxZ6d/jr9OKHZByIgPv9HIlQfuvN07M+SXRPTeWqpeWnQX/fEagYrk/t
	OlWmvYG06/SLM2S1mJeh8e7jS88VERkrBhrHUsvSXnCfVeJQSCvsm9cQ2l7iX6i18b/U
	Q38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+zL+3H3DzxMMkYUT64AKNeJcej7iig8Au8axHchjgA=;
	b=e5tkhx/uV/TYbL48KUhA4IbhceRPr63l+ye1YMoqzJ7fuaniLPOLsGVyv1ItihU0DI
	4AAGX+3cPWDbCVEDfoxGxeKeyrazcGy5qEW9A3VGRGIHuxJUhjc4mcSUTGaTDlyjsdyo
	zS9uecYSROyQ+8Pqy31dRkG/668Ru1iE0lG4oc9Y9Ke0hCvG2D1UVXv9oKLCCWAI0w+C
	4Cd0lwlo7bH7UgQjmyO89xom5BYfZBlXHYmQbUGNH0shU2oclRuP9O4+zkI3ZYD3Y2BO
	HDWcQ5+UwoeNgZoQPCfa0hucyHoWXOu8C9d6dj/WnGvAgaVtkiiNXJ0cPl6aYpXtq/Zy
	dKSA==
X-Gm-Message-State: AD7BkJL/MYLpovch4QOYDZFmP321wbyvbZqPNGKfCQBT3t2VosVKapbtXNjYPDbBOPdrbg==
X-Received: by 10.50.221.38 with SMTP id qb6mr384279igc.54.1459447997801;
	Thu, 31 Mar 2016 11:13:17 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id p1sm4252058iop.12.2016.03.31.11.13.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Mar 2016 11:13:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 11:13:05 -0700
Message-Id: <1459447989-25263-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/4] drop obsolete HOSTTOOLS_WHITELIST_GPL-3.0 etc
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
X-List-Received-Date: Thu, 31 Mar 2016 18:13:17 -0000

Andre McCurdy (4):
  base.bbclass: drop obsolete HOSTTOOLS_WHITELIST_GPL-3.0
  base.bbclass: avoid duplicate call to d.getVar('LICENSE', True)
  base.bbclass: include PV in 'incompatible license but whitelisted' debug
  base.bbclass: minor logic simplification

 meta/classes/base.bbclass                       | 41 ++++++++++---------------
 meta/classes/multilib.bbclass                   |  2 +-
 meta/conf/distro/include/default-distrovars.inc |  3 --
 3 files changed, 17 insertions(+), 29 deletions(-)

-- 
1.9.1


