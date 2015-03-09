Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F3CA06AC2B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 01:39:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t291dnae009138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 8 Mar 2015 18:39:49 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 8 Mar 2015 18:39:49 -0700
Message-ID: <54FCF9E3.3070002@windriver.com>
Date: Mon, 9 Mar 2015 09:39:47 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1425634271.git.liezhi.yang@windriver.com>
	<1eade737f0d2e1279a75c27335e110140b28503f.1425634271.git.liezhi.yang@windriver.com>
	<CAJTo0La_2aZHEs5MfbaV+UZ9Bf+qLfnm0Dj=9uurcLVz9KUHvQ@mail.gmail.com>
In-Reply-To: <CAJTo0La_2aZHEs5MfbaV+UZ9Bf+qLfnm0Dj=9uurcLVz9KUHvQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] apt: fix SRC_URI
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
X-List-Received-Date: Mon, 09 Mar 2015 01:39:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2015 08:35 PM, Burton, Ross wrote:
>
> On 6 March 2015 at 09:32, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     -SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/apt_${PV}.tar.gz \
>     +SRC_URI =
>     "https://launchpad.net/debian/+archive/primary/+files/apt_0.9.9.4.tar.gz \
>
>
> Surely this should continue using ${PV}, especially as this is a .inc.

Thanks, I will update them and resend these patches.

// Robert

>
> Ross

