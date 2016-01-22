Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9B17E731FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:28:45 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id z14so152763013igp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=B0VXWnEFuD2sIbp3PN8On8XEBW9zr6i+FZzoF8V0oBg=;
	b=cSVVfScZHQzMsGjYMF0sEZ+qk2H+7ryKz3PrtRbsnZkeEfq4rwceTKHaGvSvcr1dVt
	8eamSYRm/5+5P5ROgmYRdJy1IFFmPZ2z7DYQPuNmseN4g0HHMfWzrZ2O55GAV3rAq4VG
	Z/4N0AYI4/57V11YjFvoCfW7Q6oP+YSWbn90qvgIwxNwxjU3FmMdrAxRkrPK2f4mcI8l
	Gb75+JxPHmUalFvGMD+xLwzTN9STpnS/VdVBE7k2vdAaZU2U5wMGJPVdj8qDmRT48H2+
	DWo61cTLlnyogRBNPqK3qC6X0f4x5f7pcNth/DDzrCZ0TdlJmOFRx5QC4/wDRwlYq40E
	nZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=B0VXWnEFuD2sIbp3PN8On8XEBW9zr6i+FZzoF8V0oBg=;
	b=K+ECm+GNOrGzFVvqn2Gf8H7I0ahgsFZ5I8mI0a+D16u3LNzpJkEw73Wc+qR/2odFcR
	GAceir4uP2DieqajzGU0SEfxesVGhbkqZ2pqUhEx7JRiKyY5dKA22Vle+CP/IS+FDIjS
	i0o776uScf8+KOqGGnb+dGfnTfiboUc7WmWGBfwDAgEpJAb9hd2QN1cG+HM8NmWZd1eo
	WM65Nbcf9K49YG6FJqZAXMXF2NFlRWgYYLnxxKe34g+oXvdR6Y834Z3rJwhDWZY1+SJh
	H/g93bu3+X5up/J3/ZmMl9vLyC5HU3qj/yzr5ygQ/jlpt+/g++MWk0EBdoclgpLPDN7S
	mjtw==
X-Gm-Message-State: AG10YOSzTrhCinNA6g2J2uq3qLtYXgxNzoGMF0CmKk7YdUytFuQ9s+5kNNUcw/u7y3eXvewRw88MrdxHI5k4dA==
X-Received: by 10.50.13.102 with SMTP id g6mr4664866igc.77.1453480125763; Fri,
	22 Jan 2016 08:28:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 08:28:16 -0800 (PST)
In-Reply-To: <CAJTo0LaFqUeC9+qWrovAcahz93aHgWvem2BRHXKgEz0_KYom5Q@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<d4925a4659964507e08b4b9e67c88f3913fbc860.1453029952.git.raj.khem@gmail.com>
	<CAJTo0LaFqUeC9+qWrovAcahz93aHgWvem2BRHXKgEz0_KYom5Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 08:28:16 -0800
Message-ID: <CAMKF1soyb0Js+Nt7_+w2gpya242AeJwQ6ZMV7QOLe+epx6y_pQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 64/73] acpid: Fix build on musl
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
X-List-Received-Date: Fri, 22 Jan 2016 16:28:45 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> implement isfdtype() if libc does not provide it
>>
>> Fix build when S != B
>>
>> use top_builddir instead of top_srcdir
>
>
> This and Maxin's upgrade are conflicting:
>
> NOTE: Applying patch '0001-Define-isfdtype-if-libc-doesn-t-have-it.patch'
> (../meta/recipes-bsp/acpid/acpid/0001-Define-isfdtype-if-libc-doesn-t-have-it.patch)
> ERROR: Command Error: exit status: 1  Output:
> Applying patch 0001-Define-isfdtype-if-libc-doesn-t-have-it.patch
> patching file configure.ac
> Hunk #1 FAILED at 41.
> 1 out of 1 hunk FAILED -- rejects in file configure.ac
> patching file sock.c
> Hunk #1 succeeded at 61 with fuzz 2 (offset 11 lines).
> Patch 0001-Define-isfdtype-if-libc-doesn-t-have-it.patch does not apply
> (enforce with -f)
>
> Can you see if anything else is required beyond Maxin's upgrade?

This whole patch can be dropped.

>
> Ross

