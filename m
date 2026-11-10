Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19.1794324483086401608
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 07:28:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=MZJM4TTs;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so18185245e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 07:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794324481; x=1794929281; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrzPkl1j3rf+qpdYwIQkcvr02Gi1hfavC70vlPqgsm4=;
        b=MZJM4TTs3ahfOIGsmw55UX4wzv+qFJJJNlUJPCHnEHFLX/pPlC0RuoGvMisFyuTrE2
         nqRMwFymo6qAfU8YJEiWi8Yq0s4xjOwPGMlyKY2qe6XzEOGt2S/dol7+Mj7wfEdVBG3n
         mwbzCkweLtUjJgOedFcPmO17k6p0LUZSgEcXR6CV1V1FLmM+hSnML8dV4vfcS6eQFZ9w
         dWT9mV/GBjaARv8I9+Ng1S653kR10KRGq8yp4s1G9ItRtNy3edGILYEUcb1EAqJaabeK
         90dGggt6n04FBBZvimJnXvjXtCtkTXtxXmOFRQUYGUc0dd2E5yELr9ne+m8EonN4bn2+
         GiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794324481; x=1794929281;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrzPkl1j3rf+qpdYwIQkcvr02Gi1hfavC70vlPqgsm4=;
        b=Oz/t1GLG2LoWCu0NMrJOaWAXsHMZBkLzlwAK1xG62h4tfPMyisHZPGwaE3ygfBgtYU
         2JhlFt7rKOddBErbfwFJ6jL45JuQlFW+SnJY+8Z0XqBmOY53kBvfjdYcc7vYpGZPjVjy
         /X2Kl+StDN+GBwc80MQO/M80UWPvYuE7KDfcHI/Num6T2zCgWmoCpb1WAa2BwOIVMQ8v
         gBq4Ew5RjzLf3+alxylWm44/g0fiHfosifeE4kBPPH8b1O7Oc6rb4x8aeTr5XscKcdB9
         zJXJiYsVP9/MV/zAAzDWPrcPJEGb9dnxECYbG0Vr7AdGR1FxHd/qn4CksI0zwqPFtNWy
         dLBQ==
X-Gm-Message-State: APuU4Z/c4TD+RNeXJ2mkdrgOG5OyP9dXvvD0snRRHHzA7gPOP0plfNDo
	Y+0QH8xLed3vEbA3kCunuYZIkREyUMm7drl6Wq6ra4d+MHnpasgZn4MJYxeizORLUQpCJc8s14K
	vTIUKnnE=
X-Gm-Gg: AYBFou2/QhCvT/4gxCOmZtkZLSGsrhx3OwmpUF22lE+3DHd8RIf4KbRVpU0sVZ7BCUZ
	P6S6oM252Xjgl9+WhsykRh2qeQEfOx5CHSqH2BfS3oeAYh+cGB6+lu+CxTVDdwTbHIaI9b0SUAg
	9Kj/oaIqnn5fCh7hQpG7ixCFLq5jDyIjHhd7xEwhXdOzWvfz9rkb/uReEgtfBE4LF4M3PomB2PO
	u0NT2ir07eyDu+xFVy4/MTUySOLEGO5a/SGN0UPyS4Feq1+1xZs5QHLqnl3kZb60+7z98Ojb00i
	BVbP3RJp/4Ai2aKcgjGMsYFWZ39LNP4P9exAquRt4mkifqZ1x0imyK9EA90+gXA9fnd67LRvQmy
	lLgYwe4BAfSU8aYyPa1NN6F3mB8zIIMFqwh3qIJ4bjaZEw2pFPvIpBoLRZ4F32yfvaRRijlAwzB
	o3p6VlPv0P7lZTYH35KJvNtCuCCm/ltvUNHgdijMs0vdBtdq/JfeVZDacl1UAJGNCpFg7J09zIw
	3ugyHmSENPIShc3X+OORQ0KHFFtLnoe6qxPC9QAZ7IL6We+mfQ5E/59sr4OoNaDf8Oi2Vr3caCe
	h/njgVZQB4ptE0FetSUYf8V3Gjd/6oDCCoU9bxqV3h52BkOhd68sr1KQl9iIT47O+jQFHn7lINA
	wZ49bvOglKsbAn9HDK8TAD+1xy1eF+l6NP/t/
X-Received: by 2002:a05:600c:3143:b0:4a1:78c5:79f5 with SMTP id 5b1f17b1804b1-4ba02355f49mr47855315e9.33.1794324481158;
        Tue, 10 Nov 2026 07:28:01 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02043149sm66691555e9.8.2026.11.10.07.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 07:28:00 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 0/1] Pull request for CVE-2026-CVE-2026-123158
Date: Tue, 10 Nov 2026 16:27:35 +0100
Message-ID: <cover.1794323281.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 15:28:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249922
Content-Type: text/plain; charset="utf-8"

This is an expedited Pull request to fix CVE-2026-123158 (aka
"sshhole").

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5099
* qemux86-tc failed with 14259 – AB-INT: NFS mounting issue on qemu
  oe-selftest glibc.GlibcSelfTestSystemEmulated.test_glibc
  => retried in https://autobuilder.yoctoproject.org/valkyrie/?#/builders/28/builds/4967
*  oe-selftest-armhost, oe-selftest-debian, oe-selftest-fedora failed on
   recipetool.RecipetoolCreateTests.test_recipetool_create_go
   | AssertionError: Items in the first set but not the second:
   | "${@go_src_uri('github.com/protocolbuffers/protobuf-go','v1.28.1',path='google.golang.org/protobuf')}"
   I think:
   * this is due to a recent change upstream[0], and
   * this is unrelated to this series (I reproduced the error locally without
     the CVE-2026-123158 fix.
   Given the expedited nature of this series, I think we should merge
   this CVE-2026-123158 fix and handle the selftest fix in the usual
   review cycle (most likely by backporting [1] from master to
   scarthgap)

[0]: https://github.com/protocolbuffers/protobuf-go/commit/b0087d0ecfdf237f44579eee415010405f329f17
[1]: https://git.openembedded.org/openembedded-core/commit/?id=d1256f8ff4a94d4f32b2b9ca855359dd2d691beb

The following changes since commit d40b840d5c7e7b0f9e94c2b434010fb63b306a72:

  util-linux: patch CVE-2026-53615 (2026-11-03 23:41:28 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to fc4316861becc9f0d41857b49f6438929ab4c291:

  openssh: fix CVE-2026-123158 (aka "sshhole") (2026-11-10 10:47:42 +0100)

----------------------------------------------------------------

Yoann Congal (1):
  openssh: fix CVE-2026-123158 (aka "sshhole")

 .../openssh/openssh/CVE-2026-123158.patch     | 191 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 192 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-123158.patch

