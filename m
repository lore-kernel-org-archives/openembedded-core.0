Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym04.jp.fujitsu.com (mgwym04.jp.fujitsu.com [211.128.242.43])
	by mail.openembedded.org (Postfix) with ESMTP id E27246FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 02:36:04 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym04.jp.fujitsu.com with smtp
	id 0582_3c60_3cb90388_f93c_478c_888e_ed9533d26d23;
	Mon, 29 May 2017 11:36:02 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A4F5AC00E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 11:36:02 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 14BE21E9;
	Mon, 29 May 2017 11:36:02 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id EF2C71E0074;
	Mon, 29 May 2017 11:36:01 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1495775169-24954-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LYTGn2kObGysTxTPvRj8GR_ahkZO3s=DzvXPo3BWBY5bg@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <c6087a6a-04f5-4a2a-4eb1-a77ba6e865f7@jp.fujitsu.com>
Date: Mon, 29 May 2017 11:37:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYTGn2kObGysTxTPvRj8GR_ahkZO3s=DzvXPo3BWBY5bg@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: Upgrade 0.168 to 0.169
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
X-List-Received-Date: Mon, 29 May 2017 02:36:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Sorry, I forgot to include aarch64_uio.patch into patch file.

Fan Xin

On 2017年05月26日 23:30, Burton, Ross wrote:
> 
> On 26 May 2017 at 06:06, Fan Xin <fan.xin@jp.fujitsu.com 
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
> 
>     1) Upgrade elfutils from 0.168 to 0.169
>     2) Delete unnecessary patches which has been merged into 0.169
>     3) Rebase the patch files for 0.169
> 
> 
> ERROR: elfutils-0.169-r0 do_fetch: Fetcher failure for URL: 
> 'file://aarch64_uio.patch'. Unable to fetch URL from any source.
> 
> Ross

-- 
=====================================================
株式会社富士通コンピュータテクノロジーズ
組込みシステム技術統括部　第一ファームウェア技術部
樊　昕 Fan Xin
fan.xin@jp.fujitsu.com

┏┓ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
┗■ 【ubinux V15】のリリースを開始しました！
「SDN(Open vSwitch)」や「クラウド管理(OpenStack Heat）」などに対応
---------------------------------------------------------------------
詳細＞＞http://elsc.utsfd.cs.fujitsu.co.jp/location_elsc.php?id=0024
※"ubinux"は組込み装置向け当社独自のLinuxディストリビューションです
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

