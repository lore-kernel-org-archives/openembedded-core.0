Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4BEA737EE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 07:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3I7x29F018883; Sat, 18 Apr 2015 08:59:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id OVERnfywlp7K; Sat, 18 Apr 2015 08:59:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3I7wmtp018859
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 18 Apr 2015 08:59:00 +0100
Message-ID: <1429343928.6976.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Sat, 18 Apr 2015 08:58:48 +0100
In-Reply-To: <1429326365-25767-1-git-send-email-sgw@linux.intel.com>
References: <1429326365-25767-1-git-send-email-sgw@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Dpkg: Fix broken patch
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
X-List-Received-Date: Sat, 18 Apr 2015 07:59:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-04-17 at 20:06 -0700, Saul Wold wrote:
> Richard,
> 
> Major mia culpa! 
> 
> I tested sgw/dizzy and then manged to push another patch from a different branch, I had this
> patch queued up and it ran on the AB before I pushed the wrong branch.
> 
> Please pull this patch (it's the correct one), and reset the Build Appliance SRCREV, I 
> will try to start an RC2 build this weekend.

Ok, merged. Fired a master-next in the meantime.

Cheers,

Richard


