Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4F617701C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:28:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9E2SxbR023353
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Oct 2015 19:28:59 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 19:28:58 -0700
Message-ID: <561DBDE8.6030908@windriver.com>
Date: Wed, 14 Oct 2015 10:28:56 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
References: <1444642535-196919-1-git-send-email-wenzong.fan@windriver.com>
	<1444654455.3844.3.camel@linuxfoundation.org>
	<561C66C6.4090408@windriver.com>
	<CAJTo0LaXbStAc_CYc2qLrxSbMK6wNfrQuMrUB0JS02Hn16fjxg@mail.gmail.com>
In-Reply-To: <CAJTo0LaXbStAc_CYc2qLrxSbMK6wNfrQuMrUB0JS02Hn16fjxg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Wed, 14 Oct 2015 02:29:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2015 08:48 PM, Burton, Ross wrote:
>
> On 13 October 2015 at 03:04, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I wrongly thought that it was right, and we did have several
>     "Backport [Debian]"
>     in oe-core/meta, should it be a Pending or Pending [Debian], please ?
>
>
> If the Debian bug/patch doesn't refer to an upstream bug, I'd suggest
> Pending with a link to the debian bug# if there is one.

Ok, I'll send V2 with the updates.

Thanks
Wenzong

>
> Ross
>

