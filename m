Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
 by mx.groups.io with SMTP id smtpd.web09.24148.1629726804022535172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Aug 2021 06:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gherzan.com header.s=fm2 header.b=dJ0gYsk1;
 spf=pass (domain: gherzan.com, ip: 66.111.4.27, mailfrom: andrei@gherzan.com)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id CE70A5C0289;
	Mon, 23 Aug 2021 09:53:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Mon, 23 Aug 2021 09:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm2; bh=VvTd407WH/WtWvFQM0STei1Cht
	QofsTE33LbHww3fuw=; b=dJ0gYsk1JopN6chKHtTr4EmwgQBWKsL3DXmehHYqmN
	5jYyfb2F50lKELlszLDAG7E1KdVJSOGtsKhT5aVfkHDapBmgE7ta0X7Arxe09FqC
	Map41N4vi2rTdko9CntRsajGJSokZvN0joSyIDbgIur+QrTgaquldcSJdB9WrJHY
	ipyrvAPyvSMsFi5qoI3qdsURSPB8LKAXoefXORu1labwjuhn6DzTMu3CyJ7Egnon
	AEUdPMmht2PTjyV84VeQ9x8rM31xg/UptZkS3+zJncDE4lJ/e4tHdMdoRwxqgLR4
	hqEoP+coAOEJCTvrw58Ktd5O6fOe/MA9R1xxIvPPn7mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VvTd407WH/WtWvFQM
	0STei1ChtQofsTE33LbHww3fuw=; b=Z5qxSm2vcHGWekaz4U55FbpNB1deKWXW5
	VAlPABriYduHGgIAH3hcvMFaOMGl9OdFGoakDoyxo+RwdCMlsQzCXJkEhaTeerR1
	1GPeGj/eqNs7KzQuFvAm7wO5Tydnx9fWCn4/xsHxntjEF5MSMskEai9VukOnegJy
	nqXMDnHN31eKZ+eUQ/jGKxkNq6pQdvvRdZ5qqo0jbDyUtZnHM9FrYv6AL+ABM9QN
	b6dqEgLNcHaxBDcl0R7/w/ooeiscXl79oMnDT/VL1Z2B5cr1E7rXnBIVcKe6z7pb
	EgxSCkKi5JHW3fYTtqaYH9PKbXMtrIP3bIcmbgZx77krPgLXZLa5A==
X-ME-Sender: <xms:QagjYTEqQQa6S7pIfu_oiZOf_PWrkUZl9yphe_3_NuEyKctwPxkOhw>
    <xme:QagjYQUZyeDYP0KvjlRM9QAfm2xrpquPeyaHRF5d_BH8sMbqVCytnPzlYvYOT0j4L
    s1u3y-hxfEzWl1hpWA>
X-ME-Received: <xmr:QagjYVJ9FsA0r6mFYXIKi5ih4PNDjBe6_YDNl1Ku6PpSqXr7K87a_eqIumf_7faL-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddthedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgurhgvihcu
    ifhhvghriigrnhcuoegrnhgurhgvihesghhhvghriigrnhdrtghomheqnecuggftrfgrth
    htvghrnhepfeevjeevfeejtdevkeeigedvueeileevffevgffgjeejfedufedtvdduteev
    teeknecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvihesghhhvghr
    iigrnhdrtghomh
X-ME-Proxy: <xmx:QagjYRF0puZfMUghX8i7pQpRdXa_oRAVIKR9otGRrxep0In3nQxNnA>
    <xmx:QagjYZV1Fru9IRiBAQn0EwRmqfuupikIqOYLuOuMIc63uOtKhd-zYw>
    <xmx:QagjYcOKdvJSmSe_3OveCANZogskJzQqUxqfK-EuqXagHFDfMJ-8-g>
    <xmx:QagjYWjAQFcKCDfmxEY1VfmrV_XOjRb8TgVG6QKhRD8Rb9L3v_D81w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 23 Aug 2021 09:53:02 -0400 (EDT)
From: "Andrei Gherzan" <andrei@gherzan.com>
To: openembedded-core@lists.openembedded.org
Cc: andrei@gherzan.com,
	Leif Middelschulte <leif.middelschulte@klsmartin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] bitbake: fetch2: fix handling of `\` in file:// SRC_URI
Date: Mon, 23 Aug 2021 14:52:49 +0100
Message-Id: <20210823135250.767173-1-andrei@gherzan.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leif Middelschulte <leif.middelschulte@klsmartin.com>

Using backslashes in file:// URIs was broken.
Either the resolver would fail or the subsequent `cp` command.
Try to avoid this by putting the filenames into quotes.

Fixes https://bugzilla.yoctoproject.org/show_bug.cgi?id=8161

(Bitbake rev: aa857fa2e9cf3b0e43a9049b04ec4b0b3c779b11)

Signed-off-by: Leif Middelschulte <leif.middelschulte@klsmartin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/fetch2/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__init__.py
index dc99914cd9..ece07f611c 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1525,7 +1525,7 @@ class FetchMethod(object):
                     if urlpath.find("/") != -1:
                         destdir = urlpath.rsplit("/", 1)[0] + '/'
                         bb.utils.mkdirhier("%s/%s" % (unpackdir, destdir))
-                cmd = 'cp -fpPRH %s %s' % (file, destdir)
+                cmd = 'cp -fpPRH "%s" "%s"' % (file, destdir)
 
         if not cmd:
             return
-- 
2.31.1

