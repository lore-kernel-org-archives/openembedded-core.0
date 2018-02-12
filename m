Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED8A60102
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 10:19:18 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id b52so14569274wrd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Feb 2018 02:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7ivacdM0UJ1yYROWtQ5KzbkRA8hj/3lTiWPVtzKPHdw=;
	b=dBOgT3s/AfPy0YCF6rnk1S5xETvurSOZk/b52B/z07tNnvMkClcIYdOhq32qY8Nepj
	/hcjAYmME8eSl2Mcgp88RcBfrZyf7oHhWbxdeQr9p7u3Eg7n3Ke95YnQWWcQWx1MjbSu
	983MFwtN6CGt0SrrqlzVO76XX8oiA1Ue7VSItOMVX0O5YoVeS/2nvzzBIU2eHyDNGupO
	dFqL+PIkFyYgLiVB+WfCbjzk+76JOcemDz2g6eph8j9g1FT8ynrl+PY8NHV/DBwnrLlM
	Pv5DglE4WEemWcRMoIGYCpRXAoT5v540/HlUAa8AsRpDbaWTsnyLvF/xxLxBMJKIZd2u
	nLOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7ivacdM0UJ1yYROWtQ5KzbkRA8hj/3lTiWPVtzKPHdw=;
	b=Zfhq8Dn2iq1SOfA3358NhjwHKGbw5CSWoAOLaInzy25ymsIdcCSeCImZw5fzGjwMZE
	xNzG5QRSQg3Q3P5Iqzzitn/bRInUwM3onangKZV0+Ys8s10PmBrxrIQa0mniH5+7s59G
	VCrDg6HnDqEjlyCpsdayLT+Zh7pCB/auqiZ8KwLkgQaZJvP6SB3tzE6EEJwZCl9RheXA
	9zNlhmjQ0BzqFrDENr39kB6yH3fZFxEXid4rOKYySZ7WAinAo5dqmdoWtS4FL9h+aSSY
	wLrRCugqDziiqu2W1kM+1YaY5Du1MvIfx/vWpcdgPpVd+5XetE1UcrNe3SpGb5kF2eux
	T4hg==
X-Gm-Message-State: APf1xPB2COfz4kunQLPYPbK7FptAaZiIbO9++9TGTmxgW48RT2LJrLQr
	c8Z2ceEsRKey7yWVhYycyiNh6A==
X-Google-Smtp-Source: AH8x227bUuKL5vEyDOw0+eCmfRR1g7S6gxez0BPhTV8tUw7Df51NLxUrMF6TVv+UrkvQyeOqcHKHZw==
X-Received: by 10.223.155.196 with SMTP id e4mr10049764wrc.63.1518430759913;
	Mon, 12 Feb 2018 02:19:19 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	h14sm9764307wrb.29.2018.02.12.02.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Feb 2018 02:19:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2018 10:19:18 +0000
Message-Id: <20180212101918.228-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <CA+chaQcQztFnFJjZhXVYQeTZuv4qJ41j5cNca0NJhHPz4R6x7A@mail.gmail.com>
References: <CA+chaQcQztFnFJjZhXVYQeTZuv4qJ41j5cNca0NJhHPz4R6x7A@mail.gmail.com>
Subject: [pyro][PATCH] bitbake.conf: add ssh to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Mon, 12 Feb 2018 10:19:20 -0000

From: Chen Qi <Qi.Chen@windriver.com>

We changed to make tools required by testimage to be included conditionally.
This resulted in users who use ssh for git fetching having failures.

Add ssh to HOSTTOOLS_NONFATAL to make things work for the above situation.

[YOCTO #12227]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f3994fc642..e2383d2709 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -472,7 +472,7 @@ HOSTTOOLS += " \
 HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
 
 # Link to these if present
-HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
+HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
 
 # Temporary add few more detected in bitbake world
 HOSTTOOLS_NONFATAL += "join nl size yes zcat"
-- 
2.15.1


