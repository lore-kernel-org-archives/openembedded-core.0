Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FE117FFBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id j42so2435151wrj.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DxVFyPuBPDgzw9StjzfqHYYGQGyqLJYM5QXcoPqEA6c=;
	b=Da7m0Ghq+m3h9AjqU83LLxIm/b2qHI68pAbC4g65sXAOA3k5vZdv0TBXUkKFkmem9V
	b83bdT6kY7B4xKReuYRXYSVCE3ECHCHmxp+Y5FdIy4/wAXaOH5DILT+HaoC4vsS0ESTC
	1UmyTPk+QtZmYXyRuvHMEehwcqzuxzIHVzlv61j4vCe1W8lDSnE8XY7ctl9YnKFLN+ad
	biWYMg4Ocw9lFWseLqUEDl5kneCd68N75/HtiD5Raijlg5sNmTJkGGU6F33XkFYCQeR3
	tH+3ZRDnD7omSOcAcF+NJ4ef9uoVU5lQkpdP1g8m/8iZYudCsH9AFWPLGijAwXhyYveF
	IJEQ==
X-Gm-Message-State: APjAAAU3dF+EDcbrEK7Utz7Hx9jm1XvkkxAe1vaCIlg+4ij8Yx6/xTTE
	IaUYqAVigXd6urpjbNyYMOe4Rogp
X-Google-Smtp-Source: APXvYqwwzayudzeI7Pq/DD8h9/KhPTrlR3bHnn3BKLpGSKGLuW81SHzMq/ry+xZWoHj5Xr893WiQcA==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
	l9mr4731171wrx.304.1578675199786; 
	Fri, 10 Jan 2020 08:53:19 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:19 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:56 +0000
Message-Id: <20200110165302.27426-11-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 10/16] site: linux supports NULL in utime()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

to set the file to the current time

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-linux | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index fcabdbd54a..2ef5238799 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -48,6 +48,7 @@ hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
 
 # coreutils
 ac_cv_func_chown_works=${ac_cv_func_chown_works=yes}
+ac_cv_func_utime_null=${ac_cv_func_utime_null=yes}
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
 gl_cv_func_unlink_busy_text=${gl_cv_func_unlink_busy_text=yes}
 gl_cv_have_proc_uptime=${gl_cv_have_proc_uptime=yes}
-- 
2.23.0.rc1


