Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id D07887D044
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:08 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id u65so2394887itc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=aWpoItA+inLbjWbeK6hNBBQDnbOhfiWX5R4sXdWTAGA=;
	b=Y0iIYB1l+gFRE5IcaoA7BelOQQxIXgTl+dTwlhycUWblE2eafdpYrXIZkH/8L/Zdbm
	RD6+2eSm5FsO8ig5Tm8l40kILkO1WKe5wuokqmCDI99/Thc2D2aoyilqMTGR6uAUvTaa
	keCSn8udvIBC8vANXcz2n/EjCzPY5ntbz6jDYG2ksRAlzalozNKfHzbMdNr6qGK8AqDZ
	ru2nqRd7rObXwDsbBg4QfHvhPkMJfapIQanIuuTXxNBQKrdqWo3YqbK8cXDeqlqYwY2/
	M40F2isV7KyAaVlllxZfBRI8R6gEoD9LJntDNG7+bLF4bH1NyyDT84HGQDGQ+qcmFrvI
	psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aWpoItA+inLbjWbeK6hNBBQDnbOhfiWX5R4sXdWTAGA=;
	b=qQK4J4WnaA/8yJ4a71uRC/PhS+cfncIVrrgy9aX89fu5iQOp5oQOAJaJ4M0XSU+OLU
	XpYxXaXU0R0DEzLcl5l1mt8b7Fzcd4txEI+Joa5UzjRoyJUzZYWRAAyJShZxMaFakmWO
	UifN1kHwlPQb5Tc+Onx1T4O8nBYTGklkkpDdpELGiI42lZBNopBaJla1lGh5S3NkVRmC
	nsnc6JgpDkL+3Y4ljBUwav6v+L9WpdSEOxd7c4qhYUJjhZ+unxz9vlrxlIDYQk/FOJl+
	h5Mml8Xq9wS5T9KFr0TW3owlB1IZSh2oUmRg2FMtk7r9hQu5btVUO8huDh+rp1dHuiRR
	fMbQ==
X-Gm-Message-State: APjAAAWEeTnlzieKu9KxhRKHDfQA1ciSv+42ngdNMTJkp8pn2C0aednT
	8M7COUhyyU8Kvd1hi8G1U5g=
X-Google-Smtp-Source: APXvYqzJE0qdnO6MnAI5yorFN4atSG/Bmtp/KOYwOvk6YTcTmYjQh2LTSJ2z5OLRBI23kQOeMWcXWg==
X-Received: by 2002:a24:a50c:: with SMTP id k12mr10315136itf.6.1553483529705; 
	Sun, 24 Mar 2019 20:12:09 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:08 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:57 -0400
Message-Id: <d7ddced1d64e906b8e6bfd12401249e770f26807.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 8/8] linux-yocto-rt/4.19: update to -rt16
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:09 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the latest 4.19-rt to the preempt-rt branches, the -rt
release announcements summarize the changes:

    Changes since v4.19.25-rt15:

      - The "preserve task state" change in cpu_chill() in the previous
        release is responsible for missing a wake up. Reported by Mike
        Galbraith.

      - The x86-32 lazy preempt code was broken. Reported by Andri Yngvason.

    Changes since v4.19.23-rt13:

      - Use the specified preempt mask in should_resched() on x86.  Otherwise
        a scheduling opportunity of non RT tasks could be missed.

      - Preserve the task state in cpu_chill()

      - Add two more cases to consider before warning about pending
        softirqs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index fdf7ce1435..dc64e38dd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "264e7ef1dcc8ae753f36a7d13c8570690d28e3f9"
+SRCREV_machine ?= "2c6e44e476bd297d65d5cb1b5f5538d303fc05a0"
 SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.19.1


