Return-Path: <changhyeok.bae@lge.com>
X-Greylist: delayed 899 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 May 2015 03:04:59 UTC
Received: from lgemrelse7q.lge.com (LGEMRELSE7Q.lge.com [156.147.1.151])
	by mail.openembedded.org (Postfix) with ESMTP id C790074030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 03:04:59 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.222.197)
	by 156.147.1.151 with ESMTP; 14 May 2015 11:49:28 +0900
X-Original-SENDERIP: 10.177.222.197
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: "'OE-core'" <openembedded-core@lists.openembedded.org>
References: <20150312143521.GD2338@jama> <5501D4CA.2090209@r-finger.com>
In-Reply-To: <5501D4CA.2090209@r-finger.com>
Date: Thu, 14 May 2015 11:50:00 +0900
Message-ID: <08f401d08df0$aba9be00$02fd3a00$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQFJJzd33wMNl4fFEeoeYEhR/UHxBgHlFIsNnnpp5FA=
Subject: Re: meta-gir issues and maintenance
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
X-List-Received-Date: Thu, 14 May 2015 03:05:03 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Hi Tomas,

I'm Changhyeok and working with Martin Jansa.
Actually I'm using meta-gir layer. So can I take over meta-gir layer?

Thanks
Changhyeok

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org
[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Tomas
Frydrych
Sent: Friday, March 13, 2015 3:03 AM
To: OE-core
Subject: Re: [OE-core] meta-gir issues and maintenance

Martin,

On 12/03/15 14:35, Martin Jansa wrote:
> I was trying to use meta-gir in Dizzy release and found out that last 
> commit in this layer is 16 months ago and many .bbappends no longer 
> match with their recipes.
> 
> Was this layer superseded by something else or you just didn't have 
> time to update it for newer Yocto releases?

Unfortunately, life has been getting in the way of working on this layer (as
well as meta-guacamayo), and it is not going to change in the foreseeable
future. :-( It's a pity, as the gir stuff is useful/necessary for things
like python bindings to gobject and related.
If someone wanted to take over, it would make sense to move the repo
somewhere more central (yocto, oe) as well.

Tomas

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

This email has been protected by YAC (Yet Another Cleaner) http://www.yac.mx

