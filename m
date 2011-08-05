Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpN41-0004kk-Oe
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 18:15:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2011 09:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="36235876"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2011 09:11:31 -0700
Message-ID: <4E3C1633.9000505@linux.intel.com>
Date: Fri, 05 Aug 2011 09:11:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <5EF017EC-CCFD-4040-9455-D022611ACD0E@freescale.com>
	<4E3BE761.6070407@windriver.com>
In-Reply-To: <4E3BE761.6070407@windriver.com>
Cc: "yocto@yoctoproject.org list" <yocto@yoctoproject.org>,
	Kumar Gala <kumar.gala@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Use of git.pokylinux.org vs git.yoctoproject.org in	kernel recipe.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Aug 2011 16:15:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2011 05:51 AM, Bruce Ashfield wrote:
> On 11-08-05 08:50 AM, Kumar Gala wrote:
>> In the linux-yocto_3.0.bb recipe we have:
>>
>> meta/recipes-kernel/linux/linux-yocto_3.0.bb:SRC_URI =
>> "git://git.pokylinux.org/linux-yocto-3.0;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
>>
>>
>> Should this really be git.yoctoproject.org?
>
> Yep, it should be! I'm sending a pull request for queue of kernel
> changes, so I'll toss this on top of the pile.
>
Already done

Sau!

> Bruce
>
>>
>> [ I think the sites might be interchangeable, but seems like being
>> consistent is good. With the name of the recipe being yocto, and with
>> the 2.6.34. and 2.6.37 kernel recipes ]
>>
>> ---
>> From - Fri Aug 05 08:18:45 2011
> X-Mozilla-Status: 0010
> X-Mozilla-Status2: 00000000
> Return-Path: <yocto-bounces@yoctoproject.org>
> X-Original-To: sgw@linux.intel.com
> Delivered-To: sgw@linux.intel.com
> Received: from azsmga001.ch.intel.com (azsmga001.ch.intel.com [10.2.17.19])
> by linux.intel.com (Postfix) with ESMTP id F1B0A6A4087;
> Fri, 5 Aug 2011 08:18:39 -0700 (PDT)
> Received: from azsmga102.ch.intel.com ([10.2.16.52])
> by azsmga001-1.ch.intel.com with ESMTP; 05 Aug 2011 08:18:40 -0700
> X-IronPort-Anti-Spam-Filtered: true
> X-IronPort-Anti-Spam-Result:
> AkwAAH8JPE6M06l6mWdsb2JhbABAA5gYj0sUAQEBAQEICwsHFCWBQAEBAQEDAQEBNwwDBwUKDAMLAwMBAgMDAQEBAQgRBAEBAQoUCAEHAwEjAQoUCQgCBAESBQOHab8ag0CCJ18EkHSHHhWLQQ
>
> X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="749637259"
> Received: from yocto-www.yoctoproject.org ([140.211.169.122])
> by mtab.intel.com with ESMTP; 05 Aug 2011 08:18:28 -0700
> Received: from yocto-www.yoctoproject.org (localhost [127.0.0.1])
> by yocto-www.yoctoproject.org (Postfix) with ESMTP id C4CAEE011C0;
> Fri, 5 Aug 2011 08:18:14 -0700 (PDT)
> X-Original-To: yocto@yoctoproject.org
> Delivered-To: yocto@yoctoproject.org
> Received: from mx01no.tycohealthcare.com (mx01no.tycohealthcare.com
> [216.75.208.72])
> by yocto-www.yoctoproject.org (Postfix) with ESMTP id C119FE011BF
> for <yocto@yoctoproject.org>; Fri, 5 Aug 2011 08:18:09 -0700 (PDT)
> X-IronPort-AV: E=Sophos;i="4.67,323,1309752000"; d="scan'208";a="285840293"
> Received: from unknown (HELO tamans-bh02.thcg.net) ([10.80.3.108])
> by mx01no.tycohealthcare.com with ESMTP; 05 Aug 2011 11:18:17 -0400
> Received: from TAMANS-HT100V.thcg.net ([10.80.9.28]) by
> tamans-bh02.thcg.net
> with Microsoft SMTPSVC(6.0.3790.4675); Fri, 5 Aug 2011 11:18:17 -0400
> Received: from TAMANS-HT101V.thcg.net (10.80.9.29) by
> TAMANS-HT100V.thcg.net
> (10.80.9.28) with Microsoft SMTP Server (TLS) id 14.1.289.1;
> Fri, 5 Aug 2011 11:18:17 -0400
> Received: from TAMANS-MB100V.thcg.net ([169.254.8.245]) by
> TAMANS-HT101V.thcg.net ([10.80.9.29]) with mapi id 14.01.0289.001;
> Fri, 5 Aug 2011 11:18:17 -0400
> From: "Ourada, Paul" <Paul.Ourada@Covidien.com>
> To: Richard Purdie <richard.purdie@linuxfoundation.org>, Todd Cooper
> <todd_cooper@yahoo.com>
> Thread-Topic: [yocto] prebuilt pacakages
> Thread-Index: AQHMU0eqaudMXigntU+XF//SkgCRv5UOXQSg
> Date: Fri, 5 Aug 2011 15:18:15 +0000
> Message-ID: <4D9E0AFD9C2FCC428A8EAADA898F5B2D018515@TAMANS-MB100V.thcg.net>
> References: <1312468953.58082.YahooMailNeo@web161219.mail.bf1.yahoo.com>
> <1312469993.14274.10.camel@rex>
> <1312480201.81774.YahooMailNeo@web161219.mail.bf1.yahoo.com>
> <1312497831.14274.53.camel@rex>
> <1312508226.49460.YahooMailNeo@web161217.mail.bf1.yahoo.com>
> <1312532006.14274.62.camel@rex>
> In-Reply-To: <1312532006.14274.62.camel@rex>
> Accept-Language: en-US
> Content-Language: en-US
> X-MS-Has-Attach: X-MS-TNEF-Correlator: x-originating-ip: [10.80.12.32]
> MIME-Version: 1.0
> X-OriginalArrivalTime: 05 Aug 2011 15:18:17.0436 (UTC)
> FILETIME=[E71049C0:01CC5382]
> Cc: "\"yocto@yoctoproject.org\"" <yocto@yoctoproject.org>
> Subject: Re: [yocto] prebuilt pacakages
> X-BeenThere: yocto@yoctoproject.org
> X-Mailman-Version: 2.1.13
> Precedence: list
> List-Id: Discussion of all things Yocto <yocto.yoctoproject.org>
> List-Unsubscribe: <https://lists.yoctoproject.org/options/yocto>,
> <mailto:yocto-request@yoctoproject.org?subject=unsubscribe>
> List-Archive: <http://lists.yoctoproject.org/pipermail/yocto>
> List-Post: <mailto:yocto@yoctoproject.org>
> List-Help: <mailto:yocto-request@yoctoproject.org?subject=help>
> List-Subscribe: <https://lists.yoctoproject.org/listinfo/yocto>,
> <mailto:yocto-request@yoctoproject.org?subject=subscribe>
> Content-Type: text/plain; charset="us-ascii"
> Content-Transfer-Encoding: 7bit
> Sender: yocto-bounces@yoctoproject.org
> Errors-To: yocto-bounces@yoctoproject.org
>
> I'm no expert, but would the use of something like Puppet make this job
> a lot easier? A consultant is suggesting that we consider that tool for
> this purpose. Define a particular set of packages in Puppet, and you can
> play around in your sandbox to your heart's content. When you want to
> get back to a particular configuration, let Puppet do that for you. It
> may be a little heavyweight for some projects, but I'd think that any
> project which needs stricter control could use this.
>
> http://www.puppetlabs.com
>
> Paul E. Ourada
> Sr. Principal Software Engineer
> Covidien, Energy-based Devices
> 5920 Longbow Drive
> Boulder, CO 80301
> paul.ourada@covidien.com
> www.covidien.com
> Main: 303-530-2300
> Ofc: 303-581-6940
> Fax: 303-581-6741
>
> -----Original Message-----
> From: yocto-bounces@yoctoproject.org
> [mailto:yocto-bounces@yoctoproject.org] On Behalf Of Richard Purdie
> Sent: Friday, August 05, 2011 2:13 AM
> To: Todd Cooper
> Cc: "yocto@yoctoproject.org"
> Subject: Re: [yocto] prebuilt pacakages
>
> On Thu, 2011-08-04 at 18:37 -0700, Todd Cooper wrote:
>> Can I suggest that Yocto put it on the futures list, but with a lower
>> priority?
>
> You can add it to the list on the wiki.
>
> Which known set of prebuilt packages are you thinking we should be able
> to build against?
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>


