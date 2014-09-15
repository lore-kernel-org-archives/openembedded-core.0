Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C507E609BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8FECGt2021297; Mon, 15 Sep 2014 15:12:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hbL3AuPDmZTV; Mon, 15 Sep 2014 15:12:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8FECBBo021293
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 15 Sep 2014 15:12:12 +0100
Message-ID: <1410790333.14624.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Mon, 15 Sep 2014 15:12:13 +0100
In-Reply-To: <5416F0A0.80000@topic.nl>
References: <1410536389.14624.1.camel@ted> <5416F0A0.80000@topic.nl>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] license: Improve disk usage
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
X-List-Received-Date: Mon, 15 Sep 2014 14:12:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2014-09-15 at 15:58 +0200, Mike Looijmans wrote:
> ﻿I can probably come up with scenarios where "os.stat(src).st_dev == 
> os.stat(destdir).st_dev" but os.link will still fail.
> 
> Less code and does not assume that when src and destdir are on the same 
> device, they can be linked:
> 
> try:
>    os.link(src, dst)
> except:
>    shutil.copyfile(src, dst)

I agree that is probably easier. I'm curious which scenarios you're
thinking of though. We do have that device comparison elsewhere in the
codebase and I copied it mainly as it was how it was done elsewhere...

Cheers,

Richard


