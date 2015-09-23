Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8BE766F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 22:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NM0WNc019360; Wed, 23 Sep 2015 23:00:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pamoRiVtJTFV; Wed, 23 Sep 2015 23:00:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8NM0JMF019355
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 23 Sep 2015 23:00:31 +0100
Message-ID: <1443045619.19044.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 23 Sep 2015 23:00:19 +0100
In-Reply-To: <5600C0E4.4030606@windriver.com>
References: <cover.1442311946.git.liezhi.yang@windriver.com>
	<5600C0E4.4030606@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] Fixes for mutilib SDK
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
X-List-Received-Date: Wed, 23 Sep 2015 22:00:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-22 at 10:45 +0800, Robert Yang wrote:
> Hi RP and Ross,
> 
> These patches are required by multilib's do_rootfs and do_populate_sdk,
> otherwise they are broken or partly broken. These patches don't affect
> do_rootfs or do_populate_sdk without multilib are to be installed.

Thanks for these. Patches 1-4 look ok, we can try them in -next however
I do worry about 5 and 6. Could you confirm if you tested those before
or after the recent data store changes? Its possible the OVERRIDE fixes
there may have fixed the issues 5 and 6 were trying to fix so I'd like
to confirm if they're still needed or not.

If they are, they don't look like the right solution so I'll need to
look further at the exact issue there.

Cheers,

Richard


