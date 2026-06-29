Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD197C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 15:43:05 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.115.1782747782006335541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 08:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QXfvZLTX;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1635; q=dns/txt;
  s=iport01; t=1782747782; x=1783957382;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nt8yt84PT7qlfJPd2kN4hf8IkmdPYM9INvFVK2ChHxI=;
  b=QXfvZLTX5e1NE7VA3PUyTNm/5TQZDZGStwi2hs7oJ7QYpVyN10yf+kKM
   9dwfp/Ev/5JID42EmC3OoyDoLKlBePj8+66CVlSjXlYrdT5uns4oDEi4l
   ysrxMJBZPEPIGJQWzx4sr7xhmRmJJHpfpUPKiMlM+GZ0chY3sZPsMRpJb
   Bs1zdLKd4usWdpWKSBQAoKYknnkGEuZLlsTk9d4/x1dtMU7KkLU5jLMP1
   OpsUd8CZc8TFQ55QKhjAOcu1XXjWvvsRSmIGLfaoqNODllGLQi9M78upQ
   zPELjUZc3c6nqTjyzipgdCwLsU0O98BmBKS+1ShEx9H1je7TlyEXB5nP9
   g==;
X-CSE-ConnectionGUID: XynkQ6JUQf+aPq7YKrpcAQ==
X-CSE-MsgGUID: BwH5aXE4RzaSCid5jIPzew==
X-IPAS-Result: =?us-ascii?q?A0BCAgDEkUJq/4//Ja1aglmCV3RfQkkDlCegP4F+DwEBA?=
 =?us-ascii?q?Q8uDxQEAQGSUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZdBTEBGAFdWAREgwIBgnMCARG3UoIsgQGDKAExBQkCQ1DbLAELFAGBO?=
 =?us-ascii?q?IU/iB9zAYR8JxsbgXKBFYNpgQWBXAEBAhiBLmWFeASCInoShBmMcEiBHgNZL?=
 =?us-ascii?q?AFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgWmBBIR9Ix8DOX+BMHVYZ?=
 =?us-ascii?q?hUwNYEDER4KgVInAwsYDUgRLDcUGwQ+bgeMXhcPgj2BDiyCLKV2oQ8KKIN1j?=
 =?us-ascii?q?CGNPod8GjOqbJkIjgoWljqEaIFoPIFHCwdwFYMiCUoZD444g2uBf4MUwyEkN?=
 =?us-ascii?q?QIMLwEBBwIHDgMLgWiRfQEB?=
IronPort-Data: A9a23:FWcsV6sy+RrZhBcq5+OPRKi6i+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWGBPP6MM2TzKop+PYzloRsDusDQmNJkTlc5rX0zFX4UgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/zZ+Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwyvdxAlgQ1
 8EhJnMEVgnctsGs2LmSc7w57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoHSH5wKwh7I+
 goq+UzTHTFHPeyylQCX+0mHh+OSnwLDSo8NQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:d58HVqBEi+vJ5eHlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: 9a23:EBcLymNvRDDXYu5DaDhh93dKOP0cfD7U9G6PEmyiEW1AcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A2fzliQ+ZIANrkGlOmVcywEuQf+13w/mnOG1Rq4c?=
 =?us-ascii?q?PgOKFOXFyGg+PgSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="502174084"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 15:43:01 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 15A4D1800025A
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:43:01 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id AA29BCB6A93; Mon, 29 Jun 2026 08:43:00 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][Scarthgap][PATCH] openssh: set status for CVE-2026-3497
Date: Mon, 29 Jun 2026 08:42:40 -0700
Message-Id: <20260629154240.2293009-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-12007.cisco.com [171.70.97.7];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239812

From: Sudhir Dumbhare <sudumbha@cisco.com>

Analysis:
 - CVE-2026-3497 affects downstream OpenSSH GSSAPI Key Exchange patches.
 - The vulnerable code uses sshpkt_disconnect() in the GSSAPI KEX server path.
 - Upstream OpenSSH/OE-Core does not carry the vulnerable GSSAPI key-exchange delta.
 - Hence ignoring the CVE for this version.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2026-3497
https://github.com/advisories/ghsa-wcpp-3x59-h8vp
https://ubuntu.com/security/CVE-2026-3497
https://security-tracker.debian.org/tracker/CVE-2026-3497
https://www.openwall.com/lists/oss-security/2026/03/12/3

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
 meta/recipes-connectivity/openssh/openssh_9.6p1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index a1b5d4a553..40c27102d8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -49,6 +49,7 @@ Red Hat Enterprise Linux 7 and when running in a Kerberos environment"
 
 CVE_STATUS[CVE-2008-3844] = "not-applicable-platform: Only applies to some distributed RHEL binaries."
 CVE_STATUS[CVE-2023-51767] = "upstream-wontfix: It was demonstrated on modified sshd and does not exist in upstream openssh https://bugzilla.mindrot.org/show_bug.cgi?id=3656#c1."
+CVE_STATUS[CVE-2026-3497] = "not-applicable-platform: Only affects GSSAPI Key Exchange patches used by some Linux distributions and does not exist in upstream openssh."
 
 PAM_SRC_URI = "file://sshd"
 
-- 
2.35.6


