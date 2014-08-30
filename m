Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1C36F7122B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 07:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7U7xQu8032301; Sat, 30 Aug 2014 08:59:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id oxI-aecGYcsp; Sat, 30 Aug 2014 08:59:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7U7xMvH032297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 30 Aug 2014 08:59:23 +0100
Message-ID: <1409385563.29296.215.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jate Sujjavanich <jatedev@gmail.com>
Date: Sat, 30 Aug 2014 08:59:23 +0100
In-Reply-To: <CAPphmgb+9dgJTZ19p0dDOR3V5GQuQs5oZawQRnB9KQa2_Yt-Ag@mail.gmail.com>
References: <1407704441-29326-1-git-send-email-jatedev@gmail.com>
	<CAPphmgb+9dgJTZ19p0dDOR3V5GQuQs5oZawQRnB9KQa2_Yt-Ag@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] useradd: Add setscene dep on pseudo-native
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
X-List-Received-Date: Sat, 30 Aug 2014 07:59:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 11:40 -0400, Jate Sujjavanich wrote:
> There's a commit in poky's master-next with the message "bitbake:
> runqueue: Fix setscene tasks not running".
>
> Should it fix the problem fixed by my patch?

No, your patch does need to merge, I've done that.

Cheers,

Richard



