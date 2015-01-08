Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id F1A4072AE8;
	Thu,  8 Jan 2015 20:00:02 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	t08K01Mw025643; Thu, 8 Jan 2015 14:00:01 -0600
Received: from weregild ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015010814000103-1776484 ;
	Thu, 8 Jan 2015 14:00:01 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
In-Reply-To: <20150108120155.GH3972@jama>
References: <20141219180841.C5F5A503BF@opal.openembedded.org>
	<20150107141256.GM29986@jama> <20150108120155.GH3972@jama>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.1
	(x86_64-unknown-linux-gnu)
Date: Thu, 08 Jan 2015 14:00:00 -0600
Message-ID: <87zj9tt54v.fsf@weregild.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/08/2015 02:00:01 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 01/08/2015 02:00:01 PM,
	Serialize complete at 01/08/2015 02:00:01 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2015-01-08_06:2015-01-07, 2015-01-08,
	1970-01-01 signatures=0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : font-util: Fix incorrect PKG_CONFIG_PATH
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
X-List-Received-Date: Thu, 08 Jan 2015 20:00:05 -0000
Content-Type: text/plain

Martin Jansa <martin.jansa@gmail.com> writes:

> On Wed, Jan 07, 2015 at 03:12:56PM +0100, Martin Jansa wrote:
>> On Fri, Dec 19, 2014 at 06:08:41PM +0000, git@git.openembedded.org wrote:
>> > encoding maps are stored under a different path than OE, this will break
>> > font builds, because ucs2any will attempt to read the sysroot's encoding
>> > maps with the host paths.
>> 
>> ^ Is this description of what the patch is supposed to fix or expected
>> side-effect of this change?
>> 
>> Because all font recipes and meta-oe are failing since this change with
>> errors like this:
>> 
>> /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/bin/ucs2any: Can't read mapping file
>> '/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/share/fonts/X11/util/map-ISO8859-1': No such file or directory!
>> 
>> See http://www.openembedded.org/wiki/Bitbake_World_Status
>
> I can confirm that reverting this patch fixes font-* recipes
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100523.html

Thanks for the heads-up, I've reproduced it and will get back with a
fix. How soon do you need it to avoid a revert?

> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

-- 
Richard Tollerton <rich.tollerton@ni.com>

