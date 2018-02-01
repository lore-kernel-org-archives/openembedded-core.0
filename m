Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F99D78687
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 12:22:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t74so5489585wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Feb 2018 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=99EcbVyAwlcZ2D3tPcrfUWHKlPg0SV8QsNlGfEGasn0=;
	b=rhUSNrfvwSRJI3vFVY+pK6z877d9rLlnWljLnfnekegPHna0QDUrtrGK5c1aVTMF0w
	PnUcA5ilOfCRW/DsJAYKZVaJ9bfO/ECfzgInG6rrUuPOMN3hWb1Dz3EyuJpw6QOmQPqq
	NGzF56TrsskRp6af1UXvrE3nSLSx3UV5/OzZxoT/s7EsK61fHFRI7Dv9Z7n55mV8OeCw
	2lnh5DSd1BfeNrncZM4agLpuNbxRqKZ46QJ3Fhlvaq7CS0I9HiASomQYMMS3sDYh/7sL
	pIy6cwLo0+g4C3P0/T2gBsc4jKt8EX14B8oIi8sYqTVKPv33cLQkwfLNP6U+qda/OydO
	xWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=99EcbVyAwlcZ2D3tPcrfUWHKlPg0SV8QsNlGfEGasn0=;
	b=dJ5hZLBlVfG+ixqvyLa+SIGumEgvQNuunL0q/FDHYXcDJbQbsy6STbN4pHlvVQLrXT
	6vqFdzKhu5s+0UVubtnhMzL5CkR8QCi2u1s97O6jbzltQ7zk6XdRJC5Dc3kOoKlXgo7p
	SHpB2De3I3yKTBwoAaOZq489VNzI2Bl2/d/dQtvJyMQdq8zMGBgbNYIbacTxWHzJ0697
	E5g0vvjfYP5LjrCuOYqTrzCEI+Tgw6iWjNF4lMjWMkZyTnMWtMCb42pxUDDxM6Q7dQFd
	Biy9XJ2xUIDZ7U6pUmEqphlbFl5Qtb32fGpv44P222yAUvTyK4vuSLbxr9IEaQ2mT0X3
	dp5g==
X-Gm-Message-State: AKwxyteorYoy7V2qO9zBvLyKEuVTo7YLb5uZHpz20jCfbxD4fXzsXFVJ
	C0vey/iI9D0n9H7z/nG8yes2kA==
X-Google-Smtp-Source: AH8x2244GBW/Y8Sjt2f7zPQmiE74LoXMK0PtRJTHgnFHBPn+dRQc++p0CSdA/Db2bUQeNc8sa+wz9Q==
X-Received: by 10.28.172.70 with SMTP id v67mr16005563wme.58.1517487740833;
	Thu, 01 Feb 2018 04:22:20 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b72sm2489274wmf.2.2018.02.01.04.22.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 01 Feb 2018 04:22:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 12:22:18 +0000
Message-Id: <20180201122218.4533-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
Subject: [pyro][PATCH] bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 01 Feb 2018 12:22:20 -0000

From: Chen Qi <Qi.Chen@windriver.com>

Add tools required by testimage to HOSTTOOLS only when testimage is
inherited. These tools, as described in the comment, are only required
by the testimage task. So this change should not have negtive effect.
This would also solve build error on hosts which miss some tool such as scp.

Cherry-picked from rocko 8ca61a5464743ff85b6d26886112750d6ddd13e0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2dac3a1481..f3994fc642 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -469,7 +469,7 @@ HOSTTOOLS += " \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "ip ping ps scp ssh stty"
+HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat sudo"
-- 
2.15.1


