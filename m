Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E643F74E2E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 20:37:39 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v63-v6so612419pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 13:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KT0qHfdWfz8PjXqXmYqOQCGrUp1z+PQQlYa5U0PQ9oI=;
	b=k8UgQ/ZfOTJHD+zxlFul9FiV6TL8+CKXOUglkYPKYVl7R+df2zr6LNHpUhpBFEpUNE
	kyQvONKBl8oOKtu49ZPpkEQQxlgLJhdp1X+l8Ea7T+EJ5dlaPGfhXTJebr4JfbrdYNtQ
	GpGB+Ws6ct1PpP6xwsvwoJIJX5o3iuGw6HERLT25V7cVA//LahCiEISYUhUY466HecLZ
	9BnfQ3FOupNJfWnBkQkie41VjEf/j1xldgswFg+AHvmufssFIq4BGxe25PM3rbVGlu5d
	DNMVVOUiCK5womedHsQuQwvo6WOLlFlqx98ZG4YRtTDVfwYsVxhnTOdUDC3qn4zLUnUa
	nS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KT0qHfdWfz8PjXqXmYqOQCGrUp1z+PQQlYa5U0PQ9oI=;
	b=D3ibB3m22mGcWSTT7Jo0Qwctl6RZtbnB3u3LJ80Y5rPg5Z9VPkfp/2UudfN7k5AkI3
	hWKsbWmrA/zGzTyCYvl/PayD6qnDF/zUvbohKSWnShtHvViZH7CD4W3d49qtQd3rea/J
	6aCdJMTlcldPq6c8/Oo69NMAIumsj9boP0yGiganfW4Jw2rxx2BFMN4ggKDbbqEXQN5r
	LSl8b0DLSMbpQrwVixSU97ELSmlly4xBU6BDZu0pjll7ysro5Myj1OzpdQksOdULGP7A
	Hvh1ugSfowvGvgtP52W4RB1ROTAuIb1U/8ehZhN4cbaVtWooE83N6E72ZT/GL+yjg/UH
	YOKA==
X-Gm-Message-State: ALKqPwcl77OXNrLd4KB9+QutOvU6vYzw2JvgrHF9+IyJF6KPVGLL1Rps
	Fjb1CBWlYh9OGudXHkjles0c0w==
X-Google-Smtp-Source: AB8JxZoJBVURqlMlBDDiRQBoaXfZqxKGgwOr5R8/VvLs5hZfK+EWLK58FRHSoRtO1gfsoRpTFGFXOA==
X-Received: by 2002:a65:498e:: with SMTP id
	r14-v6mr13119699pgs.78.1526416660368; 
	Tue, 15 May 2018 13:37:40 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a3-v6sm818566pgw.14.2018.05.15.13.37.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 May 2018 13:37:39 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 13:37:22 -0700
Message-Id: <1526416645-4896-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [morty][PATCH 0/3] morty backports
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
X-List-Received-Date: Tue, 15 May 2018 20:37:40 -0000

Alexander Kanavin (2):
  upstream-version-is-even.bbclass: ensure that the full version is
    matched.
  upstream-version-is-even.bbclass: exclude various alphas, betas,
    pre-releases etc.

brian avery (1):
  nativesdk-packagegroup-sdk-host.bb: add cmake

 meta/classes/upstream-version-is-even.bbclass                      | 2 +-
 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


