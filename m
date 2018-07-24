Return-Path: <armccurdy@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 6353060851
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:11 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s7-v6so1746325pgv.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lnuxsaJl/3BhumIneCpcOTzB8536QU5StgMhKdakRGc=;
	b=VKkhTxbWrcNoJ03iLrh1EoMNT2oGtoL2Hxyrwe8CqXl9iIoBw+XEIXt+9REpeKZZdE
	mw9Hq3ZhfBuQyYwH71BzIgEd5yPwm9BOeaHrUj5u9/nVhTwezIZvvAHTLXAgPm8EKUmH
	tDk/gGY/t7WKsomF4dan13/N7AhNOsrWOPm2hAc+gth9bUc/mEMBz6ugbg1XxdetAzPZ
	We03GaTEJuQ1djJXBh/YIozo9DeoyB1ALEjg0DUa0jTTd3Tbgymq+00bgHdoOjnVE+oz
	xPrQZcaKJJDzDuJ/XF1bzFwH/2HcaNHRerTTlELi4MTE/EVJ7JsmnPFt+jMrncdDRahW
	QbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lnuxsaJl/3BhumIneCpcOTzB8536QU5StgMhKdakRGc=;
	b=VnVo0eeZhNn/dL4OC/faUE+VEN2RmRhIBSvkFymSr33ckAuEUB8cIkT7w5ZfI4MQ34
	su7bfEJ/j/8qQ4FQrobU5sKW/lLcR1Q9IYG0aP3xQGta66611iLvHklf7vx8CyGxC/NR
	lORqftC56MLFRYXMFIiZRMMzSUSaolyZAmZgSrnzK0j8P96KVPGc0ArEQZDkOtv5Gkno
	XLNPzdvxGdY5r9v6LRCdeiqeyE/GUDltA7kTXxX6lIW5zljI8F9oNs8LSzRAtpWDF68B
	xerAPys/YfWoNSpVlVbq8X0ubUUYC/DX9DEVJx1mjouYCz/Rm+0VAHtmcZjJ0hEDI4Fo
	Ojzg==
X-Gm-Message-State: AOUpUlFtXGjmxcrN9mBimaLkxZT/i85DuuVx1+7uRqwxDRZubZQH3X7V
	YiqJ1dn0JFHzfK/cncj4i24/TC6t
X-Google-Smtp-Source: AAOMgpeKUaxcttPEjVcx7eIteNAE4YL/hkCKw2g1Eb8WzsFP7mhqMrsfQHMfYzNeCI9/Tn+h7Uvn/w==
X-Received: by 2002:a62:6eca:: with SMTP id
	j193-v6mr15884970pfc.256.1532399952474; 
	Mon, 23 Jul 2018 19:39:12 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:12 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:53 -0700
Message-Id: <1532399935-32296-7-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 7/9] openssl: remove uclibc remnants
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:11 -0000

Align the openssl 1.1 recipe with changes made to openssl 1.0:

  http://git.openembedded.org/openembedded-core/commit/?id=e01e7c543a559c8926d72159b5cd55db0c661434

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0h.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index c0aaaf6..a2f5d67 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -37,10 +37,7 @@ EXTRA_OECONF_append_libc-musl = " -DOPENSSL_NO_ASYNC"
 do_configure () {
 	os=${HOST_OS}
 	case $os in
-	linux-uclibc |\
-	linux-uclibceabi |\
 	linux-gnueabi |\
-	linux-uclibcspe |\
 	linux-gnuspe |\
 	linux-musl*)
 		os=linux
-- 
1.9.1


