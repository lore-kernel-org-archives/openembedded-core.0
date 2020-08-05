Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.4639.1596624780458386632
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 03:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bytesatwork-ch.20150623.gappssmtp.com header.s=20150623 header.b=AlusmYmW;
 spf=pass (domain: bytesatwork.ch, ip: 209.85.208.50, mailfrom: daniel.ammann@bytesatwork.ch)
Received: by mail-ed1-f50.google.com with SMTP id bs17so13409681edb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 03:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcisS/VXvc6vAq0VEjcvghQIPb+YHrd51XFNdFSYQzI=;
        b=AlusmYmWrfCWY6EqbRPCwfDLO49hjCATKib9NP6R8HF+0CQ74dWiGi7WHsIYK528ya
         7vfg/YaCRkEada++f0N9/0DTioRpBzgWrT+QnSCeZAKotNtWx2IsW9desJL0/RsG0GwH
         0gtlXz188gkTXes7H6Kh0Le87su27UjbmsZnMAZKLyEIm0qjvQ451K6AwFJ8+1xB5Ngq
         m/iO5zmbxgfEwO9JVaj3Zy8Tgm0FL5MxXPG2XKzi5vpehHBmM/DKjjgQKiZNDSEmdlwT
         efrn9xM0f91Y3NB5Hp/+cVRYL0miz4EOYgBwknPjYUpV0Tjbq3IoNMNM6L3KcZb/uP5J
         d0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qcisS/VXvc6vAq0VEjcvghQIPb+YHrd51XFNdFSYQzI=;
        b=KNLwjVZ/Y/dwuegaTFI0sBAoAH113vAfCvzSe3myQY/4HXr5TlHXQRMXyXTZv9alHU
         noK9eCBs1/Kc0jp9X8jN/D8SYj00t5sc6yIkbcbmWXoRprJP2VoRHSjj5oyouqyEd5/u
         N0Pij5navx4q6FVFGDSRvva9s0WHyzZV35XAENmyzTzx+UpfGLA6F3jPlvAlvQl7KmaI
         qLc/fXhix6J8FZMSuyi00MiD9MrOVZEfYGiv3lReopPhtESU0O1H/I3wq7Zs1Id6sFq1
         wKRY8kQsX60Toae3T215T/JmJ0Qwp7FWk0nGQj2uquKRU0KiyiJ794LCZQKDU0HvsJW+
         lIng==
X-Gm-Message-State: AOAM531mtGPIhDBmpRQpoiaPszn7Lwl3jEcj+ju0ayyXG7sHeseqwlLY
	VzwkGAuWkL9Hhw7y/u60efC8SUHG4A0KuA==
X-Google-Smtp-Source: ABdhPJytoR3Qo9SsOs8F/JAc3i/pzzZ9/HU/GkLDgOhkeCKGmNGx/uF+nIj+mals7mkGrOR5xmLqzw==
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr2092225edg.61.1596624778827;
        Wed, 05 Aug 2020 03:52:58 -0700 (PDT)
Return-Path: <daniel.ammann@bytesatwork.ch>
Received: from mimas.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id pv28sm1289753ejb.71.2020.08.05.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 03:52:58 -0700 (PDT)
From: "Daniel Ammann" <daniel.ammann@bytesatwork.ch>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: fix typo
Date: Wed,  5 Aug 2020 12:52:43 +0200
Message-Id: <20200805105243.18499-1-daniel.ammann@bytesatwork.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 138986a71e..5dbe2558d2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -141,7 +141,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                     break
 
             if not kernel_name:
-                raise WicError('No kernel file founded')
+                raise WicError('No kernel file found')
 
             # Compose the extlinux.conf
             extlinux_conf = "default Yocto\n"
-- 
2.20.1

