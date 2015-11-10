Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 07DD976F58
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 06:03:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAA639GB027547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Nov 2015 22:03:09 -0800 (PST)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 9 Nov 2015 22:03:08 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1445333081.git.liezhi.yang@windriver.com>
	<b6a5e9973afe805490f6aee8967026bc47f2692b.1445333081.git.liezhi.yang@windriver.com>
	<CAJTo0LaOD2_=aDwHi9fjGzWZ2+hcMtUnjHMFsSOTABWiozuSTQ@mail.gmail.com>
	<564094ED.4050402@windriver.com>
	<CAJTo0LaU=2GbBh7F6d+yGz+nUFZKd9x3cvSi4mU_=7xG2QY_Dg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5641889A.8070107@windriver.com>
Date: Tue, 10 Nov 2015 14:03:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaU=2GbBh7F6d+yGz+nUFZKd9x3cvSi4mU_=7xG2QY_Dg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] bitbake-prserv-tool: check file name
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
X-List-Received-Date: Tue, 10 Nov 2015 06:03:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2015 10:33 PM, Burton, Ross wrote:
>
> On 9 November 2015 at 12:43, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Maybe selftest should use export.conf rather than export.inc ?
>
>
> It's a configuration file that is typically included, so I'd say .inc is
> perfectly reasonable.  Better error reporting in the Python would be useful so
> it doesn't just throw an exception.

Thanks, I will update it to both check .inc and .conf.

// Robert

>
> Ross

