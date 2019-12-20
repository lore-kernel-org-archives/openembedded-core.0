Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC4A7FD2F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:23:59 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p17so9841466wma.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Dec 2019 08:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XYde8BatjhbAxtpC8+4B93Gj2NRlKYn2aTdpnBa/dQg=;
	b=PXnldYrqU5d6IyB512WdDxS1S8oprySC6UKFT+SSfogc+7ncg5q+mSifmD3P7OFYOW
	MIjyCUg2FqAwAQkF81821MpQR3uy9EAtrT+PejG+e9fkzpJi5gol9pCBFEVbWs8VkYfC
	J/dDvjlhSs3d4ayKSF1P6gquIPjziF7tbMWLbd+uvn4LqVCH9s7fzRzt56xXBTJTCzOf
	LPYcOHNlTaZh6Lo6dve4YlFqYi4N9e7qj+/kR8zBtd9HKnCH9W9Pk4y/cG7tck+xzL/Z
	fkwcQ9CzQch82TZm9SY3f8ZMhOt8RyefxFgK2v/weK2aWCE/J8spQOvOMBy5T9y1AnBj
	ucqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XYde8BatjhbAxtpC8+4B93Gj2NRlKYn2aTdpnBa/dQg=;
	b=OJ22VP9evaUiCQgiLA0HUotmbop2NbsLnAFkGdn0V0d3LcHdPdQbeVKGlomU2Bj/e6
	XYuSVH26lNI5C/0h+WfPNRwb5ms7B51/+cbbrbN7G2g57U9VOdMsdm5UNlCIiv/4QA6U
	07ipS+Znj/ABvfAT0EZeq7IJAZS8IDcl/86ZX9FuF/bYAHECZRMzbkVAFf6Fq5Mh+rKj
	Pk5ilz+WhUwBfHCXtiay+DXD7k3RKUWW55ktFNEB6UBtXEa8we0213UfqL+D2vGUdaNZ
	4lZaz3f9Nl6JUAWB5xU0kXvjuEUEEfReWXoSk+Nsr8OFvzgz4WHuphoevv7oNW3ZhJ8g
	pbIg==
X-Gm-Message-State: APjAAAWvNzcgttZI3ftvzFT8+ko8F4WNgxuao0FKGgRvWeLCGFmjtV6s
	OFloxHIZB0wnDGOtiZvCPWgqqzvwJik=
X-Google-Smtp-Source: APXvYqzRqgRnXQ/k9hWlAfQI9kmMRAIn3oUyAC7/vVPIZxyydvf7Dcf5YFik+oDlK1eUnILx0NEOwg==
X-Received: by 2002:a05:600c:20c7:: with SMTP id
	y7mr17912934wmm.21.1576859039962; 
	Fri, 20 Dec 2019 08:23:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	w17sm10436356wrt.89.2019.12.20.08.23.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 08:23:59 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Dec 2019 17:23:45 +0100
Message-Id: <20191220162351.94498-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220162351.94498-1-alex.kanavin@gmail.com>
References: <20191220162351.94498-1-alex.kanavin@gmail.com>
Subject: [PATCH 05/11] ptest-packagelists: drop python 2.x
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
X-List-Received-Date: Fri, 20 Dec 2019 16:24:00 -0000

With python 2.x reaching EOL and leaving oe-core soon, there is no need to keep
it in ptest lists.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index bb4724cf528..26b8db5b607 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -70,7 +70,6 @@ PTESTS_SLOW = "\
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-    python-ptest \
     python3-ptest \
     strace-ptest \
     tcl-ptest \
-- 
2.17.1


