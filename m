Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm04.jp.fujitsu.com (mgwkm04.jp.fujitsu.com [202.219.69.171])
	by mail.openembedded.org (Postfix) with ESMTP id D12227199F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 09:51:46 +0000 (UTC)
Received: from kw-mxoi2.gw.nic.fujitsu.com (unknown [192.168.231.133]) by
	mgwkm04.jp.fujitsu.com with smtp
	id 6f6b_373d_c265d90a_999b_4283_aeca_959fba492807;
	Fri, 07 Oct 2016 18:51:41 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by kw-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 48519AC0198
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 18:51:41 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 36F1D617;
	Fri,  7 Oct 2016 18:51:41 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 195761E0074;
	Fri,  7 Oct 2016 18:51:41 +0900 (JST)
To: =?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
	<354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
	<CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <33e1a0be-3fb1-acd6-04c8-bf31eeb69b08@jp.fujitsu.com>
Date: Fri, 7 Oct 2016 18:52:50 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Oct 2016 09:51:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maciej,

> BTW. do you recall the rationale behind abandoning zypper in 1.4? I'm
> curious about the motivation for using smart given its Python
> dependency.
>

The reason to drop Zypper is Zypper has too much components and brings 
huge potential support issues described in [1].

The maintainer of Yum is actively hostile toward RPM5. This is the 
reason why YP do not select YUM.

In [2], Smart is small and compact. And dependency of smart is small 
(python and rpm).

The dnf forks from Yum and dependent of hawkey, librepo, libcomps, 
libsolv. If according to the same raionale, smart is still the proper 
choice.

The relationship is complicated among rpm4, rpm5, dnf, yum, smart and 
OE-core. And thing is changing makes it harder to figure out this issue.

Best Regards,

Fan

[1] https://lists.yoctoproject.org/pipermail/yocto/2012-October/010384.html
[2] 
http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100582.html



-- 


