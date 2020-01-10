Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7897A7FD08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:13 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w15so2488922wru.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MWE/2cYJowFqsEAp7gYNc4Z9NGPZfh2ZQ0ZK7wFD/QE=;
	b=KoYleQ3oCaTTVbLMrR72vYPuyhX4yoQ6a6s0Nrg5m6zleDPRxtuTlsrVHgGAx8VjH/
	l8fAqPQ5GNvtOWw167VJIfzvznyFlb93KBErDWaAKrz/XwFFICyMOtfEiwFm6KqXdpFL
	xTMczlvqusiYcoFrk8gVKcYlvFR9L/V60KUcWxXN+Ts4VioE9hpwm2OpKC0ybbZAka+n
	n6jRlJbKI0n18A0pp/FGniiQkSKL9lbOtfP2owhwfbM0ylHszhITRGb+4yJqV2v7siCI
	Ykky7uk8Bjf8B0LUo0rhm7bnV4LECXxRHr52eAveq2ZrhCbVaHleeHNOYUrqDag3Iz1F
	SiDw==
X-Gm-Message-State: APjAAAV7tZQvoQlWAaOuIW7+nJUzG3Q/sYNSLoJedouW0qngSE7GJVHI
	1iBmWIIvYY+Lzjgmip5XTMNvEMa6
X-Google-Smtp-Source: APXvYqw5QCVzauDyhYfx5hVWpH7ZfYZzRFokura5if4xAG6HiesNWD61HN8UYoz7REqxJbGOk6xTlA==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr4495103wrr.98.1578675193998; 
	Fri, 10 Jan 2020 08:53:13 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:51 +0000
Message-Id: <20200110165302.27426-6-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 05/16] site: linux supports unlink() of executing program
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I.e. shared text that is being executed.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 59fb9e36a6..fcabdbd54a 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -49,6 +49,7 @@ hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
 # coreutils
 ac_cv_func_chown_works=${ac_cv_func_chown_works=yes}
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
+gl_cv_func_unlink_busy_text=${gl_cv_func_unlink_busy_text=yes}
 gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
 
 # mysql
-- 
2.23.0.rc1


