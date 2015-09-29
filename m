Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6339076FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 07:46:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8T7k4mK019528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Sep 2015 00:46:04 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 00:46:04 -0700
Message-ID: <560A41BA.5050906@windriver.com>
Date: Tue, 29 Sep 2015 15:46:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1443432019.git.liezhi.yang@windriver.com>
	<5a37554dfd79d1c65ce30ab9db9b05608066eedd.1443432019.git.liezhi.yang@windriver.com>
	<CAJTo0LZv-pri_fntqi6ypU=oFiSXD--1k9ZBfzhF=TN7aVTFEw@mail.gmail.com>
In-Reply-To: <CAJTo0LZv-pri_fntqi6ypU=oFiSXD--1k9ZBfzhF=TN7aVTFEw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] python-async: inherit setuptools
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
X-List-Received-Date: Tue, 29 Sep 2015 07:46:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 09/28/2015 08:31 PM, Burton, Ross wrote:
>
> On 28 September 2015 at 10:20, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -inherit distutils
>     +inherit distutils setuptools
>
>
> setuptools inherits distutils, so you can replace instead of adding.

Thanks, updated in the repo.

// Robert

>
> Ross

