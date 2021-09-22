Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.6807.1632316444327541286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 06:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=emoZ8+99;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632316442; i=@fujitsu.com;
	bh=EUk3edQ4SPhj7Zslt71HtQLrRIXKmNZhtTbnvRoeG/g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=emoZ8+99Mu8FeZOeniRmwUSIf+Kpj3PvYPSGo9yJAibsLAPbJLVsGVp3mtUFJN5BR
	 kLwNKvqfUoNIrFuDcLyJwh7rZ9KelxXA/ZnFQnHTfkjkVdhlr85F5OseEfFLchcvsb
	 cJqcDRXGxxABsm2ha+KLZPc/1jf6wrF+G5JD3lH6LsI747gdlY+Cu13gsbNulyul9l
	 +viF4e1ZHhvYjo4x6gz3L1s4CK0FXoaTOPha8lGLt0nSVkpbAo7zxksojuUpZdSLfL
	 7lifdEbPUF4rnOtS5rrK84Rnwz2POl5JWkVC+TDU63bSyItt9dgK3hhue/23WBE2mX
	 bNVb5+6+M2jlg==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 26/EB-01625-A1C2B416; Wed, 22 Sep 2021 13:14:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8MxRVdKxzv
  R4O1LDos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNr/RS2gpkcFdPX72RsYFzF3sXIxSEkMItJ
  4tKFxWwQzglGiWetjSxdjJwcbAJqEtNv3WDtYuTgEBHQk7j6TxQkzCygIvHidw87iC0s4Cixr
  nk9M0gJi4CqxNJ7siBhXgEniSVPV7OB2BICChJTHr5nBrE5BZwlfszeBGYLAdU8eLONGaJeUO
  LkzCcsEOMlJA6+eMEM0asoMftyMwuEXSExa1Yb0wRG/llIWmYhaVnAyLSK0TypKDM9oyQ3MTN
  H19DAQNfQ0EjX0NJI18REL7FKN1EvtVS3PLW4RNdQL7G8WK+4Mjc5J0UvL7VkEyMwFFMKDujs
  YPz56oPeIUZJDiYlUV6hK16JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4PbS9E4UEi1LTUyvSM
  nOAcQGTluDgURLhFQRJ8xYXJOYWZ6ZDpE4xhnO8WbtkETPHWzDZdu8ukGwHkzMXHFzNzDELTN
  5vPwQkH4BIIZa8/LxUKXHeCJBxAiDjMkrz4JbB4v4So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5
  GJWFeKZApPJl5JXA3vQI6lwnoXP6VHiDnliQipKQamGz0y76wdt8R+PT+7ctzAs8Dw9MZyo7M
  urGTQ03+jt32ye8lcloWMRdomFrEvpR921jaX3jziWPz/RQei9mfqm/9uJ/rlTjp955wMUvr2
  66v+srjDcVzfYr0rk7z/h+9ef65vcJlfJxBBTOT45eJROgJr5t7uumeitrL6jeL9Azf3LXdbD
  8r/4+wtNGvExzznbfX/73NLGrL2b4w07HavKhNZXoVl5538d1dZzadqq/ff0Vx8Z4jm9s21jv
  cYNbi7QhNmnA26dGhyIZcmQdvfO47XuM9JWjy9dIjpm+sSeZS7zlyvGrLL2RWL8s+qca8fsem
  eXb87fsz5H51Ln57bL80n9N1iU9nNu6PWONhqMRSnJFoqMVcVJwIALifQHV2AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-267.messagelabs.com!1632316441!158236!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 964 invoked from network); 22 Sep 2021 13:14:02 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-8.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Sep 2021 13:14:02 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18MDDsuC001761
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 14:14:01 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 22 Sep 2021 14:13:58 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] createrepo-c: upgrade 0.17.4 -> 0.17.5
Date: Wed, 22 Sep 2021 21:13:34 +0800
Message-ID: <1632316416-58153-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
References: <1632316416-58153-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{createrepo-c_0.17.4.bb => createrepo-c_0.17.5.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.17.4.bb => createrepo-c_0.17.5.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb
index 500b508d72..60585fe580 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.4.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.17.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "cb74969736bdea86465e85feeceb895ff7a42610"
+SRCREV = "ab96d490bc2f606570030fe50302d466fce8f346"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1

