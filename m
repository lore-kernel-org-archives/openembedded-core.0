Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 089A665C98
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jul 2015 02:54:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6C2sokW015049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Jul 2015 19:54:50 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Sat, 11 Jul 2015 19:54:49 -0700
Message-ID: <55A1D6F8.4010801@windriver.com>
Date: Sun, 12 Jul 2015 10:54:48 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1436176865.git.liezhi.yang@windriver.com>
	<249919a0513534269d16dee1ecaf173d01b7e791.1436176865.git.liezhi.yang@windriver.com>
	<CAJTo0LbS0ReW+N3YL=TU+AzeGogrS++jxabp5_=ns_GxFtOC4g@mail.gmail.com>
In-Reply-To: <CAJTo0LbS0ReW+N3YL=TU+AzeGogrS++jxabp5_=ns_GxFtOC4g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: skip dev-deps QA checking for ptest package
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
X-List-Received-Date: Sun, 12 Jul 2015 02:54:53 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2015 06:26 AM, Burton, Ross wrote:
>
> On 6 July 2015 at 11:01, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The ptest pkg such as perl-ptest may need .h, .so or other files in dev
>     package to run test cases, so skipping dev-deps checkin for ptest
>     package.
>
>
> Is this a common occurrence or is perl the first instance of this? This warning
> can be skipped with INSANE_SKIP_${PN}-ptest = "dev-deps", right?

I only know perl atm, I will try more.

// Robert

>
> Ross

