Return-Path: <fan.xin@jp.fujitsu.com>
X-Greylist: delayed 665 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Oct 2016 03:29:14 UTC
Received: from mgwkm01.jp.fujitsu.com (mgwkm01.jp.fujitsu.com [202.219.69.168])
	by mail.openembedded.org (Postfix) with ESMTP id F185D71957
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 03:29:14 +0000 (UTC)
Received: from kw-mxauth.gw.nic.fujitsu.com (unknown [192.168.231.132]) by
	mgwkm01.jp.fujitsu.com with smtp
	id 5169_0538_c7de4b1f_ba1d_484e_b94a_2f62b77f6b43;
	Fri, 07 Oct 2016 12:18:01 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 46609AC00A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 12:18:01 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 350645B3;
	Fri,  7 Oct 2016 12:18:01 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 1AFCC1E0074;
	Fri,  7 Oct 2016 12:18:01 +0900 (JST)
To: Joshua Lock <joshua.g.lock@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
Date: Fri, 7 Oct 2016 12:19:08 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475757767.3146.12.camel@linux.intel.com>
X-TM-AS-MML: disable
Subject: Re: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Fri, 07 Oct 2016 03:29:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joshua,

Thanks for your info.

Actually, our origin motivation is that we found smartpm is not 
maintained any more. We maintain smartpm for our distro at
https://github.com/ubinux/smart2

Then we realize smartpm should switch to python3. In order to solve this 
issue, there are four solutions as follows.

[1] smart/RPM5
[2] smart/RPM4
[3] dnf/RPM5
[4] dnf/RPM4

I confirm that RPM5 have some bugs with python3 and I am not familiar 
with RPM. So I think the easy way to solve this issue is [2], recover 
RPM4 and solve the bugs in smartpm.

>
> It's also worth pointing out that we're strongly considering dropping
> SMART in the next (2.3) development cycle[4].
>
Considering YP would like to drop smart in 2.3, I wonder YP would use 
[3]dnf/RPM5 or [4]dnf/RPM4 ?

> Do you have a reason for wanting rpm4 beyond the proven Python3
> support?
No, I just think python3 support issue should be solved. I am fine with 
RPM4 or RPM5 or smart or dnf.

Best Regards,

Fan

-- 


