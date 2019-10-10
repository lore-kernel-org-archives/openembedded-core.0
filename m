Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF747E31D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:28 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id i76so3948142pgc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XBJ+v7ivKQpjMB+t3O445i7yI1Rb4XvcW8pUE49clBc=;
	b=jc6WBxxIGA35Vom5LZG+tx5zc1QzGGvl4aL/dut3nQhFX/aXZFQPq9RMNwDKqHQPEx
	91+tmSVqBriSTUSCCwyD522+qdlhsERmk2Jo44jZvs1BAvgWd+JIQHvhiomGbFlKDmvH
	h3AiA3q82pp8yudqBViY3HSrwfzg2TZXnhlO6hcYe1nYUF4+pLIn8T8ItHNvspv0L8PX
	bP7KvrhPhqlH6u4Vfx9iMb2neUGtDftcWqWtyalunx3dgIX8nTYSMfb32FZDqhwkTY24
	NqHTUP2gE+VnQ+UpEZt2+lof0sZp6ZsxTueZJadiR4zXoeDCWBluNMRPOfUq79p+dev6
	ejgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XBJ+v7ivKQpjMB+t3O445i7yI1Rb4XvcW8pUE49clBc=;
	b=D65CdYlBLyWd/Bujm0DVqH7bfaKVYxClQiE0ktQ/+pTjIs2T0l/pDLjhdViHzTyCAa
	UitTzfpLBcLdnHozb3JqSem6y9m1LKO+R8PSVv7zQZjEFja/sBpHoL9F+P0IDHlpZPsA
	tD5izlsyvDEze8FlwXfViVwAmKRyv2XXRbxgudpyG7TMDA6uaLusFbo6vFnIfqix82fe
	Lq3CDeXApMH49GSFyO3u9/jQ8U5opNN6gtTClF6jTbB9co9icAqI3WM1W7m068TQTiK3
	RAQeD+pc4uiPUdCvVRB/6Uc9wP9azk4VuqkHbnlM1f0Jezq25EKTvtoWfONvcR22DzvU
	w7eg==
X-Gm-Message-State: APjAAAXEFbdTuIuIMfxGzdcGdUYNFjrFP4chb1jsswE7nHp5A9whQ8wS
	R+aHNfD6LW4Rl3lAbA8yqAlOTneM
X-Google-Smtp-Source: APXvYqwA1y1ugB5PChPthipHCHp1EW8qJhsCodCB7FMowxTxN9+GMxOkiKQoyPBXOQlAQ3lz0ndGDw==
X-Received: by 2002:a65:6158:: with SMTP id o24mr11724568pgv.133.1570722569902;
	Thu, 10 Oct 2019 08:49:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:13 -0700
Message-Id: <c54411d0e03fe1cea8b6bb0c80dea029dd264f36.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
Subject: [thud 01/12] oeqa/selftest/context: ensure log directory exists
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:29 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Ensure log directory exists to avoid the following error.

  FileNotFoundError: [Errno 2] No such file or directory: '/.../build-selftest/tmp/log/oe-selftest-results-20181207043431.log'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/context.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index c521290..c56e53d 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -108,6 +108,7 @@ class OESelftestTestContextExecutor(OETestContextExecutor):
         logdir = os.environ.get("BUILDDIR")
         if 'LOG_DIR' in bbvars:
             logdir = bbvars['LOG_DIR']
+        bb.utils.mkdirhier(logdir)
         args.output_log = logdir + '/%s-results-%s.log' % (self.name, args.test_start_time)
 
         super(OESelftestTestContextExecutor, self)._process_args(logger, args)
-- 
2.7.4


