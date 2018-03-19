Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3AAA5789BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 17:49:17 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 123so1560115pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=61zhShEFdyy71n8RSDvCzd8fpNt4r+h/eWLJLeO0tFo=;
	b=lT9faPiZ7loJbhN1uMrp/wfDsa75fiTK6ywvjwSamxt/SIw1HSvupIpK1O7I8K2659
	NvmWf7GhzD+5rcXedJhnBEStmWV+9BmiA06IrZ0swTtsqcmlX8Ad/xxhdmop17hVs9zN
	s6rA5qXFpwEkk+X4VmyVOpNUV4YlhmsdLWCqIc3Ded9h2I/FBUe7ySWzXk4/2TLjk8b7
	PefbIq89qqLH6OZaO8f//2QPZbPHQttaBmVlonGJue3gjibgc2YQyZm2Lpo8eE8YhUgX
	q1tApIjzfoZPkK1YEPmi+yFXA6xmuBlelCebjf0bgiXOSBx37vcRnX9tFQ5aw/wMXu/L
	AnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=61zhShEFdyy71n8RSDvCzd8fpNt4r+h/eWLJLeO0tFo=;
	b=ZGf6yfmMARAsMkPOJRpFkLTHFf5siis7mnc4xOtibw+1IwKiDzjIKDUmEVS0lZxmEc
	NbPMMPd2CfchIAppEwyq9EiLmJtFBnuSbvPDpmpSipqCU/cDVFei9huSR/MwxVv7Clgp
	Topvx4gEZCo82F8JWWjUwE86MvSWs8bo3ufcYlFc8Bl9zUnSsRa2V0Ow4aOc4G0xVgl0
	fX325awmC70RjE3FVPIpwvYV41R5hvK4n5l8U9Kq2i2GK2RzQawH2Ylgy4Z2KGT0DN45
	+z3TujlR/tjkpI5GXRqEB9sXs8a/v1w5toKhkuj9+0bbY7G2vrunMf++IH0awY0QbGzY
	7rcw==
X-Gm-Message-State: AElRT7GmC8y1fexX7q5+6FDf3dZ6eVMyey8fT5i339S43YeZ4frwcujl
	UHpabNO4XfoMu6O0738WWp92ItExm01Nb3jMbYg=
X-Google-Smtp-Source: AG47ELtxzKt28QZdVe2ktvKOM9V993kv+dpAE1cCr3Gdz9c8tSbt3d4pEVKQ/rdAWKQDe3ITb6UN0ThXgRc2Jjwdvxg=
X-Received: by 10.101.97.15 with SMTP id z15mr7840752pgu.393.1521481759076;
	Mon, 19 Mar 2018 10:49:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.241.68 with HTTP; Mon, 19 Mar 2018 10:48:48 -0700 (PDT)
In-Reply-To: <CAJTo0Lb5P916LL80z3vBk-mT-a0-orEqarLi4es__Soy3jt6sw@mail.gmail.com>
References: <cover.1521257828.git.raj.khem@gmail.com>
	<19ff9542e08c7df5898cc811f65200050ecf02d5.1521257828.git.raj.khem@gmail.com>
	<CAJTo0LZ0Mqnpu+021rDroBnVWKB-zbdC+Q35XXwQpb12_FYHNQ@mail.gmail.com>
	<CAMKF1sq4eFjSXeKy2HYkXhNE5yWRWPF2vjji9sbYhXDJ0S_dyg@mail.gmail.com>
	<CAJTo0Lb5P916LL80z3vBk-mT-a0-orEqarLi4es__Soy3jt6sw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 10:48:48 -0700
Message-ID: <CAMKF1sr352BftmNV_svxN9PrMsTCOyz+zOXLggfEo6o=npboFw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] x264: Use updated gnu-config artifacts
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
X-List-Received-Date: Mon, 19 Mar 2018 17:49:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 10:23 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 19 March 2018 at 16:54, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> this only works if the system uses autotools
>> in full respect. x264 has a hand woven configure
>> but rely on other parts of autotools. So we have to
>> stay with proposed solution.
>
>
> gnu-configize should be sufficiently dumb that it should work in
> non-autotools trees, did it give you an error message?
>

its looking for configure.in or configure.ac

> Ross

