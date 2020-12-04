Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.20408.1607112474526966268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 12:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SDlI4Pt8;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id m19so10404233ejj.11
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Dec 2020 12:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d4/Zxclalua689M92IdGji7dVuWk/MJUwoHdfAYTo64=;
        b=SDlI4Pt8iUJt0s3+fKRfxwG2rvLePPG+5yO3QzE5WmuimMavLMyJYfMosKAnWedAxY
         XVUi72Fuv85hgenqausn9BmQ1baoVq38khaQBmkf5E1FOAezzwrf94fvB1XVFxBZOWWt
         +UmUzF2gOWykmI8lhPx7wKUcsIbl4mISazp5/alpPjOoql057iKmj4gBA1exdex8gYu/
         mqWepTFvczI4YxG7yRWshQd6cZTNFJSuMP25lNL6rK65hfQ/tUpSjPsd0P+07b0vrc+S
         6NRBcTVD65nxKfaLnR7CjiyPobfXpiGD4/tGaKiCQYJHAwVwSh4VllAUumOHZ7r6r0IG
         pOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d4/Zxclalua689M92IdGji7dVuWk/MJUwoHdfAYTo64=;
        b=T/fMdlfpdKUU/LKZmnPG6zfXFmMVX1wF3M7rJ17aJXtiBaJmAyqU280znvZBfMuJe6
         9cHuDWylZmYDEp41MiK00nNqjqk5lRDClOURBXbhnnLIPYktElsN7xi+xlpVhzo6jlTU
         lc56G9cqruxZwa/RfW+2ty1qVd89Hf2zzekG9o161nJ7WPGljMREV2QMtmJ+YYfQhO9v
         8S5USKu1eKAkT9Fy2uN5nIit+8I0Srm04fEelShPuhsVnFcy3ViWth0DzgkZP0C0qSLr
         Q6ARfV/wM4bgdKZq4ZuSXHsd27bm/HiJoCNbBSDCxbOGLMJGiN9AjCnqn/5gPHsDM/Yc
         aHYA==
X-Gm-Message-State: AOAM532UkLi5LqWv+VwoFhEw/mkN7Jb7SHNGdyvaNr6XgiGXjTW80Ki4
	rBZ1INfV+RxoucvLDaxAEgQRooXkCKzyTg==
X-Google-Smtp-Source: ABdhPJzEFu8/SWZPzVvWAT1B4IaWSnv+0CpgvnnJDcwpGJVDV08H87Oztw2gVRdMgaNfKCEhhUkzIg==
X-Received: by 2002:a17:906:3c11:: with SMTP id h17mr8558458ejg.20.1607112472884;
        Fri, 04 Dec 2020 12:07:52 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id d6sm3601660ejy.114.2020.12.04.12.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Dec 2020 12:07:52 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 09/23] kea: upgrade 1.7.10 -> 1.8.1
Date: Fri,  4 Dec 2020 21:07:22 +0100
Message-Id: <20201204200737.7072-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201204200737.7072-1-alex.kanavin@gmail.com>
References: <20201204200737.7072-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_1.7.10.bb => kea_1.8.1.bb} (96%)

diff --git a/meta/recipes-connectivity/kea/kea_1.7.10.bb b/meta/recipes-connectivity/kea/kea_1.8.1.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_1.7.10.bb
rename to meta/recipes-connectivity/kea/kea_1.8.1.bb
index 1d011ace78..9b104a06df 100644
--- a/meta/recipes-connectivity/kea/kea_1.7.10.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "\
     file://fix-multilib-conflict.patch \
     file://fix_pid_keactrl.patch \
 "
-SRC_URI[sha256sum] = "4e121f0e58b175a827581c69cb1d60778647049fa47f142940dddc9ce58f3c82"
+SRC_URI[sha256sum] = "52020cb16889484b661746d7fc4c7cd88974b1af5b7fc436eb6e69c62eb83734"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.29.2

