Return-Path: <Xudong.Zhu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A0FA56EE32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2014 02:44:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1H2iAIp029818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Feb 2014 18:44:10 -0800 (PST)
Received: from [192.168.1.131] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Sun, 16 Feb 2014 18:44:09 -0800
Message-ID: <5301777B.9050706@windriver.com>
Date: Mon, 17 Feb 2014 10:44:11 +0800
From: "Xudong.Zhu" <xudong.zhu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1392348604-4134-1-git-send-email-xudong.zhu@windriver.com>
	<1392348604-4134-2-git-send-email-xudong.zhu@windriver.com>
	<1392380959.14081.32.camel@ted>
In-Reply-To: <1392380959.14081.32.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tar: fix a build error introduced by 1.27
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: xudong.zhu@windriver.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 02:44:12 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年02月14日 20:29, Richard Purdie wrote:
> On Fri, 2014-02-14 at 11:30 +0800, Xudong.zhu wrote:
>> From: "Xudong.zhu" <xzhu@windriver.com>
>>
>> --same-order option cannot be used with -c the latest
>> tar version 1.27.
>> To fix this, drop the -s from -ps if -c exists.
>>
>> [YOCTO #5823]
>>
>> Signed-off-by: Xudong.zhu <xzhu@windriver.com>
>> ---
>>   meta/classes/libc-package.bbclass     |    8 ++++----
>>   meta/classes/package.bbclass          |    2 +-
>>   meta/classes/populate_sdk_deb.bbclass |    2 +-
>>   meta/classes/staging.bbclass          |    2 +-
>>   meta/lib/oe/path.py                   |    2 +-
>>   5 files changed, 8 insertions(+), 8 deletions(-)
> This patch is not against master, this was fixed a while ago?
Sorry, I didn't notice that at the beginning, I just worked on my local 
branch, I will keep this in mind, thanks for your reminder, please 
ignore this patch.
> Cheers,
>
> Richard
>


