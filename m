Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6C09560CEA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 02:44:18 +0000 (UTC)
Received: from mailserv59-us.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	r982iIiF002759; Mon, 7 Oct 2013 21:44:18 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by mailserv59-us.natinst.com (Lotus Domino Release 8.5.3FP2 HF169)
	with ESMTP id 2013100721441859-52949 ;
	Mon, 7 Oct 2013 21:44:18 -0500 
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
User-agent: mu4e 0.9.9.5; emacs 24.3.4
From: Richard Tollerton <rich.tollerton@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-reply-to: <1380958620.30971.9.camel@ted>
Date: Mon, 07 Oct 2013 21:44:18 -0500
Message-ID: <87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on MailServ59-US/AUS/H/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 10/07/2013 09:44:18 PM,
	Serialize by Router on MailServ59-US/AUS/H/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/07/2013 09:44:18 PM,
	Serialize complete at 10/07/2013 09:44:18 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-08_01:2013-10-08, 2013-10-08,
	1970-01-01 signatures=0
Cc: openembedded-core@lists.openembedded.org, gratian.crisan@ni.com,
	ken.sharp@ni.com
Subject: Re: [dylan, master][PATCH] autotools.bbclass: Fix race with sed-native
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
X-List-Received-Date: Tue, 08 Oct 2013 02:44:19 -0000
Content-Type: text/plain


richard.purdie@linuxfoundation.org writes:

> On Fri, 2013-10-04 at 20:22 -0700, Saul Wold wrote:
>> On 10/04/2013 04:35 PM, Richard Tollerton wrote:
>> This also starts to create more front end bottle next on autotools 
>> related items before we can really start to parallelize the build.
>> 
>> More thought is required on this.
>
> Please have a look at the sed-native changes that went into master
> recently as I think this issue has been fixed differently...

Indeed, I agree that commit db2eb325 would fix the race... aaaand this
also makes me 2-for-2 this month on reinventing the wheel. :'(

But this brings up a question I've been meaning to ask.

Build reproducibility is reduced (all other things being equal) as more
external dependencies are introduced. So I would have expected that The
Right Thing here would have been to specify -native packages as explicit
dependencies (just like it's always important to comprehensively
enumerate dependencies). Not to add specific short-circuits to use the
system package. sed's probably a bad example here since it is rather
well-behaved -- surely this sort of issue comes up for many other
packages, though...

I know that the OE build is horribly slow, but is it really so slow as
to require short-circuiting native package dependencies such as this?
Has there been a general architectural decision made over this sort of
thing? (I'm sorry, I tried to search for one on the mailing list and
wiki, but couldn't find any.)

>
> Cheers,
>
> Richard


-- 
Richard Tollerton <rich.tollerton@ni.com>

