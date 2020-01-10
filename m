Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 682367FD08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 20so2692788wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CoSFPggsw8pC4uSlxxqY1Dv9jSMmAM7Xal1CNxFZ8jg=;
	b=nHtbT3eWb6jPgm+J8MwflkSHjxO824/lXG9+ufRsh6IZi0KzLXwE9cIxHsNMpy2BhC
	s9u0BOofjjygjT5F1dFlSE3sIxi8rG94OF3fSf3rmGD3v1ADQyVBP6sopui6tHzT04EM
	URmWD/dCWGKb9DQh4nPifquhFDKRa+aENl7ofPmZX/4JQHDLW5CUrZJqLMXahqXAJGFw
	QmdlGKWvxSir2nn4tAw0cz+hw9sp05OznA5kY5jyn7y39Y87gc1AQi0m9nEL7IX1SrTr
	eq4G1JCk/FFx4EeP91oku5x9ZGo9Lr1vDdgE+fktehYD9uUeegjxTOao25Y6oyQKgKzV
	D+EQ==
X-Gm-Message-State: APjAAAUOTtDxF7FAYFAVYbvOMqYS5jru9hfVZcFjMVRyusTqwtjOmHQN
	bpN1J5PFXiLYaK0U36STAgRcOIKH
X-Google-Smtp-Source: APXvYqw07s7pNNMDLaSfjx+bU11y8wjyf74JsHW/qikxtXBK+ysOGFaaGi7NdmOyUPKXuFTmCd3TVg==
X-Received: by 2002:a1c:b603:: with SMTP id g3mr5202559wmf.133.1578675190023; 
	Fri, 10 Jan 2020 08:53:10 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:47 +0000
Message-Id: <20200110165302.27426-2-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 01/16] site: linux has working chown()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I.e. a chown() that works when given -1 as uid / gid

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 71ec961b15..59fb9e36a6 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -47,6 +47,7 @@ hw_cv_func_snprintf_c99=${hw_cv_func_snprintf_c99=yes}
 hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
 
 # coreutils
+ac_cv_func_chown_works=${ac_cv_func_chown_works=yes}
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
 gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
 
-- 
2.23.0.rc1


