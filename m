Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TLfgr-0003nE-PK
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 21:42:06 +0200
Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 09 Oct 2012 12:28:55 -0700
Received: by mail-qc0-f175.google.com with SMTP id j3so4321196qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 12:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=sBpYELiF0/DbCg2TndiuruDcBCzQdJ0z5VfmbU0/o8E=;
	b=Q5UArwrFB8ZB36dyKFNwtl086xHRwiPK0JViPSusgKGzZTaueZadZqAL5P+GOFrr5Z
	X3jcvAStLBDGpcJ0vqf1gqHKDbceom/QfvHJre1U5eXKdYvfBJXxZRiZ4rTF6UOtT3nr
	hh8zXmjNbpxZOvso+42BF4SylftCCg/HH4ZGp8yp6GZFgt5YW56Kc4kCOGMGtH3s7+W3
	TRfyH/RTKptDYZZyl4juNtkgSshyiloz3eEq6R7VEV6XpTBhsQnMPMZM5IwWzTHz+YwD
	HpLmcpp90KwEn06W+eEmdNNw0i7xHhqN/OQQ9ekU+wP8Llt+BgU8aHJ2GpVv/W0BSTsc
	dPeQ==
MIME-Version: 1.0
Received: by 10.229.106.162 with SMTP id x34mr3286790qco.60.1349810934178;
	Tue, 09 Oct 2012 12:28:54 -0700 (PDT)
Received: by 10.229.110.2 with HTTP; Tue, 9 Oct 2012 12:28:54 -0700 (PDT)
Date: Tue, 9 Oct 2012 12:28:54 -0700
Message-ID: <CAPhnLPAojmKQkympwaPL4Co5srBSzUfJd+7eB4YU3Fv665Q6gw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkp2/ccQMWeTzaI7qv1GjFzVde1jbmE4TNDNJcDxPrW85QlZzgd/uTZWiLSPxiyQuxXDAbo
Subject: [PATCH] bzip license: bzip2 not bzip.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2012 19:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

The name of the license for bzip2 is wrong causing warnings
to be thrown.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/files/common-licenses/bzip  |   41 --------------------------------------
 meta/files/common-licenses/bzip2 |   41 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 41 deletions(-)
 delete mode 100644 meta/files/common-licenses/bzip
 create mode 100644 meta/files/common-licenses/bzip2

diff --git a/meta/files/common-licenses/bzip b/meta/files/common-licenses/bzip
deleted file mode 100644
index 8ec599d..0000000
--- a/meta/files/common-licenses/bzip
+++ /dev/null
@@ -1,41 +0,0 @@
---------------------------------------------------------------------------
-
-This program, "bzip2", the associated library "libbzip2", and all
-documentation, are copyright (C) 1996-2010 Julian R Seward.  All
-rights reserved.
-
-Redistribution and use in source and binary forms, with or without
-modification, are permitted provided that the following conditions
-are met:
-
-1. Redistributions of source code must retain the above copyright
-   notice, this list of conditions and the following disclaimer.
-
-2. The origin of this software must not be misrepresented; you must
-   not claim that you wrote the original software.  If you use this
-   software in a product, an acknowledgment in the product
-   documentation would be appreciated but is not required.
-
-3. Altered source versions must be plainly marked as such, and must
-   not be misrepresented as being the original software.
-
-4. The name of the author may not be used to endorse or promote
-   products derived from this software without specific prior written
-   permission.
-
-THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
-OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
-WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
-DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
-DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
-GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
-WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
-NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
-SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-
-Julian Seward, jseward@bzip.org
-bzip2/libbzip2 version 1.0.6 of 6 September 2010
-
---------------------------------------------------------------------------
diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2
new file mode 100644
index 0000000..8ec599d
--- /dev/null
+++ b/meta/files/common-licenses/bzip2
@@ -0,0 +1,41 @@
+--------------------------------------------------------------------------
+
+This program, "bzip2", the associated library "libbzip2", and all
+documentation, are copyright (C) 1996-2010 Julian R Seward.  All
+rights reserved.
+
+Redistribution and use in source and binary forms, with or without
+modification, are permitted provided that the following conditions
+are met:
+
+1. Redistributions of source code must retain the above copyright
+   notice, this list of conditions and the following disclaimer.
+
+2. The origin of this software must not be misrepresented; you must
+   not claim that you wrote the original software.  If you use this
+   software in a product, an acknowledgment in the product
+   documentation would be appreciated but is not required.
+
+3. Altered source versions must be plainly marked as such, and must
+   not be misrepresented as being the original software.
+
+4. The name of the author may not be used to endorse or promote
+   products derived from this software without specific prior written
+   permission.
+
+THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
+OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
+DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
+DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
+GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
+WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
+NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+
+Julian Seward, jseward@bzip.org
+bzip2/libbzip2 version 1.0.6 of 6 September 2010
+
+--------------------------------------------------------------------------
-- 
1.7.9.5


