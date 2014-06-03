Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7E41605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 10:58:36 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s53AwUte016916; Tue, 3 Jun 2014 11:58:30 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rD5n8YXlDoCg; Tue,  3 Jun 2014 11:58:30 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s53AwNO3016908
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 3 Jun 2014 11:58:25 +0100
Message-ID: <1401793095.12440.72.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ChenQi <Qi.Chen@windriver.com>
Date: Tue, 03 Jun 2014 11:58:15 +0100
In-Reply-To: <538D9363.2020006@windriver.com>
References: <cover.1401781206.git.Qi.Chen@windriver.com>
	<cd4a352b664c2c15c0ad9ff7bc4e5870f2e0c941.1401781206.git.Qi.Chen@windriver.com>
	<1401786411.12440.54.camel@ted> <538D9363.2020006@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: matt.cowell@nsn.com, openembedded-core@lists.openembedded.org
Subject: Re: [daisy][PATCH 1/1] systemd: do not use alloca() function in case of uclibc
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
X-List-Received-Date: Tue, 03 Jun 2014 10:58:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-03 at 17:20 +0800, ChenQi wrote:
> The use of alloca() was introduced by an oe-specific patch from Khem Raj.
> 
> The patch is 
> meta/recipes-core/systemd/systemd/systemd-pam-fix-fallocate.patch.
> The upstream status of the above patch is as following.
>         Upstream-Status: Denied [no desire for uclibc support]
> 
> That's why I use 'Inappropriate [oe specific]' in the Upstream-Status 
> field of my patch.
> 
> And I just realized I forgot to also patch the journald-kmsg.c file. 
> I'll send out a V2.

Please just update that patch then rather than patching code that we've
ready patched. Is this issue uclibc specific?

At the very least information like this needs to be put into the commit
message/patch header.

Cheers,

Richard


