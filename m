Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 231E06CD26
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2013 17:47:23 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	r98HlNI4019915; Tue, 8 Oct 2013 12:47:23 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2013100812472279-11187 ;
	Tue, 8 Oct 2013 12:47:22 -0500 
References: <1380929753-10606-1-git-send-email-rich.tollerton@ni.com>
	<524F85EA.30805@linux.intel.com> <1380958620.30971.9.camel@ted>
	<87mwmkpjlp.fsf@weregild.amer.corp.natinst.com>
	<1381234763.29912.39.camel@ted>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.4
From: Richard Tollerton <rich.tollerton@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-reply-to: <1381234763.29912.39.camel@ted>
Date: Tue, 08 Oct 2013 12:47:22 -0500
Message-ID: <87txgr64et.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 10/08/2013 12:47:23 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 10/08/2013 12:47:23 PM,
	Serialize complete at 10/08/2013 12:47:23 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-08_08:2013-10-08, 2013-10-08,
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
X-List-Received-Date: Tue, 08 Oct 2013 17:47:23 -0000
Content-Type: text/plain


richard.purdie@linuxfoundation.org writes:

>> I know that the OE build is horribly slow, but is it really so slow as
>> to require short-circuiting native package dependencies such as this?
>> Has there been a general architectural decision made over this sort of
>> thing? (I'm sorry, I tried to search for one on the mailing list and
>> wiki, but couldn't find any.)
>
> Some native utilities cause big problems in the dependency chain. Things
> like tar and gzip have caused us big problems in the past. We've made a
> conscious decision to require specific versions of tar, gzip and git for
> example to ensure builds work as expected.

I can level with that. However, it doesn't seem obvious that such a
decision was conscientiously made, judging from the code/documentation
(at least to a neophyte like me). Is there a place I've missed where
such technical decisions have been documented? (Or should there be? Or
should I just ask these sorts of questions on IRC?)

> The list of things we assume are ok is relatively small and we look at
> new issues on a case by case basis. I think sed is well enough
> established and well enough behaved to be something we can rely on. In
> general we don't rely on much. Do you have any other specific things you
> worry about? When you start to look at it, the list is rather small...

The biggest thing I can think of is gcc-native. My understanding of gcc
documentation is that it's recommended to build a cross-compiler with a
bootstrap, or at least the same version of compiler, and we're not doing
that. (Right?)

Otherwise I'm mainly asking in order to understand the decisionmaking.

>
> Cheers,
>
> Richard


-- 
Richard Tollerton <rich.tollerton@ni.com>

