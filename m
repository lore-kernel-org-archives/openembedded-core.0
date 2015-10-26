Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8997873E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Oct 2015 02:00:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9Q20EGM018656
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Oct 2015 19:00:14 -0700 (PDT)
Received: from [128.224.162.154] (128.224.162.154) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 25 Oct 2015 19:00:14 -0700
Message-ID: <562D892C.3090800@windriver.com>
Date: Mon, 26 Oct 2015 10:00:12 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1445506427-15720-1-git-send-email-wenzong.fan@windriver.com>
	<CAJTo0LY=QaJ-a9U=59_RgJAxR+LJUciXQiBv=jujHHVDR6SDpA@mail.gmail.com>
In-Reply-To: <CAJTo0LY=QaJ-a9U=59_RgJAxR+LJUciXQiBv=jujHHVDR6SDpA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: set development_version as no
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
X-List-Received-Date: Mon, 26 Oct 2015 02:00:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/2015 06:40 PM, Burton, Ross wrote:
>
> On 22 October 2015 at 10:33, <wenzong.fan@windriver.com
> <mailto:wenzong.fan@windriver.com>> wrote:
>
>     +-development_version=mym4_isbeta
>     ++development_version=no
>
>
> I'd say that a neater fix would be to change the logic in autogen,sh to
> set beta=no in the find-version logic.  There's a chance you can use the
> argument that taking an upstream tarball and re-running autoconf
> shouldn't be considered a development release to get it upstreamed then.

Ok, I'll update the patch.

Thanks
Wenzong

>
> Ross

