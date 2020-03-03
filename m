Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id ECE1660F93
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 13:39:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48WymR5gZxz4f;
	Tue,  3 Mar 2020 14:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583242777;
	bh=SknhxIvnfE+qOsYTzwZvMhHmQH+l5JKtj5qXsetj+N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OruRgRk5N9xQ8wJD+UCc9bnjXfyoRW5ctGffdWk/CVrh/iFsGApDPk5mfyYjREqCX
	voaKxMb+DaLoumLArHrIxLVp2wfnMA3UFyZTRgE6y0POT6rq/0Zzp8klZ3f+DntjAk
	B1ElKuWGM87roV5+dnav+u0wNG9dy5tjP9fZ6BqWK14wuZiVQ/uYCgZxyeBSVm5HUK
	sS3JXm7IMnVr5REocOkBXJQ2XkNI9NMSSkZaKn6kThXFq/lHIkl+DPPAwE7TJFFZfG
	nK6jDwizZeGvQ798El49TzkAirkkaIgd9qA6emmLhbJUqFr+Yp3bNdmi6pbXG8cPbB
	mLgZB/4RyogeUXwzzhWV+STPssjKmfP7GFK6ulCfnZIdoX530NcOESKdBfrSwy9sCh
	IChrT+ZRpY3SwL4FWtTYenAFrofRZeQmkWJn5pI/qn5nhd7OBK6TJ5GO/4YV1iwUrw
	ak5sSJjRZJLo9MMKR0zDTNQsHv9PV0BmbR4xv/1NqETvbt/4w0PxZuwRvz2PSCjedb
	uSCvn1AKLhZABigyfNJIz8SaIvHo4c0XGXHZ/u4nPqOq+epCi1VjtpV1cBqo1M30/b
	qgmcsHUd9YSbSr3hH6RtS1C/0YliZUp9KQg5ZDaWTfTcBmVRkzHZSQgms4PKlVczeD
	bZr7uoax4nXkPubbijy+LlMs=
Date: Tue, 3 Mar 2020 15:39:31 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20200303133931.GB13148@localhost>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
	<9d41cd5d-7355-175d-391c-35231c9a7e92@huawei.com>
	<41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <41b7391039564f10a0c8b4f63eeb4274@XBOX03.axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "wangnan0@huawei.com" <wangnan0@huawei.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 03 Mar 2020 13:39:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 03, 2020 at 11:59:58AM +0000, Peter Kjellerstedt wrote:
>...
> Which corresponds to how it is done for armv7*.
> 
> At least we currently rely on being able to do, e.g.:
> 
> COMPATIBLE_MACHINE = "aarch64|armv7a|armv7ve"
> 
> and if you remove "aarch64" from MACHINEOVERRIDES, we need a suitable 
> substitute.

What does "aarch64" actually mean here?
Does it also cover 32bit-only aarch64 CPUs?

Similar to x86 there are 3 ABIs, and aarch64ilp32 is different from aarch32.

Different from x86, there is no ABI that is available in all aarch64 CPUs.
They can be 32bit-only or 64bit-only, and aarch32 support is optional.

> //Peter

cu
Adrian

