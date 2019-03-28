Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f54.google.com (mail-yw1-f54.google.com
	[209.85.161.54])
	by mail.openembedded.org (Postfix) with ESMTP id 837237D141
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 18:56:14 +0000 (UTC)
Received: by mail-yw1-f54.google.com with SMTP id x129so14757979ywc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=9eyGjoDvFQl/DHJ2by/qdpv6ROc1hWyz86B4c2BKt64=;
	b=LgPB4thF22WtZTNgIU+Nc9KZs7O52O6Gs2tWXWo2D7hmnDIjklYIHBCgq7xYYb4zoB
	2oZhwa2ehiuiSDGACvxUWHnpw8cfkoRdXFOKTu6VuKbpbJsgVQI0p6LdZ0DCV3QXtGI8
	HO+Xm4zfCIRCgl+UwhHebFDqEXv2NfTaiyo2x5/g3ykrr59FFxyPtBINhqCVb6yPO9ui
	lj3zUI0EJwpfCV7uItKHH7H8Kmvlaoviyir6GIHSX3gRG5mbClBXGD4FqfdQLGos4loT
	G4I34ghzZCB32tjlphlDNTiU54YdFGH3mVXDyVKg1fodCWciZhZWFbigX8c2JlPllZT+
	VoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9eyGjoDvFQl/DHJ2by/qdpv6ROc1hWyz86B4c2BKt64=;
	b=KnkzUGquo/MLYfT6G7pt/rC7Yo8T1vhtJr1PyJPoTBJmLx06pDRm+KgARwZn46gofY
	qvDXFkRJA2sdkwu7AoetcWvkfaCz1zzrZTgODSe0bPZTLNSCdqGJzpfsL7vN5bX/Ed6L
	YzvilK0GmX6m0iiTocNc/ilzJgzzIWncZWdJwHuhBnRgKn/tqIo3dCEEF9vewC3j2Gbc
	7O9R7C5CVkA+lSo4QEopv3SuvGWWs3y1WEHBNQAjqL6EyFX4JOtW8bYnNCEJglYdMgXj
	GGMJs1/Liq3VCbqpkqr65fNenl6tax2YuREjFzzioRv5Vbu58CnXCkNHfbHlQG7FcJzu
	62yw==
X-Gm-Message-State: APjAAAWNXK0GglmVbdGOKoiyvS/fPTnhmPVYtSf9OZPb5RYAxGZbg3/v
	ZqzlIrVaD6aeeXOTecCCu2/NMQ==
X-Google-Smtp-Source: APXvYqzf85222Hp08stzTb+Ad9l+R0wt/jLnSqnk9zxpE0EXeWnFJDqbUH1dwbN59U7bVn42DardoQ==
X-Received: by 2002:a81:430a:: with SMTP id q10mr38176318ywa.508.1553799375203;
	Thu, 28 Mar 2019 11:56:15 -0700 (PDT)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	l185sm6985609ywb.21.2019.03.28.11.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Mar 2019 11:56:14 -0700 (PDT)
Received: by graymalkin (sSMTP sendmail emulation);
	Thu, 28 Mar 2019 14:56:12 -0400
From: Jon Mason <jdmason@kudzu.us>
To: yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 28 Mar 2019 14:55:51 -0400
Message-Id: <20190328185553.5247-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
Subject: [PATCH 0/2] clean up machine config files
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
X-List-Received-Date: Thu, 28 Mar 2019 18:56:14 -0000

General clean-up of the machine config files present in Yocto.  Since
this encompasses files that would natively be in the oe-core and
meta-yocto-bsp repositories, I split them into 2 commits.  However,
since they are similar, I sent them in the same email thread.  I hope
this is acceptable.

Jon Mason (2):
  meta-yocto-bsp: clean up machine config files
  machine: clean up config files

 meta-yocto-bsp/conf/machine/edgerouter.conf    | 2 +-
 meta-yocto-bsp/conf/machine/genericx86-64.conf | 5 ++---
 meta-yocto-bsp/conf/machine/genericx86.conf    | 5 ++---
 meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf  | 3 ++-
 meta/conf/machine/qemuarm.conf                 | 4 ++--
 meta/conf/machine/qemuarm64.conf               | 4 ++--
 meta/conf/machine/qemuarmv5.conf               | 6 +++---
 meta/conf/machine/qemumips.conf                | 4 ++--
 meta/conf/machine/qemumips64.conf              | 4 ++--
 meta/conf/machine/qemuppc.conf                 | 4 ++--
 meta/conf/machine/qemux86-64.conf              | 4 ++--
 meta/conf/machine/qemux86.conf                 | 4 ++--
 12 files changed, 24 insertions(+), 25 deletions(-)

-- 
2.17.2


