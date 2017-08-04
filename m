Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE8B605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 02:56:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r77so4237450wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Aug 2017 19:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=83xD2eFDXEdo/90kMSubsgSy0nXRjYLbTzJhCKR62n4=;
	b=JKSSPGlqkm0XxOpWT/jBNwrqMlaM+8U4g2kwt9YicIpYneWvp3z5VQK9CEkKr0oZAp
	N75X+GQRYluhUz+k0QXAHdUlf5MJlTueXe3pqN0fF5qU1Tx2Rf+O6CJgi1DnvWsZ0U7w
	acj9kF7hiEeRTF598JSXUVjH3tTAE8cLdMNneMq8oAaPb0vP+5B0E5lB+VyFmAevEb6r
	q3Jug92C8os6IH7T0GrUK6e+WjYDqrgboOpAyE6HL9mjqiEV1ePRYSlbJhvdTo7PlNkG
	Du4MEovwZ/nLAVIfNAe6K6C/QINryCXoSg1GTXwPct5b0Z7hc3CEFRfueb1sNpKBz1yb
	IGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=83xD2eFDXEdo/90kMSubsgSy0nXRjYLbTzJhCKR62n4=;
	b=JcXh8IHYWpmXad78z/3QwySsELIdUWcXw6srZuGnk8d05TLtogO6hVo6s4RSA4PfIt
	usiKtUU+T6L8zrxk3tyC9x8YLKFrZJL8MwBhMdtnFz+V+ikBqVHn7cTWOj2cfj3T7wKQ
	yQOgsPU9BH03jyGrbS5mFrToQMn865tlHp5jn2z68+VoUtyp1TgmVUTcG3wRTHqsT/+A
	aVZkkXvQpzqzzoccggsbrfbwsZvaeOHTyw46iuKgFOGED9nTngA4SE+BF1syGuf3A+vw
	dJPfmeqpgrmQXXmHW19ZN8aQ4f6FC90ijYeOvu7/V4p5j31Qk5MXxmsfA3Q1YYqPFSe1
	LbJg==
X-Gm-Message-State: AIVw113QPdDrH8fySUkODoAIJB+0XFM6N5dmEAEKXRaIXm9aOd+/vAGo
	a+Q8QoDxAK4knejF
X-Received: by 10.80.140.65 with SMTP id p59mr1036417edp.0.1501815402047;
	Thu, 03 Aug 2017 19:56:42 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.186]) by smtp.gmail.com with ESMTPSA id
	b10sm1984131edl.74.2017.08.03.19.56.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 03 Aug 2017 19:56:41 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 04:56:27 +0200
Message-Id: <1501815391-8192-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH V2 0/4] Set WKS_FILE_DEPENDS/Clean up some do_image_wic depends
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
X-List-Received-Date: Fri, 04 Aug 2017 02:56:42 -0000

From: Ming Liu <liu.ming50@gmail.com>

Ming Liu (4):
  image_types_wic.bbclass: adjust WKS_FILE_DEPENDS_DEFAULT
  wic-image-minimal.bb: add parted-native e2fsprogs-native to
    WKS_FILE_DEPENDS
  qemux86-64.conf: set WKS_FILE_DEPENDS
  qemux86.conf: set WKS_FILE_DEPENDS

 .../recipes-test/images/wic-image-minimal.bb        |  2 +-
 meta/classes/image_types_wic.bbclass                | 21 +++++++++++++++++++--
 meta/conf/machine/qemux86-64.conf                   |  2 +-
 meta/conf/machine/qemux86.conf                      |  2 +-
 4 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.7.4


