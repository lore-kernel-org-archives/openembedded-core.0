Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 555F27C861
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 01:34:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4L1YNNH024395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2019 18:34:24 -0700 (PDT)
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 20 May 2019 18:34:23 -0700
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <135a9bc7-29ac-7b7c-c005-8b679f724414@windriver.com>
Date: Tue, 21 May 2019 09:33:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
Cc: paul.eggleton@linux.intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd-conf: configure wired network with dhcp
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
X-List-Received-Date: Tue, 21 May 2019 01:34:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/21 上午1:45, Alex Kiernan wrote:
> On Mon, May 20, 2019 at 10:47 AM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add a configure file for systemd.networkd to configure wired network
>> interfaces with dhcp. It works with common network interfaces such eth0
>> and eno1.
>>
>> [YOCTO #13057]
>>
> I'm really not convinced about this - yes it's initially surprising,
> but should base packages have this kind of assumptions/policy baked
> into them?

I have considered whether systemd or systemd-conf should contain such 
configure file. Compare to Fedora and Debian,
no such kind of pre-configured network setting provided by systemd, so I 
added the configure file to systemd-config.

If systemd should be preferred, I'll update in v2.

Kai



>
>
> --
> Alex Kiernan
>

-- 
Kai Kang


