Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CC1BD65D00
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Apr 2015 03:32:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t343W8f6026828
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 3 Apr 2015 20:32:08 -0700 (PDT)
Received: from [128.224.162.174] (128.224.162.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 3 Apr 2015 20:32:07 -0700
Message-ID: <551F5B36.8080103@windriver.com>
Date: Sat, 4 Apr 2015 11:32:06 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1427874748.git.liezhi.yang@windriver.com>
	<ef4bd808c72bfaa4a7615db04cd27fdb98ab38bf.1427874748.git.liezhi.yang@windriver.com>
	<20150401175921.GK14928@jama> <551CB686.5090405@windriver.com>
	<CAJTo0LYwySSjO=uE9qoh7Otk9dtMvoBEOeFBv6=D_AqeNyiqAA@mail.gmail.com>
In-Reply-To: <CAJTo0LYwySSjO=uE9qoh7Otk9dtMvoBEOeFBv6=D_AqeNyiqAA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] piglit: add PACKAGECONFIG for freeglut
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
X-List-Received-Date: Sat, 04 Apr 2015 03:32:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2015 07:10 PM, Burton, Ross wrote:
>
> On 2 April 2015 at 04:24, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I'm afraid not since it depends on virtual/libx11.
>
>
> So what's gained by disabling freeglut? Shouldn't we be enabling it if possible?

There is no freeglut in oe-core, so I think that we need disable it by default.

// Robert

>
> Ross

