Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ECA817391D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 06:28:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6F6SS6f018943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jul 2015 23:28:28 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 14 Jul 2015 23:28:27 -0700
Message-ID: <55A5FD8A.3010802@windriver.com>
Date: Wed, 15 Jul 2015 14:28:26 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1436765128-16695-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0Lb8L_NZVvJqaKB0VfWd2SdoL1p8rtfuOjof4J8yQ1kf9A@mail.gmail.com>
In-Reply-To: <CAJTo0Lb8L_NZVvJqaKB0VfWd2SdoL1p8rtfuOjof4J8yQ1kf9A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1 v2] rpcbind: handle rpcbind options
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
X-List-Received-Date: Wed, 15 Jul 2015 06:28:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2015 07:14 PM, Burton, Ross wrote:
>
> On 13 July 2015 at 06:25, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     -EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
>     +EnvironmentFile=@SYSCONFDIR@/rpcbind.conf
>
>
> Did you intend to drop the - from the EnvironmentFile statement?  I'm
> guessing not.
>

No, I didn't.

I have sent V3 for clean this change.

Thanks
Wenzong

> Ross

