Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D120E72F60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 15:47:59 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id a72so99868288qkj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E2iXcgGPDkpci1W4i2yFVTr3KfP2vKdORf3E7i7zlhA=;
	b=UAkom0tukQYbrijhiqPCb9pLTPEqZKHStOhLpdIZo/QLVV9tpcPELzW9VxC1UfT5cj
	FLHnbMiLvbI5HeBSPi2EpAhNoPVKJkf/Lisb6QlIdBxnZ/CiwUfqmqEL26soN4VbnGt0
	7Dm92MjDMoBgpkfyZ7JI6WsQw5uzXtzmzDvZ71u6l0f2YMRwrZpix6+d+EsYn+qczHGi
	Cyeq8v244sK94YL5inKZ5cJ7jYlvnxyBqQi6OHm1K4A0wYQjjf4Ult00/Pi9SufGUdsu
	wSp9yBQ8El9zfzr3AgrT7dby2gTRshIalTEdJNPdSE4B07mxXJMZuNy399Xc3MZbEvez
	Q2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E2iXcgGPDkpci1W4i2yFVTr3KfP2vKdORf3E7i7zlhA=;
	b=Q3HicVOrwW5K0KhrkOPXQYY7u6+/w+ZutTEEw58fdFdpmc5B0BWJpqlaPiynGG9bDO
	REOfmv69LpRiAERvUtK/GyEEggo9ClOg0lKsAt2+8LCYEgr/gsmmx87oZdqhvHLNAhO8
	JpJpXu9f30KKUKCGGkX1FUijCuASvUn4G9oOsFZYBkSI+PitJb0NOQdy+WS459fWUG45
	h8+f/rCKvLrC3qaewMDVSKrAbvPOl/yVleQ3x5genZc3cSDj7T15tkZUtjla2ce0sr7A
	do/xOqLlyDU69WAIJmP97eU0DL1ZY0s/XOgqznwaMqYe/18GAa0xAWwZut/C2dufvx8x
	xOJA==
X-Gm-Message-State: AODbwcAASZ3RoD+DawCyfSDi72ojo7FviDynhfPjRIjSYexS1U7JcJu6
	ILGvWZRS+dbqSoiwKcXjRVx82KT5fw==
X-Received: by 10.80.137.56 with SMTP id e53mr5333770ede.67.1494863280307;
	Mon, 15 May 2017 08:48:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Mon, 15 May 2017 08:47:29 -0700 (PDT)
In-Reply-To: <5919BDFD.5080308@linux.intel.com>
References: <1494607799-32105-1-git-send-email-anibal.limon@linux.intel.com>
	<5247c79d-2131-0bff-8970-4c4bcef387a0@linux.intel.com>
	<5919BDFD.5080308@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 May 2017 08:47:29 -0700
Message-ID: <CAMKF1srM6+insBEWhz2cZXMQyU-n+Qj5esoPx1GfEWB2We-y2g@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: Upgrade to 2.8.1.1
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
X-List-Received-Date: Mon, 15 May 2017 15:48:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2017 at 7:41 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
>> Upstream is already at 2.9, why this version?
>
> Patrick has a patches for enable TPM into QEMU 2.8.x line, but there
> apply into 2.9.x but the compile fails.
>
> I guess there's a need to work on those patches before 2.9.x upgrade.
>

its also easier to backport it to pyro since its fresh release. Eventually =
yes
2.9 is going to come into master.

