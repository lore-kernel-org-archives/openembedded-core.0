Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 9D2AD6057A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 10:53:26 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym01.jp.fujitsu.com with smtp
	id 4f1a_f903_56bb48fa_4ea0_445f_9804_8d3132f63b17;
	Thu, 06 Oct 2016 19:53:20 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id CBED0AC03E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 19:53:19 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id C17A3386;
	Thu,  6 Oct 2016 19:53:19 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id A60EE1E0074;
	Thu,  6 Oct 2016 19:53:19 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1475735370-22935-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0La6k5GVtoHWUWvTnYcePMCSPLXGunkZvBoZVuP6YnJTLQ@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <af4989df-0bc6-55b8-fd44-8a696db3c174@jp.fujitsu.com>
Date: Thu, 6 Oct 2016 19:54:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La6k5GVtoHWUWvTnYcePMCSPLXGunkZvBoZVuP6YnJTLQ@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Upgrade 20160126 -> 20160920
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
X-List-Received-Date: Thu, 06 Oct 2016 10:53:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年10月06日 18:22, Burton, Ross wrote:
> On 6 October 2016 at 07:29, Fan Xin <fan.xin@jp.fujitsu.com
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
>
>     1. Upgrade from 20160126 to 20160920
>
>     https://github.com/linux-test-project/ltp/releases/tag/20160920
>     <https://github.com/linux-test-project/ltp/releases/tag/20160920>
>
>
> We're close to the final 2.2 release so unless this is *critical* then
> it won't be merged until 2.3 is open.
Yes, I know. It occurred to me just after I sent this patch.
I will resend it after 2.3.
>
>
>     2. Delete the unnecessary patch files because the ltp source code
>     has been changed.
>
>
> Delete because they've all been merged upstream, or because they
> conflict and you don't want to rebase?
>
Delete the unnecessary patch files because
1. Some of patch files have been merged into upstream.
2. Upstream drop some test cases where these patch adapt to, so the 
patch files become unnecessary and nowhere to adapt.

> The patches I looked at either had no or pending Upstream-Status, so I
> can't trivially check that they have been submitted upstream and are now
> redundant.

Did you mean that Upstream-Status should be added for each patch file ?

Best Regards,

Fan



-- 
=====================================================


