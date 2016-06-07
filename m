Return-Path: <alistair23@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF10770FE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 01:06:02 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id e72so253490554oib.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2016 18:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=rmXHtGzaBLvPUVGS0nRU9fBn/WuSWuVn6usm5knywg0=;
	b=PeV+HDfhEecAxb1Q1j8miWdVkU/p6g6TgsPdCfEGsKNzqUA87bedy7qsyW90YYCczO
	cxYh9zNYPmy6NDICTBcLJ9C4DRNbWgbQB2WuQnpxiwejFVM0nDRe5iQbJ/fZYiLinzCt
	ecaQp0pte1sL/e6P/jbq/Ktt0TU1ystD3w33SXjXtbo8xEP/7SYrkpsoft7A3AFFPiQZ
	MlzoNv69YNLKwQ0NyyhSGBgNtVh1pqg5D/WhgBL8DxaMEYVXa16OagiVB7CRqdFizeeG
	l3asCcBHlx2q/SovD1Ef4g4Nd8MVMQyxTQb5+idmcfNf0iS6i+eSNEcl/kKYnDt1Z46k
	64uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=rmXHtGzaBLvPUVGS0nRU9fBn/WuSWuVn6usm5knywg0=;
	b=Ks9armWuf1UJicJnHUv7pchWqQ8nPX65BxQxn8OIkyAfOsG/7IV9FVIM6yl8Mg8vlh
	nFJ8HY+fVEIM2lrGc6gTGmIH3rf6qyKOzXWB0wB7RIxGgU9Qi3FNf2AVksGml5ABvHJL
	CBc4mHn6P9voZpJ0UKbzW7ZS7Lh6e0JjfFDlA7zHqC5HK4EZYaQ3vm+Emn+lfaeEGDPE
	tcbLdZmxmJtD0MZlhTHv1BOSTjzHF/RJIdnKU7Qbe4uuxO5RoHSvxxSKnjIMOPapI3wS
	uH4shzPgwUwd8BS94drUS/4MEXj7AHqZ1EvHC7RuXQ2/SEWWFaDCq5vES3p0eu1rxlMr
	D4Ug==
X-Gm-Message-State: ALyK8tL/K4m0fzMvQjwlow44VQ2Bh1OTaS/UI9mNJ8LhCS+01JRP7EzUeWAQ4q9ohNWUpC8pdyeBA8ARzeuapA==
X-Received: by 10.202.0.7 with SMTP id 7mr6841907oia.44.1465261562944; Mon, 06
	Jun 2016 18:06:02 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.182.98.137 with HTTP; Mon, 6 Jun 2016 18:05:33 -0700 (PDT)
In-Reply-To: <CAKmqyKPjFjtqhfLx8R=qJDR=_4mrL7ChdLUfOHeGEUofwYTdkA@mail.gmail.com>
References: <1463089059-10156-1-git-send-email-alistair.francis@xilinx.com>
	<CAKmqyKPPRF+AvEShiFopGj-WtzM6Hdr48nBanA4TEwdWKq2ZSg@mail.gmail.com>
	<CAJTo0LYJuy3vJG_nDp_qA_YTRr62FgN5YUzYcWb5=i6WoAv2Ow@mail.gmail.com>
	<CAKmqyKPw2M0aso8Ti6aChzx_EBDMveOHwkzdiERy-qnQ4jn09w@mail.gmail.com>
	<CAKmqyKPjFjtqhfLx8R=qJDR=_4mrL7ChdLUfOHeGEUofwYTdkA@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 6 Jun 2016 18:05:33 -0700
X-Google-Sender-Auth: bgTRk7ICz7kA2Plkj7RUdxhxURE
Message-ID: <CAKmqyKNuP9tqQz-GiWaEvp1456KMRQm7ypcHKhtr8OyXgjmQZQ@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] runqemu: Add suport for qemuzynqmp
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
X-List-Received-Date: Tue, 07 Jun 2016 01:06:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 23, 2016 at 3:09 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Mon, May 23, 2016 at 2:37 PM, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Sat, May 21, 2016 at 2:33 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>>
>>> On 19 May 2016 at 17:40, Alistair Francis <alistair.francis@xilinx.com>
>>> wrote:
>>>>
>>>> On Thu, May 12, 2016 at 2:37 PM, Alistair Francis
>>>> <alistair.francis@xilinx.com> wrote:
>>>> > Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>>>
>>>> Ping!
>>>
>>>
>>> Sorry meant to reply to this a lot earlier.  There's a RFC from Robert Yang
>>> which proposes a series of patches to completely rewrite how runqemu works,
>>
>> Are you talking about the 'runqemu/runqemu-internal: refactor it' patch series?
>>
>> I talked to him about that and I'm happy to help convert the Xilinx
>> machines to the new method.
>>
>>> so the machine-specific knowledge is contained in the BSP itself.  As a BSP
>>> maintainer who is working on runqemu, would you be able to have a look at
>>> see if it should solve all of your needs?
>>
>> I haven't looked into it too much yet, but I can't see why it wouldn't
>> work for us.
>>
>>>
>>> (this is now marked for my staging branch too)
>
> Just to double check, you mean this patch is in your staging branch right?

Any updates on the status of this?

Thanks,

Alistair

>
> Thanks,
>
> Alistair
>
>>
>> Thanks!
>>
>> Alistair
>>
>>>
>>> Ross
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>

