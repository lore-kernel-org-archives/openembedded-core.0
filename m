Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	by mail.openembedded.org (Postfix) with ESMTP id B70B060053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 23:11:28 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id z78-v6so2458172qka.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=31ZH9S4qWqyuO3yP1lTSRI14KKo1zTuOAUNfekEG/Zs=;
	b=LCNEJRkxvLwvxbyP+AFN2rRqLlryyRrvkOJiiATAyHZmnNRbqvPVOacV3LojPUwS0v
	RCY+vkiaP+H83rgQLXPMIwfGiOWrgl+m38Qyl7Tnehc9f5Tcx1JoHcZPxYQKtA0ChXy4
	2+wIztYiFxORcJwDsE9CpHlB85ubkr2ta2pXDr7UZokhYLVB/IQPA+K9fwS8eYj+8LLs
	2bNRolxOeZ5a67R5KZIgRSa1KLyqxRQIbhxGVKDgoBLIyzn4ItsMGzYoDPumfjrD4KQD
	rr0gKOcSH/3gu77PgLZvCG7mFBcIUjbHUI+ebWvOlSju6AP/H5YahHjokyyZE6RBvdxM
	uikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=31ZH9S4qWqyuO3yP1lTSRI14KKo1zTuOAUNfekEG/Zs=;
	b=dlLS8E3U6JUqWc3J20CV/IyHW+6GM2M4Fuy6aYjaNDhHe0AMVm9jdrHsOw6j6Kolkk
	ghh7PKJujEK++knjcgMphfqNG7c1J+m5kWaqSm9AKWpNH8Z3vBn7i0zPpAkBjRu5Ux/3
	B7kY9aSpyUSzYF6+S1PtpX6L5vDZT4ie7b/RVCFhR3TFeYX87d1D4eiCbnhuyPHSo1t/
	t8KRnb/ZWuaj+DVWB8nIpYlt5cddnVAZqnPMT4AEkCEPXFaMlugSd0Pmh+3XYxkv5D3N
	LEvH7CrveYKkSiYq0eEmXogeF951RDTBknRnc4CoDx1hgt3AY+uVpBf9b9aEHenWP8t5
	0QCA==
X-Gm-Message-State: APzg51AJrUuW3vHhJ+X5wS5Q/eHM8nR7haZ64kHEVsZ3jR+Aq5b8QkEO
	9PNdp2Thc9gLs1pMfXetgnA/G/0+9tDqu6utv5/LiQ==
X-Google-Smtp-Source: ANB0VdY69uJkfVWFUxciTehgqE/lpTkOlEh8x0BEuNuSM0BP+ipXL1rgn723FvAvnI0G/vidJ7azP2w8ZlVdq6dOTLk=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr8166043qkm.2.1535757089175; 
	Fri, 31 Aug 2018 16:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
	<b11c0e06-2d5f-8478-6dfa-a69604d92714@vaisala.com>
In-Reply-To: <b11c0e06-2d5f-8478-6dfa-a69604d92714@vaisala.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2018 16:11:03 -0700
Message-ID: <CAMKF1sqhfek-a3=7+dOkU8ZE96AoA5dpB6AHXj0f7H8tOCuhpA@mail.gmail.com>
To: Niko Mauno <niko.mauno@vaisala.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: recipes-kernel/linux-libc-headers/linux-libc-headers.inc question
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
X-List-Received-Date: Fri, 31 Aug 2018 23:11:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 31, 2018 at 3:07 PM Niko Mauno <niko.mauno@vaisala.com> wrote:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=eb24d4aeacaad9d41ddcbefd8d2ac96e95548183
> apparently is needed for 4.15, but it breaks with 4.14 as we get
>
>   ERROR: linux-libc-headers-4.14-r0 do_install: oe_multilib_header:
>   Unable to find header asm/bpf_perf_event.h.
>
> I used following to work this around in our own linux-libc-headers_4.14.bb:
>
>   do_install_armmultilib_prepend() {
>       touch ${D}${includedir}/asm/bpf_perf_event.h
>   }
>
> but curious if somebody could suggest a better mitigation
>

We do not encourage to fork off linux uapi package ( linux-libc-headers)
so changes in .inc files may become incompatible with other versions more
often than not.

Your fix if it works for you might be ok to carry in your layer.


> -Niko
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

