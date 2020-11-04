Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.12826.1604495872266979703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 05:17:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=hxEC8dPO;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.172, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f172.google.com with SMTP id o3so16573848pgr.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 05:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=k79ME+5qmWzeGxfHqWbKPImGhaztkQIhkOnDmfKbTBM=;
        b=hxEC8dPOjxLjHEoLhlFA+e1wIwiNYVjJbbdBLoDyj0IqalrWt3HSDnacThvkoU5lIO
         dBYeteykvLTHQAYrUxe8iEhpeyUL/bIHr60rBtgs22T68BJQ+olkjeFkBGGsdISbbXM2
         5cOqeJokihD/+pdWZ9+kJV9p4IFHQA3W4XioY7HzjmScPHI71+OSxBoslF+q4osQnBML
         toI6PaXVQQl1rPYldeJF9eosFajFsO44IsdWxwmiB/neEMnh2hi6fIpENFIEjwfU103a
         LXzfi8tdttsxUqkGgA5i7t8GL1nWgJdj2B3/V4vpI33r5qsnqVDNcOmZkLHeAFvtoz3R
         tcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=k79ME+5qmWzeGxfHqWbKPImGhaztkQIhkOnDmfKbTBM=;
        b=BKFT9xmr6teDXkWz7yH1rDrc1c3qAixV4n9VHcxKRd1Fp6JsHfVpytYjtfEbJVmTG0
         gvEGMYB/GIpaf794E+qgkw78Ik7YMKqYGSzmKxvQe0zq3FNcxNeUFGbde1yeEQjFck6a
         NCj6q+gT21X0ONzUj+Zased64jRmosUd68SA2s37gTXwM5LuSFhpDwhaKLYE4HnG8KD4
         RGh47xYgwHknC1CBqtSGn/b4/26CQ+/xIUk6oYs+mfcCf9OTO/Dcf0wM+JsJzUX4S+9g
         owNhETgTHM85zuibpk08w15rv582Es0Rv9E3T1wGdax9iByN3vZhUtFEn2wlhIgNBokz
         kySA==
X-Gm-Message-State: AOAM533WHk6rcF6PLK5+ybarpUKW/5P5RjkZ698iQaXBSjt7WcT4QIw8
	3cRJLr0vvM0JwOH9jEYsJrTVbw==
X-Google-Smtp-Source: ABdhPJx0eITYc1r1nRIQGoDI28P1eJfkU/nACOYaPuvcNWg4bQGtDiGfw9wj3eoSp3lsz5JHiuzhsw==
X-Received: by 2002:a63:ea0f:: with SMTP id c15mr21468743pgi.367.1604495871809;
        Wed, 04 Nov 2020 05:17:51 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id f4sm2315159pjo.29.2020.11.04.05.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 05:17:51 -0800 (PST)
Date: Wed, 04 Nov 2020 13:17:45 +0000
Message-Id: <20201104131745.397780-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] vim: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/vim/vim_8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
index 709b6ddb55..7e4654e472 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -3,7 +3,7 @@ require vim.inc
 PROVIDES = "xxd"
 
 PACKAGECONFIG_class-native = ""
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
 
 ALTERNATIVE_${PN}_append = " xxd"
 ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
---
2.28.0
