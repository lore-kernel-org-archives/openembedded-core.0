Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TJV1N-0006qi-VK
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 21:54:18 +0200
Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 12:41:16 -0700
Received: by qady23 with SMTP id y23so2258871qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=n6XmGGMHER9kLP7QR9aSFrVqhRtaw2xEBZVluoFKh/c=;
	b=ay4nChNboxCT/xqwcxBK1cPiE0SyAJNkck7rxM0Tl33oaKbsmUalYj6LdUqxLk8r2M
	Wgf985DVwsGVF2vtYjOIa7g0DoPKNw6GFVGQk286t6CJBdGJKUVpaZcPUk2pt4oKFi/3
	KQfvQqH7ydGjiA7wiTHzMtyN9bHrFNE4TeUhDBYKnawt05suM7AlsIW3YEdX9uS0RmAN
	1uafjU/E5yVCFuuEJFGtkSoTiuk5nJuxtKvTfOkjKSl37QVpedl/qdxvpELTBIjiENXY
	9ecAtvlCO0BiPM4tmTZToePVX8L3qio5dAfbKPU2Et3iPETSNJI6MC7NYUDnpYJMxQ9a
	tDJA==
MIME-Version: 1.0
Received: by 10.49.1.43 with SMTP id 11mr14484222qej.41.1349293275165; Wed, 03
	Oct 2012 12:41:15 -0700 (PDT)
Received: by 10.229.63.1 with HTTP; Wed, 3 Oct 2012 12:41:15 -0700 (PDT)
Date: Wed, 3 Oct 2012 12:41:15 -0700
Message-ID: <CAPhnLPCTDCOhz2Na9ehrWUbD0XQGos5HWbXyVS-LCVKLR2Ev9w@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnBNIKLeevbGar8Lb90vQvS13+u+SzhLO65RyLnkwjXNQesFIx9/Gjkdg/Osi5PLUF4Duhh
Subject: [PATCH 1/1] common-licenses: Adding bzip
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
X-List-Received-Date: Wed, 03 Oct 2012 19:54:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

bzip requires it's own specific license.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/files/common-licenses/bzip |   41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta/files/common-licenses/bzip

diff --git a/meta/files/common-licenses/bzip b/meta/files/common-licenses/bzip
new file mode 100644
index 0000000..2162888
--- /dev/null
+++ b/meta/files/common-licenses/bzip
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


