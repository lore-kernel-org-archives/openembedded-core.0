Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B95F17142E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 01:46:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8F1kiqa009179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 14 Sep 2014 18:46:44 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Sun, 14 Sep 2014 18:46:43 -0700
Message-ID: <5416451E.9060004@windriver.com>
Date: Mon, 15 Sep 2014 09:47:10 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1410231534.git.Qi.Chen@windriver.com>
	<d58dd3655ba6634fe15a01e36fc9822cbc83e13a.1410231534.git.Qi.Chen@windriver.com>
	<CAJTo0LY=XCVYQk6pUKtf2WJ6P1AoGZQ+oZP4XyssNxcEFOPbMg@mail.gmail.com>
In-Reply-To: <CAJTo0LY=XCVYQk6pUKtf2WJ6P1AoGZQ+oZP4XyssNxcEFOPbMg@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] extrausers: add util-linux-sulogin to IMAGE_INSTALL
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
X-List-Received-Date: Mon, 15 Sep 2014 01:46:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/15/2014 06:51 AM, Burton, Ross wrote:
> On 9 September 2014 04:01, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Previously, root with password set cannot login in rescue mode for
>> core-image-minimal. This is because that the busybox's sulogin is
>> not configured with FEATURE_SHADOWPASSWORDS enabled.
>>
>> Add util-linux-sulogin in IMAGE_INSTALL_append properly to fix this problem.
> What's the rationale for installing bits of coreutils, verses enabling
> FEATURE_SHADOWPASSWORDS in busybox?
>
> Ross
>
>

If FEATURE_SHADOWPASSWORDS is enabled in busybox, busybox assumes that 
there's /etc/shadow in the system, but it's possible that there isn't. 
In such case, the related utilities from busybox cannot work correctly.

That's why I chose to installed util-linux-sulogin conditionally in 
extrausers.bbclass instead of enabling FEATRUE_SHADOWPASSWORDS in the 
defconfig of busybox.

Best Regards,
Chen Qi

