Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0800B605FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 14:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4OExVcg004155; Tue, 24 May 2016 15:59:31 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RbofhlDb7dTC; Tue, 24 May 2016 15:59:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4OExTgO004151
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 May 2016 15:59:30 +0100
Message-ID: <1464101969.9570.61.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 15:59:29 +0100
In-Reply-To: <5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
References: <cover.1464004128.git.jussi.kukkonen@intel.com>
	<5f5c927d9a012122af814032161f3f12b476a442.1464004128.git.jussi.kukkonen@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/5] docbook-xsl-stylesheets: Upgrade 1.78.1 -> 1.79.1
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
X-List-Received-Date: Tue, 24 May 2016 14:59:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-23 at 15:44 +0300, Jussi Kukkonen wrote:
> * Use $PV at appropriate places in do_install
> * Install some new files, avoid installing 25M of java archives
> * License checksum change is just copyright years changing

I think something here may be causing:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/buil
ds/766/steps/BuildImages/logs/stdio

(the xdg-utils failure)

Its only happening for poky-lsb for some reason. I can't rule out gcc6
but it is possibly unrelated to that, its the first time we've see it.

Cheers,

Richard

