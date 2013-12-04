Return-Path: <iyadkq@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 225176DEE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 17:01:12 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id rq2so23841350pbb.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=78bYVwtu428qXwUwDg6baZbvKaW3D1c1mYTqUcCZjNA=;
	b=scW7hE0sgd+dhIwcdDax893pYo+L5HeNpKAfi48tS79crZdZ8uerp5BEqMwQqNIFnm
	WqmrScznhGFh4aCsA4kq3vqqwXsjFiQzQoZo7qiQwaXztIIhXm8P7gYaBFQn34u2jQ3U
	WAMa7HJnk3uqyV3ezbC93xgu8KUKeB4dpCOamivjFpkoeav4XhoX/BpE5kkpL0Wiue0G
	Mb46d6jTFN4DNau+rzIW5Pr5VK9uIotq344eW0nSVJXFAJB29Kvg8J2VZGU6vikcuIRN
	H5uhLhyv0xuBPpnXPbb62blntOXUvwSXyjGyHdZ8N7+FOL78QyV30GHugzTVo1r35njZ
	qKPg==
X-Received: by 10.66.139.100 with SMTP id qx4mr19431520pab.141.1386176471580; 
	Wed, 04 Dec 2013 09:01:11 -0800 (PST)
Received: from linux-jvv9.site ([204.119.232.48])
	by mx.google.com with ESMTPSA id
	jn12sm97241711pbd.37.2013.12.04.09.01.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 09:01:10 -0800 (PST)
From: Iyad Qumei <iyadkq@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 09:07:53 -0800
Message-Id: <1386176874-4286-1-git-send-email-iyadkq@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] icecc-create-env: Upgrade script
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
X-List-Received-Date: Wed, 04 Dec 2013 17:01:13 -0000

Folks,

This change was necessary to compile code with external toolchains with support for linker time optimization, such as linaro.  The older script does not process the LTO related content correctly. More recent scripts from upstream icecream corrects this error.  However, the script required modifications for use with OE.  Hence I created this patch.

Iyad Qumei (1):
  icecc-create-env: Upgrade script

 .../icecc-create-env-native/icecc-create-env       |  266 +++++++++++++++-----
 ...ive_0.1.bb => icecc-create-env-native_1.0.1.bb} |    5 +-
 2 files changed, 209 insertions(+), 62 deletions(-)
 rename meta/recipes-devtools/icecc-create-env/{icecc-create-env-native_0.1.bb => icecc-create-env-native_1.0.1.bb} (89%)

-- 
1.7.10.4


