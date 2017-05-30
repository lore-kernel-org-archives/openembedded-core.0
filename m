Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7237078170
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 21:56:58 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b84so358321wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 14:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/ZwPIi+C1UhgIVg0wgkt0pKuyt1oscEp7nE2tZkV134=;
	b=O2S8+IVPzDfY9nwzFhcwCI/uHYeQbp8Dk0hywnZM8U4J924RxTqs/xDBoAGbN5bdq5
	8Fqtp6Dj6hWE+VPLsJzwvpnHtHBbzdTVcBm3PTXhnoqsrNtfX6BwdTJM5YbcTCMTk22F
	hJGoqugmireh5SZHieA/qaqMYYkJpJ8x8yDxIfBiAVussRccWXG7/KjIuKN3LAdg8giB
	VnlYajcZm8nvoZ7gPnhEnm1+IpHq04dCmI49lNEB5fFjkyWHnsrhlpGXPstQU4PJd/y2
	M6eW2gU18d9FCwz3H/x0VQOiORtUKwslM6SxdnXS3JCUkUbUBgMU7O6h6bTZv7evhpy/
	VW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/ZwPIi+C1UhgIVg0wgkt0pKuyt1oscEp7nE2tZkV134=;
	b=eSjhGUQBAQsyFp8ohTcl2Nh/osXl7GKI7svXS+sO8tVEBG9HrZR5G6MIF2gSTuRXSy
	g5mWz/G/cBpy6AvZrwl7nqzEOlRn/orYlJ3WRfc1OeOvwirVlR/3f+fK1IMVILaSTR6O
	jBH/AAZktxV09onWBapmCoOsYaoRYuf0XPB68z9/c+U9L8aAdrKc716dcBdFrTzwMh1L
	TR5cyFUQMla7EAjIM+8DSL4waOkuL7sz2sfnmmhbGjjHlDz0YBCh3xWJfTJZig0C0aqb
	ORl9vDJYCV5E5uBW48y0lmOCMGmb7K2XXqleBOdRT+/tect3wYT2FbOHmc0EeABT5d0y
	PWAQ==
X-Gm-Message-State: AODbwcA2l6peXg+YhgCiRbdA7Dv6b4i/kI7PO2N5qNREV8VjvgThOZgp
	3P6xphS/nhxcp+GcNcMFb4KZqoO13A==
X-Received: by 10.28.24.207 with SMTP id 198mr3051907wmy.86.1496181419774;
	Tue, 30 May 2017 14:56:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.176.148 with HTTP; Tue, 30 May 2017 14:56:59 -0700 (PDT)
In-Reply-To: <CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
	<CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 May 2017 14:56:59 -0700
Message-ID: <CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: KERNEL_IMAGETYPES and Image.gz
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
X-List-Received-Date: Tue, 30 May 2017 21:56:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 1:26 PM, Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
> On Tue, May 30, 2017 at 7:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
>>> It really sounds to me like something obvious is missing, i doubt I
>>> would be the first one to try Image.gz..
>>
>> You may be the first to try for a non-MIPS machine.
>>
>> MIPS is a little special in that the MIPS kernel doesn't support self
>> extracting compressed kernels (zImage, etc), so MIPS machines are the
>> most likely to make use of a gzipped vmlinux image (which will then be
>> decompressed by the bootloader) and KERNEL_IMAGETYPES="vmlinux.gz"
>> works OK.
>>
>> If a compressed kernel is required, most non-MIPS machines use a self
>> extracting image.
>
> this piece of is coming from this old commit:
>
> cb17b6c2a7 kernel.bbclass: support kernel image type of vmlinux.gz
>
> It is clear that the goal of this logic is only to support vmlinux.gz
> since the kernel build system does not create it (only vmlinux). It
> almost looks to me like we should treat vmlinux.gz as a special case
> instead of treating each .gz target as 'special'
>
> -    typeformake = re.sub(r'\.gz', '', types)
> +    typeformake = re.sub(r'vmlinux\.gz', '', types)
>
> e.g. the special case should be used *only* when the kernel build
> system is not capable to create the compressed file. e.g. on ARM ,
> Image, Image.gz and vmlinux are valid image that the kernel build can
> generate, so it probably doesn't make any sense to have vmlinux.gz in
> KERNEL_IMAGETYPES anyways..

I agree that kernel.bbclass should not take over creation of an image
type which the kernel can handle directly, and if that means special
cases in kernel.bbclass to handle differences in which image types can
be created by the kernel for each architecture then so be it.
Documenting the special cases makes it less likely they will get
overlooked and broken by future refactoring etc.

I'm not sure about not making sense to have "vmlinux.gz" in
KERNEL_IMAGETYPES though? It is a valid image type for MIPS and it
should be possible for machine configs to choose to build it.

> In fact , looking more closely at kernel makefiles (for arch/mips,
> since you brought this one up), it looks like uImage (and compressed
> vmlinux) was added in 2013 (commit
> 4defe4559e86e26545ab2f542656a4b966dcde53). So we might not need all
> this logic at all anymore in kernel.bbclass and just get rid of it.

I think vmlinux is an elf file and vmlinux.bin is the raw binary (?),
so even though the kernel can create vmlinux.bin.gz directly it
doesn't cover systems which need a gzipped elf file (ie vmlinux.gz).

> so, to backtrack a bit, i think it should be safe to only treat
> vmlinux.gz as a 'special' case, and then it is there in
> KERNEL_IMAGETYPE, then we do a "make vmlinux" and we manually compress
> the file, otherwise we just trust that KERNEL_IMAGETYPE is a valid
> type and give it to kernel make command line.  that should be enough
> to fix the Image.gz cases on all platforms where it's relevant (like
> arm).

That sounds reasonable.

> then a second step might be to check if we even need that mechanism
> anymore.. but that might be a more tricky change.

