Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55DCB610F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 10:12:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8GACxC8001989
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Sep 2013 03:12:59 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 16 Sep 2013 03:12:59 -0700
Message-ID: <5236D9A7.6080300@windriver.com>
Date: Mon, 16 Sep 2013 18:12:55 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
	<5236C833.30002@windriver.com>
	<CAJTo0LYqh0+TY8hgv4NufumF_uu6c_sVSG5=Eyf2b=FNe+FRhA@mail.gmail.com>
	<CAJTo0LZPbYuFyCK2xRy4QcM=miAKaEQby+7Hxgw3V1WAuhVkAQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZPbYuFyCK2xRy4QcM=miAKaEQby+7Hxgw3V1WAuhVkAQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 10:12:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2013 05:30 PM, Burton, Ross wrote:
> On 16 September 2013 10:15, Burton, Ross <ross.burton@intel.com> wrote:
>> On 16 September 2013 09:58, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> Is there a specify reason that we need to remove it ? transfig
>>> provides fig2dev which is used for building the documentation,
>>> for example, gstreamer and libtheora may use fig2dev.
>>
>> Considering nothing depends on it, clearly not in stock oe-core.
>> Presumably you have some patches to enable the documentation builds
>> and add the missing dependencies?
>
> It also appears that GStreamer (at least gstreamer itself, HEAD of
> master and 0.10) doesn't actually use fig files for the documentation,
> just PNG.
>
> If we're talking about a large number of packages then I'd agree, but
> if we're saying that oe-core should have imake and transfig-native so
> that if you patch libtheora to build documentation it has diagrams,
> then I'm not sure that's a suitable trade-off.
>

No, I don't have anything depend on transfig-native, I just worried about
that many packages use it, I did a grep in a world build directory just now
, didn't find any more packages use it.

// Robert

> Ross
>
>

