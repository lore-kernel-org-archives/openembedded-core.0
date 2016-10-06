Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym02.jp.fujitsu.com (mgwym02.jp.fujitsu.com [211.128.242.41])
	by mail.openembedded.org (Postfix) with ESMTP id 96C106069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 11:17:10 +0000 (UTC)
Received: from yt-mxoi1.gw.nic.fujitsu.com (unknown [192.168.229.67]) by
	mgwym02.jp.fujitsu.com with smtp
	id 4885_02ba_c3d56047_2c3a_4386_a6ff_ba8150bc88e3;
	Thu, 06 Oct 2016 20:17:02 +0900
Received: from m3050.s.css.fujitsu.com (msm.b.css.fujitsu.com [10.134.21.208])
	by yt-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C7F7AC01CF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:02 +0900 (JST)
Received: from omame (omame.fct.css.fujitsu.com [10.24.14.171])
	by m3050.s.css.fujitsu.com (Postfix) with ESMTP id 7705B4DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:02 +0900 (JST)
Received: from [10.24.19.99] (fan1.utsfd.cs.fujitsu.co.jp [10.24.19.99])
	by omame (Postfix) with ESMTPSA id 604261E0074
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 20:17:02 +0900 (JST)
To: OE-core <openembedded-core@lists.openembedded.org>
From: Fan Xin <fan.xin@jp.fujitsu.com>
Message-ID: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
Date: Thu, 6 Oct 2016 20:18:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
X-TM-AS-MML: disable
Subject: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Thu, 06 Oct 2016 11:17:12 -0000
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi

I did some work to figure out whether the smartpm could been built with  
python3. However, I found smartpm is dependent with rpm, and OE-core  
uses RPM5 which seems has some bug.
http://rpm5.org/community/rpm-users/1098.html

RPM4 could be built with python3. So I think maybe we could recover RPM4  
into OE-core which is deleted
(oe-core a6e7a86f1635be9a688c56c25e9d215ea4d2cc84 )

The drop reason is that RPM4 is buggy and no one want to maintain it.

I build RPM4 in OE-core and the build is finished without any bug. And  
next I will try to use smartpm to manage RPM4 packages in my local  
environment.

By the way, could anyone give more detail info about the bugs in RPM4 or  
any suggestion about how to make smartpm built with python3.

Thanks.

Best Regards,

Fan

-- 


