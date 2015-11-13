Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 620 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Nov 2015 01:05:50 UTC
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 30AEE75A52
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 01:05:50 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 2ba1_1c40_93d88877_0ace_401d_98ac_8f9a1074e6c2;
	Fri, 13 Nov 2015 09:55:24 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id A5416AC02CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:55:23 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 8D35418D;
	Fri, 13 Nov 2015 09:55:23 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 743E81E0089;
	Fri, 13 Nov 2015 09:55:23 +0900 (JST)
To: "Maxin B. John" <maxin.john@intel.com>
References: <563C5648.5050009@jp.fujitsu.com>
	<20151112084316.GA22724@mbabyjoh-mobl.fi.intel.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <5645352D.3030907@jp.fujitsu.com>
Date: Fri, 13 Nov 2015 09:56:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <20151112084316.GA22724@mbabyjoh-mobl.fi.intel.com>
X-TM-AS-MML: disable
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant: upgrade to 2.5
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
X-List-Received-Date: Fri, 13 Nov 2015 01:05:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

 > In addition to what Ross mentioned, http://hostap.epitest.fi redirects
 > to http://w1.fi
 >
 > So, it will be nice to update the SRC_URI, HOMEPAGE and BUGTRACKER to use
 > w1.fi instead.
Thanks for your comment.

As you said, these items also should be updated.
I will update them and resend the patch later.

Thanks for your kindly reminder.

Best Regards,
Fan

On 2015年11月12日 17:43, Maxin B. John wrote:
> Hi,
>
> On Fri, Nov 06, 2015 at 04:27:04PM +0900, Fan Xin wrote:
>> wpa-supplicant: upgrade to 2.5
>>
>> 1. upgrade to 2.5
>> 2. remove eight patches since they have been modified in 2.5
>>
>> Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
>> ---
>>   ...integer-underflow-in-WMM-Action-frame-par.patch | 45 -------------
>
> In addition to what Ross mentioned, http://hostap.epitest.fi redirects
> to http://w1.fi
>
> So, it will be nice to update the SRC_URI, HOMEPAGE and BUGTRACKER to use
> w1.fi instead.
>
> Best Regards,
> Maxin
>

