Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5BF473E3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 02:35:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H2ZlBF018316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Jul 2015 19:35:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 16 Jul 2015 19:35:47 -0700
Message-ID: <55A86A01.1060108@windriver.com>
Date: Fri, 17 Jul 2015 10:35:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Richard Tollerton
	<rich.tollerton@ni.com>
References: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>	<871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0LZF6fogQd6YhTbkY9adXGOhiZONqwWLc909AUF4fBUapg@mail.gmail.com>
In-Reply-To: <CAJTo0LZF6fogQd6YhTbkY9adXGOhiZONqwWLc909AUF4fBUapg@mail.gmail.com>
Cc: Ben Shelton <ben.shelton@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: Fix error on 2.0 versions of git
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
X-List-Received-Date: Fri, 17 Jul 2015 02:35:48 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/14/2015 05:49 PM, Burton, Ross wrote:
>
> On 13 July 2015 at 19:43, Richard Tollerton <rich.tollerton@ni.com
> <mailto:rich.tollerton@ni.com>> wrote:
>
>     Ben Shelton <ben.shelton@ni.com <mailto:ben.shelton@ni.com>> writes:
>
>      > On 2.0 versions of git, the create-pull-request script exits with the
>      > warning "No match for commit... Are you sure you pushed 'HEAD' there?".
>      >
>      > This is due to a change in behavior where git used to guess the branch
>      > you meant, but no longer does.  See the thread at
>      > http://www.spinics.net/lists/git/msg233050.html for more information.
>      >
>      > To accommodate the new behavior, if the COMMIT_ID is set to the default
>      > of "HEAD", make it point explicitly to $BRANCH instead.
>      >
>      > Signed-off-by: Ben Shelton <ben.shelton@ni.com <mailto:ben.shelton@ni.com>>
>
>     I still need to apply this patch in order to use create-pull-request.
>     Bump?
>
>
> Not sure how this got missed, and I can't even find it in my archives, but it's
> queued now.

This patch breaks create-pull-request:
$ ./scripts/create-pull-request -u oe-contrib -b rbt/PU -r HEAD~5
fatal: ambiguous argument 'HEAD~5..rbt/PU': unknown revision or path not in the 
working tree.
Use '--' to separate paths from revisions
fatal: Needed a single revision
ERROR: git request-pull reported an error

$ git --version
git version 1.7.9.5


Richard Tollerton, does Saul's fix work for you for git 2.0?

commit 5ffa98a95317e6bea436e4372b9202f4da0ce2ae
Author: Saul Wold <sgw@linux.intel.com>
Date:   Tue Feb 3 09:08:29 2015 -0800

     create-pull-request: Fix git request-pull



// Robert

>
> Ross
>
>

