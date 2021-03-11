Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web08.7796.1615476442345009968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 07:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fLtpVb4t;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d8so10347282plg.10
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 07:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqFhvw//Y0VsDebStl1EqYTQImVnl2YIsW7281i+HsU=;
        b=fLtpVb4tZOAjziiErbLbnDDAz4nx01QXKqrlFzw+KF+SLbrmQRxmpaFH253naYZt3E
         R6JtkSapBrU2CzKYKpV0wTcfWo8WY73J/T50S+BWJAwwXRA6UWPD+xfvA6aqCsV5yL+W
         TZU8kni4BDI9y+Eb7gIe0SXH2Ou1WukMEa3C0lGB5ms5GRjZEs5IOwLbOazDzbbj1Gnr
         L9J81CLOL+iMj+EwrymMwdKPFrl7pCiyj7NI6Xqc9Ze10GXAO0PFOi8tHC0cEgZLyiAM
         cetrjEupYKCDOKB5Olgry+hQE6AbtcaXFzFir/Q2URmXeVDRVGuTGrvHgNthQlsGluyi
         N4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bqFhvw//Y0VsDebStl1EqYTQImVnl2YIsW7281i+HsU=;
        b=PBdz98/ThRJxb/33PJ9lnt5cfB7MRWbWi8IqPmxthDtkKNcLP5xPURxqHOHj3N00Be
         yffZN+fe0gBy1TiAFZcBkGhQWmyWzRSLhgCReLrHZfOFNmHm8ThWZ95Ah3ujPTDQdhg3
         iLElAA7CCUkWPYongiRNJqxuuN1JLuffDsNV0TLOj8uk/5KeOfwU8J1EH3oHtIEHnAM2
         UYJ71YJACm1VIKQcXWz+A1fDrrLOOEMdzkG7bh7SmBGmxjPBg7v8w4iy8oq3HJPikdb+
         xirPhG1KKsl+xIt8hjplSBWGHeKEBP6GwT+CETO3axEFi5CJ27gnaUqdlzz6f+uUsbAa
         cLOA==
X-Gm-Message-State: AOAM532qPL4ZCYMmOpk5eAyz4p9ea9f5E7Vo+ZaftZ8d+5Wlqyc7FZ4E
	Sg0Q/WiBr9uTNIJma6LQ9HnTb7q7td3z1uoh39g=
X-Google-Smtp-Source: ABdhPJyhY7XkomGFfu+1sJ6l+X8Sysck471eLnEKOuYGx9ny0whj+k0ApsqNYtKRVPfdd5EU+5YKIA==
X-Received: by 2002:a17:90a:c202:: with SMTP id e2mr9237286pjt.73.1615476441263;
        Thu, 11 Mar 2021 07:27:21 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j92sm2652626pja.29.2021.03.11.07.27.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:27:20 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/2] Pull request (cover letter only)
Date: Thu, 11 Mar 2021 05:27:07 -1000
Message-Id: <cover.1615476356.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cf22f3831488b346195e049ace92e153d18660db:

  meta/recipes-core: Add HOMEPAGE / DESCRIPTION (2021-03-05 04:40:01 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Michael Halstead (2):
  yocto-uninative.inc: version 2.11 updates glibc to 2.33
  yocto-uninative.inc: version 3.0 incorporate seccomp filter workaround

 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

