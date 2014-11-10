Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id A42CF65D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 10:45:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43133811"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 10 Nov 2014 18:42:02 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAAAj1DA022717;
	Mon, 10 Nov 2014 18:45:01 +0800
Received: from Fedora (10.167.226.40) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.181.6;
	Mon, 10 Nov 2014 18:45:13 +0800
Date: Mon, 10 Nov 2014 18:45:11 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20141110184511.23b8e2dd@Fedora>
In-Reply-To: <20141110135237.1a9c3eca@Fedora>
References: <1415077496-11116-1-git-send-email-qianl.fnst@cn.fujitsu.com>
	<CAJTo0LZ2FL--UchK7pVPUJFtsQJtH35_a0aJwYUSnWh34nCf-A@mail.gmail.com>
	<20141110135237.1a9c3eca@Fedora>
Organization: FNST
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Bluez5: Add gatttool to new package bluez5-tools
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
X-List-Received-Date: Mon, 10 Nov 2014 10:45:17 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit


> gatttool is not a test tool, but a develop tool. In bluez4 it is in package
> bluez4(not in bluez4-testtools). I don't think it's good to put it to any
> existed package.

How about put it in bluez5, just the same as bluez4? It seems make sense to
put it there.

