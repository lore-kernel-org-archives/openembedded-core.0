Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF947563B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 13:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TDamYc015657; Fri, 29 May 2015 14:36:48 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tq37FBXXgkHZ; Fri, 29 May 2015 14:36:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4TDaWUR015628
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 29 May 2015 14:36:44 +0100
Message-ID: <1432906592.404.138.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 29 May 2015 14:36:32 +0100
In-Reply-To: <9267553a2f080dfb2fac0522df25346195b831fa.1432805258.git.liezhi.yang@windriver.com>
References: <cover.1432805258.git.liezhi.yang@windriver.com>
	<9267553a2f080dfb2fac0522df25346195b831fa.1432805258.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/9] btrfs-tools: 3.18.2 -> 4.0.1
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
X-List-Received-Date: Fri, 29 May 2015 13:36:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-05-28 at 02:57 -0700, Robert Yang wrote:
> * Updated fix-parallel.patch
> * inherit autotools-brokensep, the autotools doesn't work:
>   | make: *** No rule to make target `ctree.o', needed by `btrfs'.  Stop.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../btrfs-tools/btrfs-tools/fix-parallel.patch     |   16 ++++++++--------
>  .../btrfs-tools/btrfs-tools_git.bb                 |   16 +++++++++-------
>  2 files changed, 17 insertions(+), 15 deletions(-)

Did upstream switch to autotools for 4.x? If so, this should really be
mentioned in the commit message to make sense of the changes.

Cheers,

Richard


