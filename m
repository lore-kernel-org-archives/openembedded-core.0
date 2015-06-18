Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFA673306
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 08:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5I8Fx9I007457; Thu, 18 Jun 2015 09:15:59 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ogV3KanYPuHY; Thu, 18 Jun 2015 09:15:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5I8FjWm007437
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Jun 2015 09:15:56 +0100
Message-ID: <1434615345.14710.49.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bian Naimeng <biannm@cn.fujitsu.com>
Date: Thu, 18 Jun 2015 09:15:45 +0100
In-Reply-To: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
References: <1434612286-52367-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] libmpc: add a GPLv2 recipe
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
X-List-Received-Date: Thu, 18 Jun 2015 08:16:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-06-18 at 15:24 +0800, Bian Naimeng wrote:
> Same as other recipe such as bash, we should provide both GPLv3 and !GPLv3 recipe

libmpc is not really the same class of recipe as bash. Its mainly used
by gcc and we don't have GPLv2 versions of gcc so this doesn't make much
sense. 

Why do you need a GPLv2 version of libmpc?

Cheers,

Richard


