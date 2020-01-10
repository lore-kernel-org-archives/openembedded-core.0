Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id BA1A57FFA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id y17so2476558wrh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PH0HF0IxvLCXDALbnSPuluTL+T6haPUQjb/kT1dPHOs=;
	b=Ireo3Dk0CaC5Ab+OVbyvEpBhvAMUmZp0frdyIwIH96sOpanB7N/EMqBAgtlcZZ0HWN
	/EqXHVgTmx7u9p8RnKQvVWiHhp3gkh2dYkEMjWrKB9EHeSWE2ao8zrwB+gLSJ4jaGOyE
	FbGdKV6g1JGvRTF2Hift38Eqah9HEhAKNZczeQU8L+v192pC1dAgk/i3ExypcMuw7ube
	EUTtjAXrrLI2RLBaieHZXJ4pw+zPfXXU97LCp2EEJhPSOLsh8l0tcnqpLjqW9nNGNvMl
	CF/ULLe5qthwYOoFMiybw1xLmbLl1sv+1g9BnzZ/s0RA4S3Kydxw7aal4eTI1bfvdZ74
	flXA==
X-Gm-Message-State: APjAAAVtq1ThEV9K0+RdgraKemYThmPqc/HsrbmW64qgOw8hkHmgaaBj
	chJE5XtcsMM0ETxwbW+S0DB1EfUk
X-Google-Smtp-Source: APXvYqyxnvZ0/OyrtwZ/mGG5LNHOYeDpwJpf4Lw/CLzwxSnFzQh29KFM0uKpDIQ1PICv1LPM6/5t2A==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr4500836wro.310.1578675203083; 
	Fri, 10 Jan 2020 08:53:23 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:21 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:58 +0000
Message-Id: <20200110165302.27426-13-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 12/16] site: on linux, pipes are fifos with max link count of 1
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 2ef5238799..720a1204a5 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -52,6 +52,7 @@ ac_cv_func_utime_null=${ac_cv_func_utime_null=yes}
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
 gl_cv_func_unlink_busy_text=${gl_cv_func_unlink_busy_text=yes}
 gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
+gl_cv_pipes_are_fifos=${gl_cv_pipes_are_fifos='yes (1)'}
 
 # mysql
 ac_cv_sys_restartable_syscalls=${ac_cv_sys_restartable_syscalls=yes}
-- 
2.23.0.rc1


