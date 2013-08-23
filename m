Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f50.google.com (mail-yh0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 240D66065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 14:49:27 +0000 (UTC)
Received: by mail-yh0-f50.google.com with SMTP id a41so200552yho.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 07:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=eYhgU6Vt6tuu8xFw++k2ViTokTJTBbMZ2qNm9SG/SWU=;
	b=xmab4QMN7h2uvV9vd7T1uIarjWNOKe7iq0Gmw8NmJT9T2AlQWkheAE332SQCJrVRg/
	Fjp7uQXsDqpTYb2zyYY2CjFS2PWk8ulqCqmgmBvMTPXJQC864BMJHXEW8hC8/YFkLuub
	WWYrjzBQneQ75AZA96O/WW8q9ZXJMeZZNFlLYaG+cVfiWx2kAB8zN/66wC/NxODQ7DSo
	zBQuhnZTozgyb+rFfMY5yhkr3x+h8hDCbr6yvV5MKrnhoIAPdav4cKPA6xWxyBo0AmT+
	rERW5JbvpC8bJDjgx5zQy72yVwkOplXRZxbJIqyQPGtTvURVt+kGaj28pMUK5AUDkYiX
	wPcw==
X-Received: by 10.236.182.166 with SMTP id o26mr7800yhm.187.1377269367110;
	Fri, 23 Aug 2013 07:49:27 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id v23sm248195yhv.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 23 Aug 2013 07:49:26 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Aug 2013 11:48:56 -0300
Message-Id: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc1
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Daiane Angolini <daiane.angolini@freescale.com>
Subject: [RFC PATCH v5 0/2] Pending changes for review/discussion
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
X-List-Received-Date: Fri, 23 Aug 2013 14:49:28 -0000

I am resending those two patches as they are not fully
discussed/reviewed.

The EXTRA_DISTRO_FEATURES (1/2) one has a mix of people which likes it
and others who hates it. Personally I would like to get a mechanism
like this one supported and it allows for much easier use of
DISTRO_FEATURES during development phase. People argue it can be
abused and this is a real possibility and something that will happen
however this happens with everything so it does not justifies, for me,
the not inclusion of it.

On the other side the UBOOT_CONFIG (2/2) one is not complete in my
opinion. It needs someone to help to find the gabs so I can fix those
and propose a final patch.

Changes in v5:
- Resend

Changes in v4:
- Drop _prepend/_append hack and remove/add DISTRO_FEATURES (thanks to
  RP for the tip).

Changes in v3:
- Drop _prepend/_append flags from DISTRO_FEATURES to avoid the re-add

Changes in v2:
- Use data copy to fix wrong prepend/append expanding.

Otavio Salvador (2):
  base.bbclass: Add support to EXTRA_DISTRO_FEATURES
  uboot-config.bbclass: Allow choose of U-Boot config for machine

 meta/classes/base.bbclass         |  4 ++++
 meta/classes/uboot-config.bbclass | 39 +++++++++++++++++++++++++++++++++++++++
 meta/lib/oe/utils.py              | 24 ++++++++++++++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta/classes/uboot-config.bbclass

-- 
1.8.4.rc1


