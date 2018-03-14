Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3B38E788EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 15:11:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2EFBR92020314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Mar 2018 08:11:27 -0700 (PDT)
Received: from server.local (128.224.20.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 14 Mar 2018 08:10:46 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
	<f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
	<CAJTo0LZcrg5TmTEyEwjAW0_49RJ0T2A4ZBsuNmyJ=wSMFWtuZw@mail.gmail.com>
	<dbc5da75-f7b9-bda4-c9da-5be3088945ab@windriver.com>
	<CAJTo0LbY_61zJ=nCBGgmruLOY+x2Ky6Coj-D9X743iXBAFJ6+g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <9f288566-afd0-c6d7-7481-c69b818f9c5c@windriver.com>
Date: Wed, 14 Mar 2018 11:11:26 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbY_61zJ=nCBGgmruLOY+x2Ky6Coj-D9X743iXBAFJ6+g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Wed, 14 Mar 2018 15:11:27 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-03-14 8:50 AM, Burton, Ross wrote:
> On 14 March 2018 at 12:46, Bruce Ashfield <bruce.ashfield@windriver.com 
> <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     I'll revert this for now (or see if I can quickly move it to a debug
>     kernel build), and yes, there is a better way to do this. I'm just not
>     sure I can get it done in time for the release.
> 
> 
> Thanks.  I'm desperately trying to be able to tell RP we can fire the M3 
> build so I'm +1 on reverting now, fixing later.

revert sent. I put all the details in the commit log about how
to build systemtap with the relevant options enabled. So there's
still a way to build with the options that were the intent of that
change, and with this revert the standard kernel should go back
to normal.

Bruce

> 
> Ross


