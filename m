Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C50AB601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 03:08:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6T38Jp6012326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 20:08:19 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 20:08:02 -0700
Message-ID: <55B843A1.6040207@windriver.com>
Date: Wed, 29 Jul 2015 11:08:17 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436518495-27392-1-git-send-email-rongqing.li@windriver.com>
	<CAHiDW_FxgLz638LwPen_AfOByHeCpvL6A093PjrmGD4X=P-xNQ@mail.gmail.com>
	<55B582F8.5000603@windriver.com>
	<CAJTo0La-RwRf3L-sJ=HtMMFi_nMQwXi5cXzunELAg6trRyT0cw@mail.gmail.com>
In-Reply-To: <CAJTo0La-RwRf3L-sJ=HtMMFi_nMQwXi5cXzunELAg6trRyT0cw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][resend] perl: fix build failure if building dir has the "blib" string
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
X-List-Received-Date: Wed, 29 Jul 2015 03:08:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年07月28日 20:53, Burton, Ross wrote:
>
> On 27 July 2015 at 02:01, Rongqing Li <rongqing.li@windriver.com
> <mailto:rongqing.li@windriver.com>> wrote:
>
>     I think we can merge this patch.
>
>     I open a defect and submit this patch, as a result, noone knows
>     what this line can fix.
>
>
>     https://rt.perl.org/Public/Bug/Display.html?id=125603
>
>
> Reading the bug it seems a more upstream-friendly fix (i.e. one that
> they would also accept and have in fact asked for) would be to change
> the regex to /\bblib\b/. This solves the problem of building in paths
> that contain the substring "blib" *and* retains the intent of the logic.
>


it can not fix all issues to replace /blib/ with /\bblib\b/.

/\bblib\b/ will make the building path "/tmp/xxxxblibyy/" work.
but if the building path has sub-dir blib, it does not work,
like /tmp/blib/
since \b is anchor in perl

I have update the perl bug report

https://rt.perl.org/Public/Bug/Display.html?id=125603

-R

> Ross

-- 
Best Reagrds,
Roy | RongQing Li

