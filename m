Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB9EB6E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 10:23:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8AANXh4022591
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 10 Sep 2015 03:23:33 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 10 Sep 2015 03:23:33 -0700
Message-ID: <55F15A23.5010904@windriver.com>
Date: Thu, 10 Sep 2015 18:23:31 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1441878476.git.liezhi.yang@windriver.com>
	<CAJTo0LYdchmiRpbW6TKOQ68pzgLUKiRt4bOP2syNH6-9Zppd2g@mail.gmail.com>
In-Reply-To: <CAJTo0LYdchmiRpbW6TKOQ68pzgLUKiRt4bOP2syNH6-9Zppd2g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS
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
X-List-Received-Date: Thu, 10 Sep 2015 10:23:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/10/2015 06:14 PM, Burton, Ross wrote:
> I sent an almost identical patch to this yesterday :)

Thanks, please drop this one, something is wrong with my
thunderbird's searching, I had searched before I worked on it,
but didn't find the patch, I searched it again just now, and
did find it. (while its sorting isn't correct)

// Robert

>
> (your patch breaks is SSTATE_VERIFY_KEY="0")
>
> Ross
>
> On 10 September 2015 at 11:04, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     The following changes since commit 56c5fa106eeccda2ca92dbeb73ff01ba40992e7d:
>
>        ptest: use fakeroot for do_install_ptest_base (2015-09-09 14:25:09 +0100)
>
>     are available in the git repository at:
>
>        git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib> rbt/ss
>     http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ss
>
>     Robert Yang (1):
>        sstate.bbclass: fixes for SSTATE_SIG_KEY when use SSTATE_MIRRORS
>
>       meta/classes/sstate.bbclass |    7 ++++---
>       1 file changed, 4 insertions(+), 3 deletions(-)
>
>     --
>     1.7.9.5
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

