Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web08.7943.1607194316782180442
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Dec 2020 10:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u8ebmhUI;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id b2so9392441edm.3
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Dec 2020 10:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEbWFw9Ld07FjewrvG3YQXfPcYA747DVXrlSxGYRcXA=;
        b=u8ebmhUIRnV1yCoMaDt6p5y0Xz3z8jog1CHgg/OVhoh08x02FlJ6UemzvOJSXy6A1E
         YdOcahM59N5987zAHnVNCA7mvj1X6LSqPhT2lG0Z6kyiDROF31txWe00km1tu0SyUKlQ
         LU+k8pH84320+oGFe0wBGBCIuVHo3M9hpuOgdE58i7E15T8oKadR2sIB0z2hQryf89R6
         Mpqvznsrtu67P1hEVwrwLy4MyDQ6HszaO2fB9dMPcR93IMEdxpZxXdmGTiWsujmKvGo8
         AEZ6I50ivHLXqPVf+Nicu75P0HodFeireQ85OBQiamZOz+6PxW70/neiJ+Xp5JvGMtf8
         5RBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MEbWFw9Ld07FjewrvG3YQXfPcYA747DVXrlSxGYRcXA=;
        b=WGZrzuH973YLsPSDhxV3LJh+yGCsqZv+CMk9ZoxWQIr2qwvugCe5+ixTVpQJUfn2Ze
         ZqFrrYRWlTYgyns7TSNF8ntYH61h2yPQAjMZ9Thtib4KllQwMJgwPndGA6WjDM/6/JC7
         pRixO2l2yrkO26C4XqI6JudJkjr9LmI4VUDkzhj8XmTZHQl2P5wk9fUCZMsnChFTTzln
         5ydUzKu4lTw/ODzWHkYkUo94nQQ8l0nvWbhg8KcTsmOcHMdi07QFCJwyu97Y/NyAQ4Rw
         1zRdBE5LkVTmlbJIg7fTCSY931RwMTpzn7yTTn9h2PcBb9UyqewAyMkUptlPl31o1eOu
         CC/Q==
X-Gm-Message-State: AOAM531Yu/JyF60UJmNC1kChZOHis+MfGlyQy/vvM6Pa9dY0aCjGoBiV
	A2VK8d2pqEO4UFBr5kZSmHJD+ScKAAFRJw==
X-Google-Smtp-Source: ABdhPJz8CwEpGSnRMJ6RActRX+gxSQrLizYuIq1Rxig6Dd50e8NGP+JLxyuJGQ150cEwK2xSxs0SxA==
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr1393296edv.110.1607194314906;
        Sat, 05 Dec 2020 10:51:54 -0800 (PST)
Return-Path: <jan.vermaete@gmail.com>
Received: from localhost.localdomain (78-20-166-56.access.telenet.be. [78.20.166.56])
        by smtp.googlemail.com with ESMTPSA id v24sm6203882edw.23.2020.12.05.10.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 10:51:54 -0800 (PST)
From: "jan" <jan.vermaete@gmail.com>
X-Google-Original-From: Jan Vermaete <jan.vermaet@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] common-licenses: add OpenDDS
Date: Sat,  5 Dec 2020 19:49:34 +0100
Message-Id: <20201205184934.6105-1-jan.vermaet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jan Vermaete <jan.vermaete@gmail.com>

This is the license of OpenDDS found at
https://github.com/objectcomputing/OpenDDS
as LICENSE at commit 11b2e4771fa323485c0f231f7fa4030feedae9a0.

They have a meta layer at https://github.com/oci-labs/meta-opendds

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/files/common-licenses/OpenDDS | 50 ++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta/files/common-licenses/OpenDDS

diff --git a/meta/files/common-licenses/OpenDDS b/meta/files/common-licenses/OpenDDS
new file mode 100644
index 0000000000..e743a00e3a
--- /dev/null
+++ b/meta/files/common-licenses/OpenDDS
@@ -0,0 +1,50 @@
+OpenDDS (Licensed Product) is protected by copyright, and is
+distributed under the following terms.
+
+OpenDDS is an open source implementation of the Object Management Group
+(OMG) Data Distribution Service (DDS), developed and copyrighted by
+Object Computing Incorporated (OCI). OpenDDS is both a multi-language
+and multi-platform implementation. The OMG DDS specification is intended
+to be suitable for systems whose requirements include real-time, high
+volume, robustness, failure tolerant data distribution utilizing a
+publish and subscribe model.
+
+Since OpenDDS is open source and free of licensing fees, you are free
+to use, modify, and distribute the source code, as long as you include
+this copyright statement.
+
+In particular, you can use OpenDDS to build proprietary software and
+are under no obligation to redistribute any of your source code that
+is built using OpenDDS. Note however, that you may not do anything to
+the OpenDDS code, such as copyrighting it yourself or claiming
+authorship of the OpenDDS code, that will prevent OpenDDS from being
+distributed freely using an open source development model.
+
+Warranty
+
+LICENSED PRODUCT IS PROVIDED AS IS WITH NO WARRANTIES OF ANY KIND
+INCLUDING THE WARRANTIES OF DESIGN, MERCHANTABILITY AND FITNESS FOR A
+PARTICULAR PURPOSE, NON-INFRINGEMENT, OR ARISING FROM A COURSE OF
+DEALING, USAGE OR TRADE PRACTICE.
+
+Support
+
+LICENSED PRODUCT IS PROVIDED WITH NO SUPPORT AND WITHOUT ANY
+OBLIGATION ON THE PART OF OCI OR ANY OF ITS SUBSIDIARIES OR AFFILIATES
+TO ASSIST IN ITS USE, CORRECTION, MODIFICATION OR ENHANCEMENT.
+
+Support may be available from OCI to users who have agreed to a
+support contract.
+
+Liability
+
+OCI OR ANY OF ITS SUBSIDIARIES OR AFFILIATES SHALL HAVE NO LIABILITY
+WITH RESPECT TO THE INFRINGEMENT OF COPYRIGHTS, TRADE SECRETS OR ANY
+PATENTS BY LICENSED PRODUCT OR ANY PART THEREOF.
+
+IN NO EVENT WILL OCI OR ANY OF ITS SUBSIDIARIES OR AFFILIATES BE
+LIABLE FOR ANY LOST REVENUE OR PROFITS OR OTHER SPECIAL, INDIRECT AND
+CONSEQUENTIAL DAMAGES, EVEN IF OCI HAS BEEN ADVISED OF THE POSSIBILITY
+OF SUCH DAMAGES.
+
+OpenDDS copyright OCI. St. Louis MO USA, 2005
-- 
2.25.1

