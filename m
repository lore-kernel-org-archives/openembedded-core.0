Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web12.1176.1604335784688402901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M3ZKppMr;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id oq3so17943909ejb.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M6R3QunojjKzhp0v7UIr3APnn5J4aICvqntCp76WSdE=;
        b=M3ZKppMr5KKtuK4ceeaM3kJXMYSuSd/GBRJErvF9XgGiT091cx8/ZEKVyIaWWyqeZA
         iqxpAi44i0UQtgjlqxzfMmrCmqpulQmbwV6alITwwfUIv188E3QkrmIDPj1EkhFLE9EQ
         eZRhBT/Ul9Uu8OdP0hl/vNMwB/9lzhvel33FGp4SD7ZMFTea3cZIk9rM1kBRy0jtQ1eH
         +Fc7yhzRnDh5fbBuVYY18Piqw/dwUb87vlBcComrEnriGOFSnxENoWXHarenCxnQls9Y
         +3ap4+sWpsGNxiPEUZfrggD+5hh12RmPBc+zJ0SHXbISs581EixxYE5UH4b/CDt7XSXV
         a+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M6R3QunojjKzhp0v7UIr3APnn5J4aICvqntCp76WSdE=;
        b=cZydy08tJZMHak9dT3Hr9/PvxkSiH2ob0YUdoj+3EAvZuJPqoMY19H/QBD2NjPnNln
         6e/G+6biPr6NANofbsqvcU8O5jhDoFNlTvHHxaTG8I8OOqdkJjWyI4sE9jdgsZ/DYj9d
         41hwd/nPBkf6S6t++Wwjkg41Gxasaqqs974jC8h0I1D94N9NQwBuLvgG8i/MVeCNB9+D
         XsV5vsA/Jg/mkRWoxtMtZoQ2iTeFgPZ6EUqmIsLtTk5XHeMLLjsbHYcw995ZvILzxzjp
         UkJmasauDXYFgnh0NswfH1Cb72yuTaypfRMlnJKaMBDb2lTOH72lQqEHHgkWW4s98C4e
         LuAw==
X-Gm-Message-State: AOAM531wVrwMPwHOcSIHqoIYj4+CC6GliUsjo+X55DlnFdCEqcV1O24P
	VfNAXOq7wdj8djsms894g2yWMvV8fO6QMg==
X-Google-Smtp-Source: ABdhPJxnjJPQ9D45SBpPwceXrTP4G1RcYp1I8ixuQh7BMT/lTk0Mcfyi8zYFJc46ODbe9qGmlTnLRg==
X-Received: by 2002:a17:906:745:: with SMTP id z5mr17187964ejb.408.1604335783045;
        Mon, 02 Nov 2020 08:49:43 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:49:42 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 29/80] kmscube: upgrade to latest revision
Date: Mon,  2 Nov 2020 17:48:16 +0100
Message-Id: <20201102164907.27572-29-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index c72fbc61a9..478d5c4de4 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -6,7 +6,7 @@ DEPENDS = "virtual/libgles2 virtual/egl libdrm"
 
 LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
 
-SRCREV = "4660a7dca6512b6e658759d00cff7d4ad2a2059d"
+SRCREV = "e6386d1b99366ea7559438c0d3abd2ae2d6d61ac"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https"
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.29.0

