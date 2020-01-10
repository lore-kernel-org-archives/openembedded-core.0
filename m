Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF797FFA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:24 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p17so2707522wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qaknlkFBTk7DvEIrqh3yf4TIwzzVv1v8VW8K8zWW+tI=;
	b=TmFA//xKsqofpun5NcaamAI/yhrTGImGCZvcY14yDX2Aqzy1Ym+E+hI7b6bGeAnHUY
	3e/FEDxKQXna/PsbeDkgsjJ1bp+xo8GbAoBs456bKjUsS/txRN3Rjdiocl8oBCxX9b+z
	PxKqyeii0pBmKPu10X+UFu3c9GwysV/MfDeleb8X7oLjejqlHDt23sbGRj+AzuDIGrc9
	ySENlRBB7Wh8YpfE+vA45o/SgsRF6f+CJ6w2vO8xNLO2oWyIEe93OykN50L521uVF7qW
	SO1uRoKTfqyQZJ2HIA88ejBC6OOiBmBmxCXvJt04lv47hjBaF6ar7nYBYeaRjQ4caO25
	FCqg==
X-Gm-Message-State: APjAAAXUF5Vwr88nqhdEahkGqvXpcCeQPhTXnHjHf5qk8B3ZjmunUoER
	ZYzi3ae4xF7THXGHO9S/MCr2aFei
X-Google-Smtp-Source: APXvYqwTSnkFTHBdnXPoG0KqFIFTU70/y+yk7o3tlzaHRaxuEFxd4T8lTpkDRgfloxl5Ui1S1y6Ouw==
X-Received: by 2002:a1c:730d:: with SMTP id d13mr5270564wmb.126.1578675204684; 
	Fri, 10 Jan 2020 08:53:24 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:23 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:59 +0000
Message-Id: <20200110165302.27426-14-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 13/16] site: on linux, link(2) doesn't follow symlinks
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

(but gnulib / coreutils assumes yes when cross-compiling)

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 720a1204a5..1c1fdafbb0 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -50,6 +50,7 @@ hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
 ac_cv_func_chown_works=${ac_cv_func_chown_works=yes}
 ac_cv_func_utime_null=${ac_cv_func_utime_null=yes}
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
+gl_cv_func_link_follows_symlink=${gl_cv_func_link_follows_symlink=no}
 gl_cv_func_unlink_busy_text=${gl_cv_func_unlink_busy_text=yes}
 gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
 gl_cv_pipes_are_fifos=${gl_cv_pipes_are_fifos='yes (1)'}
-- 
2.23.0.rc1


