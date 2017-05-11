Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 85EBC71C90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:50:49 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b84so48350783wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AN6i8PWg+Uim+FNzvjbZfc7uUiUp7QQqR2S2oHWxtF0=;
	b=tLSH4irCf2CPIemq31cZ5zO7S6G6lVImnt2Zz13pXIZAH4E8a6jisfi7H4GqGPjZs3
	tLmH98Bj6bTtkiXwfILZU7Bk3F/Z4uNCsURQm+86WRlaVknd93PL8RhqXDTSkGiT7qL4
	OVwF6yEaLtDuD7AtgrOX+7nsLNjAihR3pmJ/YXkSd24vb0JUxEOGpa3JNbWVGrVwLue1
	+V0FexCV6DZmkQywRqqOyx5qCpLXA69ICXk4s7GCTgYrN/kTjrXsvBYX7iv0cIJgCVrY
	UnHzCTAWLHpXCidlB1vUuF198r8hzM+ttCYqDGpdVCgdw7LDNt2/mQJv2cxbpD10YJaY
	m6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AN6i8PWg+Uim+FNzvjbZfc7uUiUp7QQqR2S2oHWxtF0=;
	b=PNVl3gFxzhbW78Iykb9GkbL1ZKE775zhMzYGnJruiWul81EjjzwGMUszHBY9A5tbL/
	yyjo6tucgG1xlGhO4VRaZfck02k9LGhTJDEKSNC1m3kLvG8r/DR8J8VBLoUpnS4dH2Yx
	TbZwWoov41rHtQhZriISGCQZsjSxo9LbAxjzco5YsXOrRiAzKev0/NB7kRzLZ/3sI9Xj
	LXOtAaEE1l9Dm+VC+ARe7ZPDDHlobNdFzxh1Mts3x4JHkr2qXuJtEs9d5n8r8N7w71BI
	YMOZtKw+JIUDKVR8nLL6kx2Ft+U5Ib8u6ZzsRKjqyMst0GlldCU+/J/SnhIirjuTgn3P
	MExg==
X-Gm-Message-State: AODbwcB8KRXGGM1bo6HLnCgIB52L+Qm6y6iDjUOUHTNngvvsbuJ46nz4
	fC42iaOF5PDvN+a9fLqYBq2peX8iQA==
X-Received: by 10.80.147.195 with SMTP id o61mr63330eda.178.1494521450093;
	Thu, 11 May 2017 09:50:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Thu, 11 May 2017 09:50:19 -0700 (PDT)
In-Reply-To: <CAP71Wjw6mgBVTz_qapVAtM=WevCUu9DCLSKLe-uBsq2F7euOnQ@mail.gmail.com>
References: <alpine.LFD.2.20.1705110623380.31743@localhost.localdomain>
	<CAP71WjzrOsmind=t8wE+9HRDyxDBnc3SMMx9RM=8sbhX0Yg9Sg@mail.gmail.com>
	<CAMKF1so+CTyskyQ1OhaKoXxNFt0yKpXj3NechSm9JGZsAQ6trg@mail.gmail.com>
	<CAP71Wjw6mgBVTz_qapVAtM=WevCUu9DCLSKLe-uBsq2F7euOnQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 May 2017 09:50:19 -0700
Message-ID: <CAMKF1so9kHC-qEjXgY3SBR6zju_V0VRG1OFLsRBjnLeTMSBRsQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OT?] where to start building for qualcomm snapdragon APQ8016E dragonboard 410C?
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
X-List-Received-Date: Thu, 11 May 2017 16:50:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 11, 2017 at 9:48 AM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Thu, May 11, 2017 at 6:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> user meta-96boards and meta-qcom and you are set usually do builds
>> for MACHINE = "dragonboard-410c"
>
> meta-96boards is not required.  the main recipe from meta-96boards
> which is 'useful' is 96boards-tools since it would auto resize the
> rootfs partition at first boot. but it's clearly non essential
> content.

right on. Thats what I use it from that layer but its quite handy

>
>>
>> you also need
>>
>> ACCEPT_EULA_dragonboard-410c = "1"
>>
>> otherwise the build errors out with strange access errors.
>
> hmm. that's not quite expected.. I will check this one. on the other
> hand I will soon remove that anyways..

will be good. but it doesnt bother me I also deal with fsl layers :(

