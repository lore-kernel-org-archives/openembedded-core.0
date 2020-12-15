Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
 by mx.groups.io with SMTP id smtpd.web08.8319.1608021403086790452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 00:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nathanrossi.com header.s=google header.b=cdpsVvJX;
 spf=pass (domain: nathanrossi.com, ip: 209.85.215.194, mailfrom: nathan@nathanrossi.com)
Received: by mail-pg1-f194.google.com with SMTP id w5so13979811pgj.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 00:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=date:message-id:from:to:cc:subject:content-transfer-encoding
         :mime-version;
        bh=VLdyFVY/7LqfCjUxPSdl7oK4Zvlw4plkYh1hNggxmzI=;
        b=cdpsVvJXUWsz/gfyPo3kiDkL2NCefgMm3hR1w8EteD8UESjoOI8btrVut+cq/bp7vE
         PQ5ZgkxWMPQJslcla67n7eRQkXdG3Kn+J7kv3ubp8AtRJ2bEHIiSwk1UCiON45rCUYuE
         tJnL8+D1crAQ6wosu5opjQMj9onTz8dlv0AghmC4H+/O1ZNPfqGuZwVMGBLvoGo0Plze
         2RNiILlgM8/OpnsfKNTYbzsY9CTOHiKVKjEgUZL2IkTzwOcyuMsl7hYpXv9dDjtp1QZi
         17K24XN6i700olWDJLm5scdyLnCULcllPct7R0EuNkz5ZLkjmu886AHI/O0SIqzvEWcw
         GrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:from:to:cc:subject
         :content-transfer-encoding:mime-version;
        bh=VLdyFVY/7LqfCjUxPSdl7oK4Zvlw4plkYh1hNggxmzI=;
        b=CT0Fuiksr7uNL6QWSJQBy3Bj938LjRazeCTX4g/t1FkBYsnO7Nhps+g0Dk3q5z8YX/
         LeAoFQ9r+3Qm5JHjP0mO3nemHr/MihqfFCqfnsGNRgirPefNMMvKkjSo3vFy4cuw+PN8
         nmCU+EbSvtmeayxkTs8A8MUX+l1fm1XfvEND2Yg+LLHYoyeLbRFg1DVzvTqF2aINzaMR
         cdMku8wAwKw/S9JjJY6SImNcadR81epXA2mgEIhYgFBh0TvJLAyJ7a71BZpfWM6uXCeV
         jj/XFvy1IFDcuYDFA7HZ3twLYNq1aoursoRrW/w3xaXI6yLyKsoQeofq/tH+Sx11lwlw
         lt6g==
X-Gm-Message-State: AOAM533uWTStbjrmIc9WkVEsPzOiB32nzkvLs/S1+ZjWTUQaRl3tNS5T
	aqoD2il3dE9WaHmpkLba036O2hoL0/vfWEPX
X-Google-Smtp-Source: ABdhPJy8/2YF9IJ7wnNeQ4dblNANTkkdgYo/PND7MsF38/ObepvCz3Gi+qBm1+lVeMe+TWQUfVv2YA==
X-Received: by 2002:a63:e24f:: with SMTP id y15mr18375903pgj.366.1608021402390;
        Tue, 15 Dec 2020 00:36:42 -0800 (PST)
Return-Path: <nathan@nathanrossi.com>
Received: from [127.0.1.1] (117-20-70-209.751446.bne.nbn.aussiebb.net. [117.20.70.209])
        by smtp.gmail.com with UTF8SMTPSA id m30sm16339155pgb.26.2020.12.15.00.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 00:36:41 -0800 (PST)
Date: Tue, 15 Dec 2020 08:36:36 +0000
Message-Id: <20201215083636.1361318-1-nathan@nathanrossi.com>
From: "Nathan Rossi" <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Cc: Nathan Rossi <nathan@nathanrossi.com>
Subject: [PATCH] sed: add nativesdk to BBCLASSEXTEND
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-extended/sed/sed_4.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sed/sed_4.8.bb b/meta/recipes-extended/sed/sed_4.8.bb
index 39e3a61df5..048db47e14 100644
--- a/meta/recipes-extended/sed/sed_4.8.bb
+++ b/meta/recipes-extended/sed/sed_4.8.bb
@@ -63,3 +63,5 @@ do_install_ptest() {
 }
 
 RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sed', '', d)}"
+
+BBCLASSEXTEND = "nativesdk"
---
2.29.2
