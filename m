Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SPaig-00085p-L7
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 16:39:54 +0200
Received: by wgbds1 with SMTP id ds1so3899803wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 07:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=vEwJ+AmmgbWSaVeBY9B7NweHWsWpDfQnZQceungy2kY=;
	b=aLiNs6z3O8VG5r9aSInA3TX51a7L3mbNfBJLKY7NoXR0f9g/inNPH4fCZ/zT02dS1q
	vhmkfWapWrCwfuNwyGOKtYmtoen6qi/K/8TiV9fboNsTpiM17V4HkBXrS2NjnJEbOzA+
	mKHYQ38fdeJ4CDGRYQpXQeOjX0eNo3Lrl4Ani/T4BR5AjOk9a8p/YhFGzoe/mIdB8Rde
	UdJRJOLUNywp8me3FJhzm4iAxsVsp27zSzb4PVwwxq5wmQuouZkAAVTqcXi5Y5Nw+FsC
	Kbbvw8wUzM3OZwoJrTUnxT2kaCkL4s8L3xnJD8lgrgb3SX4yfMGvFsyMvJD+wki8hK9A
	E42g==
Received: by 10.180.88.67 with SMTP id be3mr14616291wib.20.1335969010392;
	Wed, 02 May 2012 07:30:10 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gg2sm7172063wib.7.2012.05.02.07.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 07:30:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
Date: Wed, 2 May 2012 16:29:54 +0200
Message-Id: <DE7E5733-CC28-46DD-A4BC-C1AA663F925B@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQmPeyWJIBDftp3fOYR3j3nD0dLWvt+aOnkYxbF6ZE0LoFaspZIbk+VGmQ9BrpNT8aaZ36wL
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Wed, 02 May 2012 14:39:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 mei 2012, om 16:23 heeft Jason Wessel het volgende geschreven:

> The user mode NFS server does not get built by default when you are
> using a purely command line driven development environment without SDK
> tools.  In order to accommodate simple test configurations and have
> all the tools built for the minimal validation with qemu-native,
> simply add the dependency to unfs-server-native.

So all images I build for e.g. qemux86 now have an nfs-server? Can we =
please move settings like that to the specific images?=


