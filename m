Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1237F74535
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 14:07:12 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t11so529715wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 07:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=6tpL2YCLB0cp41DG+15P4batUkPC1WQxOFxhW/zYBiQ=;
	b=IJ5D33YlKhyPotoO2N28E91iRktXfhNQGN+/teN1/KzSkp4M35mbmGHR/qp+LKqhUI
	gZA21nKa6Hd/R9LUMernPZUvUlT3QZWxbTIr2jmhxSG5xJyo54Mfu+yX/dvrZCn+lW3c
	uOypiHenY2/CTcai8KrTTNYFhfbjkNOcq11jQEjjvPcjbgu5aKrEK0cTGoh01qutp/Yt
	u6ex3JDmA3pemJbWkdlQxv909B5o8BVzU4mdaDpZ251IvNQXXLPTr/dhntZMXm8ABtFv
	g4apXSQTetcRSwz8xwVXOpr+eHS0mwgngz2L9/fqqqkUrwKKZbhQXz0Pstirg41klS6t
	Q+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=6tpL2YCLB0cp41DG+15P4batUkPC1WQxOFxhW/zYBiQ=;
	b=hMOKF/BHck81HBRClor4/fV18TCiKqbFt0TH1TgC19CVNtHFZnaVEnI+BaQUOoG+T7
	jo8o4g0Dep4osHX0mZ2zl3aI62ShA37vpV4cIGt1vCV0oO0mW8MwhYCjZCGx/ZWBXtfH
	8CuMhx9d+PSJnGp92O1I055Uraqqfm+8Y/fFBDFJvgRD4KM6/RgAn4nSCE6uaciKtsEC
	JA+4nXEXJ52r8rWITc72OVu8j0NyDQCRPB2z2WmSfEt+Rv9f1XI+qSTOxEzPZVxBjtJa
	S2lkkLd6cOasoqj1qvKptfofSQTTJG9elhtBeUV11w7VHWbDryyNCMOuG+hYSP1AkYmT
	aKYA==
X-Gm-Message-State: ALQs6tDuiF36qyB+eDJOgZDxDrgwG51LwpFkRzz55whkEEUEHzH52Ne3
	151mWIAK03igmXhH0LYVE0vEdQ==
X-Google-Smtp-Source: AB8JxZo3l0TXXaUwyg3JPkK8/I0SQ3JwXRfKe/moBppbCRrAhnDlIXxpMh2lSJFreFEYsa/bY7ejpw==
X-Received: by 10.28.110.30 with SMTP id j30mr2200940wmc.62.1524665233667;
	Wed, 25 Apr 2018 07:07:13 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	v75-v6sm33583397wrc.65.2018.04.25.07.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 07:07:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 14:07:12 +0000
Message-Id: <cover.1524665116.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [rocko][PATCH 0/2] Backports for rocko
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
X-List-Received-Date: Wed, 25 Apr 2018 14:07:14 -0000

The following changes since commit 1b18cdf6b8bdb00ff5df165b9ac7bc2b10c87d57:

  libvorbis: CVE-2018-5146 (2018-03-31 14:17:16 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/rocko-backports
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=jansa/rocko-backports

Martin Jansa (2):
  Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
  scripts/test-dependencies.sh: remove

 meta/classes/waf.bbclass     |  17 +--
 scripts/test-dependencies.sh | 286 -----------------------------------
 2 files changed, 1 insertion(+), 302 deletions(-)
 delete mode 100755 scripts/test-dependencies.sh

-- 
2.17.0


