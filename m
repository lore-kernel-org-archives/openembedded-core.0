Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.17537.1590940469865081743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DCyt+A+Q;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l27so6907942ejc.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=McgP1lYUdQoGaYhTlmb0kLKu8Wt7FFneEmyLBKdaagA=;
        b=DCyt+A+QoElj06tOwBviNtgNoVvnbQaaHSHFvKD9/tCsENq9UxEegowRgKhknU7/4g
         +cdX17urR7Jz2ytFq4Ru6Qs0r5xgfGjbm2DiUvsMQyxKLQkUvvWTdE4LryCzrSOK6OCF
         /piS3CpqjBcu84cK1kD0ZfT2QdxpEfY8MYIjiGCAfNWszuOYF6kIDfMIBsYt2hjk0O3m
         CsopHFMGyAjogeKGPM69xU0c+S64gtVovvIncVBPzDGLRM5uA8NjEil0W2dzqEUDcRcx
         oybWsVaRzfx1e0cchD9nu9FAUKPuS73uIjTSVEf1rtNvFsLGzT02OfXcDKGh9nFb49pz
         B+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=McgP1lYUdQoGaYhTlmb0kLKu8Wt7FFneEmyLBKdaagA=;
        b=CIeF4IVk/bztoHGnHXAnVVQmFlAPoPJrnk+IuwIAsY99LvbmROHHzxXxl4llZ4SS49
         3FlWs3bYLi/tBQbtAiSKXiS49uEy560yOwLDZgq2MVf9ftYPMxIaDR0K+JbT9/jy0qSM
         gA77FraWw8g584zSskTFzY/1/JLpYG5+lNrrL0mwzZLr4bp/UVDfmAVnq7+ugRus4zsu
         cVDgw83HKIT8EKbiujP2k0sWRIi5snleke94Yyg8rvo6foE5EQaiTuNSB8pV+5HXbUCC
         EZDK50rSYwvsEgU5meB6b0Og1GaZOlD9A66G4YXTKawgi3Bh5ehLVDvkFJAk3aW1P96x
         Y0+Q==
X-Gm-Message-State: AOAM530wBdqRXoSOP3URlAzcyD1yzDtJ065u8kCFFdjf06SrMmcASkNH
	l6BHB3BJ/d7/raffzsHE+UkYrfnj
X-Google-Smtp-Source: ABdhPJxdHRceCPcHRJ8KzurgtSWUO9+F8fB7JROxt/ZhnlVH6YO3cZzS+MuDa8YB+ghegi2zCZgfhA==
X-Received: by 2002:a17:906:d0d7:: with SMTP id bq23mr1912099ejb.259.1590940468242;
        Sun, 31 May 2020 08:54:28 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:27 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 68/70] asciidoc: bump PV to 8.6.10
Date: Sun, 31 May 2020 17:52:52 +0200
Message-Id: <20200531155254.10283-68-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SRCREV is unchanged, as it already points to a post-8.6.10 commit.
(this was overlooked when asciidoc was switched to a py3 port)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../asciidoc/{asciidoc_8.6.9.bb => asciidoc_8.6.10.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_8.6.9.bb => asciidoc_8.6.10.bb} (100%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.10.bb
similarity index 100%
rename from meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
rename to meta/recipes-extended/asciidoc/asciidoc_8.6.10.bb
-- 
2.26.2

