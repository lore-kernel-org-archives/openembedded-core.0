Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 660E160897
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:14:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCI33P019790; Tue, 21 May 2013 13:18:13 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id P-qyVjJaGO_a; Tue, 21 May 2013 13:18:13 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4LCHvbV019766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 21 May 2013 13:18:10 +0100
Message-ID: <1369124064.11013.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
In-Reply-To: <1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <51969025.6040407@linux.intel.com>
	<1369062325-30335-1-git-send-email-tf+lists.yocto@r-finger.com>
Date: Tue, 21 May 2013 09:14:24 +0100
Mime-Version: 1.0
X-Mailer: Evolution 3.6.4-0ubuntu1 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: updates for cogl, clutter and mx
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
X-List-Received-Date: Tue, 21 May 2013 12:14:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-20 at 16:05 +0100, Tomas Frydrych wrote:
> > There are some issues with this patch set, some of the included patches
> > either do not have Upstream-Status or Signed-off-by tags, please review 
> > that.
> 
> Updated the various patch headers in v.2.
> 
> > Also, I want to confirm that these are all new recipes and will not cause 
> > backward PRs (ie do you need PE bumps to these)?
> 
> I renamed the mx recipe also to mx-1.0 for consistency, so yes, these are all 
> different packages now.
> 
> > Finally, I think you need to update the packagegroup-core-clutter recipe. 
> 
> Done.

Thanks for this. I'm not convinced with the delete everything, then
re-add approach as it makes the git history even harder to read than
git's normal rename handling which is bad enough. I therefore split the
removal patch over the other patches. I also tweaked the patch titles as
"New xxxx" doesn't read well when listed alongside the other changes.
I've merged this with this minor tweaks.

Cheers,

Richard


