Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF49FC982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:31 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43678.1789974443062340331
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CzRlY3V1;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so36072575e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974441; x=1790579241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PLyeS3QL+oNoyfmCtfFvUyiSPQVk7P7iVWLBYNWtgjM=;
        b=CzRlY3V1CvDIGmxFPBREC0rc94yklYO2wqAKAziANQGOYueiOmYo9L+mWxSmGhJJMn
         MFwCmRCnbShxeO9F7Nn1fYrPhtMH6aV18TByYJkJ5czJPiIWenERqDp8UtRH3u5SU/MF
         0MGcSdgKpvobZdCJMaN+hhXbU9+bUCogWukro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974441; x=1790579241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PLyeS3QL+oNoyfmCtfFvUyiSPQVk7P7iVWLBYNWtgjM=;
        b=Wn6hjoTEPurZEdKMShtRANMsYML+/u8u1f4YxjwNIu8LD8v05YrUYtiQ4mwZX1l0Zg
         BQLhsoNlU0ppx1wf9w3OmJoj4twQWLU9YdY2Z4BxuHZLpFNKNrSttRJJ9J4IbJfyjz/F
         CrmgCdpTBItA1V8YmQkTK0KRy1B9+IyFR8Nyu6c3W+uTC2wm1oJJdT2HzIwPUxKuNeBS
         tEnxQoXen3VZar5wmLlpV/JlL5j2YuYGT6AOa2bL31KMpJ4rKbzOL7Bp6d8Z9xAgQ6Wy
         mJOhuZUShZPMi4mMGkNBQi9bB2EX9YmLjXZQ2X4oqGZmhqqpabA3jGqhWrZl2xwLL0Jl
         8dcA==
X-Gm-Message-State: AFuF++koipZdFN4qC08EeWq8weA/ya/hqaRQ4bSokqHCoyjHOiFE2eTK
	8WejEnED+1OC4f51J2YF6m2EGbScbduf9bRapRjAYFLPaaQD5Jzv25ToHsmzMdoDQhe47oKnuXY
	bJRKU7YI=
X-Gm-Gg: AYBFou12fmlb1EmXyezsgx4U5Q/aEI3d63Z04zwZDNPIOlk7eolxG5gcaodQ/boAvuP
	iv+sVaJxpwUeVXZccfB2CwnaMCR7mQCDR0YqNuh/4qnsb2YFOcSQaIt7Iz6+LCOxGJrdOZcndH5
	Uzru9OToGr7NzGR23xKtzVFe4hT5CEUonUDx+H2gpmbkfMeoHR12YdIC2Y8ZRXbBGSmNqeP65OF
	yrBAWQ6BZ+dSwSXVZQgTJTOYkph92dzcaqQ6ML3aYavqQASqt2XnT2ww04/2C38ejcD9TUd1HAN
	Zmcxhq7PccSwzKEtT9tH54/lhM7+RVKWUb1k4V76NhLqd2NeI47l2dCZwX3dODFSVEKmCfdkbaQ
	dudrsAwco5MAliOIiaZT89/QoJpwMmpqYACRHGD2yom1C1YrBNuDkeNCfdQDFwi7XznfRmuH+9c
	fZZkz68FLmkS8/mNI7ogjfzxJ8UWV2mjPdMfvVZ7T/LdHqVH1FSPpABweOPoXQmhVGn/FFCnL5m
	H4CN5+7zTrsfmLQcQzrGebOtR4+bHB85IbNcw==
X-Received: by 2002:a05:600c:37ce:b0:49e:799a:8952 with SMTP id 5b1f17b1804b1-49fc5743c81mr133894105e9.26.1789974441187;
        Mon, 21 Sep 2026 00:07:21 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/20] ppp: upgrade 2.5.3 -> 2.5.4
Date: Mon, 21 Sep 2026 08:06:52 +0100
Message-ID: <20260921070656.521680-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246303

This is primarily a security release, fixing several vulnerabilities including CVE-2026-75883 and
CVE-2026-85495. For more details on this and other vulnerabilities fixed, see the github advisories at

https://github.com/ppp-project/ppp/security/advisories?state=published

These range in severity up to 6.8 (moderate). Many of the vulnerabilities are actually only of
concern if pppd is installed setuid-root, which some distros still do, though 'make install'
in this project does not install pppd setuid-root.

Other changes include:

    A new environment variable is defined for scripts, called PPP_SCRIPT_INSTANCE, which contains
    the original name of the script (e.g., ip-up). This can be useful when the name in argv[0]
    gets lost because the script is executed by an interpreter.

    New options 'strict-script-checks', 'nostrict-script-checks', 'strict-secrets-files' and
    'nostrict-secrets-files' have been added. The strict versions are the default, and the
    nostrict versions are privileged. 'strict-script-checks' enables checks on script files
    that are run as root (e.g., /etc/ppp/ip-up) to ensure that they are owned by root and not
    writable by group or other. 'strict-secrets-checks' enables checks on secrets files (such
    as /etc/ppp/chap-secrets) to ensure that they are not readable by group or other. Previously
    (and now with nostrict-secrets-checks) the check was done but only produced a warning; now by
    default pppd will refuse to use the file.

    For EAP-TLS and PEAP, the verification of the 'common name' in TLS certificates no longer
    stops the comparison at an embedded NUL character. The pppd man page now notes that the
    default verification mode is 'none' and that the 'suffix' verification mode doesn't check
    for a '.' in the common name before the matched suffix (this was the behaviour previously
    but the man page was incorrect).

    Many more options are now privileged, in particular all of the RADIUS plugin options, and
    almost all the options relating to EAP-TLS and PEAP.

    OpenSSL engine support in EAP-TLS is disabled by default, since engine support in OpenSSL 3 is
    deprecated. If you need it, use the --enable-openssl-engine flag to configure.

    Pppd can now run as non-root as long as it has the CAP_NET_ADMIN capability. In that case,
    scripts are run as the invoking user, the user can use privileged options (provided the pppd
    binary was not marked as setuid or with additional capabilities), and the ownership checks
    use the user's effective UID rather than 0.

    Various pppd options that take an integer argument now enforce sensible limits on the value.
    This aids in avoiding edge cases where vulnerabilities may lurk.

    EAP-SRP support has been removed. Previously it was disabled by default.

    Extra length checks have been added to ensure that the pppd code doesn't access outside the
    bounds of received packets, even when such accesses were harmless (i.e. within the bounds
    of the array that the received packet was stored in, and not affecting any result).

    Various other minor bug fixes and improvements, including man page updates.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/ppp/{ppp_2.5.3.bb => ppp_2.5.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/ppp/{ppp_2.5.3.bb => ppp_2.5.4.bb} (98%)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb b/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
similarity index 98%
rename from meta/recipes-connectivity/ppp/ppp_2.5.3.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.4.bb
index 18157821690..6f7977ece37 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.4.bb
@@ -25,7 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            "
 
-SRC_URI[sha256sum] = "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c5509158e99e148f572d4f"
+SRC_URI[sha256sum] = "379a630a40d858a1347f6592d671791dde12101697a743ef9900012f3765be31"
 
 inherit autotools pkgconfig systemd
 

