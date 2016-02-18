Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C905C731C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 08:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1I8JEET025128; Thu, 18 Feb 2016 08:19:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Fm5Frq0-Vk3M; Thu, 18 Feb 2016 08:19:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1I8JAe8025125
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 18 Feb 2016 08:19:12 GMT
Message-ID: <1455783550.28376.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: fupan.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 18 Feb 2016 08:19:10 +0000
In-Reply-To: <1455761419-21043-1-git-send-email-fupan.li@windriver.com>
References: <1455761419-21043-1-git-send-email-fupan.li@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] oe-core: Fix base-files wrong softlink of /var/run and /var/lock
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
X-List-Received-Date: Thu, 18 Feb 2016 08:19:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-02-17 at 18:10 -0800, fupan.li@windriver.com wrote:
> From: fli <fupan.li@windriver.com>
> 
> OE-CORE's fs-perms.txt force /var/run to link /run and
> /var/lock to /run/lock, so in order to match with it,
> make base-files /var/run and /var/lock link the absolute
> path too.

You really need to explain what the issue you're solving is here. You
appear to be replacing two relative paths with absolute paths? Why does
this matter?

Cheers,

Richard

