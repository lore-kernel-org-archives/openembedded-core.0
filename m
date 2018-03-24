Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8DF6778289
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 19:42:45 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id l49so6036139wrl.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2/udOntc0QvQ6wEoNjuOJOEGwHW20IdH3mFWjS8CM4Y=;
	b=NUGFxc060LBkCl0b4R5GJHbNrHRL+i82aDwhkzBwG80DSrmOPvAcUYgHw5smyEThlj
	IgfXq5unx4aBJAQLSPOE68sfBGLaiQoVOk90WfP43moOoV7EYEJuFhnXZEuohoKhuwPz
	ZWajFg7z6nE5NPgsVkpm/TwVQc5jZr58bTVSHi6vCjSd4Y81j5sT9vuSazziDXFTswms
	f/hFjM9A/8EzMrRTAsIme8e2loVoJfGrrJZRNkthImvtD3mIb32TGB25aiKp4N1qd/OA
	jNgXyf4z5xK40gctpQFtPX8BTS9ahcPDa5MArwLfLfd4Shhkce8C/YAv0RgDjK5NwWa9
	54vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2/udOntc0QvQ6wEoNjuOJOEGwHW20IdH3mFWjS8CM4Y=;
	b=j9YzocPO9WyAAuCo0gu3OEY52Dfy4xh/hCFU3V5mIcN1yuaxbcyL6Y3fUIbuAXnDCw
	/6zintUcmY32iBoMO1tWrAEtHdyTa4F9VL0SCL1P4OlMY4JeTzfAMXtgLGa51Mf+2Pkg
	q6+TTrwxRel1PK4uOnwWoRDKP9VVBK0qb7I9cUZR10Kgl3scJPrq6vDwDhm/DKgTLRui
	RjZs6uxa7e2Cp3eqa4LtHYEA57zPMuUEPOWG+YgszwXM1qSpsYj/tG0o6gCzErNCkUiV
	jGFUfzGu86BM3nI0rwN5vzY3w8hLk+KfGja7H2bdHbefjn9VlpI4nVoHUG9in3ieiNch
	YTDg==
X-Gm-Message-State: AElRT7G8k/Z0jEwRRKYfMT9IBv7H0l5bx6p37ho6Bvrd3IY18XlGqYJL
	fgnNliorfAr21naKQ9n6uY4a0pEbsIeCuSO+ULc=
X-Google-Smtp-Source: AG47ELt6EJk3r9NQOP9jN8gag+K0/v/maXV3ZP248v+sWPqETvKxA/NMldb1BTLbkZgGVSLX+zmh814LJp3/Yi070jQ=
X-Received: by 10.223.177.213 with SMTP id r21mr21702308wra.89.1521920566199; 
	Sat, 24 Mar 2018 12:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sat, 24 Mar 2018 12:42:45 -0700 (PDT)
In-Reply-To: <20180324142427.53da953d@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 24 Mar 2018 12:42:45 -0700
Message-ID: <CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 19:42:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 12:24 PM, Seebs <seebs@seebs.net> wrote:
>
> I didn't see a qualifier about it being only on a 32-bit architecture,
> it just says "EABI".
>
> But in general, this is the reason that musl's ability to work doesn't
> buy us guarantees; musl doesn't have to *interpret* the arguments. So
> for instance, they could just pass "the same arguments" for
> SYS_readahead, we couldn't. (If we needed it, which I don't think we
> do.)

Right. The musl example is to show how it's possible to transparently
intercept and pass on any call to the syscall() ABI without
interpreting anything.

> Similarly, they don't have to do Fancy Complicated Fixups around their
> system calls which can break weird register conventions. Consider:
>
>> >        On a few architectures, a register is used to indicate
>> > simple boolean failure of the system call:  ia64
>> > uses r10 for this purpose, and mips uses a3.

Those details are all taken care of within the libc implementation of
syscall(). It's not something we need to care about at all in a
wrapper for it.

