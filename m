Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 96AF2731D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:29:27 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170214212925291_0684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:29:25 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=54212 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdkf1-0000n9-T3 for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2017 16:29:19 -0500
Date: Tue, 14 Feb 2017 16:29:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1702141627380.20591@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] kexec-tools/kdump: Correct typo in comment "crashkenrel="
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
X-List-Received-Date: Tue, 14 Feb 2017 21:29:28 -0000
Content-Type: text/plain; charset=US-ASCII


Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/meta/recipes-kernel/kexec/kexec-tools/kdump b/meta/recipes-kernel/kexec/kexec-tools/kdump
index 2347205..69e3caf 100755
--- a/meta/recipes-kernel/kexec/kexec-tools/kdump
+++ b/meta/recipes-kernel/kexec/kexec-tools/kdump
@@ -89,7 +89,7 @@ do_start()
 		return 0
 	fi

-	#check the running kernel cmdline option,insure "crashkenrel=" always set.
+	#check the running kernel cmdline option,insure "crashkernel=" always set.
 	grep -q crashkernel= /proc/cmdline
 	if [ $? != 0 ]; then
 		echo "Kdump isn't supported on the running kernel,please check boot option!!!"



-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


