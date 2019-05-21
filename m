Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C57AB7E161
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 05:04:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4L536vK025548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 May 2019 22:03:31 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 20 May 2019 22:03:12 -0700
To: Alex Kiernan <alex.kiernan@gmail.com>
References: <20190520094621.94652-1-kai.kang@windriver.com>
	<20190520094621.94652-2-kai.kang@windriver.com>
	<CAO5Uq5TMy73eTwm538936eSY7NtA=aaGGAHX0TZo5xMRFESiYg@mail.gmail.com>
	<135a9bc7-29ac-7b7c-c005-8b679f724414@windriver.com>
	<CAO5Uq5QjL0sy4SeMc1AemLmLGVuQ4OC+gSM_0cWQXeStEvkjkQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <22a8d6a6-1644-0d69-72d8-f4c09224160f@windriver.com>
Date: Tue, 21 May 2019 13:02:28 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO5Uq5QjL0sy4SeMc1AemLmLGVuQ4OC+gSM_0cWQXeStEvkjkQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 21 May 2019 05:04:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/5/21 下午12:49, Alex Kiernan wrote:
> On Tue, May 21, 2019 at 2:34 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2019/5/21 上午1:45, Alex Kiernan wrote:
>>> On Mon, May 20, 2019 at 10:47 AM <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Add a configure file for systemd.networkd to configure wired network
>>>> interfaces with dhcp. It works with common network interfaces such eth0
>>>> and eno1.
>>>>
>>>> [YOCTO #13057]
>>>>
>>> I'm really not convinced about this - yes it's initially surprising,
>>> but should base packages have this kind of assumptions/policy baked
>>> into them?
>> I have considered whether systemd or systemd-conf should contain such
>> configure file. Compare to Fedora and Debian,
>> no such kind of pre-configured network setting provided by systemd, so I
>> added the configure file to systemd-config.
>>
>> If systemd should be preferred, I'll update in v2.
>>
> No, systemd-conf is the right place for it, since this is machine
> specific configuration. My question is really if this piece of
> configuration should exist at all in OE-Core; but I'm not totally
> opposed to it.
>
> I could live with the kind of construction in meta-yoe (but with the
> files added to systemd-conf as you already have)


The original requirement is from [Bug 13057 - No default network 
configuration for systemd-networkd ] which blocks to make systemd as
default init manager. If add this to meta-yoe, it still no working 
network if no connman/networkmanager installed(but this is same as
Fedora 29 and Debian 9).


Regards,
Kai


>

-- 
Kai Kang


