Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E7C6E78667
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:46:56 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id u48so308690wrf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3g/ScngCV7nKwGhayMewECpzGw/6qWV+EQNGcAMkCGM=;
	b=qEzTmOWDfGJI5y0Xd5E0jY6wKrOb3Tu4WfzW0tyH2HQIOGTEzhyc2tCU/ati3O7nz4
	VgxMz2FMiokbV9t0/6jM2IKssYdnBg32kyyj71GF+JrqOn4cohl1uhPW7/kGLEhtWKMp
	xnw5bv5zFVt+65WOmAX4seAd8M3cbhtDxQ8n+al8jRPp4LCUue3QKQobA+CevEBC/L5B
	tRNSiqm00QJ0/+0q3yxz3O7EuKD3Ogyna3t2GUwDpUussl58OZql9liVbz0a+9xtiAeZ
	pOVY4gck22ApArPWvWZ11lVeygy4VL8aY51TX27eEeZbPLtCEhLynu4YrkBe8II4ePod
	QtFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3g/ScngCV7nKwGhayMewECpzGw/6qWV+EQNGcAMkCGM=;
	b=BS0RTrEWvY5jTReRFC98skCYC42H7YkRs1fNLSVDItzH1AH8EZhElzonMo2soKSNMl
	CVfsBqbfnFILp1YZmtuWkk4rbQ5XFg+iPqDdMgGiqZNecxeDcpr9p/GBCGmJ6zAJ6axI
	lm7gMduZZ1LP+yeo5aATa3ghQzTQojzGPnaey2rpNdLl4Yoy6K9AWEJaF949PVrEQOTv
	D0luvnyhC3KrqnXuRDdzLR849g7Dx6r6Ua2Grhnr87SPsrwxcNDGwxeIvx6gkuXVmYix
	fnOUYY1sev+kNiUYB9bRjkBMzM6RECNTCPZqFg1GJQ9gyEwMda7DaAUgH1G2qVX7MT1E
	oxcQ==
X-Gm-Message-State: AHPjjUihpeDMqUaiRFG5CY2v3uhUAUd5ypf4tDuS7LbmNf5FklH4XVu/
	FcCEdweBif8zYg==
X-Google-Smtp-Source: ADKCNb7xIrT1b8Vomo7BiU5+MyRBmMppK6abT6ms212vvQDbWkufL+vqcuLtJX/qs+G6viSQQu3IpQ==
X-Received: by 10.223.133.164 with SMTP id 33mr15333139wrt.179.1505317617625; 
	Wed, 13 Sep 2017 08:46:57 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	p78sm2197439wma.11.2017.09.13.08.46.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 08:46:56 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 13 Sep 2017 17:49:11 +0200
Message-Id: <ca609f03a5b999b80e19e90974ca7b1755e1ec32.1505317670.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1505317670.git.Martin.Jansa@gmail.com>
References: <cover.1505317670.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [pyro][PATCH 2/2] bitbake.conf: add bzr to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Wed, 13 Sep 2017 15:46:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Jansa <martin.jansa@gmail.com>

* it's used by bzr fetcher:
  meta/conf/bitbake.conf:FETCHCMD_bzr = "/usr/bin/env bzr"
  and when it isn't available in PATH do_fetch tasks fail with:
  /usr/bin/env: ‘bzr’: No such file or directory
* it was also added in:
  https://patchwork.openembedded.org/patch/140107/
  but this change wasn't merged (nor rejected AFAIS)

* cherry-picked from master c7ba7e9e7a7ca2caf453106112dc5a3c855b21d3

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8e4f4bbb56..2dac3a1481 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -477,6 +477,9 @@ HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
 
+# Used by bzr fetcher
+HOSTTOOLS_NONFATAL += "bzr"
+
 CCACHE ??= ""
 # Disable ccache explicitly if CCACHE is null since gcc may be a symlink
 # of ccache some distributions (e.g., Fedora 17).
-- 
2.14.1


