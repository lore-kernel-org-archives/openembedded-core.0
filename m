Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6390.1795182833324185139
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=N0OwUyLh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso8332805e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 05:53:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182831; x=1795787631; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c85RqZbOBafUb/rHdfV0pA5S80yvde7LFp49XKEquLY=;
        b=N0OwUyLhm64r9h3HmSHyd5D599BaNSbRzk2iqGMcyRUddJncDB4G6XrKic0WPuNnwJ
         hsr+nf7knd2CW/StkdoCSwrJzKDPT//44k+HIQqa0Xs9tn5fF3N32trx5guWbyzPlBV7
         qeJAOiAm/i6NJ5HSls+zWIKOYujmrr6TIZJtu+4L6Bv7HciTPLChC418aSIFV5KeoNoj
         6V/orPrJNSYnt7mG4e4U9SvOg36/+ntFNfmFyfqoikCsX762yHsnpj0ZL1zJi/n/lenB
         4f8u1rb1vxq+QZnLjNaa6BDcs4THctQCR8O4gcvccv9r89F9yk6SIbpCx3PdBqPqMSGv
         JqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182831; x=1795787631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c85RqZbOBafUb/rHdfV0pA5S80yvde7LFp49XKEquLY=;
        b=FGeHptgWVYumee4sr4qNkpTz7tLlblHd8sv0Merqe74hX3j0vJEnHZCunOtkG4hnWf
         CTz7x0Cq8YnoaxbE4t/Zk3+sdEUSjoxApXM2s8BYLJVqRm+jC3zGxEp7Ihi1dJWfoixt
         32f/THUrUAF5RQnxVWXIfbUPvU6oXVbPwBkeQ1g9iuHYOVSGzptqrfO4jb7oRq6N/uQQ
         Ul6f8Q2Bvj00QoMDJHCbGvcBzh3+sp6ab9sfam4hTsimIfx+VYKOW8ErSfVOh8atRPVt
         uOSL7uh2iZOWewIx3o29uPW5VbJqGltg/Zpd3tOc7v75vx3unNDnuSZtfGURiEiyiHoz
         acHA==
X-Gm-Message-State: APuU4Z94yD/GrmK/pQBn3/tEUPJhI3kBW25hfPSQfl4EpFydVlwYiFqc
	VJB0eDZvCYUcMBFO5Hw5JCLvCz/7tpllckm+w4abwNHxHGNa7dtFBTqgK8CaINPx
X-Gm-Gg: AYBFou1cfxfKX+xHSwZ4EAhcp1So3AAHR6RsNMr6hJw7mvDTjef8pSXVdUaq55TLcb5
	IpIG69ru5crcjql1wfxZnCQEq+VmIbskAbqY8cooNTvW0VCPXoUw08F7F/8B1nKmWj7nIHU9eA4
	eUtYim8uyPpzWKvwZHT3NYavIbtHDQL47WyvdYuYVubbYQ7o2f9NNox5+WDOkTv/u9pcI6Uj1vE
	YpzoXLTqzIWzjlEaHNRgY+lWOfaT34xzVg4FvdMCQWbxHh/mqWykf3gDHafVImbYRAkS8iO8iDm
	DVrZpK93aGlj/OEctcAx7M++EaXYJ6Wxeb1FHdPjAs3CBAh/lQ4m61ecfKzhlxabsrU+eyd+ep8
	uD+/Q24u9Anv6G6ulQAktm3zhz24hmHltFRnB96DhPt3CD3nY+0DeU029zhDYzFI7zrYsmJJdgN
	pRW6mnbNZQK8zu1gI645LCTq6/wg1X354F/j2ux96pc5UTm3dKfRjRvjHemTuQ82TPggu2SWsum
	CCIAUjqpsBKpmIguIe2hVmSVyxUUcs0BIXQ2qy/ma25SWrZmz2c0jD7W/Y5r9tcYVfeAmnlV0xb
	MA9ZTSU4UwQ=
X-Received: by 2002:a05:600c:64c7:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb887ffee2mr66227375e9.9.1795182831601;
        Fri, 20 Nov 2026 05:53:51 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f6b6a6sm101009695e9.5.2026.11.20.05.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:53:48 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Joshua Watt <JPEWhacker@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH 05/10] oeqa/selftest: recipetool: Expect the npm source in UNPACKDIR
Date: Fri, 20 Nov 2026 14:53:36 +0100
Message-ID: <20261120135342.2628228-6-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120135342.2628228-1-stondo@gmail.com>
References: <20261120135342.2628228-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:54:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250798
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

recipetool writes S = "${UNPACKDIR}/npm" for an npm package, because
the fetcher unpacks into UNPACKDIR. The selftest still expected
"${WORKDIR}/npm".

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index c6aa77399f..ba4f674b4c 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -454,7 +454,7 @@ class RecipetoolCreateTests(RecipetoolBase):
                     '83f1263230afc588123958b73e36bb241f63eaf08119aac5aa2a870bc4de9223')
         urls.append('npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json')
         checkvars['SRC_URI'] = set(urls)
-        checkvars['S'] = '${WORKDIR}/npm'
+        checkvars['S'] = '${UNPACKDIR}/npm'
         checkvars['LICENSE:${PN}'] = 'MIT'
         checkvars['LICENSE:${PN}-base64'] = 'Unknown'
         checkvars['LICENSE:${PN}-accepts'] = 'MIT'
-- 
2.56.1

