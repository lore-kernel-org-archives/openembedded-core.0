Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB3E60102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 01:34:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t7so18689880wmh.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 18:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lsnmDa4I72sYFCv8jLz6b4HkJ/rDP9kUioL0UAquEoo=;
	b=q7W8hpbMozOr8qZ/8JNnF2z1EgkdONosIW9ZzSZaRzjgor6xju+MQWY8iYbaJRG1yG
	vcXMFPflc86d9tkJpGvolPCswd+HTA8jxKlKYYBzevBoiV2JtsAVSJcU82kSy67W5DDx
	ilM9HPcJ56ullkb6yS1VVf4RcOeEKTeCavup7Oyz85ndOHIjfnR6iAWdnqJVDIW1ZTuZ
	D2ekmF5iXGv15wAHIvUY1udONdt6LGK0TSm3SNGvBAk+fnWjyefNGD5DluQnC0FpqAIe
	ywBeaMhBUbQp+aU6vpehvCi8FOt5RoJKEr7R+TQW0fyJNYaShsPOiVbwpdvyDC3iwt2p
	aK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lsnmDa4I72sYFCv8jLz6b4HkJ/rDP9kUioL0UAquEoo=;
	b=uHUsbJf/ZXtG4kK2tdXFG2c2ZF0s8qNKU/2tnktDi3R8vciwdnU5GMSjJhf449noAr
	vA09auSmewUvTBot/T2Kav/6fKhqhhFcshbbZTe/UjGLn10reSWbgae6EQsRRgqDLZHS
	brgmhJPr68bS2SoQ47agB4UYVtFtIS45Y8JzYtx1DjmNybAvDdLcXKsxuW73GnkRVp6e
	CKtvqx66Vb1DBQ7NtiSpSt0fjUaLTm2tAjXKOMf34vlQ98vE2fAW021I0Lerysxqke6k
	OxCmPrCnFDyErGkCeP6TKv5N5NhvDJ/K4IrWGdzk0Ur8mfAZVo74gEzcZhPmhOH/P2hA
	i4/A==
X-Gm-Message-State: AElRT7HoIuFB4296j0qCHsVxjNIkR2Rqr9hbaS4tDe9/86+2iw+HkUi/
	gWoRB1eoGUJR7Z7vMt1u6j+NyLMPk86UtgE+srI=
X-Google-Smtp-Source: AIpwx4+3EwSRBr3dB/q/2lSx+BYpnX6fnnUkouUdUuVoR3KmD8oB4zpWoPzk2GyVtnIohVqQar8iW64bNZYed/You14=
X-Received: by 10.28.45.144 with SMTP id t138mr610102wmt.151.1522114451100;
	Mon, 26 Mar 2018 18:34:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Mon, 26 Mar 2018 18:34:10 -0700 (PDT)
In-Reply-To: <20180326203209.2da967eb@seebsdell>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
	<CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
	<20180326143107.48f153a5@seebsdell>
	<CAJ86T=X4u0=82wPCdwngRwQL-==trUDVfuH-4FGC-2G6AmfVgg@mail.gmail.com>
	<20180326160746.1dce7ae9@seebsdell>
	<CAJ86T=VaJyJYbBTkjR1yUTSJPCFSjgZCZZkYbyGEaTWYCg+u7A@mail.gmail.com>
	<20180326203209.2da967eb@seebsdell>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 26 Mar 2018 18:34:10 -0700
Message-ID: <CAJ86T=VqLZrmyLBYD4ovQc9eNJQx5Rqp8YK+=3hPHgmjqqa55w@mail.gmail.com>
To: Seebs <seebs@seebs.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 27 Mar 2018 01:34:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 26, 2018 at 6:32 PM, Seebs <seebs@seebs.net> wrote:
> On Mon, 26 Mar 2018 18:10:07 -0700
> Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> I've verified that the QA warnings on FC27 can be fixed by preloading
>> a wrapper for libc syscall(). Just a proof of concept but if anyone
>> would like to reproduce it my steps are below.
>
> Yes, I think we were expecting it would work on x86, where the ABI is
> trivial and friendly?
>
> I remain interested in why the glibc implementation does all these
> weird things on some architectures if none of those things matter.

Which glibc implementation? I'll take a look.

