Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF8077086
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JEhwqC030498; Fri, 19 Aug 2016 15:43:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S39TFWLQe3DC; Fri, 19 Aug 2016 15:43:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JEht2n030494
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 15:43:56 +0100
Message-ID: <1471617835.16712.39.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 15:43:55 +0100
In-Reply-To: <c1f61bbb-02ac-2ae8-9016-55a00ff71a15@pseudoterminal.org>
References: <c1f61bbb-02ac-2ae8-9016-55a00ff71a15@pseudoterminal.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: Why are verbose makefiles enabled by default in cmake bbclass ?
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
X-List-Received-Date: Fri, 19 Aug 2016 14:43:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 16:10 +0200, Carlos Rafael Giani wrote:
> Hello,
> 
> in a project, I'd like to disable verbose makefiles (the bbclass sets
> CMAKE_VERBOSE_MAKEFILE to 1), since the log output becomes very
> large, 
> and finding compiler errors becomes more difficult. I think there is
> no 
> problem in overriding the default in my recipe. However, I wonder if 
> there was a specific reason for setting CMAKE_VERBOSE_MAKEFILE to 1
> in 
> the cmake.bbclass, or if this was just preference. Any ideas?

People tend to report errors based on the log files and its tedious to
have to ask them to reproduce the error after having to turn on verbose
output. We do this in a few places to aid bug reporting.

Cheers,

Richard


