Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 646CD6C37F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 13:49:17 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id j2so27513399wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 05:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nD4zAYQ6s7U81Fei0orufzz5rq9i5KJ41KIPuKP1rKA=;
	b=Up3RoxlppSgxsxDIDAhizm6QbQEbcPR2EdHl5TQAXCn/Hzm3h+KwWHrYr+vcwUCXG7
	2NfGWQHae56UE5x8Iy7QAzMiMy/k2dsl/W4ARtg+NQ5ohnr6trfhV+3Z8u6iaykhf3sA
	RDXYiqQUqe4PIFOklkPmRr1ozAbX0rxJnVeV3noIrDRd2TbzpjGZ9hR/NJ5TimUL/T1h
	fa3uwtT7S3JFT5zWV3ofCPDb5tvXyayym48iE1dFrlYc/EaMcxzEYjLvIgBjyDOORKg6
	BVGbBk41XOQodnkId7bNGuED2qXBCZHrwoZOeKgTzAphBwz7y6V0Np66k/We4EgKOTaL
	3dxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nD4zAYQ6s7U81Fei0orufzz5rq9i5KJ41KIPuKP1rKA=;
	b=gYpBUkBg4GKxNXW2DrHIEhRhMmzCmfKKlG6yJA+VFz9bwUB0YlSBPHgHXfuYNVBOWc
	ps7eWZdI37v4bYRcfiG4wd53KXOQmfXoWFQS/8VLq0QUHtFdClKrQCHZtYQz5FWXpgnQ
	zwPKKBd9frQO5RdkGFLJDB/9TvCwOwIKGgIzMmy2JwSDP7T91R8PoPnRKIc9DaM8orsF
	Dw6dStrxb75tYzHEOvq+YrdM7e8pmf3PCcyxCnT2KaxoBoCQ5dvMN6fUFTXUJd1xeAnj
	02zp2Yx6Npu7c17OPo0lOezEjB9E5lSbTL74TV4M0XHBvb6C2hKU3hrZGoM5QlBKIZHk
	5vRA==
X-Gm-Message-State: AJcUukepRjcroiTGm1WfQNRXBFAkRuudFyM+WSgposz6HmDcjq/0Zac6
	CBxGLDKjV31l8K5M2TVk/Ds6R/K7
X-Google-Smtp-Source: ALg8bN4mPl+CL4ICsOHz3x05x3BqsnGGR15KkozwMrDLwOIVQzSFFJ4saBv3IwApf4DIKvllAOHqnQ==
X-Received: by 2002:adf:ca13:: with SMTP id o19mr32699866wrh.148.1548164957562;
	Tue, 22 Jan 2019 05:49:17 -0800 (PST)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	s132sm35315532wmf.28.2019.01.22.05.49.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Jan 2019 05:49:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Jan 2019 14:48:43 +0100
Message-Id: <20190122134844.13433-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/1] remove unused distutils-tools.bbclass
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
X-List-Received-Date: Tue, 22 Jan 2019 13:49:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please correct me if I am wrong

Andreas Müller (1):
  remove unused distutils-tools.bbclass

 meta/classes/distutils-tools.bbclass | 73 ----------------------------
 1 file changed, 73 deletions(-)
 delete mode 100644 meta/classes/distutils-tools.bbclass

-- 
2.20.1


