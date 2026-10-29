Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7327.1793264083625417481
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=idkd4Anl;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-14fc585291cso1671360c88.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793264083; x=1793868883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1GOhBli/o2/nywFk3WomL9Ige+UDDLQ8cGZt6vkOYM=;
        b=idkd4AnlcEbCrYX5h08Eaoc8e0p4NyCkEi/UHJ2eP42WqXuvx8cezePHbv6l/aUnrv
         KrVy4CROCHjr1AZOlLQV9zLPPCDooOpn8MUhYPjoAZ1Glv74ek2AJC/LXb01Gkidtiik
         /v/PwQOJx0kaXt41RCfsT13A0PThtn7skfc2WKCq8bnU+834uc1aAjPJ36N+4qQrDwdl
         k8c5Q/W/77kqV4c8+I9udM5zc3GthHcpqBW3llxv8oZkuz1NlrEDLLrVew+cOLTrc8Ew
         WnFFDV6+vSI3tfYp7s4duMRffwFx5DmaROVnqWXeCBN5g1fkg2klw5LFlTprB1tmdAl5
         pLDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264083; x=1793868883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1GOhBli/o2/nywFk3WomL9Ige+UDDLQ8cGZt6vkOYM=;
        b=Us9HBuVoqW+krERHjvS7NDCIXwmx4KiH+BvIfSUJTD6a0b1cDC/1BeozRrXPlQ8fd5
         3CVOzyzFs3PfVg4YVOvKfOsdbalqCeY6kf5M4PATHKKe+1rStBguNOLtn1cpQTbJtYqr
         33t+aDZ9Nv2JJpnjQkigm/euIte2oH1Soo3/eRb8o8OXLkGH+mVwVLZdwQCDNj96UysX
         e92EIr23wuyAcRTC2d7nYGqoM7Y04gA9JK1qY/TBd2yyBpBjXISNWlyeerM6Tn3QiCUX
         WWVFCj/d4vEoi0PZw92bJKMTWQtLaN9tfSbSh8IIsopOyGTYagx17PpYz54Ehnc9OO8Q
         weuA==
X-Gm-Message-State: AFq9FYLSzDYk88jARBf1k14tubA1gB5ddBp5G3y2jepiADhzZTNporTj
	gUVf1xhDzOv5OmfidUFS1tD4cDKu/KcrWJv1P5Y4YAPsybLHQiHT/PWir3fgPw==
X-Gm-Gg: AYBFou2YdfzzUeLpBqj+1DsKzcAtInayrfRLpBleBZMga9Iyfp5fkEUEvAoXlpkv+g6
	JxPJsdPGyJw1p7Ky6Rfa10HAfKlLt29Vfcx9PJaqnwAvyga2ebfJrqpFLACusi1BhhRHPKZ4VMW
	cLpCt8JPkymNMlt5fZUuaLwFXTUyQo9WCL//Z2GSugQ/wb+3ZgLlgGydxu7l756MbgwpuzSey0u
	RhWE2IlE7sS6NqXzxsT/pg1aMEoCQfyhDDgDtdMW+JU9Ag9re66QTIFpmwVwrl/ZKKdYRf1QXwA
	Wi82gSiWxio49ffLeAKjThiYilgsnLMOjROYf5zsIPadJBtlHtBpZbgF48XpsHcfYbmFytvZd4B
	RIRfidqCCVKMyOpS9uETjwJFfmaqElqlS2cHN/P0JFbbyh4zmhBBH9w2ikMxhDbXgXw0GjpRiea
	l9r6CrFU+WnQeYOb7AsxqTDggES5ssYjKS07PlNMMXpfw5FgsSM7lXk/p2HzuPxANWd43Ha29kW
	FDRzU7sOfEofHoKPQSdYeGfHrclxGOgtUBnSnVFrNeRk5J64+cg3NyAO+FBiBpsSirfRl/LtORw
	jE4wWlJrNJBighlbh/cWv6LyFne1Eog7cUd8uOjPiBs2LSeh61cIyRZ2vB9k/YFuZJ0j2WDoHx0
	7zwMQ2sA=
X-Received: by 2002:a05:7022:1003:b0:151:8280:2c1a with SMTP id a92af1059eb24-1a6cfcedf27mr7459161c88.42.1793264082724;
        Thu, 29 Oct 2026 01:54:42 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75c81490csm15056178c88.8.2026.10.29.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 4/4] cracklib: upgrade 2.10.3 -> 2.10.4
Date: Thu, 29 Oct 2026 21:54:30 +1300
Message-ID: <20261029085430.3491140-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
References: <20261029085430.3491140-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 08:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248917
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/cracklib/cracklib/releases/tag/v2.10.4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cracklib/{cracklib_2.10.3.bb => cracklib_2.10.4.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cracklib/{cracklib_2.10.3.bb => cracklib_2.10.4.bb} (94%)

diff --git a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb b/meta/recipes-extended/cracklib/cracklib_2.10.4.bb
similarity index 94%
rename from meta/recipes-extended/cracklib/cracklib_2.10.3.bb
rename to meta/recipes-extended/cracklib/cracklib_2.10.4.bb
index 48dd72d5f9..81338f5cfe 100644
--- a/meta/recipes-extended/cracklib/cracklib_2.10.3.bb
+++ b/meta/recipes-extended/cracklib/cracklib_2.10.4.bb
@@ -12,7 +12,7 @@ EXTRA_OECONF = "--without-python --libdir=${base_libdir}"
 SRC_URI = "git://github.com/cracklib/cracklib;protocol=https;branch=main;tag=v${PV} \
            "
 
-SRCREV = "e73d5db1789d198b5f9ec44b68b9c775c3e6c042"
+SRCREV = "3b38d097102e34b50b5a1c2a8ddd1541172de85a"
 S = "${UNPACKDIR}/${BP}/src"
 
 inherit autotools gettext
