Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2D61660557
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:26:49 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d22so8622859pls.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XBJ+v7ivKQpjMB+t3O445i7yI1Rb4XvcW8pUE49clBc=;
	b=seu5gdYiAK/6D0ZmrhvwMVFKGcL1r5hSuPpjWul42vCGTgGev37V/XPnwlvcmzlihb
	1TWJj3AQ4Yz/yPUdYy7ZyYJpQlzyJUqr9wHCVc+6IsO8OjUWi0skYPSS0SNFvx6EDPCf
	urz5EshP72AeWo0945EPmQ7YQep4d0fHrr7TiuwHsrxTJBw3XJ7Y/uP1n/zbM9PZXxmA
	qAi7uG9VQx5IK/3yTKP7+tmIwaqmzLCwvEI/IM1bZrHoak+/5al58NKjnu2E9TdVMw41
	Obewi0xLJ0gDQRPOT87QG0gbcZmEAibnuvGtDMCjp2lNVIDXfeThMPM3bHm7YuUvtDtj
	Hc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XBJ+v7ivKQpjMB+t3O445i7yI1Rb4XvcW8pUE49clBc=;
	b=mmPNt2/EI+o2YaHYrQ6oRfYcLfrvRJHSA2t/M1YXJhJrKze6ctdFS19Fi6dt97VG66
	RkGy9hgdAa/16wKZNNg5LWEW7U5eK+KQBbc39849s9IbIVUBNeHAPCTb7/e+t7pf+K8i
	jfoxe7Bfhk1v/6wDoc6QsEZ1+h3OGTOC5L1HrgTanWTxYu3BlxsqKKpGnZfUbjm2oKwm
	hUxGdKaxl64+0ArHKXe1xYVgAKm42p5Hf+XjVc2K52T9IO7piCubkk7c5wqzM7H5VFOw
	C5sanKbW6TCsAz2F9345c1Jc9dzya5B5knj3dEqOzg3fMNtspZAH8mrGrTd7Z8PaMS5J
	gRRA==
X-Gm-Message-State: APjAAAWQFWxiXJiJsSlP7Uv2ovob0P07DcKEiKTbi+reDYtrOznREobP
	aw8xkZl8MWrAaYbobUxIKuWb9yogs0U=
X-Google-Smtp-Source: APXvYqwf1uujDnygRS4vIWBLa4azEw+lHH7YIY+MfMvcsVouh5ihi23nXWn9N78FVJzcUYyZFIaoKA==
X-Received: by 2002:a17:902:a70f:: with SMTP id
	w15mr36434661plq.132.1570548410099; 
	Tue, 08 Oct 2019 08:26:50 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	x18sm18420763pge.76.2019.10.08.08.26.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:26:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:26:33 -0700
Message-Id: <c54411d0e03fe1cea8b6bb0c80dea029dd264f36.1570548180.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570548180.git.akuster808@gmail.com>
References: <cover.1570548180.git.akuster808@gmail.com>
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
X-List-Received-Date: Tue, 08 Oct 2019 15:26:49 -0000

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


