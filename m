Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D45754E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:40:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8J9exhB014699
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 02:40:59 -0700 (PDT)
Received: from [128.224.162.153] (128.224.162.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 19 Sep 2018 02:40:58 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180916054532.1312-1-hongzhi.song@windriver.com>
	<65182ac2-33bd-a68a-be2e-7851809b4329@windriver.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <b1c2a3c9-49e2-851f-246a-0328a956c21f@windriver.com>
Date: Wed, 19 Sep 2018 17:40:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <65182ac2-33bd-a68a-be2e-7851809b4329@windriver.com>
X-Originating-IP: [128.224.162.153]
Subject: Re: [PATCH 0/3 v5] udev-extraconf/mount.sh: add systemd-mount command for systemd
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
X-List-Received-Date: Wed, 19 Sep 2018 09:40:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Sorry for ping.

The patch has been merged.

--Hongzhi


On 09/19/2018 05:37 PM, Hongzhi, Song wrote:
> ping..
>
> --Hongzhi
>
>
> On 09/16/2018 01:45 PM, Hongzhi.Song wrote:
>> v5:
>>      perfect a few codes based on v4
>> v4:
>>      fix the recursively dependency for the systemd-mount
>> v3:
>>      perfect syntax
>>
>> Hongzhi.Song (3):
>>    udev-extraconf/mount.sh: add support to systemd
>>    udev-extraconf/mount.sh: Fix the recursively dependency for the
>>      systemd-mount
>>    udev-extraconf/mount.sh: Skip the entry in /etc/fstab when using the
>>      systemd-moun
>>
>>   meta/recipes-core/udev/udev-extraconf/mount.sh | 92 
>> +++++++++++++++++++++-----
>>   1 file changed, 74 insertions(+), 18 deletions(-)
>>
>


