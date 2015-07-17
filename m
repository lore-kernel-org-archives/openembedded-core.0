Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 27F4765CBC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 16:39:59 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6HGdwcH002430; Fri, 17 Jul 2015 11:39:58 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015071711395875-1383694 ;
	Fri, 17 Jul 2015 11:39:58 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"Burton\, Ross" <ross.burton@intel.com>
In-Reply-To: <55A86A01.1060108@windriver.com>
References: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
	<871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
	<CAJTo0LZF6fogQd6YhTbkY9adXGOhiZONqwWLc909AUF4fBUapg@mail.gmail.com>
	<55A86A01.1060108@windriver.com>
User-Agent: Notmuch/0.20.1 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
Date: Fri, 17 Jul 2015 11:39:58 -0500
Message-ID: <874ml2ybz5.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/17/2015 11:39:58 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/17/2015 11:39:58 AM,
	Serialize complete at 07/17/2015 11:39:58 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-17_08:, , signatures=0
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 17 Jul 2015 16:40:00 -0000
Content-Type: text/plain

Robert Yang <liezhi.yang@windriver.com> writes:

> On 07/14/2015 05:49 PM, Burton, Ross wrote:
>>
>> On 13 July 2015 at 19:43, Richard Tollerton <rich.tollerton@ni.com
>> <mailto:rich.tollerton@ni.com>> wrote:
>>
>>     I still need to apply this patch in order to use create-pull-request.
>>     Bump?
>>
>> Not sure how this got missed, and I can't even find it in my archives, but it's
>> queued now.
>
> This patch breaks create-pull-request:
> $ ./scripts/create-pull-request -u oe-contrib -b rbt/PU -r HEAD~5
> fatal: ambiguous argument 'HEAD~5..rbt/PU': unknown revision or path not in the 
> working tree.
> Use '--' to separate paths from revisions
> fatal: Needed a single revision
> ERROR: git request-pull reported an error
>
> $ git --version
> git version 1.7.9.5
>
>
> Richard Tollerton, does Saul's fix work for you for git 2.0?
>
> commit 5ffa98a95317e6bea436e4372b9202f4da0ce2ae
> Author: Saul Wold <sgw@linux.intel.com>
> Date:   Tue Feb 3 09:08:29 2015 -0800
>
>      create-pull-request: Fix git request-pull

Eek! Yes, it seems like it does work. I think I might have
misinterpreted an error in running `create-pull-request`, then changed
the command line enough to (coincidentally) work after I reapplied the
patch.

Ross, please revert commit 7ee64ea60ede5477b2f9a355d93bdc556e6b7895. My
sincere apologies for the inconvenience.

