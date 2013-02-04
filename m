Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U2JoY-0008Q5-TM
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 12:02:30 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 Feb 2013 02:45:15 -0800
Received: by mail-bk0-f69.google.com with SMTP id q16so6908586bkw.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2013 02:46:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=/zRv/Y2ZLy5zV7KNQM7XnnyJcMD5OVA8cj7AyWuMi0Q=;
	b=VSx7O39YIuq//ruKqdFG8vcbNfl0uQnb+H/PkVWXw8dGCBEz3Dk6/qQmbA146/CCzL
	uVwPVmXquB9m3dvXaS20bNS/rj7RpFrsyl6ZJtM47kNqqgrsEioJ9ao1zpbvGBsaUavB
	tNEuMm5meRJAVd2+IZaWxWQvV0rPF4r1ZtXJDoZKQ3zHfsBMD54Hx/AA+BZHyxWW7OdD
	wyoJvW8jiH6bcWxwMgrPEz0IsATgJ6GD6xzWg3Y/6NQIxKSYZQuLGLfwsci/4QUClgya
	d9g/7YxIA/1B9aHzuGbUxn6iEWVtomSZUULyFDXu9yWBlBcHrhZtQl7L16XRu8RcfL3T
	fGug==
X-Received: by 10.180.92.129 with SMTP id cm1mr9485286wib.10.1359974787428;
	Mon, 04 Feb 2013 02:46:27 -0800 (PST)
X-Received: by 10.180.92.129 with SMTP id cm1mr9485266wib.10.1359974787233;
	Mon, 04 Feb 2013 02:46:27 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id j9sm12586031wia.5.2013.02.04.02.46.25
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Feb 2013 02:46:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Feb 2013 10:44:12 +0000
Message-Id: <1359974656-21894-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
References: <1359974656-21894-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmophvAzfn5QJBQebu+q66B8A4BjAwuHy50RiayHt0hukOYLCLjOclKfMTIZo4wB6+cM9n8ZI2u5VbQwHTxccU2r5aCwpVK/79a5jFgMgzIx6TxttagsSTwdj9zHiL2O9HdH2xQ7L3w6EJjMgb6a8zy8Wb1pfiI6qEkHk0dN5vxWZubgi1Z+8TH1FQBqxT9ztQIv+PQ
Subject: [PATCH 1/5] cmake: reset B from autotools, as this class doesnt like it
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
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000
X-List-Received-Date: Mon, 04 Feb 2013 11:02:37 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cmake.bbclass |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 54d4519..e64c30c 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -13,6 +13,7 @@ OECMAKE_SOURCEPATH ?= "."
 # If declaring this, make sure you also set EXTRA_OEMAKE to
 # "-C ${OECMAKE_BUILDPATH}". So it will run the right makefiles.
 OECMAKE_BUILDPATH ?= ""
+B="${S}"
 
 # C/C++ Compiler (without cpu arch/tune arguments)
 OECMAKE_C_COMPILER ?= "`echo ${CC} | sed 's/^\([^ ]*\).*/\1/'`"
-- 
1.7.10.4



