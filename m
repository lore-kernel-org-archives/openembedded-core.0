Return-Path: <h4nn35.work@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id 996CC731ED
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:50:35 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id c3so119151380vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 06:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=FADn6h0n5oHJ9PEtIranFTGIpUEt9f7qviq+3jmGiNI=;
	b=AW2UJQk/kFGsuFczB+SMYpYL16pii/O2FX6Vxy4CibcSZFujT7U5FFtnCTaedYs+/f
	tgu9CEpDV+I0YguKNVwsFqShV43dNU4w9wINzN0LHP6MXBqTs1otXzIjRKKhCtJFQvXS
	ZYwq2vmX3vwUECc48Ajj6MFUhJcgs7zMPpHWGCNb20KRuYb51hAZoX1ihtoVIeB/5zgz
	UekI4tMZPtnaj7IZNjMFdbe0mBxzjxQsaZpLp6RCObdrvNLkjdfIaRZV8X1/V7QkpApz
	LhLwDAJIe4jAaXFCt+x9ABBxdSMBjfUJ0b9Y5EC8swvYOySQO4/ZYOZ7oqdpc1SnB/9q
	W3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=FADn6h0n5oHJ9PEtIranFTGIpUEt9f7qviq+3jmGiNI=;
	b=G1bmD7CfBfWAmc0S8bEYN/lKuSjxy+wuOIgKgyfR5JKRJxYmL5GczfIImldduI8i6l
	7W9pjJjRZGCknBtFxcb33wPnI7gEFT9kJjZG+WzSkXUOatZbCkh3MZxDZLVnrMTF/+3O
	k/+1v7qFznAgWQZh1equCMLJ10IVBhF6aYUEpyIyJTWL3beNjPV0LsFz7vZ4W3Lz9K9/
	Eu1iY2SFPdZgLRAINOHRhuLpeamtkIJzHrrLnfjO+jOHGfickeMwvuNYm303rotTbPxh
	h8PaAj3A4mTYgv83NCLbNZimol5pw4eRiJXuhfSpP9waLgc6ly+rFgo1WvGaYdPM54Uv
	h8iA==
X-Gm-Message-State: AD7BkJJ+4JuwZwIF530S2iyelD0yETIHVF4oKPCrhsUgWfXFtqXWht0Smzhe+GXbJ04fa5v/6BElOfSAbF23dg==
MIME-Version: 1.0
X-Received: by 10.31.162.3 with SMTP id l3mr21220873vke.68.1457362236037; Mon,
	07 Mar 2016 06:50:36 -0800 (PST)
Received: by 10.31.192.206 with HTTP; Mon, 7 Mar 2016 06:50:35 -0800 (PST)
In-Reply-To: <CAJTo0LZ_rMH3zn+uox0D0tBw+T74xbkNzdvCoR3CCwpo1SnZpg@mail.gmail.com>
References: <1456863137-7388-1-git-send-email-johannes.pointner@gmail.com>
	<CAJTo0LZ_rMH3zn+uox0D0tBw+T74xbkNzdvCoR3CCwpo1SnZpg@mail.gmail.com>
Date: Mon, 7 Mar 2016 15:50:35 +0100
Message-ID: <CAHvQdo0ckNBU19WSrMwehCsZ-HO37uqNRWqnywUfK3ZPtPT0Zg@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Patch][jethro] xf86-video-modesetting: Require sufficiently new libdrm
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
X-List-Received-Date: Mon, 07 Mar 2016 14:50:35 -0000
Content-Type: text/plain; charset=UTF-8

The reason I thought this patch wouldn't be needed for master is that
it was included in xserver 1.18.1 and master is already on xserver
1.18.0.
Do you know if it is planned to switch to the newer 1.18.1 version?

2016-03-07 15:02 GMT+01:00 Burton, Ross <ross.burton@intel.com>:
>
> On 1 March 2016 at 20:12, Johannes Pointner <h4nn35.work@gmail.com> wrote:
>>
>> This fixes the check of the libdrm version in the configure script.
>
>
> For patches to stable branches please explain why this isn't also required
> to be applied to master.
>
> Ross

