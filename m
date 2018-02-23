Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D029F785B8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 01:23:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1N1NNdo018643
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Feb 2018 17:23:23 -0800 (PST)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 22 Feb 2018 17:23:02 -0800
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20180222141537.229103-1-hongzhi.song@windriver.com>
	<CAP9ODKrAmVyqUa8Kw5JcLCZNP3wMQTKMxhFuPO36crWy=330dQ@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <9671a8bf-0e27-f182-6d8f-4b248dcac860@windriver.com>
Date: Fri, 23 Feb 2018 09:23:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrAmVyqUa8Kw5JcLCZNP3wMQTKMxhFuPO36crWy=330dQ@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Fri, 23 Feb 2018 01:23:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

If MountFlags=slave, systemd-udevd mounts all block device,  such as

'/dev/sda1' '/dev/mmcblk*' , in itself unit namespace. So other namespace,

such as 'root user', has no access to use block device mentioned above.


On 2018年02月23日 08:50, Otavio Salvador wrote:
> On Thu, Feb 22, 2018 at 11:15 AM, Hongzhi.Song
> <hongzhi.song@windriver.com> wrote:
>> MountFlags's default value is shared in systemd-udevd.service. But upstream
>> sets MountFlags with slave just for keeping mounts done by udev private to
>> udevd, which causes block device mounted by udev unvisable but being busy for
>> host. So we revert it to shared to be propagated to host.
>>
>> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> This is what the mountflag does. This does not explain WHY you need this change.
>


