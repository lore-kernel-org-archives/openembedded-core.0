Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1106E78A02
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:01:31 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h10-v6so5518970wre.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=S/3MaBPp0coWRBRu9fSKeg4CC0TDJL+HTrlC3p1OnVM=;
	b=X25YLl78vqGnXlUulBiGQZPDDVA/E3X16mm+wOTo9NIqrKHDCvUAf4pVbS5QWqmxPg
	QyU3Rn7of/US45R8k3sVN0BdFKuSc6Ta7pruFqnl7ez4inG7/aelxH9ymYcxMdbgVJYT
	Btf4PwzlwOHUA9+lTO6FTld6sBr4eKro4nE9ocMQy3rn13/7QRtGsNPzMKc1QuUKnjnJ
	twQNH6ZgyaILhfWY30ryJmkUTHo3HL6n8KdxnQCLJSEHy/mxgWrjsoxL58RWzFaEHeVO
	8omKF+CN6FnujIUP7bZ7+whal2FEp6EtecqBqhm0QjVOyS6+80tqktH0RP+ePRFVThtV
	Jo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=S/3MaBPp0coWRBRu9fSKeg4CC0TDJL+HTrlC3p1OnVM=;
	b=H4rlCC24jbOzdsJ8XrNMhwynZS9V0gtBdCZKdBXW123BL+0tbfO51AFBUVhao+nr0n
	tLfE5OSuzjp4AQ3AlEzkIpY/6D+eoC9cBms/MRFcuIX85YH0ljdIi2mtxSobDjs5EZNI
	+uzCaMMvgXjGij0DqvYOPAofbgYnx5AOPKztZCRjgd2pLRiByYM0H114MJPwYtH+3Yfi
	vEYfDfEWLC0kqgVKw7dN/TWja09HHzN4SPLpGkJicbjYMZ1CzQ5bkLKdzkHAo74z1G/z
	+HRVf2oCfpcmieSnz8L576Xt0p0/h/6cLR9or+EsAuNOMUmHWYhadGChN28Afe31s8Qf
	TRwA==
X-Gm-Message-State: AOUpUlHMM4iCnXSmIRDCaOZYbh4i1yiayB/cZtX1+MV5uBtNJpNhXoY6
	MDvDFDDUhMZZaWw8sBCn7cfVRGS5Lrg=
X-Google-Smtp-Source: AAOMgpfNWmSMY1phF3f/eH4fGASIjLzJQaQ12KSm8iivsruNtaYdv4bnzTrr56penRpfkL8KikmtOg==
X-Received: by 2002:adf:f342:: with SMTP id
	e2-v6mr2653370wrp.161.1533304892493; 
	Fri, 03 Aug 2018 07:01:32 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm7753757wmd.32.2018.08.03.07.01.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Aug 2018 07:01:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Aug 2018 15:01:13 +0100
Message-Id: <20180803140115.25450-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180803140115.25450-1-ross.burton@intel.com>
References: <20180803140115.25450-1-ross.burton@intel.com>
Subject: [PATCH 2/4] toolchain-scripts: put TARGET_ARCH and TARGET_OS into environment
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
X-List-Received-Date: Fri, 03 Aug 2018 14:01:32 -0000

It's useful for the SDK to know exactly what TARGET_ARCH and TARGET_OS are,
specifically for SDK QA.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 63b07c802f4..6d1ba69473a 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -52,6 +52,9 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
 	echo 'export OECORE_BASELIB="${baselib}"' >> $script
+	echo 'export OECORE_TARGET_ARCH="${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_TARGET_OS="${TARGET_OS}"' >>$script
+
 	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
-- 
2.11.0


