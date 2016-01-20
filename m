Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39C346FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 07:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K7qNVa005370; Wed, 20 Jan 2016 07:52:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ao-h2Weg7941; Wed, 20 Jan 2016 07:52:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K7qKZ2005367
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Jan 2016 07:52:21 GMT
Message-ID: <1453276340.27999.141.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jian Liu <jian.liu@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 07:52:20 +0000
In-Reply-To: <1453267659-18756-1-git-send-email-jian.liu@windriver.com>
References: <1453267659-18756-1-git-send-email-jian.liu@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] kernel-devsrc: Fix backward compaibilty
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
X-List-Received-Date: Wed, 20 Jan 2016 07:52:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-20 at 13:27 +0800, Jian Liu wrote:
> kernel-dev is replaced by kernel-devsrc

No, its not.

> , which breaks
> backward compaibilty.
>  -- add alias for kernel-devsrc
>  -- kernel-devsrc provides the kernel-dev.
>  -- remove kernel-dev from the sub-packages of linux-windriver

kernel-dev is useful for things like profiling tools where you need
things like system.Map or the kernel configuration without source code.

If you need the "full" source, you can use kernel-devsrc.

I'm not sure we want to remove kernel-dev given it does have a use?

Cheers,

Richard

