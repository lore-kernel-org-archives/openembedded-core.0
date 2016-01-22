Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id BF6786FFAB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:30:14 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id g73so95299667ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UELH7rXSZ6ZtXA0TndLyZdzoH+2aBjm11qakq+Mpx+k=;
	b=fbS6eiP7IDvZYeWkWPcIDE/T8cRiGwdhAW1fEHDwWPfaIRhL2SJ10jcHA8/j0GAi01
	JM0SrQW4494f512adleg3Jmtfqldy+2NshjkNkunUKNMrIF5aTRGm1Dur26GAA6//Mmt
	etzAsvY3VgUkUts8LQgk/5wlhM1q/pqz6rbx66/u9wfkJIrCG1spo/JPkIAXAUHt/pn9
	p8aGTnSIISH9b3fTI9A3KoT8dxSOf+TgBJd801xVD3L6rnUnQZAofmVGn5xRLzWNnFBY
	YAfmDTxF/mEiHZVSS8sIRZQtCAhwuZC/vkCYPVKaFQBz8DUUGKS1f62VpD4j6R37N8cP
	6JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=UELH7rXSZ6ZtXA0TndLyZdzoH+2aBjm11qakq+Mpx+k=;
	b=AQ+8nagb+JsulwPMltxoWEg3H0RhpOdX9+0+Yx4KnKDTm5Oz/cNiRT4AM0P2Van18U
	+8z0soe/jZZygWdMh4mJLV3bLIYxCkkZgUgn258LpkioteIvngbfMB7vAia/LTA12A/o
	vypRY1DVh/C5Y5dw20VtNyhyOoYDSB+ZhF2GJyFYYakAPddaley98uT21Z5rBCpZHN7L
	A3d0Exr+8/3NZzMUlMl+Q7F1KmJr2mj17Fh9yTppla089qYcFbijciI0r5MbO5mG1Z43
	GX2UnZ2zWbEoxU9oYPrliRn9nc5tD2SFPGUX1t8DAfwyMrB7cyDBCQp8QlXjgxZXiKna
	sncw==
X-Gm-Message-State: AG10YOR7mcZae7SRTF+S4WiVrsz6JMwicszrWhIB4GrtHqr+VRI8FJODm6jKZAO54TK/LvOTOx28m9g7LkvGOg==
X-Received: by 10.107.165.14 with SMTP id o14mr4193753ioe.49.1453480215465;
	Fri, 22 Jan 2016 08:30:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 08:29:46 -0800 (PST)
In-Reply-To: <CAJTo0LZdouaU6FhRAV-b+fcEY1W0-zohxVQ0B5P4v5jt23YbEQ@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<07d854174cf74c1a89798d2687fe8a374edac748.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LZdouaU6FhRAV-b+fcEY1W0-zohxVQ0B5P4v5jt23YbEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 08:29:46 -0800
Message-ID: <CAMKF1srkvEWTzVYUFKdBM6g3oav+ZQ+6x_b15WPDvMxj95UX9A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/73] systemd: Update and fix build with uclibc
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
X-List-Received-Date: Fri, 22 Jan 2016 16:30:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:34 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  create mode 100644
>> meta/recipes-core/systemd/systemd/0018-include-missing.h-for-getting-secure_getenv-definiti.patch
>>  create mode 100644
>> meta/recipes-core/systemd/systemd/0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>
>
> These are missing Upstream-Status.

Drop this patch from this series. I will submit it separately.

>
> Ross

