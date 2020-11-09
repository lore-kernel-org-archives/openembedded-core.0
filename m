Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web09.8727.1604910708594369981
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mr2qu0eG;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id ay21so7790035edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfSsoYUpUCwBJ1jmzmuhvptGDaSU4kiEWuzz9ISkNow=;
        b=mr2qu0eGg98ieLr4wBQsDGTcBKjEOGmEnIWBlmV8oI1v10mK6h/M97lZwlF+eZFf7D
         bxX8ukdJPtnSyWKHjQWuLJJD6ttCVFzyWx75v4QcGzYJiNTLJR1iP8MGa6Da7Nz/YsQd
         RzEMHqwYrbrnNQLfO1GrsGl0hjX9AFlmFSDhUN5R2e7IMgRk2/DtpAXnOPtjAxnjdIEs
         vLoqyiktX/AzdLf5fpoOZEV6/oXqTin3ZQsLWqBjIm022s1jQxJsczv5fCJJybVOC9zZ
         vn2OfogJc/rTqFDnWdOKhNhmC9jHKq3Fdk6/nV4knb7tEOQEWMaZrU9PljZx+iwuNZaZ
         PR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfSsoYUpUCwBJ1jmzmuhvptGDaSU4kiEWuzz9ISkNow=;
        b=PFTbEEJ5iT+j6xqHHHVT4YcEaTd4APmr6XGOanFMadlav7A6uC5v5lZ03pDnYvAHea
         vUavddGjFfe4V7wvZk+cL9mCxhiZ6eILcJOeZQpptgYfWPdtiV6JqAQjQJPpfIm6mkvt
         c/oXFZkL6K2I9iw71FQwdRPe9ZAd4h4fFvqjTsuBq0hRbXooGmMxOB2Ve+31AmnxWFDs
         +jjl8d2WTovf2kI3VOuMtHEvyMow2yMSnmEEMs6k8HvXnXX0RfakChCMkm4j1bJDGfSd
         JM8NhZCkmtSr5/KGWKu6IteOU+xnS7TuzZjIpynSnbsDUqisJ4cyjtnbP5ej/sN2/b1K
         axTA==
X-Gm-Message-State: AOAM533kxwDvWFgcCOjl1InHFGsa+pCOGh96tPdK9ofU987DSlkbN4HT
	VvBRQlywNLS2vQTs7hX2RqMz2pApjX7NfQ==
X-Google-Smtp-Source: ABdhPJyrOMRXbdjAi6Gxi2NYvMnLU+keJbj3goPR/5uZnI/1wSJsUW1ZoNBIXU7x6ukdunEq65/jvw==
X-Received: by 2002:aa7:cc0e:: with SMTP id q14mr14260151edt.181.1604910706995;
        Mon, 09 Nov 2020 00:31:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:46 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 05/12] core-image-multilib-example: base on weston, and not sato
Date: Mon,  9 Nov 2020 09:31:26 +0100
Message-Id: <20201109083133.16503-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../recipes-multilib/images/core-image-multilib-example.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
index f13186f933..77e5b2118d 100644
--- a/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
+++ b/meta-skeleton/recipes-multilib/images/core-image-multilib-example.bb
@@ -7,7 +7,7 @@
 #
 
 # First include a base image to base things off
-require recipes-sato/images/core-image-sato.bb
+require recipes-graphics/images/core-image-weston.bb
 
 # Now add the multilib packages we want to install
 IMAGE_INSTALL += "lib32-bash"
-- 
2.29.1

