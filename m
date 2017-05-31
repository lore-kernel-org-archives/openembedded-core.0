Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id B3FD071B27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 10:26:21 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id f55so8285419qta.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 03:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gNMqinQ+peb3W4ZgFj8WAih9hpvD/yqD8MTsT4KOBpM=;
	b=Kff9X8JGZ6hXsmlf9ygetm2Cr8V5JpsP+dzIzDaS+fS6BOFzOcCz1aqTusWDboyi3G
	/tvftN2uolrvC67rYmG9tp7kCPCINcYhAzdO0SAGjYo4sn4QXFny5twpL8l2Jxpzyiu1
	XzlOPqb8lpkRT9XJQJ0yGHnYfXPQRyusqwlFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gNMqinQ+peb3W4ZgFj8WAih9hpvD/yqD8MTsT4KOBpM=;
	b=gXaJeTxiv7gmHbO0oeTqEMZB30YKeRnmQM/Ti0kNTxGCTgyeiAzyqhxQut9834XVDw
	aQ/n99aD+vKYRzH+C/0Z53TP8Eh4VG5wZ08+M5YKRpiM4/v+R9q65sSzTl+LIk9FLaS3
	b0hZmw/BpEDAsM4zlPvoR2WceHQbOmWIdPiOk8zs0riOazyMRvgvNyh3YumCefnqiB4/
	bV64HmDX3ix5CQrDENgUj1Ym1NF+fPVJIVhDmj9kGkDAeY0CIwEY1aHGLgsET7B+rOmn
	H6d1FyLRWEL3b7zd4+lewS+KRs5cIC+UhDSm9KPGQMXqi3s0bmsi7JRE96y+t03AgoVV
	Up5A==
X-Gm-Message-State: AODbwcDspGGp/2/r4aW1TFZIhZQP6aQyABLM321xWuMu3/eqmKUrYA6Z
	VoXa7JnYRxfcZNvvG7ctqbHFCB8GQ78o
X-Received: by 10.200.42.219 with SMTP id c27mr30694679qta.9.1496226382788;
	Wed, 31 May 2017 03:26:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Wed, 31 May 2017 03:26:02 -0700 (PDT)
In-Reply-To: <CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
References: <CAP71WjxkYLeEaO5CfUjbEaON=j2pwRkjMDUxkyYafPAEt2qW1w@mail.gmail.com>
	<CAJ86T=VS+ThYpfakL=oHDbDt9ogmoq4E6A95S0YVdxXNxfwRRg@mail.gmail.com>
	<CAP71WjwsNYDZZttAqUwxh0+=QkY6H7HVvLbvBXc-po6y6C77uA@mail.gmail.com>
	<CAJ86T=XDeMu5yAvqymWQ3Lbe+FDhLzGobyhx8SR6h9cVpX3OvA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 31 May 2017 12:26:02 +0200
Message-ID: <CAP71WjyPL-ZsPnGDV_oq7rkWZpJCGNYyfvXQ9CVKNE6k3w9XJQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Wed, 31 May 2017 10:26:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 30, 2017 at 11:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, May 30, 2017 at 1:26 PM, Nicolas Dechesne
> <nicolas.dechesne@linaro.org> wrote:
>> On Tue, May 30, 2017 at 7:15 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>>   gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
>>>> It really sounds to me like something obvious is missing, i doubt I
>>>> would be the first one to try Image.gz..
>>>
>>> You may be the first to try for a non-MIPS machine.
>>>
>>> MIPS is a little special in that the MIPS kernel doesn't support self
>>> extracting compressed kernels (zImage, etc), so MIPS machines are the
>>> most likely to make use of a gzipped vmlinux image (which will then be
>>> decompressed by the bootloader) and KERNEL_IMAGETYPES="vmlinux.gz"
>>> works OK.
>>>
>>> If a compressed kernel is required, most non-MIPS machines use a self
>>> extracting image.
>>
>> this piece of is coming from this old commit:
>>
>> cb17b6c2a7 kernel.bbclass: support kernel image type of vmlinux.gz
>>
>> It is clear that the goal of this logic is only to support vmlinux.gz
>> since the kernel build system does not create it (only vmlinux). It
>> almost looks to me like we should treat vmlinux.gz as a special case
>> instead of treating each .gz target as 'special'
>>
>> -    typeformake = re.sub(r'\.gz', '', types)
>> +    typeformake = re.sub(r'vmlinux\.gz', '', types)
>>
>> e.g. the special case should be used *only* when the kernel build
>> system is not capable to create the compressed file. e.g. on ARM ,
>> Image, Image.gz and vmlinux are valid image that the kernel build can
>> generate, so it probably doesn't make any sense to have vmlinux.gz in
>> KERNEL_IMAGETYPES anyways..
>
> I agree that kernel.bbclass should not take over creation of an image
> type which the kernel can handle directly, and if that means special
> cases in kernel.bbclass to handle differences in which image types can
> be created by the kernel for each architecture then so be it.
> Documenting the special cases makes it less likely they will get
> overlooked and broken by future refactoring etc.
>
> I'm not sure about not making sense to have "vmlinux.gz" in
> KERNEL_IMAGETYPES though? It is a valid image type for MIPS and it
> should be possible for machine configs to choose to build it.

that's fine. i am not familiar with MIPS, if you say so, it's ok ;-)

>
>> In fact , looking more closely at kernel makefiles (for arch/mips,
>> since you brought this one up), it looks like uImage (and compressed
>> vmlinux) was added in 2013 (commit
>> 4defe4559e86e26545ab2f542656a4b966dcde53). So we might not need all
>> this logic at all anymore in kernel.bbclass and just get rid of it.
>
> I think vmlinux is an elf file and vmlinux.bin is the raw binary (?),
> so even though the kernel can create vmlinux.bin.gz directly it
> doesn't cover systems which need a gzipped elf file (ie vmlinux.gz).
>
>> so, to backtrack a bit, i think it should be safe to only treat
>> vmlinux.gz as a 'special' case, and then it is there in
>> KERNEL_IMAGETYPE, then we do a "make vmlinux" and we manually compress
>> the file, otherwise we just trust that KERNEL_IMAGETYPE is a valid
>> type and give it to kernel make command line.  that should be enough
>> to fix the Image.gz cases on all platforms where it's relevant (like
>> arm).
>
> That sounds reasonable.

I've been playing with this today, and that *seems* to work fine. At
least I can still build vmlinux, vmlinux.gz and it fixes the  build of
Image.gz as well..

I would appreciate some feedback on this one. I can then send a proper
patch. Could that break badly for anyone?

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 7a134d5c29..459b6d66a3 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -44,7 +44,10 @@ python __anonymous () {
         types = (alttype + ' ' + types).strip()
     d.setVar('KERNEL_IMAGETYPES', types)

-    typeformake = re.sub(r'\.gz', '', types)
+    # some commonly used kernel images aren't generated by the kernel
build system, such as vmlinux.gz
+    # typeformake lists only valid kernel make targets, and post
processing can be done after the kernel
+    # is built (such as using gzip to compress vmlinux)
+    typeformake = re.sub(r'vmlinux\.gz', 'vmlinux', types)
     d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)

     for type in types.split():


>
>> then a second step might be to check if we even need that mechanism
>> anymore.. but that might be a more tricky change.

