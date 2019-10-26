Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3D88B7FC27
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:27 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id q13so4637788wrs.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FTs8a0HHmKt9df7PGH8rAqUdTqVGnEuBwwMY6ffDzww=;
	b=gqRo/vqn6q7HxT22WX/bDCL/A8i+zpx/BoLtwejFtFGSQGRNBgQl676mdDIs8oSWSj
	Xt0Igzku0VzOul0MZ75RS0M29qnVPUvLEWlG8LYa2pjy0Echmf56xKF9swr6rf0hcg2v
	mOqEyBlh6flZupnM6mXmnPH1Rk4nFo+gUfN6/wd+V6WwOcj43u7PnsHRdOSTWJ13Z6o4
	KeSJKFXjI+woGHfn02KYRn7ZJyeMwbjYqTRvPG+fLpzB50/A/yzeDVd9ViMYklq3ZsOX
	lvKEf3jL9r+anG2o/FWZzlyZz9YfsFYFCRHEKncJWTirqWAf4MkE0583nXw3jDX9v//O
	0i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FTs8a0HHmKt9df7PGH8rAqUdTqVGnEuBwwMY6ffDzww=;
	b=s3FPDoPXzTfBe69C9AGoipc6mO9a8b0HOMIu6X7ACob5vNPxdsCPj8UG4DYDeONet+
	0FjcYoxFrSV5AUL2IiGluZHdeatXQ5yfj+WJY91UduObeOgvGX/DliOwsQttpWS5Hn+p
	Pf96R9k21hl9It2FS1MuDPOZGeFE5lxJ78+11pK9LKVArJyPrZ/N5Rq5apreyl+6SOrA
	WvTf3ZiRdfmJKZoBDLyIHXXvH6R7JlYUhIX4+fU4g77FBATUE3GUeH6zLraY0kx087eT
	xqcFCgbDQbsGBcZYG3merWgbeGEdhH6chAN1GaEsrmga81PfZgWbSsI/WoadFf4ps6GC
	iwKA==
X-Gm-Message-State: APjAAAXmt88KZInRUzPC1sSoFbcWzq8D1ocggMMW3ggs+hxqSZLRJCR2
	F/olaqhmzgedp+qjwnertImzqgt/Eeg=
X-Google-Smtp-Source: APXvYqwSvV9ylKJGZ9S8GpvIraAopk9xwjrlQiPTNoldQnddNw+/cYvYmGpTxjmS5UDBp37ZiXi5BQ==
X-Received: by 2002:a5d:55c4:: with SMTP id i4mr6049249wrw.140.1572072627587; 
	Fri, 25 Oct 2019 23:50:27 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:50:00 -0700
Message-Id: <a96d08ce58939ef1b4e4e6b22d79fa3a6744e9f7.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [zeus 28/28] connman: mark connman-wait-online as SYSTEMD_PACKAGE
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <git@andred.net>

The connman-wait-online package currently isn't marked as
systemd-enabled package. This means it is impossible to
auto-enable the service during image creation or package
installation, as no preset files and no pkg_postinst()
snippet is being created.

This change should have been done as part of the
upgrade to v1.31

Note:
connman-wait-online is needed when connman is in use
in more complex network/interface setups for systemd's
network-online.target to report success.
systemd-networkd's systemd-networkd-wait-online.service
alone doesn't work in such scenarios and simply times
out, as it know nothing about the expected network/
interface configuration, meaning the target doesn't
boot successfully (systemctl list-units --failed),
and long delays are seen, caused by waiting for the
systemd-networkd-wait-online.service timeout.

Signed-off-by: André Draszik <git@andred.net>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a8d18eeee6dc188d8becc778bfa933031490781)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ee00479..fb38ab4 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -59,7 +59,7 @@ INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
 python __anonymous () {
-    systemd_packages = "${PN}"
+    systemd_packages = "${PN} ${PN}-wait-online"
     pkgconfig = d.getVar('PACKAGECONFIG')
     if ('openvpn' or 'vpnc' or 'l2tp' or 'pptp') in pkgconfig.split():
         systemd_packages += " ${PN}-vpn"
-- 
2.7.4


