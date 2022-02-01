Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B3CAC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 07:28:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.45559.1643700528562688730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jziGIQN4;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id s9so30063470wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jan 2022 23:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yxio9zOUar0O9Qn9eMBw1BLpf0OjnwnYHKDwz/E+USc=;
        b=jziGIQN4e4ZtpqI1Xxivcfq+a3JuHQpaHMhCmTnfXRpbEC8L2sNTSdpJ9x1wYj9Jm7
         9U4bbAfCFnNGB21kJMPZN/hEPaBci5ZkcyZSC65n9XZjJ4RVko9D/ouaHxNyP2q0PUkz
         9HfyXwTJMSYosLSvAqzj0JNPEUINm4/zGlE20H/SvzxptpIY72lXQUKipYYR0EQcV7Rp
         VBsWmDzGA+sw4JkNJPMMaGbcqqA2BN3pGdDiXbxYp1Wtdg93jqnjTeVfj6K8QJk3NMv7
         RgcoiaB2kjwv+ChhAW5fzC4mZdlbI33Ug8FXgd1aiK1oaZ+k+gx9UwuMzyHAjPnvUebZ
         Om1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yxio9zOUar0O9Qn9eMBw1BLpf0OjnwnYHKDwz/E+USc=;
        b=XUK7eYZV9lXZtMneMUYrU2toJw+A5cv9wk7OM5HB9uX5TIpAoKJMKWYWk2oPpo+6zL
         chS/HAO4rATMfGsj/13u9svDryy00RTIz0Ly7I/UQYcTQLpM27EBof9AP119o3JrJCGI
         yxwU829mcaohqfFdL1XjLvBeq5izBVCdxEtT3dPnKJqeUXSkq946XVta2z+5nc/SiHUv
         VB27kNbize6QbaeIF4YvHpY5hWNxkF5cnWUmNIdbWuai2IXPRJnJ24brLeYnRZgsKByk
         kCKcT8naJ+QgmNuEFrGzJ5McOF759GvIuuDEInYOJ75AsEvaFB18Lop/M2K6gR2CYKcT
         TaNQ==
X-Gm-Message-State: AOAM533+vkId+D0Z3LD8E7ixCqez7C9nVmdXExBgo6OJ5+TkdQ6PX3DQ
	thWN4y+vC764Oyqynv01b/+2UbZTMn8=
X-Google-Smtp-Source: 
 ABdhPJwlhpIm0gZ8BAQZ+nWWLZBCbk+tmpHF++aZg/mYWsmPvEA8FYLOLq0or7rUdDJAoK/JS+6O3A==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr20137759wrt.581.1643700527068;
        Mon, 31 Jan 2022 23:28:47 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 n18sm13667370wrm.47.2022.01.31.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 23:28:46 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross@burtonini.com>,
	Ross Burton <ross.burton@arm.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Nisha Parrakat <nisha.m.parrakat@bmw.de>
Subject: [poky][dunfell][PATCH 2/8] lsof: correct LICENSE
Date: Tue,  1 Feb 2022 08:28:25 +0100
Message-Id: <20220201072831.34695-2-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220201072831.34695-1-nishaparrakat@gmail.com>
References: <20220201072831.34695-1-nishaparrakat@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 07:28:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161146

From: Ross Burton <ross@burtonini.com>

The lsof LICENSE is superficially BSD-like, but it isn't BSD.  Now that
we have the full SPDX license set in oe-core, use Spencer-94.

(From OE-Core rev: 5c1d61d1d4dfacb643a366285c0392e6a31087ed)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
---
 meta/recipes-extended/lsof/lsof_4.91.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lsof/lsof_4.91.bb b/meta/recipes-extended/lsof/lsof_4.91.bb
index b3adfd57af..7c85bf23fc 100644
--- a/meta/recipes-extended/lsof/lsof_4.91.bb
+++ b/meta/recipes-extended/lsof/lsof_4.91.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
 Its name stands for LiSt Open Files, and it does just that."
 HOMEPAGE = "http://people.freebsd.org/~abe/"
 SECTION = "devel"
-LICENSE = "BSD"
+LICENSE = "Spencer-94"
 LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429ba3b39dbb9f205172a"
 
 # Upstream lsof releases are hosted on an ftp server which times out download
-- 
2.17.1


