Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.8175.1599689829326115922
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 15:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=yVk+H00R;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.67, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f67.google.com with SMTP id di5so2380786qvb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2020 15:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c3hF9gEk5m+6rkYYyl++cR1P/A+EO7I53nPqRiV7sQ0=;
        b=yVk+H00RoECyiX8V1BMgq+qzJo/rn3cCOUkUpfYo2A8+P5Q6fWF6TQX1ELNQvmH4Wg
         Cwalp+dRysKhxHatZ3nvSfLutOaeN//Ju5phJjRAqlH0rxHI6FCTdwCFq6KRlPjAf8Bt
         zwmROsq/NpCz027cvzP+wHmipqS5xqwUpOe4TAEhB+DlB5ieVSqCY7KmS3i/LNGAdqna
         jMauVvWmEa6EtMS5I26KjO0BzSOaFPvWM5AzkRaZm908Ljs3ETCGFg+E+Ctbuigusanc
         oB4qWRxGFOrIKDYRUavWpws1pXeEpU0/eriPuD00gIqemuV35VC/gHmX/ZcNAIEXwRs1
         6uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3hF9gEk5m+6rkYYyl++cR1P/A+EO7I53nPqRiV7sQ0=;
        b=LyxezA+59X3A9bvX1KEFA11JPf6HWP1vnDjZR3O/yWhc7yirjGfDq8WT/yUkg/HO6y
         MQx1dy+JWNZ9YPw6tnz5jCRZZSEb79tA0O9ZS+b6+d9ZfLkKQqItxJagCzliIRy5OMmF
         X8afJcZbSQJGW2JLfwduLhdb1BY+6q8XuwKZrzxTybfRadkvURgRWeOsTaNLNzVjSPu7
         4mDWSIlxDt7CnlNlNkcTtTrXQZXSB4ky94IgLwRgazgWL+Vm6XUF+Pr25N0cjm+Rm9UJ
         qeJDd1XArWfwKhWf146QaTQ2VzBf+I7KH1B+h0WlDAjqpf96HPv9gOtRiPT9r6IKOYca
         vaKQ==
X-Gm-Message-State: AOAM531gX0SjLvKZcS32P2vnb5lEqYQKpbPprXtYwXM1VhoTLzWcnwat
	6P81s7WzbDGCmOqGiKbchZ7Tvr0qFvoYpbqZ
X-Google-Smtp-Source: ABdhPJxeUJR7UkIwEB/AmLv16v9MExPzWTq4OKkCLSnXyX3YqWJQCcSoRfulg9F9bgn+6aWsJ34yLg==
X-Received: by 2002:a05:6214:292:: with SMTP id l18mr6038359qvv.11.1599689828274;
        Wed, 09 Sep 2020 15:17:08 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id b43sm4882906qtk.84.2020.09.09.15.17.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2020 15:17:07 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] cortex-m0plus.inc: change file permissions
Date: Wed,  9 Sep 2020 18:16:49 -0400
Message-Id: <20200909221652.6750-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200909221652.6750-1-jon.mason@arm.com>
References: <20200909221652.6750-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File is executable, and should be read/write.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/conf/machine/include/tune-cortex-m0plus.inc | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 meta/conf/machine/include/tune-cortex-m0plus.inc

diff --git a/meta/conf/machine/include/tune-cortex-m0plus.inc b/meta/conf/machine/include/tune-cortex-m0plus.inc
old mode 100755
new mode 100644
-- 
2.20.1

