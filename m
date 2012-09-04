Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T8sZM-00082d-5Z for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 14:49:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84Cb56f016906;
	Tue, 4 Sep 2012 13:37:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16861-01; Tue,  4 Sep 2012 13:36:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q84Cavam016898
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 4 Sep 2012 13:36:58 +0100
Message-ID: <1346762217.30964.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 04 Sep 2012 13:36:57 +0100
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/28] Package group fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 12:49:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
> This rather large set of changes renames "task" to "packagegroup" and
> attempts to clean up a number of package group related issues [1]. It
> doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> core-lsb and core-basic recipes even further, but unfortunately I ran
> out of time for this cycle.
> 
> [1] http://www.openembedded.org/wiki/OE-Core_Task_Rework
> 
> 
> The following changes since commit c6da6b648328377ba3590fd38cb12dad26a46a13:
> 
>   crosstap: new script (2012-09-02 05:47:43 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/task-rework
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/task-rework

This has needed doing for a long time, we're coming to the end of the
development part of this release cycle, there has been opportunity for
feedback previously, the patches are quite heavy to maintain and the
feedback on the series so far as been relatively minor. I've therefore
merged to master, thanks.

Any issues we run into can be taken as patches on top of these changes
(which is likely what they'd be anyway).

Cheers,

Richard



