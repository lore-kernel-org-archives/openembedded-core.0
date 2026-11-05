Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29810.1793868231004808649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=iS2azUYi;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1312264f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868229; x=1794473029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nq4N2RwdlDLvq6fFLfTbd5Auzz2O6+BU2I0pm/5too0=;
        b=iS2azUYi63dTMsthuOKR4o+/spSFctxZR3rAqoII5BnDphbR0iV6Kz+kXuEI/iRVt3
         KXMEFxGtrBgPzBEyHPclEKVDphGv05293gGqJC20kCR6rehhBj2G/f6DcWIVilkO5X8p
         sQ7kTjzoYWV2XRWC2wZLwIjucnFJJlh7wAVSGz80zq7pRinR6gJWomKR3G+CD6i3RNE7
         b0RtmkVdXC2pDD8HJnj3wREyC7lA+l3kOVE6rzmGvPjzRHhxkFguNbkL3TEOWLmY0omd
         roTf9IQY5UkxZnI9zOyEEzjX+dbpbBnuK3GkcRVuYPNaravP73T3079D0tkS5kupAtcH
         Kwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868229; x=1794473029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nq4N2RwdlDLvq6fFLfTbd5Auzz2O6+BU2I0pm/5too0=;
        b=q9gN84BcKn/FFTTCllNRU179LcH1IagEaktwv0S2aqU0fQNC7zIL7nBLIrNv6pyGX7
         6Bxf9alm3XcP5dy9f01wNcjRh456v1ok4d7X/hD2YeAleum7RzHGd2hl/s6tijvThEvd
         NJBvpuFtKvxRTPyMySIdmUfzPBCv05FfDr9PC9Jhvn/YyhCA0241iI5b8RkPz7pOPCsv
         IlZAbMr74k2vf3e5V+gy16F55q0XSwhcTlGVVz+rdrxUhjOuLi4XqczLvYUx8tWM6dy0
         Ar/rtRKACqT4lnZyhHevj2d2I07uhYlCwsPkFLcawy5TdR9if/VoogFkYrkpHfK3ZeBp
         Dp+Q==
X-Gm-Message-State: APuU4Z+EMSQkjvZgHjAgnsJM+SnIDSIS0TEO41wSMVkx1kzsJWxdw4qy
	hePJR1Lbtz1paPRXGkmSUXDwO2bNslecPaRRg2/ZjeC2mRZorV+41Dupszs26C/TZg4sgHp5mDm
	yzfgqp4Q=
X-Gm-Gg: AYBFou3Ljp5AEStoW0G2RLc+oGCmu8d5yhwEPoIMmrbS68dcasMT+3DgSqm+jgJDiMh
	R2pL6Z+mgrpSQntVwZPXfPWjH3Rco48Kpa6Z1GMTUa4dNdxkf5WXGTHmbUnFCPyPScOIBwKwW0C
	5rsz+ig1LJ4tbbPFDz9ECIIIMJ7wn9kzXAPVFT73DlToy/4T/6ivtfPTV6Qj6O0x5luSGUI8Ex7
	9Y1GGSOAMfkdI7UKSWC0kKRe3K8DMoY6EDxeP3M3AzAT2PxJTDNwsiJirDpn6JB/0ZbPGiVXtFH
	dHwkJgcnZKFWIHCQELDKQf5DhKbvpz3iH40jqfnlSH55fPGW5jo36hv8poAcIKavtFal5Ci0kvu
	o9S6NyzUlAvenM8UiOS+j+CkenA2rgbL1EmuP2cxALqECWn+DKJG8eX+9PAxguzj4CsmhFEc76o
	zVewBtx+zR91R1L1lSfTTGObI/dDIKli3ReUbgmMLpnrRwWhGlgf4iGQdpM59fYqwXnpQZBmcy5
	ucDWI50yoXv8zEwsQNaiPlb3Xnl3pf30japm+j4ejblinqGjTGGpgvOVN5aa4JOMwRWN1RDCDte
	4cbvJosL837IVTYtAubR4I8f2bFGCUpg1390iZT8pbaUlt5BbXNei3qp9q1QzIgqo+wJvgcFCPX
	6zgT/lVVXKJSBJgnAwIk4akvn/ielC5b8MKrYl1B3DhxAMUKasg==
X-Received: by 2002:a05:6000:2610:b0:48e:4561:8a17 with SMTP id ffacd0b85a97d-48e6e303ea6mr37523487f8f.16.1793868229270;
        Thu, 05 Nov 2026 00:43:49 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:48 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 22/60] README: Add blacksail subject-prefix to git-send-email suggestion
Date: Thu,  5 Nov 2026 09:42:41 +0100
Message-ID: <c6be6c44b4837dec8e0ffe0eabbc1ad2630da0fe.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249481
Content-Type: text/plain; charset="utf-8"

From: Yoann Congal <yoann.congal@smile.fr>

That might help new users send correct first stable patches.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 92373e4a047..7e38fe580cb 100644
--- a/README.md
+++ b/README.md
@@ -26,7 +26,7 @@ As a quick guide, patches should be sent to openembedded-core@lists.openembedded
 The git command to do that would be:
 
 ```
-git send-email -M -1 --to openembedded-core@lists.openembedded.org
+git send-email -M -1 --to openembedded-core@lists.openembedded.org --subject-prefix='blacksail][PATCH'
 ```
 
 Mailing list:
