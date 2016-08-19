Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E6F8670057
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 22:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JM9ZVF018431; Fri, 19 Aug 2016 23:09:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xr6rcxUCgT2J; Fri, 19 Aug 2016 23:09:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JM9WVS018428
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 23:09:33 +0100
Message-ID: <1471644572.16712.58.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Dai Caiyun <daicy.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 23:09:32 +0100
In-Reply-To: <1471486086-8512-1-git-send-email-daicy.fnst@cn.fujitsu.com>
References: <1471486086-8512-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] kexec-tools: 2.0.12 -> 2.0.13
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
X-List-Received-Date: Fri, 19 Aug 2016 22:09:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-08-18 at 10:08 +0800, Dai Caiyun wrote:
> Upgrade kexec-tools from 2.0.12 to 2.0.13.

Sadly this doesn't build on arm:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm/builds/924/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-arm-lsb/builds/868/steps/BuildImages/logs/stdio

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/529/steps/BuildImages/logs/stdio

Cheers,

Richard

