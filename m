Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.10674.1611060179719584244
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 04:43:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hw09wZDq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id l12so14358048wry.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 04:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=dWS3HgDre3r37I8F6yGO0attajHS15DTKvhg2B3Latg=;
        b=Hw09wZDqs68DNcz/6tY76oA5iBDDRqic3DTBe96RW4Mcdd9xPJAkfpYV7nB9hledQQ
         oQv/659eN77Bk5JVlLQMuVZHRKXJqqq6OLwQUeHxXG5RYH9QrHrxzgEVkK3Of/ndlyXZ
         e1ZRtIE9E8gkaKwN1MYWKuyXiBGWcGWWLHF1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=dWS3HgDre3r37I8F6yGO0attajHS15DTKvhg2B3Latg=;
        b=iamLzw98vY6Zs9I0wHHhhhXXhPr4ont3Tm+d9q/g8f/U3EwGwybe2g+tOpNH1WwDX4
         y/LBXi5SCfGytrsus1+7HPQUCaTPpI8RZfx088T5u9qW1b1ppPSoEIbXx2I2lY9QIFFA
         5pG0nFIjlmyavVKxGMTUk20S4p+5/YFPhMhfrBMPs9NVNHUkD0bgpZ6yAbrTvk9RyuO5
         tycaV7XttWeN/1n2IcGs7RsWMzRnF5lzjvfcd9ol0qg+xA1XIqZQ+Os7XC6w3LB7iVeO
         hTypt4NckuBjCUhi+h7HFUhjYGWzkwth2So2veskTEnYkxFl9bRLp9uUW6FSrbLxp8K/
         l2Vw==
X-Gm-Message-State: AOAM5313D756ROIZeMOKNP3XmoGVaJNQsaydBGuVsiR9hScQOsSYdRwv
	QbELFncz2QoKhPlYYrhZ5/MTwQzpn2/HCA==
X-Google-Smtp-Source: ABdhPJxEFqzRpQYX84Zq9CgR1lb14ws95DwXV24xgIqllgHajDEn0JNVkXgXqZXwnW1b6Hw8LXdDdQ==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr4175148wru.201.1611060178361;
        Tue, 19 Jan 2021 04:42:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id g132sm4695074wmg.2.2021.01.19.04.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 04:42:57 -0800 (PST)
Message-ID: <1d7e0c43f5afc2b5f1497b26cd3e48434157b6a0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ghostscript: CVE-2013-6629 Security Advisory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Wang Mingyu <wangmy@cn.fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2021 12:42:57 +0000
In-Reply-To: <1611035125-38834-2-git-send-email-wangmy@cn.fujitsu.com>
References: <1611035125-38834-1-git-send-email-wangmy@cn.fujitsu.com>
	 <1611035125-38834-2-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 13:45 +0800, Wang Mingyu wrote:
References
https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2013-6629

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../ghostscript/CVE-2013-6629.patch           | 28 +++++++++++++++++++
 .../ghostscript/ghostscript_9.53.3.bb         |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch
new file mode 100644
index 0000000000..dffd215b4d
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2013-6629.patch
@@ -0,0 +1,28 @@
+Subject: [PATCH] CVE-2013-6629
+
+Author: pchelko 
+---
+ jpeg/jdmarker.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/jpeg/jdmarker.c b/jpeg/jdmarker.c
+index 3fbe5c1..ea3ef4a 100644
+--- a/jpeg/jdmarker.c
++++ b/jpeg/jdmarker.c
+@@ -382,6 +382,13 @@ get_sos (j_decompress_ptr cinfo)
+ 
+     TRACEMS3(cinfo, 1, JTRC_SOS_COMPONENT, compptr->component_id,
+ 	     compptr->dc_tbl_no, compptr->ac_tbl_no);
++
++    /* This CSi (cc) should differ from the previous CSi */
++    for (ci = 0; ci < i; ci++) {
++      if (cinfo->cur_comp_info[ci] == compptr) {
++        ERREXIT1(cinfo, JERR_BAD_COMPONENT_ID, cc);
++      }
++    }
+   }
+ 
+   /* Collect the additional scan parameters Ss, Se, Ah/Al. */
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
index cbf60c8c85..24d17da263 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.53.3.bb
@@ -29,6 +29,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2013-6629.patch \
 "
 

 SRC_URI = "${SRC_URI_BASE} \

Does ghostscript still have an open issue from 2013? I'd like to
understand a bit more about the background to this patch and why
upstream haven't taken it...

Cheers,

Richard

