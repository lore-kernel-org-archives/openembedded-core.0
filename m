Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id B83E971C9E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:58:07 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 3so672281pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=s7d61oFK9vyRtbZSj5nVTmVoNWOzYGsanJ+neAJ2hrU=;
	b=k3KoZocGVVpbqxqBNM0H+IK0RYMDoth6bdUdl18+SJlGNcr77U7cvPSMJIxyZmHL8M
	DA++mBG9jn9k+q5o/wdGw3JsYgzw4QC7wTqxrbExiiTIDHp+Nw5BXIRIP3l/3sAn3tbJ
	fFDKdbYl5n4aI6HIEudKhQpiW0F+eLiXuqYGsAEsilPq6qapxs/X5yxtqntSstVeNOrD
	Myyftb8xHDZm5p6asMKyQC2GVEgpCdStMGyczL3XMCqEOrk8OJYkfNKXmxClkNXCe6tM
	i9JNdCEHWSCe+Abu0oYhlpwv2y3oaE7voKoXf7T5GqrYdVDBrlQ92kGLMlkpBmrzEAUu
	6qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=s7d61oFK9vyRtbZSj5nVTmVoNWOzYGsanJ+neAJ2hrU=;
	b=eK1d1zi/qf8TcT1WIP736UrDcnrS9d27SxaYZ4WJpfzRWN+sbu3aaFAUEyjfRSK+dO
	FlubaaIdI4j4yg1713pihfx94x3DSvPoAdDyswcHUMbURX7NBq1dUTw/rjpdFcbsjpqE
	aehemPIR0zYi4h7m6r5+EVo09DKVlB8/AY1eZbE5HmAmdHGRc0Nmek2vKmEzD7nnRXrP
	nphmL4yePnDGyvbhRii9H4Gd9lvXUVOfJ6xKN17MS57d9iyCyZwOq7q1QjcjxcoNaXJN
	Qqg1Z/Hiv/T9N7oHWSZbj4S6msRZwcBhKQIvYbN6TNV7loJ+nkd+WS4Ar+28IQXeFnDO
	q/RQ==
X-Gm-Message-State: AKaTC02aafh/CdlptekyUC+A5Hic6hi80hn4AkLsaZXhC7lcOSA+LxImXHkfskXLfawUHQ==
X-Received: by 10.98.130.1 with SMTP id w1mr78498678pfd.35.1481252288511;
	Thu, 08 Dec 2016 18:58:08 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e11sm53341475pgp.10.2016.12.08.18.58.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 18:58:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 18:57:55 -0800
Message-Id: <20161209025801.20775-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161209025801.20775-1-raj.khem@gmail.com>
References: <20161209025801.20775-1-raj.khem@gmail.com>
Subject: [PATCH 2/8] systemd-boot: Use PV in recipe name
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
X-List-Received-Date: Fri, 09 Dec 2016 02:58:08 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/systemd-boot/{systemd-boot.bb => systemd-boot_232.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-bsp/systemd-boot/{systemd-boot.bb => systemd-boot_232.bb} (100%)

diff --git a/meta/recipes-bsp/systemd-boot/systemd-boot.bb b/meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
similarity index 100%
rename from meta/recipes-bsp/systemd-boot/systemd-boot.bb
rename to meta/recipes-bsp/systemd-boot/systemd-boot_232.bb
-- 
2.10.2


