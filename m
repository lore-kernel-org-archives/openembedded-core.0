Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REj2n-0007TI-E1 for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 16:47:34 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EEmOOY019963 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:48:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wGgeQbMUIx08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:48:24 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EEmKp2019945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 15:48:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 15:41:37 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318603305.2342.19.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] arch-ia32: Add a generic x86 override (instead of i{3|4|5|6}86 and so on)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Oct 2011 14:47:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
index 96980d2..a52e33a 100644
--- a/meta/conf/machine/include/ia32/arch-ia32.inc
+++ b/meta/conf/machine/include/ia32/arch-ia32.inc
@@ -12,6 +12,7 @@ TUNEVALID[m32] = "IA32 ELF32 standard ABI"
 TUNECONFLICTS[m32] = "m64 mx32"
 TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "${X86ARCH32}", "" ,d)}"
 TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32", "", d)}"
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "m32", ":x86", "" ,d)}"
 
 # x32 ABI
 TUNEVALID[mx32] = "IA32e (x86_64) ELF32 standard ABI"




