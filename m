Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7D8A273CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:16:53 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160817141652236_0685
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:16:52 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=30737 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ba1g6-0002Rh-6u for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2016 10:18:46 -0400
Date: Wed, 17 Aug 2016 10:16:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1608171013230.13392@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] unfs3: Simplify simultaneous usage of "_append" and "+="
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
X-List-Received-Date: Wed, 17 Aug 2016 14:16:55 -0000
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  for pedantic consistency, i also removed the *trailing* space from
the libtirpc line, since subsequent appends should be responsible for
adding the necessary leading space. i wonder if that will break
anything...

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
index eba1139..e7574fb 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r497.bb
@@ -9,8 +9,8 @@ RECIPE_UPSTREAM_DATE = "Oct 08, 2015"
 CHECK_DATE = "Dec 10, 2015"

 DEPENDS = "flex-native bison-native flex"
-DEPENDS_append_libc-musl = " libtirpc "
-DEPENDS_append_class-nativesdk += "flex-nativesdk"
+DEPENDS_append_libc-musl = " libtirpc"
+DEPENDS_append_class-nativesdk = " flex-nativesdk"

 MOD_PV = "497"
 S = "${WORKDIR}/trunk"

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


