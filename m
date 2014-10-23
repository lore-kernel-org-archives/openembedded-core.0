Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id B6E6565CAF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 10:59:09 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id 29so704301yhl.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 03:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=MHLR/FY90RsJC5TALsuP/H9K0m3YCzCeXPz44VInpp0=;
	b=jHpmZMXMxvbCBNWWeeDTYMZn4nOcOf+R6ik5xSG16EfOSYRESFVRLH2HW8OrXJcGX5
	y1n/h09j+N4RUFI0NBCWpXs167VQhlYRz3wx/Mem46pmlnG+y6OOOYNvuoG5x/h6/ZVC
	schDcu3fOiQtXv3L0wh+2UbGxKUcch1qRU6jPzA85G3iUloRkwhEb4ohLpWbRSIbi8Kj
	mBd5eIF+d+wYSsSejWfZ+AAhExYDE4cpqPgdS01vUXftw44gRY+GlWyBztMV3/8GWFbL
	ttaa9ammsvRFYEMazL+QH/Aoh8f/j90rAZU27ELMuaN/XMpFOTN2scOgbQiYXTz+JhyM
	waKw==
MIME-Version: 1.0
X-Received: by 10.236.222.10 with SMTP id s10mr6420257yhp.102.1414061949216;
	Thu, 23 Oct 2014 03:59:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.172.8 with HTTP; Thu, 23 Oct 2014 03:59:09 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABD53050B@ALA-MBB.corp.ad.wrs.com>
References: <1413966997-3361-1-git-send-email-jackie.huang@windriver.com>
	<CAP9ODKpSoNU5CgCYngdJ3=FJf-T11CX+F=0365k1zK53zw1F9g@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AABD53050B@ALA-MBB.corp.ad.wrs.com>
Date: Thu, 23 Oct 2014 08:59:09 -0200
X-Google-Sender-Auth: tNK07SUEaiEQDDRY29HtkeBJxpg
Message-ID: <CAP9ODKp4E2MxZX85Dp_SozkkoOVHFc6yOdTqLXSTKQKArkARCw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: resolve linux-firmware and microcode-ctl file conflicts
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
X-List-Received-Date: Thu, 23 Oct 2014 10:59:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 23, 2014 at 3:14 AM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>> On Wed, Oct 22, 2014 at 6:36 AM,  <jackie.huang@windriver.com> wrote:
>> > From: Yue Tao <yue.tao@windriver.com>
>> >
>> > Use alternatives mechanism to prevent linux-firmware and microcode-ctl
>> > bin files from causing conflicts.
>> >
>> > The error is :
>> >
>> > error: file /lib/firmware/amd-ucode/microcode_amd.bin from install of
>> > linux-firmware conflicts with file from package microcode-ctl-firmware
>> >
>> > error: file /lib/firmware/amd-ucode/microcode_amd_fam15h.bin from
>> > install of linux-firmware conflicts with file from package
>> > microcode-ctl-firmware
>> >
>> > Signed-off-by: Yue Tao <yue.tao@windriver.com>
>>
>> * The firmware should be split in a specific package, if possible (in a separated patch)
>
> Thanks for pointing this, I will re-work on it.
>
>> * microcode-ctl-firmware does not exist here
>
> Yes, I know, but we have it in our own layer.
>
>> * microcode-ctl-firmware seems useless if you can rely on linux-firmware to provide the file.
>
> Maybe, but someone may choose to use the one provided by microcode-ctl-firmware.

Well I think we ought to avoid duplication but it is your call as it
is in your layer. Anyway don't use error messages which point to your
company's data so don't cite it in the commit log.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

