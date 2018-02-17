Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1E56771B2A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 15:44:21 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id m19so4270398pgn.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Feb 2018 07:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PWT9NzNMeWbCGNaRRQDw63Ss9rVWdHWGwq3Cr69p+pE=;
	b=vVGi4xZ3whzFr/MmgFKfmH/SANhQFeSJjycDNEl0aU08ch5j422yFlPS/ohauHHd4e
	MjfqzVXfLAjaUqEaqsFnmwZ504uw6JlBKNaH8k/MoNX9gaDrjbECTl+KTbb+2m5KLij/
	0zcX9VMNa1uWrXy7sb7vcYgaciiytDAxzKeAtD5R+grwNII5f+EcvPjmJdGAma1/vcRR
	FRQ17F4IkZ5nPuvLkxQv6h/2zlZ2xRtcFiLcmlf7DZmO0gbRvfbYnBKhzXXCOD0b0dqG
	eM8Py2qGQml/4c8F5yUl6nlPD+WYk19OT0PLu485TQHVQZx28oKyH7p3zcNM5C1joFlC
	K8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PWT9NzNMeWbCGNaRRQDw63Ss9rVWdHWGwq3Cr69p+pE=;
	b=JcDlwpLA85ZYNNwEZApoodKztOoaVLMLCNa5UExVCG7WcQ3cqaS6dQRNWwX37CzjkY
	SLXflfENVcsHrpzDh4+9jBGtXvfJYk32dHEdFNTjwjCcKLk4f4jy5NiltXWslVMbCWZJ
	hYGbNyzYin+c0sSwV9iOzin7KUZzF2i2FlpkdELK1ZlwPzJRsLsG881onYjP5rPj9/gv
	vzJSULud+rpm0H134A5NuzWk0geYc/l2IYrxJ1PiwZXypuqnc3ifjuMslJVavO391wYP
	upUnMgmb96kaeTwrO4s9bgcn6HEn/e/A0dbPij9taKX788hUvLXyY0oCkubvvH1N61aZ
	XIcw==
X-Gm-Message-State: APf1xPAKl7QYUFT+dN4trheHuHx8X/33ObbCaZj+AViMqnmE1Guqnww+
	ki7c/gzB96CvRRHUfnLtdNtxCw==
X-Google-Smtp-Source: AH8x2274xYu8ElUlf9bMPabQGLoCBRxB+79c9Pi6XZgUiglnNv1Ffa29KwtX53YmSi1INz0BvmaL5Q==
X-Received: by 10.99.116.18 with SMTP id p18mr7886852pgc.77.1518882263555;
	Sat, 17 Feb 2018 07:44:23 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:1886:ab70:59d6:9e86])
	by smtp.gmail.com with ESMTPSA id
	x124sm46728635pfx.105.2018.02.17.07.44.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Feb 2018 07:44:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Feb 2018 07:44:20 -0800
Message-Id: <1518882260-2644-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518882260-2644-1-git-send-email-akuster808@gmail.com>
References: <1518882260-2644-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/2] siteinfo: add aarch64_illp32 decode
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
X-List-Received-Date: Sat, 17 Feb 2018 15:44:23 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/kernel-arch.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index e0fe22b..09793fc 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -25,6 +25,8 @@ def map_kernel_arch(a, d):
     elif re.match('armeb$', a):                 return 'arm'
     elif re.match('aarch64$', a):               return 'arm64'
     elif re.match('aarch64_be$', a):            return 'arm64'
+    elif re.match('aarch64_ilp32$', a):         return 'arm64'
+    elif re.match('aarch64_be_ilp32$', a):      return 'arm64'
     elif re.match('mips(isa|)(32|64|)(r6|)(el|)$', a):      return 'mips'
     elif re.match('riscv(32|64|)(eb|)$', a):    return 'riscv'
     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
-- 
2.7.4


