Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 901FA7FBDD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:58 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id e3so8821003plt.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9fzWaOkpA4TcpU1MxVoXoPayEbWJOifJnOOTgYCGzFU=;
	b=e+01XGsK39PJ1cXPml8Hew5NBRrM8JHNGOwC8SulF9nnSLsj7qsFgUhOSXv/mKCMwM
	lvwZ70XvoIX2XD3Ckzewv01MhEs4rVECy3X0nR5UzpyMpyAXH2fgeTkdvWUA7QF8BjOu
	dF6EVLVmCjQuz/nnY90tx6LN3e6lmsL8R0+qZGns9VUD7ATNfrHriIDOfwN3sW/O+vqH
	qGisnxtHL69LcyYBE4+fdvHOu1LxknJfzxYrW29FoWeY8xprAO0SRlDL+kxwjOP1Uwyx
	vnlW+GDXEw6R1J8NkOWZc4DHnTFY3GYZ8ouI3H9c3pFFdPmaOyJy8kvb2Q/jgvjy4pd4
	TzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9fzWaOkpA4TcpU1MxVoXoPayEbWJOifJnOOTgYCGzFU=;
	b=g7l8uzY7oGiArQqG5KPcAtDJr/G+SN+No3YWhKKL7euvLk1a10xNGfDUx7cqT7pco6
	9ereJjjH/jS4JHP+nDSP+HmvnUm70+HTRaV5osT0qWdTw/bbXiz0ryt3tgoSZAztkwkb
	tms28/6pwi7FiTPUymupqf8pK3LlexTelNjc9KhuoilO6IW7N0lZ1yOK0zCrAnPBMpVZ
	6uwOR4Sh3TTlx7IXr1N5FA28wsYHbL1H5yoeO+t25+di5vCR65gudFZqX1lesGnJ8uPJ
	2GPSpPPxkll3wjvhVj2/LePG9/Q+8YrAPrfJkvCGHH7VGXr+7r2f2cNsuqB8+Kraq9yw
	O5Yg==
X-Gm-Message-State: APjAAAXmV+A3RV7+gToFx+kNp79VqmOjMW++A9U00Ghy4/OL+34QP0PI
	8ll3lDUoM05W3/bcvkGvKGWPrsyk
X-Google-Smtp-Source: APXvYqxswHjjW26VbrA5FVF74nvo6T8xxv8bjEI1zZrsMl+gQKar8qyMtntEcKvUGVucIpTtlXij9A==
X-Received: by 2002:a17:902:9a47:: with SMTP id
	x7mr20645506plv.84.1573533239470; 
	Mon, 11 Nov 2019 20:33:59 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:39 -0800
Message-Id: <0e476c92f0bb3e347e38ed2afe1ebbe6f5d1758a.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 20/20] OEQA: remove crosstab test from manual
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:59 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/manual/oe-core.json | 42 ---------------------------------------
 1 file changed, 42 deletions(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index 6191d4f..fb47c5e 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -1,48 +1,6 @@
 [
   {
     "test": {
-      "@alias": "oe-core.scripts.Crosstap_script_check",
-      "author": [
-        {
-          "email": "alexandru.c.georgescu@intel.com",
-          "name": "alexandru.c.georgescu@intel.com"
-        }
-      ],
-      "execution": {
-        "1": {
-          "action": "Create the trace_open.stp script as follows in the host machine:  \n\n\nprobe syscall.open     \n\n{  \n\n\n        printf (\"%s(%d) open (%s)\\n\", execname(), pid(), argstr)  \n\n}  \n\n\n\nif the above failed, then create the below instead.  \n\nprobe syscall.open \n{ \n  printf (\"%s(%d) open\\n\", execname(), pid()) \n\n}  \n \n",
-          "expected_results": ""
-        },
-        "2": {
-          "action": "Add 'tools-profile' and 'ssh-server-openssh' to EXTRA_IMAGE_FEATURES in local.conf \n\n\n",
-          "expected_results": ""
-        },
-        "3": {
-          "action": "Build a core-image-minimal image, build systemtap-native. Start the image under qemu. \n\n",
-          "expected_results": ""
-        },
-        "4": {
-          "action": "Make sure that the ssh service is started on the Qemu machine. \n\n",
-          "expected_results": ""
-        },
-        "5": {
-          "action": "From the host machine poky build_dir, run \"crosstap root@192.168.7.2 trace_open.stp\".",
-          "expected_results": ""
-        },
-        "6": {
-          "action": "In QEMU, try to open some applications, such as open a terminal, input some command,  \n\n",
-          "expected_results": ""
-        },
-        "7": {
-          "action": "Check the host machine, \"crosstap\" has related output. \n\n\n\nNOTE:  Do not build the kernel from shared state(sstate-cache) for this to work.",
-          "expected_results": "The script should successfully connect to the qemu machine and there \nshould be presented a list of services(pid, process name) which run on \nthe qemu machine. "
-        }
-      },
-      "summary": "Crosstap_script_check"
-    }
-  },
-  {
-    "test": {
       "@alias": "oe-core.bitbake.Test_bitbake_menuconfig",
       "author": [
         {
-- 
2.7.4


