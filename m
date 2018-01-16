Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 49B3A601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 21:10:53 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h92so8839748lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=IVgfvtXItZDFPOSNk+MHVttui3SSrMIlSrH9sdwik2U=;
	b=srDsujVf1tv+8xrf/QrYEXKzvNoHW/GutquWd+mmmsZGkvWncwS11Sf9x37v5FWXfc
	DMDZyfGd6uEy2ZydxL0Aekhf4v5ilHewqhxvRANvpgRTuM40DQ4ZvRNV8M+7fCX196Cp
	5Tr04UhGbrXDLMUDOpsgQq5Yi4NxAoE7coe51o0I2lW6FWIO8BZuSa/fe1eTo1z0pppf
	72R1/naYJLjDi+vFHebIr2c7HkI4hVrtguJFwaOeCg9GkY0jInnz8k5BtXfaIoM5BrGN
	Wz2JFNy68BdVYno0b1et9IpNPdmM1mBnFNWgS97OxMzD2uV6NgT7bphIb66eRAWFLM5A
	X7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=IVgfvtXItZDFPOSNk+MHVttui3SSrMIlSrH9sdwik2U=;
	b=KOHdmG+JNE1qI+nRyhKY7Bfsw1omaLnUrXGCuDz+BG9adNQ5dakPFke0I5fHZ4NuE8
	GeiPjXZi85W/alU7S+HCc7V1ZBxnyf9uGQwNN4pp6T1qvMcyxwZv1bgOMlW4BOU+d32E
	y5dHPjseA3twXR0L4KgxwzSPlxe4aniSWdlCPOuw/maTWHY5dcXJle1SCtHtJc0XSoHK
	bDLlVm96FAv0AwT6BiSQLnGFLgVKzfd9kUq8zbhhKZrjqIZbMkGdLYWw/HQvJWnHTswu
	CmHTHlReGjCYKrc9GUXuWldDYk6MY1qEwxcUWr00RFZIONpcBoWQsN0U420rjkOAE5Je
	Jf9w==
X-Gm-Message-State: AKwxytfslWA1EzxRlzS8OIoVGNnQtmSV3AR5xVqb148GCekYfauYRoWY
	/0VG1zDFuWdcAlr6D+VtGtiApu+pv3wXuTIBu0g=
X-Google-Smtp-Source: ACJfBovE7Xc5TPhCoho6Kv/5sJdFi9Tf3xyaU18yBxZJo5/e2/nAToE52BLeQoihHaRqM+7uIqNnZ1naWHnRkPR7WZk=
X-Received: by 10.25.150.207 with SMTP id y198mr21767968lfd.33.1516137054744; 
	Tue, 16 Jan 2018 13:10:54 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.46.64.196 with HTTP; Tue, 16 Jan 2018 13:10:24 -0800 (PST)
In-Reply-To: <1515921611.29722.193.camel@linuxfoundation.org>
References: <20180112220906.27915-1-alistair.francis@xilinx.com>
	<1515921611.29722.193.camel@linuxfoundation.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 16 Jan 2018 13:10:24 -0800
X-Google-Sender-Auth: XJRdlbXLXC3Z-9oouVw1iJDYAdU
Message-ID: <CAKmqyKOXw98uMJkY6U8tifZ89HpX=Q+51iefy3-=5u5UZ+Y7Rg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: vineethchowz.chowdary@xilinx.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] receipes-devtools: QEMU: Bump to version 2.11.0
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
X-List-Received-Date: Tue, 16 Jan 2018 21:10:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 14, 2018 at 1:20 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2018-01-12 at 14:09 -0800, Alistair Francis wrote:
>> Use the latest QEMU release 2.11. Remove all patches that are no
>> longer
>> required as they have been merged into the 2.11 releaese. One patch
>> had
>> to be updated to apply to thet 2.11 tree.
>>
>> This also reverts a linux user patch to avoid webkitgtk build hangs.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>
> Sorry, could you rebase this against master again please? There were
> some other qemu patches which have gone in and I'm struggling to get
> this to apply.

Done, just sent v4.

Alistair

>
> If the musl issue is fixed this should be straightforward to merge now.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

