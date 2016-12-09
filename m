Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0C86FFCE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 02:53:10 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id 12so473133uas.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 18:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rf6P3HvsO94NYSboscumo1qWk1bP6q/UznUJYO4qHDk=;
	b=gxvVTLLAhK/M4U5aU7jiWBqV2vq/zbUhbzCwCB/XuDkbE4w41dj44mIlQDbAQS2Fc7
	Jr56VJ9YVUUHfeu3XGYqeD7Bv90OD7VdfhlbJdixKMoMcyeVhtt5FsZla/VG4AqTLDwB
	OSxgS44bbqi9/Yf6MwAXgy+EfPoDw9HY+1etAYdPQaaKm15jXtayVa1EkLLcbMAOVRlj
	ns6aqdnxNBiQgW6fW4/rkEXKGPinz/4hUWFMverafIAyCu0SoDQ6fzB4TH04+w2wPgi9
	sseYampZszADLqsQZ/bH8DjIQXIC0aIo8RsFP/qeG9A5cMPjMX8JspJ07m5Hth/6OEjG
	J38Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rf6P3HvsO94NYSboscumo1qWk1bP6q/UznUJYO4qHDk=;
	b=fRHtpCsvhv5NO6VLfTAJKYfE5ee3aLL9UEaHSlt8TtgvdTZf5W9PTi6auUthhOR1Vh
	fVyTjLzhkO+wYh7uMsDX0C/e3RXVY0OzlvESRrjfCpscdfleEoTayKsMyySXB8eK4KUL
	vjBh6OY6Bdo9BSL9O5JicVxCW0pR6w8MMw2WAmjun2jdVExN7LOfbav5YDfFNwZX0VQq
	rrUQSDtpGkUodmYA/d43qQIkFkjxiv1lJ8t6QH45Dm8gRb4GO6toZsFPHOyEFFS+gDmB
	lAP1atJbYJPwhwIgziSMMvwi3LJflydkzOlUkN/5/bMYa+JrT8kvQeDhoX9CGK6U0Vh7
	CHRg==
X-Gm-Message-State: AKaTC00aikmWNMesgw2VcsRZC12qRn0+w1iCabalPFBJa5Uij9EZ7M2KXI+PGeVsEkC5X32goOilO5A3esYOdQ==
X-Received: by 10.176.84.8 with SMTP id n8mr24954633uaa.29.1481251992006; Thu,
	08 Dec 2016 18:53:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 8 Dec 2016 18:52:41 -0800 (PST)
In-Reply-To: <CALbNGRTqROjBNZP=FsRMYUPn=sMbYYgAP6CAYmnjePKO3o4N=A@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-3-git-send-email-schnitzeltony@googlemail.com>
	<CAMKF1sorwZg-yF5k8NJBtDakZHqCZr0H=jvLP8mx8bkcU2B3Gg@mail.gmail.com>
	<CALbNGRTqROjBNZP=FsRMYUPn=sMbYYgAP6CAYmnjePKO3o4N=A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2016 18:52:41 -0800
Message-ID: <CAMKF1sofn-ZLUCYnU5D34tLJvMOWRbceyRK7YjXMXHMD+jFGeQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libsdl2: add EXTRA_OECONF[vardepsexclude] = "MACHINE"
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
X-List-Received-Date: Fri, 09 Dec 2016 02:53:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 6, 2016 at 12:00 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Dec 6, 2016 at 1:24 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> There probably is no need to use this additional variable. We can just u=
se
>> PKG_CONFIG_SYSROOT
> Problem is not finding the wrong .pc files. Problem is that the output
> of pkg-config must be prefixed to find the protocols.
>

I think this patch as such is fine for now.

> Andreas

