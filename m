Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3B04732A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 16:49:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1BGnwf4008629
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 08:49:59 -0800 (PST)
Received: from [128.224.56.57] (128.224.56.57) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Feb 2015 08:49:58 -0800
Message-ID: <54DB8842.9010100@windriver.com>
Date: Wed, 11 Feb 2015 11:50:10 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1423613857-19514-1-git-send-email-paul.gortmaker@windriver.com>
	<CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYJpt2XpPL6SYtY+2sT9oR4DuBKdjoCtMZR7CHqygSF0Q@mail.gmail.com>
X-Originating-IP: [128.224.56.57]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] avahi: fix do_rootfs failure due to version skew
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
X-List-Received-Date: Wed, 11 Feb 2015 16:50:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 15-02-11 07:25 AM, Burton, Ross wrote:
> Hi Paul,
> 
> On 11 February 2015 at 00:17, Paul Gortmaker <paul.gortmaker@windriver.com>
> wrote:
> 
>> -RDEPENDS_${PN}-dev = "avahi-daemon (= ${EXTENDPKGV}) libavahi-core (=
>> ${EXTENDPKGV}) libavahi-client (= ${EXTENDPKGV})"
>> +RDEPENDS_${PN}-dev = "avahi-daemon (>= ${PKGV}-${INC_PR}) libavahi-core
>> (>= ${PKGV}-${INC_PR}) libavahi-client (>= ${PKGV}-${INC_PR})"
>>
> 
> But this then breaks the hard dependencies for the avahi package.
> 
> Basically the problem is that you can't just include complex recipes in
> other recipes and expect it to work without lots of hackery.  In this case,
> the amount of hackery required to fix this and various other problems (I've
> an abandoned branch that sorts out other problems) is arguably more
> complicated that throwing all of this away and starting again.
> 
> Personally, I don't see why we have avahi and avahi-ui.  Enabling the GTK+
> tools should be a PACKAGECONFIG option that is controlled by default by
> DISTRO_FEATURES, and all the hackery deleted.
> 
> I've got a few branches that implement some of this already, I'll dig them
> out as this has been bugging me for a while now.

OK, I'll just keep a local fix for myself as required and leave it
to you guys who have a better understanding of the problem space.

BTW, Is there an open bug I can subscribe to?

Thanks,
Paul.
--

> 
> Ross
> 

