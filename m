Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 017E77718A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Feb 2016 08:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8YbtZ010561; Sat, 27 Feb 2016 08:34:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WQAXjT-MS7BK; Sat, 27 Feb 2016 08:34:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1R8YYuh010557
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 27 Feb 2016 08:34:35 GMT
Message-ID: <1456562074.11498.125.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Joseph A. Lutz" <joseph.lutz@novatechweb.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 27 Feb 2016 08:34:34 +0000
In-Reply-To: <1456441355-13599-1-git-send-email-joseph.lutz@novatechweb.com>
References: <1456441355-13599-1-git-send-email-joseph.lutz@novatechweb.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] automake: remove patch
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
X-List-Received-Date: Sat, 27 Feb 2016 08:34:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-25 at 17:02 -0600, Joseph A. Lutz wrote:
> The patch being removed in this commit removes *.pyc files from being
> compiled. This dose not allow a user to select which files are
> included
> in the image. Since optimization is no longer the default for python
> we should have the ability to choose what is included in the image.
> 
> Signed-off-by: Joseph A. Lutz <joseph.lutz@novatechweb.com>

This breaks the builds:

https://autobuilder.yoctoproject.org/main/builders/nightly-mips-lsb/bui
lds/652/steps/BuildImages/logs/stdio

Cheers,

Richard

