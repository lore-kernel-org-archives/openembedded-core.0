Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id 078487002B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 05:39:19 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym04.jp.fujitsu.com with smtp
	id 2fcf_7bc7_ce14b9f3_c482_4fe3_b93a_09d85b3dbcd9;
	Mon, 08 Aug 2016 14:39:13 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 25109AC012F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 14:39:13 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 1F8A82A7;
	Mon,  8 Aug 2016 14:39:13 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 053EE1E0088;
	Mon,  8 Aug 2016 14:39:13 +0900 (JST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1470039851-27561-1-git-send-email-fan.xin@jp.fujitsu.com>
	<1470040840.9142.98.camel@linuxfoundation.org>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <f1cdce50-f858-b5af-99a6-8702ecb349f4@jp.fujitsu.com>
Date: Mon, 8 Aug 2016 14:39:54 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1470040840.9142.98.camel@linuxfoundation.org>
X-TM-AS-MML: disable
Subject: Re: [PATCH] qpdf: add new recipe
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
X-List-Received-Date: Mon, 08 Aug 2016 05:39:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

>
> Why do we need this in OE-Core compared to a layer like meta
> -openembedded?
>

Hi, thanks for your comment.
I have sent this patch to meta-openembedded.

I sent this patch because the qpdf is dependence of cups-filters.
And I want to replace the foomatic-filters with cups-filters.
So firstly I sent qpdf recipe to OE-Core.

Best Regards,
Fan

-- 


