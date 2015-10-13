Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08FA27705F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 07:17:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9D7Hld5005895
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Oct 2015 00:17:47 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 00:17:46 -0700
Message-ID: <561CB019.8070903@windriver.com>
Date: Tue, 13 Oct 2015 15:17:45 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1444310101.git.liezhi.yang@windriver.com>
	<CAJTo0LbgZb=Q+sAd9W82U9Y5AQsR1xcyoRUQy=6HeS5b1LN4XA@mail.gmail.com>
	<5617A53F.9070506@windriver.com>
	<12350428.oQrj5AvgHG@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <12350428.oQrj5AvgHG@peggleto-mobl.ger.corp.intel.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/8] autotools.bbclass: use relative path to run configure script
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
X-List-Received-Date: Tue, 13 Oct 2015 07:17:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/13/2015 03:08 PM, Paul Eggleton wrote:
> On Friday 09 October 2015 19:30:07 Robert Yang wrote:
>> On 10/09/2015 06:51 PM, Burton, Ross wrote:
>>> On 9 October 2015 at 02:28, Robert Yang <liezhi.yang@windriver.com
>>>
>>> <mailto:liezhi.yang@windriver.com>> wrote:
>>>      I'm afraid that realpath is not generally existed on the build host ?
>>>
>>> It's part of coreutils on my Debian stable box.  I guess the real question
>>> is "does it exist on Centos 6?".  [looks].  Hmm, it's not present on
>>> that.
>> Ubuntu 14.03 desktop doesn't have it, either.
>
> Does readlink -f suffice ?

Hi Paul,

We deed change an absolute path to relative path here, readlink -f does the
opposite ?

// Robert

>
> Cheers,
> Paul
>

