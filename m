Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF7B77223
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 00:49:54 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym02.jp.fujitsu.com with smtp
	id 5a42_54f1_2ee4a80a_7d47_4db0_b9ef_f45c89be250d;
	Fri, 13 Nov 2015 09:49:46 +0900
Received: from m3051.s.css.fujitsu.com (m3051.s.css.fujitsu.com
	[10.134.21.209])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id 28266AC00B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:49:45 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3051.s.css.fujitsu.com (Postfix) with ESMTP id 1DBFE1A4;
	Fri, 13 Nov 2015 09:49:45 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 000181E0089;
	Fri, 13 Nov 2015 09:49:44 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <563C5648.5050009@jp.fujitsu.com>
	<CAJTo0LZsG+_bo5=+bYrfP3theSrW-aw2TR4Y-Ax_JVY3YnEKDg@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <564533DA.9050204@jp.fujitsu.com>
Date: Fri, 13 Nov 2015 09:50:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZsG+_bo5=+bYrfP3theSrW-aw2TR4Y-Ax_JVY3YnEKDg@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 13 Nov 2015 00:49:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

 > Did you verify that the patches are not required anymore, or did you
 > just drop the patches that don't apply?
Thanks for your comment.
Yes, I have verified that these patches have been applied in the source 
files of wpa_supplicant 2.5.

And I confirmed the ChangeLog of wpa_supplicant 2.5 that these 
vulnerabilities have been modified.
http://w1.fi/cgit/hostap/plain/wpa_supplicant/ChangeLog

 > Also, this patch doesn't apply, can you try re-sending it?
OK, I will resend it later.

Fan

On 2015年11月12日 03:44, Burton, Ross wrote:
>
> On 6 November 2015 at 07:27, Fan Xin <fan.xin@jp.fujitsu.com
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
>
>     1. upgrade to 2.5
>     2. remove eight patches since they have been modified in 2.5
>
>
> Did you verify that the patches are not required anymore, or did you
> just drop the patches that don't apply?
>
> Also, this patch doesn't apply, can you try re-sending it?
>
> Ross


