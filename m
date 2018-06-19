Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 5EDF5754AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 10:51:48 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id j15-v6so21249581wme.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 03:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CcNBlaqz00ub5Km1DZlJrtpGOnlnJOvirq/AmLxr7i4=;
	b=atn6TTMLPyInhDfTpOSYtmoyt+GNZYfcPMtNa6ve+TIb4MwdOVqIhLQS35saxNRfsd
	wyWoO82OyJp0GOeJgXwJ6PZjJN+wkFFztDmAhiriQMEGnkHbWCLhXu8Wy9s25surpnau
	npfPX6chOC7f9ZO/EoQbQBUqehOpbnCJCxxbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CcNBlaqz00ub5Km1DZlJrtpGOnlnJOvirq/AmLxr7i4=;
	b=MJTdiT0poZbqlQLqZ1zEbAI+8rZwV8UFVnpj+iFClpyyxLcraJfI58hZK4RMiOke7f
	CaDV6tq2CvGkAZvOpMWCAZq1TN0m7flA9hhEFzegcQxZVXhkx4yDJI9I6mwXyWoyD48g
	kFMxk37Lu3eiZBtFKydWEvVG7ldSo83YJMM3v5lA6cCMsJU0TtochbXYVrIxxprisYyO
	8R3H6F/owd4iVTfmRtUFFeLv5bpsAQyGs/KAtbsCIqqNvrxWrf6AcEVSVs095TjNnSxx
	6FfQCCDL3x6NENWVQdcAXvCSfa8pghBS0Mv/D09Gq6ILKiW6fESWlYrk2v0keORLZOjp
	t8+g==
X-Gm-Message-State: APt69E0uLa5yka338O/ROGF/fpFcfbi7ND+z8w9DOJ6GjJTh2MtTmFjY
	hZlh+XC34fJBoYkHn+cZDVQW9i9vKfo=
X-Google-Smtp-Source: ADUXVKJ57lKiKfSPCnMRPff8BV74cJ0l+16jCJNHlFITeBh2/AaCLEObQ8jIeUg7nW67LtV8sgDShw==
X-Received: by 2002:a1c:9a51:: with SMTP id
	c78-v6mr10990017wme.118.1529405509008; 
	Tue, 19 Jun 2018 03:51:49 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n12-v6sm15312083wrp.69.2018.06.19.03.51.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 03:51:47 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 11:51:42 +0100
Message-Id: <20180619105144.10687-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
References: <20180619105144.10687-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/5] rm_work: The do_setscene task has not existed for years
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 10:51:48 -0000

Once, there were do_setscene tasks but this hasn't been the case for years,
drop the old code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 07e63c31ad2..b45b18ce01b 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -50,9 +50,6 @@ do_rm_work () {
         for j in ${SSTATETASKS} do_shared_workdir
         do
             case $i in
-            *do_setscene*)
-                break
-                ;;
             *sigdata*|*sigbasedata*)
                 i=dummy
                 break
-- 
2.17.1


