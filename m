Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4323.1794732550025485827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DtwkGzB4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-492690dd5daso2455307f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732548; x=1795337348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c+03J/CsK8wDzWgU89MvKmc42EQnURV+ohj2aNJ1pfQ=;
        b=DtwkGzB4dL+JYDopx033wcWMK53dsfkoK2PGQ+rPu7YP/d7ysBATWME/42Bv7a6j3M
         m6YRm+TeJn1nYc4iCyclhCBd1Z2F5U0GHDlLHzKswbzF9VMUldLu107EFlwbFsQlk7PB
         gZmCM2oLSYVk5gkAEPVAbe7vpZ92UkcGO0xmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732548; x=1795337348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c+03J/CsK8wDzWgU89MvKmc42EQnURV+ohj2aNJ1pfQ=;
        b=hSZNdlau6FSPmyN9Y5qIFoOf8omhYXgx0VohlSdwKpUQFghu+P++U8gPJJCYa0I4Gy
         urMdxcVgnNOnVk2MFIqmGOJ/TGciEAS8/ZLTc2GE/McWwDA+/ppMjkSXgazIf7swwh9t
         1+mF13Jjsdapmnmg1n89YiDd7rP3kqrnq6bJVJ0OOwoEyMgtkjLNhCu78OpBw8Wyoyii
         UN5JXdg8kjl6LBUz6kByJGzJqEJLcwZSZgzvWRuB3KTcJjUdoJetjvY2zmEBh5NAB6vQ
         aOT1tafg5wnyOWhHRMzp6bESDA4DknUegkAPyy4cGIsuEtt+y6So7+xmPiQEhLdYpEeN
         EB3g==
X-Gm-Message-State: APuU4Z8k0zhioVVmNW8HYqAZSqOi4nE8IyFua980XOK7V7kbX6Xa5EKL
	9f/C76WcDcXRrJwV4/DUcop5P2ChhHI5oMsgIdxnJ81TVtA3oefGxitwXax/xwdJesB5pEsbqjd
	uN8err1g=
X-Gm-Gg: AYBFou3CvMbuqnSacngPyAtEOFsoRQzlmLgXnfPZDhJxDo5d3HR05djKYQ/3uA4MLAq
	daNS3oh/Ksc7n4bC6xystYtQcYq+7yPEbf2NDmf5dOh+Dvg2K7oo4/3Nb5S9fHV4tL7on0CTCNc
	iT9rDoYR1Kn6JxN0uiXTA0ndTCEpaunHhljMnyR2BJ/CGuwqV3xeArJ/DfWZaGh7C7BFVjA5AP/
	Wz+B+anVz+vT51uxQ0H5czr2eQEYdtXhAE//ybJZQk1EFXXEBjDgH6HEGNClbuoyog0Yu5r0i2u
	RFJa4x3ocijOj4rUjXanqz93Gh4wRlmtJAwirnXymUnIh2qGQvyNIBlQbT/By4b8buLzB6K+r4D
	myB+WzNRGWarwK6TXINQq2JGo1OFJ8vu9fY8sEfFtv0XD5SJax7WHXpxgbLNhwsnBXdX/LaiQuP
	PWiMjwRYhj6pTW9/baVbNd0RkzGFLR/QsP2SxEpsSlwKexQkXuBOkVKpRdhSD1PuTcKw81L6ia1
	IUyWv8S26e4uowaKSpC2oNmYyIX4UhCNPmrunAUZ35z5ft81AEm8NdBmxaTL3kAOOV3CkZdkQ5z
	7CBoPslaY6yysCJ1RNYbNxGwNc95YItjLhXoZq68m7gxijABNDQCdHhhed8=
X-Received: by 2002:a05:6000:1863:b0:48f:bf3c:1631 with SMTP id ffacd0b85a97d-49c7026386fmr17779202f8f.21.1794732548267;
        Sun, 15 Nov 2026 00:49:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:07 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/41] oeqa/core/context: Use isinstance() for type check
Date: Sun, 15 Nov 2026 08:48:15 +0000
Message-ID: <20261115084845.701136-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250243
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 9745286548e..3bd65ba35f6 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -23,7 +23,7 @@ class OETestContext:
         os.path.abspath(__file__)), "../files"))
 
     def __init__(self, td=None, logger=None):
-        if not type(td) is dict:
+        if not isinstance(td, dict):
             raise TypeError("td isn't dictionary type")
 
         self.td = td
