Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 41E0473333
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 22:49:57 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t1BMnwcQ019853; Wed, 11 Feb 2015 16:49:58 -0600
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015021116495874-1058294 ;
	Wed, 11 Feb 2015 16:49:58 -0600 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Paul Barker <paul@paulbarker.me.uk>
In-Reply-To: <20150211081446.GA28568@bang.betafive.co.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
	<1421446529-24888-8-git-send-email-paul@paulbarker.me.uk>
	<87bnl1tgzt.fsf@weregild.amer.corp.natinst.com>
	<20150211081446.GA28568@bang.betafive.co.uk>
User-Agent: Notmuch/0.19 (http://notmuchmail.org) Emacs/24.4.2
	(x86_64-unknown-linux-gnu)
Date: Wed, 11 Feb 2015 16:49:58 -0600
Message-ID: <87vbj8rrl5.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/11/2015 04:49:58 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 02/11/2015 04:49:58 PM,
	Serialize complete at 02/11/2015 04:49:58 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-02-11_04:, , signatures=0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 7/7] opkg-keyrings: New recipe
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
X-List-Received-Date: Wed, 11 Feb 2015 22:50:08 -0000
Content-Type: text/plain

Paul Barker <paul@paulbarker.me.uk> writes:

> On Tue, Feb 10, 2015 at 06:43:34PM -0600, Richard Tollerton wrote:
>> Paul Barker <paul@paulbarker.me.uk> writes:
>> 
>> > This recipe wraps package and package feed verification keys into a package,
>> > making the management and deployment of verification keys much easier. Comments
>> > on how to select keys for inclusion in this package are provided in the recipe
>> > file.
>> 
>> Would you be receptive to this package being extended to support OpenSSL
>> keys?
>
> I wouldn't advise it.
>
> There is no 'OpenSSL exception' in the opkg license and so a few people have
> been worried that shipping binaries of opkg linked against OpenSSL is a breach
> of the respective licenses. IANAL, but people have been concerned.

Do you recall if this is specifically because OpenSSL is statically
linked into libopkg? (Why is that done, anyway?)

> OpenSSL support is probably less tested than gpg support as well.
>
> However, if it's something you're already using, have tested and are comfortable
> with the licensing implications then go for it.

Meh. We've got some existing OpenSSL infrastructure for other operating
systems, so we were kinda sliding into an OpenSSL-based opkg setup by
sheer inertia. But if gnupg is going to align better with everybody else
long term, it's not too late to change directions.

