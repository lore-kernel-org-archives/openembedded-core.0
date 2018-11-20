Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AB22C6C465
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 01:44:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAK1ivBV008564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Nov 2018 17:44:57 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Mon, 19 Nov 2018 17:44:56 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1542247292.git.Qi.Chen@windriver.com>
	<61202575a1c0b4be44534526dd22fc85c9dadfd2.1542247292.git.Qi.Chen@windriver.com>
	<CAJTo0LZi1ouNpFqrhQ0EhwWfXcX3By54-YCBY6wuifaOjBmw8A@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <892aa2af-472c-e653-a3f0-129d6fdd78bc@windriver.com>
Date: Tue, 20 Nov 2018 09:51:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZi1ouNpFqrhQ0EhwWfXcX3By54-YCBY6wuifaOjBmw8A@mail.gmail.com>
X-Originating-IP: [128.224.163.141]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] busybox: use example.org instead of google.com in wget test case
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
X-List-Received-Date: Tue, 20 Nov 2018 01:44:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2018 01:43 AM, Burton, Ross wrote:
> On Thu, 15 Nov 2018 at 01:57, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Use example.org to ensure it's always reachible.
> Is this because of China's firewall?  You'd think that google.com
> would have excellent uptime.
>
> Ross
>

I guess so.
I agree that google.com has excellent uptime. However, I think 
example.org might be better for ptest.

Best Regards,
Chen Qi

