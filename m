Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SUNuw-00089C-2d
	for openembedded-core@openembedded.org; Tue, 15 May 2012 22:00:22 +0200
Received: by wgbdr1 with SMTP id dr1so5059303wgb.12
	for <openembedded-core@openembedded.org>;
	Tue, 15 May 2012 12:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=s1G5m7ueZg1kTu2aJ1tnTkrrRbmLr9qc8auN+IMee8s=;
	b=QTQRJ76MkvcHL1ExEk25gJqCT9FbfF7fAb7TKx+eX8tPYFf5RTpC/pU8j0mILqYBhY
	noZQzLatD9TVZJEzF73DouvplkbllTjvM/r1L26TU6bqIQggp4fkWam/Erbh32acZOIR
	u+Pt81Acm3SOHRqIvwTYNcqt+x0crzb4fywJIDqgPAkgU3gS7joarP/8/QdQtSXij3Tl
	yyHNF1fkQAXVXJ4g7Z6D3ANPE+KKZWReTpNx2UP6M3Y65EzPEMPY10ilF1sVPaIFcb2Y
	m/tExD7l5ZFNtZ7A9Jc4TN89d9nVddrhPyip2eZDUlpC6JLqOJoWmZLdvXsf4VctH2s2
	v46g==
Received: by 10.180.24.103 with SMTP id t7mr33462878wif.16.1337111421709;
	Tue, 15 May 2012 12:50:21 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id fn2sm558350wib.0.2012.05.15.12.50.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 12:50:21 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SUNlE-0006dH-2G; Tue, 15 May 2012 21:50:20 +0200
Date: Tue, 15 May 2012 21:50:20 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120515195019.GN29324@mx.loc>
References: <1336065314-8588-1-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1336065314-8588-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@openembedded.org
Subject: Ping [was Re: [meta-micro][PATCH 1/2] busybox: mdev was removed]
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
X-List-Received-Date: Tue, 15 May 2012 20:00:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping ** 2 (or 3, really. Whole thread)

On Thu, May 03, 2012 at 07:15:13PM +0200, Bernhard Reutner-Fischer wrote:
>bea936913fcf684c23d36f740050dea118d5caad removed mdev, so rm now unused
>file, too.
>
>Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>---
> recipes/busybox/files/mdev |    9 ---------
> 1 file changed, 9 deletions(-)
> delete mode 100644 recipes/busybox/files/mdev
>
>diff --git a/recipes/busybox/files/mdev b/recipes/busybox/files/mdev
>deleted file mode 100644
>index 14ba837..0000000
>--- a/recipes/busybox/files/mdev
>+++ /dev/null
>@@ -1,9 +0,0 @@
>-#!/bin/sh
>-
>-mount proc /proc -t proc
>-mount sys /sys -t sysfs
>-mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
>-mkdir /dev/pts /dev/shm
>-mount -t devpts devpts /dev/pts
>-echo "/sbin/mdev" > /proc/sys/kernel/hotplug
>-mdev -s
>-- 
>1.7.10
>


