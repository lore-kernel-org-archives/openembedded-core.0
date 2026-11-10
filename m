Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12963.1794282767066484653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ThdBb4kM;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so579577a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282766; x=1794887566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGrdmQFxbaXQynFnOP6rlpRG5QlHFFENIX+yQamdMPM=;
        b=ThdBb4kMMGx9jp/Y8mrSNxUF7ZHZxUp3ybyAGQjI2tFOXODiY9cUBsh67XkvL20KLG
         GVKzDOjA6xKgs23PcewE6Fg6I8gO7zEbwWxKE8knuIaFz4a3GawgBuoUySxr88sUhQ06
         exR3MEmhpe9VuRLpByyTJQhPJG70CAOPyOWEbGskdUqk6IZzBCW3cTza0qV4rsi1O1jk
         FjTv4STUmAtODacAv0Amk3HchG/uUzhvBgAgbQvqlqrMDWiOdlCvSP3k5aN7Q1Fl0XSq
         QjypbHPjvLTiwYWO3HlCZ8OY6+jvsH8YJLqKD69n9MbOiCgQpu5PI/EGI0Ko6vSc4Ix7
         jlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282766; x=1794887566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGrdmQFxbaXQynFnOP6rlpRG5QlHFFENIX+yQamdMPM=;
        b=ySz0LqJ99JDReKhmPm8xux0yHBS10Kp98+xaMd7IXa2M1hudmScIk/u4hUoQoQWqQ8
         BhaDI5C3MV2ZWz/xUpd2OUUFSHmwkWaKc9qrEPEbgLXXsO+LAOiQo4WAB0KpKdyUcFGj
         MJDSbKyjjjfR9OehtQIHEupGCpG6PA68Lm9RjxgvdDyDJCBz7GU4aMMymzgchxINLRqK
         lLOa045uctziyxfb+5rpT3dapYzz+desuteNmG1pZTKWjg8d+rw/9E21ksAnbXKPM8Ip
         vtf2xL7FjCeQYOVKudFlBFEmMjIjhXyK0CqjeRwXqCVmGVL1A1vqMHKKPsqqj8xdKKuB
         r1PA==
X-Gm-Message-State: APuU4Z9v1nbzxgXh7yz9af93E+9bmQVv2UQyQFszF/sxE9ETOI1fGl4a
	iMxS4oSeSiPEWRWhVdadZuO2x6Rfq456/MX9LUBmGipmj2lJZxXaMyZORHYJlozI
X-Gm-Gg: AYBFou0ZTa+oCL832sda+0oHsyWgRTtBeWPwdLCjVtfYFWwGpjGVs2qKiol8YaPgEAN
	7/kvJafB27AmsDw3NSOKMmZqA71J4S52mdvAAnlJzC4K54gAdmIhK4l7lxh4vJoB+DkYTi/pmdQ
	GB8ORvaBslhG9G/Q9ZtIlaTfL9pbzKsLfVMP5XmRQVNsyZRQZKJ8npQ3O8btXOy0POZbLx4d0jl
	3jnHoYBn3Lyh2W3P0hExyXzbC6YkIq98gXIL0mOksG0tZvvT5ImRP3juTPD2j2LmKqo3kKI+QTg
	duAUApfvhMTDIZYfJihUkNCc4WFijxPqLzesrNWWpSYCTrHGX0Rjimz+cronz1xkl+AMfBQbduk
	cf2aQsO6EbUAQISmRZ+PcjKVmm2yI6GNKg89gfjYBn/Khhy1O54GABwxIv4taXUcTb5POpGfttZ
	Ag2V7XYwZt3nJTTkBB4Eivr146HYI3eDdDgQOVyPu7+oZ54Re+neAc0p9T9WFd+oKa20SQ8Nw3V
	3YLX1wTUxBLCXFLq54WWZsSufEEILHEQhAjS57ZSvXTAqEGjdrKkHTOxnjFCAj0N41Pn8xLxUk4
	aXdfO8Ok3VBceTyhvsBzE+4n1RCHiw8VB+f9KvMjhXWUcU0SyGuINTUO7Tjz1w==
X-Received: by 2002:a17:90b:57ce:b0:3ac:7613:1ec3 with SMTP id 98e67ed59e1d1-3b166d02c84mr1547290a91.37.1794282766172;
        Mon, 09 Nov 2026 19:52:46 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:45 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 5/7] desktop-file-utils: upgrade 0.28 -> 0.29
Date: Tue, 10 Nov 2026 16:52:27 +1300
Message-ID: <20261110035229.2940188-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249892
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://gitlab.freedesktop.org/xdg/desktop-file-utils/blob/0.29/NEWS?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{desktop-file-utils_0.28.bb => desktop-file-utils_0.29.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils_0.28.bb => desktop-file-utils_0.29.bb} (88%)

diff --git a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb
similarity index 88%
rename from meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
rename to meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb
index 35537572fef..8e4138319a6 100644
--- a/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb
+++ b/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.29.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/validator.c;beginline=4;endline=27;md5=281e1114ee6c486a1a0a4295986b9416"
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "4401d4e231d842c2de8242395a74a395ca468cd96f5f610d822df33594898a70"
+SRC_URI[sha256sum] = "661f225be4c667abc4962f075717db4252b63c84480f6d37b26050d029da8fa0"
 
 DEPENDS = "glib-2.0"
 
