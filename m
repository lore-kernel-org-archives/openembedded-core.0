Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 91FC379382
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 00:59:51 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id b90-v6so4438240plb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 17:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KFWqMT4sm8VvY+e2I0igQvaZ2RGaLKOH3sCDkSw3n2M=;
	b=IoMk6p9sATJN4ed/6fx1+4sdEJeXRwTnzzNHmkOk6gSlYHzk0wuevNXHllLkuz/lUc
	FY9zgrC+tbQZNMoGPNip+nKoqA7P/Rhac2o/tI2Zz6kx2lDgEU9EY19Mv8+ZxCsZQtRR
	j04Lh3pCiiJ7oUp1zlrg3hktEeuDgxKsRzh3sJuKDEiPahXUQVea558+rHsbHBdlabUT
	v0EmMYfYlz0flAq4BPDCbs4kUYq6UnpjvDQjArHO6OOkcXJiuNx/3b93gobc1prTCUDv
	JrkvN3Nuw8TQwV2WQZ0CgcJOF4uIIrlP355aPjszUwmBMFreh2P6q2KhXmGbQ0bF/WD+
	82kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KFWqMT4sm8VvY+e2I0igQvaZ2RGaLKOH3sCDkSw3n2M=;
	b=oz3tMhXIlbAOQBPe6rv+NhRmlxW+++L5t65wkTtIe6eNa8lDy5qMIerio8BVJN0IBm
	4RfzT8frZ0sv3lzAV7xVFp2FpAtr/ShuwXECwN2H/SgW++fZqu8EhBs/bSHnAqG+Gxj/
	lPEJuMbKovtpaxnM1yvkbkjHTJqfz5Ij2Bnoub03+xcy0z7xnCCofLBHsbTNA9sjq6ZN
	eLF/XmHvUtCLB3e/te39bC5WtvqFH+RwOXuFYjuAvE+yjcoXQ94n75Zfch4er00zLabi
	WBr6PcLsGwqDdnSt7swJFBzGCGLIHZPZ9eZ7+ckYuh9WTLJ7+4n0homJxZqjfJ6D42A9
	gsyQ==
X-Gm-Message-State: AOUpUlGgcgp/lzOB9EbSi4ZqIA8uUD3FXgPeQ5LY2QS6Cbmt9llaFvnZ
	gjTLHgE7M7d3Il5baZqdMXk66go8
X-Google-Smtp-Source: AA+uWPxZqf76ia9lvJ1V1RncgcBj1EWn1ISUk9kzN3zU9DNJuMz7nOEkeWF8OejR/NhIoBAV26hrAg==
X-Received: by 2002:a17:902:9693:: with SMTP id
	n19-v6mr35500090plp.282.1534553992506; 
	Fri, 17 Aug 2018 17:59:52 -0700 (PDT)
Received: from localhost.localdomain (163-47-106-192.flip.co.nz.
	[163.47.106.192]) by smtp.gmail.com with ESMTPSA id
	t15-v6sm5986311pfa.158.2018.08.17.17.59.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 17:59:52 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:59:24 +1200
Message-Id: <1534553964-16157-2-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
References: <1534553964-16157-1-git-send-email-ankur.tyagi85@gmail.com>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [rocko][sumo][master][PATCH 2/2] base-files: respect PERSISTENT_LOG_DIR
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
X-List-Received-Date: Sat, 18 Aug 2018 00:59:51 -0000

Respect PERSISTENT_LOG_DIR variable. In this way, if the user overrides
this variable to be e.g "/home/root/log", /var/log on the final image would
be a link pointing to /home/root/log on persistent storage.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 1c0863b..597fdaa 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -42,7 +42,7 @@ dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
            ${localstatedir}/backups ${localstatedir}/lib \
            /sys ${localstatedir}/lib/misc ${localstatedir}/spool \
            ${localstatedir}/volatile \
-           ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''}log \
+           ${@'${localstatedir}/volatile/log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else '${PERSISTENT_LOG_DIR}' if d.getVar('PERSISTENT_LOG_DIR') else '${localstatedir}/log' } \
            /home ${prefix}/src ${localstatedir}/local \
            /media"
 
@@ -106,6 +106,10 @@ do_install () {
 		ln -sf volatile/$d ${D}${localstatedir}/$d
 	done
 
+	if [ ${@ oe.types.boolean('${VOLATILE_LOG_DIR}') } = False -a ! -z ${PERSISTENT_LOG_DIR} ]; then
+		ln -sf ${PERSISTENT_LOG_DIR} ${D}/${localstatedir}/log
+	fi
+
 	ln -snf ../run ${D}${localstatedir}/run
 	ln -snf ../run/lock ${D}${localstatedir}/lock
 
-- 
2.7.4


