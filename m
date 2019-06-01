Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id BEAE77E641
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 10:25:33 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d9so8116539wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=M0+GJHV+6Bhf6ZCu0AtB6MUIj2Mg3Bi4d6u773VdS7Y=;
	b=dlaycoBjU/1v0qUxuP8kPTFd6KGQGYrDwZdxtLA9XTTc3zl/c1PDrvwgtlTEQd+Toq
	kX2Y+wzJLIzkpN+g6dsNKKERWwDaYQPB5bQfeJ4vSRCLr2XJ9v9aP6aapSVnWHytUxl0
	tqt8L1DI6IYPU8zv2eT/dtVLjcIthH8H5D6FU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M0+GJHV+6Bhf6ZCu0AtB6MUIj2Mg3Bi4d6u773VdS7Y=;
	b=EcrFod3RNfdbIS0BSJrvpsV61alSSoIyixKIo0wlMK10jQpWUyG3tmtXiM0wXSwQ8O
	TbBIEzEjZ7aS5Tys9+GgRz19JMSla/HyDIZzhbkvhICg1xZoxJxHy4xcA9YtdQMVRmyK
	FBIGN6sKFk7g+sC5GrIanjnBvoQfONnxJK3inmhT67VrthY+w/ekyImax0BZ1zQal0cA
	fH83RIO2DHDD7kumf5mREtMxnrxY/axdYUSZ5e3oJjVSJmsYY1teZAOCkQiMf0O1QM6Z
	XDo8f7ejbqOKq3bThyDgosvvde6vZ5RytlO5QUTKRykzR5Y73a5Gi53GepfT2CmFPPEU
	+2Ng==
X-Gm-Message-State: APjAAAV/1TBUm9H3x52rgcrsxcKoALNcP8drINOSWV8WmZoEv2yFrHwS
	Z4bH0KvRQzviw4ptshjgAHmPIbMiJTc=
X-Google-Smtp-Source: APXvYqwDOhrAk2m8ZqvL/o+9ylm1wsnpaOiM4kG3Xl9Tu2VxW0HPPZuqiDktjbTrXuO43TmUe4xq/g==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr9676442wrw.196.1559384734347; 
	Sat, 01 Jun 2019 03:25:34 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a124sm11912234wmh.3.2019.06.01.03.25.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 01 Jun 2019 03:25:33 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 11:25:26 +0100
Message-Id: <20190601102530.5995-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
References: <20190601102530.5995-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 4/8] perl: Add missing perl module dependency
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
X-List-Received-Date: Sat, 01 Jun 2019 10:25:34 -0000
Content-Transfer-Encoding: 8bit

This fixes runtime errors when using the module (as used by various other perl
module ptests).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
index 5bf8c1d08a9..08722ad74c3 100644
--- a/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl-sanity/files/perl-rdepends.txt
@@ -2657,6 +2657,7 @@ RDEPENDS_perl-module-encode += "perl-module-constant"
 RDEPENDS_perl-module-encode += "perl-module-encode-alias"
 RDEPENDS_perl-module-encode += "perl-module-encode-config"
 RDEPENDS_perl-module-encode += "perl-module-encode-configlocal-pm"
+RDEPENDS_perl-module-encode += "perl-module-encode-encoding"
 RDEPENDS_perl-module-encode += "perl-module-encode-mime-name"
 RDEPENDS_perl-module-encode += "perl-module-exporter"
 RDEPENDS_perl-module-encode += "perl-module-parent"
-- 
2.20.1


