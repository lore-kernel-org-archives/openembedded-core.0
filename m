Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1TM1Nk-0000EW-FF
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 20:51:48 +0200
Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 10 Oct 2012 11:38:33 -0700
Received: by mail-qc0-f175.google.com with SMTP id j3so672745qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 11:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type
	:x-gm-message-state;
	bh=PWPgMgaLP8LrTUL1QV29Je3MEaCUnNJa+S6EOtbgavU=;
	b=GPy4zoti4IVciwMa4bfFpIgjmp+mm0S2yMbmJRBibsycoc0PJojViHk6n7raBdIDRL
	AqE9W8euTxIt6VOWQkndo69w7ErHnoLFrtvVxbptn7OJ6QUk67aIVqF8mI0GowPUgDvw
	EZen1VXAhjnxrCnOr07/m7rqZjn6EkdQlLNLhC/JYMPTEBsi8XeHZZn/AqMe6GwJmUcu
	NIH3PezjGHgQBbKKNa6bKbJMp4p257HgeveLLVEvTO9EOxKZUBt3IVjwdoCb2eiuVag8
	Gx8gdBnJn7G3ImBev4Hbj4K40fz2WmtTOkZRvpd1eBsZx6Pb+IITHpCBcJjx63TnNNCC
	PK6A==
MIME-Version: 1.0
Received: by 10.49.85.194 with SMTP id j2mr4044919qez.54.1349894312394; Wed,
	10 Oct 2012 11:38:32 -0700 (PDT)
Received: by 10.229.110.2 with HTTP; Wed, 10 Oct 2012 11:38:32 -0700 (PDT)
Date: Wed, 10 Oct 2012 11:38:32 -0700
Message-ID: <CAPhnLPAbtmonYG1cL9m5QGVmWC7hQ8jQA6KVuuXnUhHSWa_jAA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmY7dcSc7IEgFG77Op6dRd7L3n//QYTHJecmckzVdEatn+ljmRSBjvTbsFOFhTBNA868rf5
Subject: [PATCH 1/1] build-appliance-image.bb: Bumping SRCREV
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
X-List-Received-Date: Wed, 10 Oct 2012 18:51:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Bumping the SRCREV for the build-appliance

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-core/images/build-appliance-image.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image.bb
b/meta/recipes-core/images/build-appliance-image.bb
index 49e250d..dcc985f 100644
--- a/meta/recipes-core/images/build-appliance-image.bb
+++ b/meta/recipes-core/images/build-appliance-image.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"

 inherit core-image

-SRCREV = "f0f23f1741c29baa9601c5fa6b6b4a18175be7c5"
+SRCREV = "d13e633272ab4b40f0ed69a37ab524e6d316c338"
 SRC_URI = "git://git.yoctoproject.org/poky;protocol=git \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
-- 
1.7.9.5


