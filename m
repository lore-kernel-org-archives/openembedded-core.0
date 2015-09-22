Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC1073CBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 02:41:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8M2exlh017099
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Sep 2015 19:40:59 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 21 Sep 2015 19:40:59 -0700
Message-ID: <5600BFB9.1060401@windriver.com>
Date: Tue, 22 Sep 2015 10:40:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1442370259.git.liezhi.yang@windriver.com>
	<90e4a1064ea7dfa9be458d306bba765136b50306.1442370259.git.liezhi.yang@windriver.com>
	<CAHiDW_Gij3wQ0daYSBetKgBmz-E=DncKUvtP_WJ+O_g-T4vn_w@mail.gmail.com>
	<55F945B5.9060007@windriver.com>
	<CAJTo0LYZ+mcOxm0Tu3E7-sqG08pmtzpkqr3+-r6vESkqOx4S8A@mail.gmail.com>
In-Reply-To: <CAJTo0LYZ+mcOxm0Tu3E7-sqG08pmtzpkqr3+-r6vESkqOx4S8A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] gtk+/cairo: enable x11 or directfb
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
X-List-Received-Date: Tue, 22 Sep 2015 02:41:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/19/2015 04:23 AM, Burton, Ross wrote:
>
> On 16 September 2015 at 11:34, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Make the world build OK when possible, for example, when no x11 in
>     DISTRO_FEATURE.
>
>
> But now you're just explicitly ignoring the directfb DISTRO_FEATURE.  Maybe if
> you want to do a world build without X11 enabled the you should add directfb to
> DISTRO_FEATURES?

If I understand correctly, how about we add a sanity check when do world
build? Either X11 or directfb should be in DISTRO_FEATURES. But gtk+ is
the only one which requires this, others can be built without both of them.

// Robert

>
> Ross

