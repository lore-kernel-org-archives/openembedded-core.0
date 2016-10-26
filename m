Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD6571CD5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 17:39:09 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id e69so46572369wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uUgc7vx/z2+1ia2aBFBOZdZm6dXEMsRwjPeO5TyUfqE=;
	b=uC05NJJmLLVJxITMzZSVbSP4JwmXncbIf8EQrBMCFAyxERpHnLHih9zA61vv/wkfyc
	SjIJON3RMSFcKGKQTmnK6nltaKUR8xHtdD9Ngk4GZGZYfBN4/WCRyglXEUHvEQ7uVhv2
	bO6wmGBiMJB3+6OPK55NwVrcaqiOFgClX6hPfgv9gdkt+TP+1lzsf19TujQXReZPxaD8
	mdvuyWZgAyaYA1i73X/smeWpZq73P9a4XttKr1BtYlSCbfSB7T93Jqx1g7U/XhOImOWS
	qhOuG1ICwXFs1YXoOGPlPo+tqyh83aQu7rH9i8KGm2KzZJO9IYgqmgORMYQjBmSf1f44
	fxpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uUgc7vx/z2+1ia2aBFBOZdZm6dXEMsRwjPeO5TyUfqE=;
	b=fN1Rj2b0I8Wi3iGo3070qpGH0Nzgj5+YK36l6zp8SJD2r/gHxrwhqRifwcZrcbQxt6
	G2CGY+ivmdjykEKetVWmJBTnZgsJkfHGXaY1Mbb03ifScTFlfEQb9+e7E52hGhsElEEV
	ms6D7YOhq4VvefUyDdgmmLdfwzyUmS2a1ZZJLHcsyAhxYJqpwtkg4fRB+ruFl//X+0iZ
	70II2vf1q6NaZr5sARQu0ZlVW0xWNY7vER90g9DVS9mGz0uF+tkBF/slso/S07u5t+40
	JnwX523w5rIXnwhYLfdCSouw4bM2xbJrdd6OU0z4mf+DuTWb7PdQbyEWhITRPYfY1T58
	O4ng==
X-Gm-Message-State: ABUngvfBqFrr4mo2w0fG1tJRz1t8j61MCY/ucYUbeidt0+MwELRb07bVoHhdsGMIuLilAw==
X-Received: by 10.194.203.6 with SMTP id km6mr3146315wjc.226.1477503550647;
	Wed, 26 Oct 2016 10:39:10 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:4956:ab83:2adb:d88a])
	by smtp.gmail.com with ESMTPSA id
	pe5sm3801657wjb.15.2016.10.26.10.39.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Oct 2016 10:39:10 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 19:39:03 +0200
Message-Id: <1477503544-13794-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/1] Remove unused variables and imports from package.bbclass
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
X-List-Received-Date: Wed, 26 Oct 2016 17:39:13 -0000

Changes since v1:

Remove accidentally omitted 's' variable too.

Ulf Magnusson (1):
  package.bbclass: Remove unused variables and imports

 meta/classes/package.bbclass | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

-- 
2.7.4


