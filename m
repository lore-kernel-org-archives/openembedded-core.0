Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55.1794854542474569251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2026 10:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AL/DAGGT;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37198ed3727so172139eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 10:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794854542; x=1795459342; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+RejhOOv18HMPa5ZdvBaBllzAB24t5RW2bpxygobmyI=;
        b=AL/DAGGTIpU0btl0E5Ts5frqo8+SS2getGJFspel5zhjYT2E8zBHA4gsialHp3oDFG
         I4Lty3g2Q361DkJ+z7HVDunNDegGmObDjJ2zt5EMAW2EQv5R1/2eCuITLWYjicdoNKP5
         mDvhIZH3pTKW0tJ7Fl+DAFqa5dt5L7W/1YapaBYhiX2FukmWU4hzQu8uSlv4ZHiDRmI7
         CZCyqyfcph54Ms5HXsPcDw/8YdK3HmBdGFWMY8q+tolI6LsVGDXzXQPj0VOnnqm0Z94Q
         VWzRfCRbQ225vEbWeQy61PRpd0NrxqW/BmHRYS6p/7/KhiDIUB0Jk6P87Jh6uG6pfclL
         6TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854542; x=1795459342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+RejhOOv18HMPa5ZdvBaBllzAB24t5RW2bpxygobmyI=;
        b=N/YYf5yP5xkh7aHfskqSkFPA9kXz8BGmwNB19Z7VQaOSbb72Jb0yO9impHhOnkUIyp
         Hc+5HSAffh60p3hal8BZNa0ZVHB/7syQy/J90N2Z75D+UFryy5ZfU57BLrHegX1t52PX
         vTUFHz05a7JRa0E47YG9Y/828WqzheLbpYwYe0ABhQJWcXdk+eI1KEvV35EIHCnCGl0q
         PEqHNG6egcSfL2VeQVFi77dS1ubOXmL1dxZv15HYpWYvClnYU1ZChE1h94Kdi6wFTD/s
         vwcVX/8TXalVL4kciK2/0CkxwCPFlk1I85k4/yUvoxRYV/wSgyHuzQCi2VzjwTPx+cGd
         tVew==
X-Forwarded-Encrypted: i=1; AL+hErHU1B7fNsNmxhlyRwzMwUFVWOSiBxu16qiyD9yhW0ZC8kT14wOv/Gkvy4mpyQwtzQUjcoiWw6ao+7tWUBdb51WaZw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+fIPit5T+Yxbebu2cAlG8j81UjJpwwm/8tAvQmprZr9jqpz7/4
	eOadv+UWkOBP2O4yjYHbIeF0L0Qn4m+W1DBJGXwEwB1+yQNK29ryrk/R
X-Gm-Gg: AYBFou2PEc6RMT7sP9vRCcUzBi9zlWLKLpR+4YafK4CdYYK/5QBFegPfYwCI/08WN8z
	AKAgnqg24xta1Z7NR+HIR1VRTS5xvvCIeRNAOc/jt5JtNldFuKBqCDjQb8j7zMvvCDggryXlPj+
	COonxTlLHUlmIUuPV2y0A3sgDGJt6i0IjwK1DEjnHR5k8ESBUUrpTtWc/26YTWmP6EndgTDmSzh
	1TGJds6segVGLHAogH/pFrMd37YEbWoMTH2F4kiMR1okyXcWW13yaM4sZ/g7XNbKXr70i1zfdNn
	JCmQR/Q96ETmiyOMF+V17UrWoIdHY8dBlH+WcFTZ/9KNcQcxRe1MMch1mKlOyss+MXJvNaFV59V
	fZakfHzTHzaHiJtjcngITDIJVuv5Y2dfafMfKEK8BUYURLzP45NDIlicvQOmRSOy/Z+kMym/9B/
	Zu1PzegD+ZJR3fuvIBIX4TYGjoyWILdFb5K3WwhemRvv8nbM/CRL5990LOAf9wFzQCCh7XdsalV
	u5WNP8QaK4T73VVYyAd4JwCbnPq3HZoThOxun8Pfub/aQM+mRWa155W48j3GAbsKSdYXn415Qur
	M2tqOhos52aC9JDxKXJ6DNFhrs8lXweRTQSuwHfqplZO5kH5pei5nkFnHRAM474uSBl9OUYk30s
	+Pg8fVp9CcLUzzTtOVgmeyl9iYldMZXn3x2f/mUd96TQAA3qxXktu5pwKrYUkDp0m4/l1slKN5I
	ZBSroOjBQVzLlpKCjaQBLkqYa6s0PAnNQoidkuMEhPPrd9rauPj4J02vdDayzZCAaEKg127GU3l
	Z23OATirnvcQNi7f1toV/CugpjCt9Piuvk4gNXgm01wSm95lXcQTkU0Jp8XOL0OChBipO8yf/1M
	EPHcOQ==
X-Received: by 2002:a05:7300:d947:b0:381:25a8:2559 with SMTP id 5a478bee46e88-38125a82c64mr89240eec.1.1794854541594;
        Mon, 16 Nov 2026 10:42:21 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm54958492eec.8.2026.11.16.10.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:42:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: raj.khem@gmail.com
Cc: Ross.Burton@arm.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/3] consolekit: Upgrade to ConsoleKit2 2.0.0
Date: Mon, 16 Nov 2026 10:42:19 -0800
Message-ID: <20261116184219.361983-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <CAMKF1soWija+eU3x0oK34cdankotbZbz+Z056eDKeyq2TzqG6g@mail.gmail.com>
References: <CAMKF1soWija+eU3x0oK34cdankotbZbz+Z056eDKeyq2TzqG6g@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2026 18:42:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250372
Content-Type: text/plain; charset="utf-8"

ping. Is there any concern about this change?
