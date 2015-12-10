Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id D6B526E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 02:57:08 +0000 (UTC)
Received: from yt-mxauth.gw.nic.fujitsu.com (unknown [192.168.229.68]) by
	mgwym02.jp.fujitsu.com with smtp
	id 18ce_1412_b40c7074_7d4a_42fe_8986_eb36b6d04a55;
	Thu, 10 Dec 2015 11:57:01 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxauth.gw.nic.fujitsu.com (Postfix) with ESMTP id 36AE0AC022B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 11:57:01 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 2AB67F9;
	Thu, 10 Dec 2015 11:57:01 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 147211E0089;
	Thu, 10 Dec 2015 11:57:01 +0900 (JST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1449626605-10934-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <5668EA3F.9090009@jp.fujitsu.com>
Date: Thu, 10 Dec 2015 11:58:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZR3Jy8rvGQEsjGquZXKHpFnhSqWgHNh4k711xnLJqw2Q@mail.gmail.com>
X-TM-AS-MML: disable
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: fix for CVE-2015-1794
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
X-List-Received-Date: Thu, 10 Dec 2015 02:57:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for your kindly check.
I will correct it in Patch v2.

Best Regards,
Fan

On 2015年12月09日 20:52, Burton, Ross wrote:
>
> On 9 December 2015 at 02:03, Fan Xin <fan.xin@jp.fujitsu.com
> <mailto:fan.xin@jp.fujitsu.com>> wrote:
>
>     +++
>     b/meta/recipes-connectivity/openssl/openssl/Fix-seg-fault-with-0-p-val-in-SKE.patch
>     @@ -0,0 +1,101 @@
>     +Upstream-Status: Backport
>     +
>     +From ada57746b6b80beae73111fe1291bf8dd89af91c Mon Sep 17 00:00:00 2001
>     +From: Guy Leaver (guleaver) <guleaver@cisco.com
>     <mailto:guleaver@cisco.com>>
>     +Date: Fri, 7 Aug 2015 15:45:21 +0100
>     +Subject: [PATCH] Fix seg fault with 0 p val in SKE
>     +
>     +If a client receives a ServerKeyExchange for an anon DH ciphersuite
>     with the
>     +value of p set to 0 then a seg fault can occur. This commits adds a
>     test to
>     +reject p, g and pub key parameters that have a 0 value (in
>     accordance with
>     +RFC 5246)
>     +
>     +The security vulnerability only affects master and 1.0.2, but the
>     fix is
>     +additionally applied to 1.0.1 for additional confidence.
>     +
>     +CVE-2015-1794
>     +
>     +Reviewed-by: Richard Levitte <levitte@openssl.org
>     <mailto:levitte@openssl.org>>
>     +Reviewed-by: Matt Caswell <matt@openssl.org <mailto:matt@openssl.org>>
>
>
> This patch needs to have your (or whoever actually did the work)
> signed-off-by inside the patch, alongside the Upstream-Status.
>
> Thanks,
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

