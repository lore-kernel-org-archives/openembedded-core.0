Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F735C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:11 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.30086.1641226749803587844
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id o17so30910229qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :organization:content-transfer-encoding;
        bh=/N5b3Sz7Pj0sJVF2jghbG+0PzaD9Jm9yguLvYmTix0c=;
        b=vsw+k62LesL4h620ihvwBXbuqT8UaCcqF6sHQgSFQa5d7D8iJk4P4zbY3XDC2hWRmO
         VJIhf4fozjIArA7zpmN8we/l4m22JyTVIjXUmo8kQ1RZxVo8uYXZTix5VCjCkKv8eWb9
         8mpxOhfoTlMwCtD7povcvC27OeRxtWdXiF5b45rxRvB18S5q2/MClZfn9JATXbrCcRFF
         PdHwhg3yfAYsKP9h1rfzfi0naPfFNvmJBqwDrt25Lbx9lYcT8suzj6l8a1YIX8+Dx+fl
         aJAJxBSdn9DkY9ejMWhiyX3skF6wYwtwMS8WhyqnIGkUfLgg+mQSlfi5YYDxw4jyBFab
         Agag==
X-Gm-Message-State: AOAM531KuYaaeHBhgPrBV6wJdBdOWkiUPErlyZGuvQ1pjR9ZNVRv863/
	la4aSpKP75ZYJ1kScggE9e3rjpZCVY5Zzi5P
X-Google-Smtp-Source: 
 ABdhPJzARNfAZtwp7iHlHQ7bSOyAkAfrqZ2Fc7fXss3mmgNT9TfJc7LJV0f/IoCSfSpuTe+68BzlMA==
X-Received: by 2002:a05:622a:413:: with SMTP id
 n19mr40729239qtx.69.1641226748709;
        Mon, 03 Jan 2022 08:19:08 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 r24sm27679291qtp.38.2022.01.03.08.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:07 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 01/24] acpica: upgrade 20210930 -> 20211217
Date: Mon,  3 Jan 2022 13:18:31 -0300
Message-Id: <20220103161854.301148-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160118

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../acpica/{acpica_20210930.bb => acpica_20211217.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/acpica/{acpica_20210930.bb => acpica_20211217.bb} (94%)

diff --git a/meta/recipes-extended/acpica/acpica_20210930.bb b/meta/recipes-extended/acpica/acpica_20211217.bb
similarity index 94%
rename from meta/recipes-extended/acpica/acpica_20210930.bb
rename to meta/recipes-extended/acpica/acpica_20211217.bb
index 47f1b629ed..f88e904a90 100644
--- a/meta/recipes-extended/acpica/acpica_20210930.bb
+++ b/meta/recipes-extended/acpica/acpica_20211217.bb
@@ -17,7 +17,7 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3cd82a281a16bc70c2708665668f138c4fc606c31161d46ce77230454ec04821"
+SRC_URI[sha256sum] = "2511f85828820d747fa3e2c3433d3a38c22db3d9c2fd900e1a84eb4173cb5992"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.34.0


