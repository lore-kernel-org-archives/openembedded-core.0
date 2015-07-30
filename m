Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9487C76419
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 07:40:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6U7eLSx012093
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 Jul 2015 00:40:21 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 30 Jul 2015 00:40:02 -0700
Message-ID: <55B9D4E3.1010305@windriver.com>
Date: Thu, 30 Jul 2015 15:40:19 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LY_8MGszbQYJziM+bj4GUV+qmQgnzSTOHb4XG0+1GVb8A@mail.gmail.com>
In-Reply-To: <CAJTo0LY_8MGszbQYJziM+bj4GUV+qmQgnzSTOHb4XG0+1GVb8A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bjam-native: inhibit sysroot strip
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
X-List-Received-Date: Thu, 30 Jul 2015 07:40:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/29/2015 06:19 PM, Burton, Ross wrote:
>
> On 29 July 2015 at 08:34, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     +# bjam is already stripped, don't strip it again
>     +INHIBIT_SYSROOT_STRIP = "1"
>
>
> In case it's even needed to debug bjam-native, how hard would it be to
> stop bjam from being stripped in the first place?

By default, a release version is stripped, we could build & install the 
debug version for bjam.

For specific changes, we only need to append "--debug" to build.sh, then 
update do_install() to select the unstripped version.

Do you think this is the right ways?

Thanks
Wenzong

>
> Ross

