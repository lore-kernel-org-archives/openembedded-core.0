Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15288.1794495874824472370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 07:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bf8ONWLe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so2672824f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 07:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794495873; x=1795100673; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=og6cP0uwcIlSbeoWXLbTFazm3I8GigN3F0IY2j+0+J0=;
        b=Bf8ONWLeyiVcFqFihX83DYK3Kb0MTadhU2ersBhMZsDFmS+92vcNxpWuofxs2iEuWZ
         hZSFEBL6K7G3LUZM+eVP3IlkhAmdnn3hYlWoscTCkUuSKH2W/SWOqlYzsuMcix56eXqv
         svzUp0Wpv1tV5+g3B/bEDEH/kzV01rKdJ+xQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794495873; x=1795100673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=og6cP0uwcIlSbeoWXLbTFazm3I8GigN3F0IY2j+0+J0=;
        b=NFBUYd7FlUkDzu1F42hc/RE9APfM/Gw7lJt1xsgELxiwklOnt1auoHWuTJrKagCsvc
         w5JvZ0fm1Upbic3JddzxPezrDveR5+WqPblvuNsuillwbcyrkjhS9q+kLbjpDIVbKFHA
         QJ1IP8wyRrztfCPMI6JiyxFMEwuCmAcD5A0REp541bvFlgGMXG1mebDkdl03lsS059JJ
         7dq0cr6oXjoJ2yVnXrJibDCa1Ys43/fT12dOQMFqgDTYbQq9jsTIXHmo+E92Cv9Xy27S
         eEFE84aAqEDmuMa7Fz3hGB7N33yE0x2/jbmYQWdCfTft3RDaG9SQKMX6KYo6jhqZQMle
         rLzg==
X-Gm-Message-State: APuU4Z/sAM94xG1Y51eDWO7Hggr9rCbpsZtYkPn+pNKpVOiFpAGYyBXm
	h6Nn+rl3k0NSTLrZWT6NeFos5MBB8ZFVO/dI8kkrJZiwSwVXXD/bgq8qIygUFc1QafAZgB4T9F0
	W55aMPUQ=
X-Gm-Gg: AYBFou3MoYZ3uI/yh88T5v9zJ679cAmCxGfJRL110Sww9VpK4MeXjBEEnjAyrM7icbp
	Rb0QCnZxoJDond+N45pqdyZoOUEDHL+0+EJ7PDPmLjA9KRKshr0eAyCN977wSzBIyLHtzOc9waa
	aqBt3VKaPMAH9CxsXSgj5HQcnSttXbRDj9oCWJN9LiQZz6vQltG/wGd+XFfJsJZiZV2Jy+VAvdS
	ZBWcICa/UWBZ2evwN146uiJ47uJOc0EYYoGu75o6IUUgo+5po7lPyz9rUTLBMkxeNwLJuE+Pppp
	fexeYB3mkOs9reYCjvMQh/VWY7u8AhqU0qhIDxWH0taxgYi3o6I6Atj7IUPRdNpP5y9+9jz//vU
	i/uSLp/26fksXgnVOC5rZHAqQ/lNfNRINSEYlJI9KcK05rpajNLUXIMJJqyU6RNN7mwig4Vv5XJ
	CizrXkDd1KaJvX+eQlF/NfcP73NwV7xXmLCqVLdwrssSX9fKa7qFOctp28/ngAjX5flkt95CjaL
	jp6yGBn2eQ0oqulcVaKiYPO/mNB4xV+bpYdERG9M8OsE78eKWRpsPJPAouqriRvTiv9TJsH78JC
	yYBq4nNRn841d4z9X5Aygo5cV81Dooo1+uHPjW2BLjf2XHKj6Cfc35rHsQ==
X-Received: by 2002:a5d:5f84:0:b0:48e:75a1:1e38 with SMTP id ffacd0b85a97d-499c8d5dfb2mr11755008f8f.56.1794495872692;
        Thu, 12 Nov 2026 07:04:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1562:9f61:e354:1b51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983284c9b1sm15744853f8f.6.2026.11.12.07.04.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 07:04:30 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] reproducible: Add include_all
Date: Thu, 12 Nov 2026 15:04:27 +0000
Message-ID: <20261112150427.3396468-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261112150427.3396468-1-richard.purdie@linuxfoundation.org>
References: <20261112150427.3396468-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 15:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250104
Content-Type: text/plain; charset="utf-8"

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 1a71b9832e3..28236a28d52 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -240,6 +240,7 @@ class ReproducibleTests(OESelftestTestCase):
             TMPDIR = "{tmpdir}"
             LICENSE_FLAGS_ACCEPTED = "commercial"
             DISTRO_FEATURES:append = ' pam'
+            include_all conf/distro/include/test_reproducible_vars.inc
             USERADDEXTENSION = "useradd-staticids"
             USERADD_ERROR_DYNAMIC = "skip"
             USERADD_UID_TABLES += "files/static-passwd"
