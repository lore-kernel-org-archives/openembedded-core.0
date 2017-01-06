Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id DBDEB6093B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 14:32:31 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s140so53165432qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 06:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v4BU4l/lY/TsOjEaoWfCzYp+5rVbuMZYqWjnksX/nKE=;
	b=JaFYXSREvLi6Yt/PZrAQDfWzSwp0REi++KpvoNMQi0jqKbF1UFj8TAYyCw9hi56thu
	FxzqGiIz0iKzwCVTupHJXQKFISCrLYUbCpLplbpfJnQYK2WLtPdo8ZAzMsCdDotTtu4N
	6tOJMMw1P2xAVM8MfJHRDPApikNej1Hz6MEK6mCa0btnMxcIOPZXV9obDtuyiBoYTbhJ
	FGXEd4qEm7uFyFg3h557AEFiVExF/JzzI++kATLkIxSREaENS8lds6y/C6YLQBXe1vUM
	NFJ4n09gOWxGFiekGDn40P/IQQfn1pERLKqaXrFc1/tkEwq+ACSFDFz0WMWC1MsA1BBA
	otXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v4BU4l/lY/TsOjEaoWfCzYp+5rVbuMZYqWjnksX/nKE=;
	b=Qxe/FJkoqzz8HasPwGPrWaffZ5bAIxHFn6fcBtl0UPp3l+akWeEEFBXj06jQcy9BP3
	sIoopsDtv6Ihs4e6e3A9E42UuHvXd4221wnTohwKzgnBGi90WPeW0epL1nPxsWU0Ho+D
	c8jgpv+klk/YVAVj7qR/04ofnCNgnDZAc12K109/0eVWUv4Z0cNhAMQKx5cW8cojFDpE
	hJ75WcBN/IZn+24wR+v4oL6Tmns5V/s1rLhH2YrSNABfl7h01xaGeCkHv2F0SyuVrUnL
	Dx48AyXVQzCI0qJ40oz3DUsng2/F0NLGBowwtZLpw2s5QbE9vTEw2r9xbW8CmdJKsAhM
	G7Xg==
X-Gm-Message-State: AIkVDXKFfznpjfr5g4pZhqhhmIq/GmICIDOai9b6VteGG7rSi1jKADB8XVYs+4gCnCvy291E5k9yTL7QAvwc6YXV
X-Received: by 10.55.130.4 with SMTP id e4mr65541404qkd.121.1483713151416;
	Fri, 06 Jan 2017 06:32:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Fri, 6 Jan 2017 06:32:10 -0800 (PST)
In-Reply-To: <C2A454FDE6C23F41BD5011E2458C46C9C2AF227B@ALA-MBA.corp.ad.wrs.com>
References: <1483434305-15926-1-git-send-email-Haiqing.Bai@windriver.com>
	<CAJTo0LZs61bWkyum1imEHqYGdFrx+Hp+kAek8hZchBSbs9Ty1w@mail.gmail.com>
	<C2A454FDE6C23F41BD5011E2458C46C9C2AF227B@ALA-MBA.corp.ad.wrs.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Jan 2017 14:32:10 +0000
Message-ID: <CAJTo0LacvRwTtCmcghC3XPgja55V5SDChe_fV4b5hj6h2+=f8Q@mail.gmail.com>
To: "Bai, Haiqing (Wind River)" <haiqing.bai@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec: ARM: fix align issue of add_buffer_phys_virt() for LPAE kernel.
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
X-List-Received-Date: Fri, 06 Jan 2017 14:32:32 -0000
Content-Type: multipart/alternative; boundary=94eb2c07035656d10d05456de35f

--94eb2c07035656d10d05456de35f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Can you rebase and resent the patch please then?

Cheers,
Ross

On 6 January 2017 at 02:40, Bai, Haiqing (Wind River) <
haiqing.bai@windriver.com> wrote:

> Hi, Ross:
>
>
>
>       I clone the branch (poky-contrib:ross/mut) and did=E2=80=99t find t=
he fix
> in 2.0.14,  so this fix is still required.  Thanks
>
>
>
> B,R
>
> Haiqing Bai
>
> *From:* Burton, Ross [mailto:ross.burton@intel.com]
> *Sent:* 2017=E5=B9=B41=E6=9C=884=E6=97=A5 22:32
> *To:* Bai, Haiqing
> *Cc:* OE-core
> *Subject:* Re: [OE-core] [PATCH] kexec: ARM: fix align issue of
> add_buffer_phys_virt() for LPAE kernel.
>
>
>
> An upgrade to 2.0.14 was recently posted on the list (and is now in
> poky-contrib:ross/mut), can you verify that this patch is still required
> with that release and rebase?
>
>
>
> Ross
>
>
>
> On 3 January 2017 at 09:05, Haiqing Bai <Haiqing.Bai@windriver.com> wrote=
:
>
> If LPAE is enabled, 3 level page table is used and the 'SECTION_SIZE'
> is (1<<21), so add_buffer_phys_virt() should align to (1 << 21).
>
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>  ...-ARM-fix-add_buffer_phys_virt-align-issue.patch | 52
> ++++++++++++++++++++++
>  meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb    |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_
> buffer_phys_virt-align-issue.patch b/meta/recipes-kernel/kexec/
> kexec-tools/kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch
> new file mode 100644
> index 0000000..7d1f95e
> --- /dev/null
> +++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-ARM-fix-add_
> buffer_phys_virt-align-issue.patch
> @@ -0,0 +1,52 @@
> +From 380019f68e19ac863cf32dc7ff6784e8fe1d751f Mon Sep 17 00:00:00 2001
> +From: Haiqing Bai <Haiqing.Bai@windriver.com>
> +Date: Mon, 19 Dec 2016 14:52:02 +0800
> +Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue.
> +
> +When "CONFIG_ARM_LPAE" is enabled,3 level page table
> +is used by MMU, the "SECTION_SIZE" is defined with
> +(1 << 21), but 'add_buffer_phys_virt()' hardcode this
> +to (1 << 20).
> +
> +Upstream-Status: Pending
> +
> +Suggested-By:fredrik.markstrom@gmail.com
> +Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> +---
> + kexec/arch/arm/crashdump-arm.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-
> arm.c
> +index 38a1401..e41b7fb 100644
> +--- a/kexec/arch/arm/crashdump-arm.c
> ++++ b/kexec/arch/arm/crashdump-arm.c
> +@@ -271,6 +271,7 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +       void *buf;
> +       int err;
> +       int last_ranges;
> ++      unsigned short align_bit_shift =3D 20;
> +
> +       /*
> +        * First fetch all the memory (RAM) ranges that we are going to
> pass to
> +@@ -295,6 +296,7 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +
> +               /* for support LPAE enabled kernel*/
> +               elf_info.class =3D ELFCLASS64;
> ++              align_bit_shift =3D 21;
> +
> +               err =3D crash_create_elf64_headers(info, &elf_info,
> +                                        usablemem_rgns.ranges,
> +@@ -315,8 +317,9 @@ int load_crashdump_segments(struct kexec_info *info,
> char *mod_cmdline)
> +        * 1MB) so that available memory passed in kernel command line
> will be
> +        * aligned to 1MB. This is because kernel create_mapping() wants
> memory
> +        * regions to be aligned to SECTION_SIZE.
> ++         * The SECTION_SIZE of LPAE kernel is '1UL << 21' defined in
> pgtable-3level.h
> +        */
> +-      elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 <<=
 20,
> ++      elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz, bufsz, 1 <<
> align_bit_shift,
> +                                         crash_reserved_mem.start,
> +                                         crash_reserved_mem.end, -1, 0);
> +
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> index 59376c8..3e38923 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.12.bb
> @@ -8,6 +8,7 @@ SRC_URI +=3D " \
>              file://0002-powerpc-change-the-memory-size-limit.patch \
>              file://0001-purgatory-Pass-r-directly-to-linker.patch \
>              file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
> +            file://kexec-ARM-fix-add_buffer_phys_virt-align-issue.patch =
\
>           "
>
>  SRC_URI[md5sum] =3D "10ddaae0e86af54407b164a1f5a39cc3"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

--94eb2c07035656d10d05456de35f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase and resent the patch please then?<div><br><=
/div><div>Cheers,</div><div>Ross</div></div><div class=3D"gmail_extra"><br>=
<div class=3D"gmail_quote">On 6 January 2017 at 02:40, Bai, Haiqing (Wind R=
iver) <span dir=3D"ltr">&lt;<a href=3D"mailto:haiqing.bai@windriver.com" ta=
rget=3D"_blank">haiqing.bai@windriver.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"m_-918250190295239798WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Hi, Ross:<u></u><u></u></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I clone the branch (</span>poky-contrib:ross/mut<span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1=
f497d">) and did=E2=80=99t find the fix
 in 2.0.14,=C2=A0 so this fix is still required.=C2=A0 Thanks<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=C2=A0<u></u></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">B,R<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d">Haiqing Bai<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Burton, =
Ross [mailto:<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>]
<br>
<b>Sent:</b> 2017</span><span lang=3D"ZH-CN" style=3D"font-size:10.0pt;font=
-family:=E5=AE=8B=E4=BD=93">=E5=B9=B4</span><span style=3D"font-size:10.0pt=
;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">1</span><span lang=
=3D"ZH-CN" style=3D"font-size:10.0pt;font-family:=E5=AE=8B=E4=BD=93">=E6=9C=
=88</span><span style=3D"font-size:10.0pt;font-family:&quot;Tahoma&quot;,&q=
uot;sans-serif&quot;">4</span><span lang=3D"ZH-CN" style=3D"font-size:10.0p=
t;font-family:=E5=AE=8B=E4=BD=93">=E6=97=A5</span><span style=3D"font-size:=
10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;">
 22:32<br>
<b>To:</b> Bai, Haiqing<br>
<b>Cc:</b> OE-core<br>
<b>Subject:</b> Re: [OE-core] [PATCH] kexec: ARM: fix align issue of add_bu=
ffer_phys_virt() for LPAE kernel.<u></u><u></u></span></p><div><div class=
=3D"h5">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">An upgrade to 2.0.14 was recently posted on the list=
 (and is now in poky-contrib:ross/mut), can you verify that this patch is s=
till required with that release and rebase?<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ross<u></u><u></u></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">On 3 January 2017 at 09:05, Haiqing Bai &lt;<a href=
=3D"mailto:Haiqing.Bai@windriver.com" target=3D"_blank">Haiqing.Bai@windriv=
er.com</a>&gt; wrote:<u></u><u></u></p>
<p class=3D"MsoNormal">If LPAE is enabled, 3 level page table is used and t=
he &#39;SECTION_SIZE&#39;<br>
is (1&lt;&lt;21), so add_buffer_phys_virt() should align to (1 &lt;&lt; 21)=
.<br>
<br>
Signed-off-by: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com"=
 target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
---<br>
=C2=A0...-ARM-fix-add_buffer_phys_<wbr>virt-align-issue.patch | 52 ++++++++=
++++++++++++++<br>
=C2=A0meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" ta=
rget=3D"_blank">kex<wbr>ec-tools_2.0.12.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 53 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-A=
RM-fix-add_<wbr>buffer_phys_virt-align-issue.<wbr>patch<br>
<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-ARM-fix-add_<=
wbr>buffer_phys_virt-align-issue.<wbr>patch b/meta/recipes-kernel/kexec/<wb=
r>kexec-tools/kexec-ARM-fix-add_<wbr>buffer_phys_virt-align-issue.<wbr>patc=
h<br>
new file mode 100644<br>
index 0000000..7d1f95e<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/kexec/<wbr>kexec-tools/kexec-ARM-fix-add_<wbr>buf=
fer_phys_virt-align-issue.<wbr>patch<br>
@@ -0,0 +1,52 @@<br>
+From 380019f68e19ac863cf32dc7ff6784<wbr>e8fe1d751f Mon Sep 17 00:00:00 200=
1<br>
+From: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com" target=
=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
+Date: Mon, 19 Dec 2016 14:52:02 +0800<br>
+Subject: [PATCH] kexec: ARM: Fix add_buffer_phys_virt() align issue.<br>
+<br>
+When &quot;CONFIG_ARM_LPAE&quot; is enabled,3 level page table<br>
+is used by MMU, the &quot;SECTION_SIZE&quot; is defined with<br>
+(1 &lt;&lt; 21), but &#39;add_buffer_phys_virt()&#39; hardcode this<br>
+to (1 &lt;&lt; 20).<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+<a href=3D"mailto:Suggested-By%3Afredrik.markstrom@gmail.com" target=3D"_b=
lank">Suggested-By:fredrik.<wbr>markstrom@gmail.com</a><br>
+Signed-off-by: Haiqing Bai &lt;<a href=3D"mailto:Haiqing.Bai@windriver.com=
" target=3D"_blank">Haiqing.Bai@windriver.com</a>&gt;<br>
+---<br>
+ kexec/arch/arm/crashdump-arm.c | 5 ++++-<br>
+ 1 file changed, 4 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/kexec/arch/arm/crashdump-<wbr>arm.c b/kexec/arch/arm/crashdum=
p-<wbr>arm.c<br>
+index 38a1401..e41b7fb 100644<br>
+--- a/kexec/arch/arm/crashdump-<wbr>arm.c<br>
++++ b/kexec/arch/arm/crashdump-<wbr>arm.c<br>
+@@ -271,6 +271,7 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0void *buf;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int last_ranges;<br>
++=C2=A0 =C2=A0 =C2=A0 unsigned short align_bit_shift =3D 20;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * First fetch all the memory (RAM) ranges that=
 we are going to pass to<br>
+@@ -295,6 +296,7 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* for support LPAE=
 enabled kernel*/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0elf_info.class =3D =
ELFCLASS64;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 align_bit_shift =3D 21;<=
br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D crash_creat=
e_elf64_headers(<wbr>info, &amp;elf_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usableme=
m_rgns.ranges,<br>
+@@ -315,8 +317,9 @@ int load_crashdump_segments(struct kexec_info *info, c=
har *mod_cmdline)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * 1MB) so that available memory passed in kern=
el command line will be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * aligned to 1MB. This is because kernel creat=
e_mapping() wants memory<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * regions to be aligned to SECTION_SIZE.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* The SECTION_SIZE of LPAE kernel is &#=
39;1UL &lt;&lt; 21&#39; defined in pgtable-3level.h<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+-=C2=A0 =C2=A0 =C2=A0 elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz=
, bufsz, 1 &lt;&lt; 20,<br>
++=C2=A0 =C2=A0 =C2=A0 elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz=
, bufsz, 1 &lt;&lt; align_bit_shift,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
ash_reserved_mem.start,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cr=
ash_reserved_mem.end, -1, 0);<br>
+<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12=
.bb" target=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a> b/meta/recipes-kernel=
/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" target=3D"_blank">ke<wbr>xe=
c-tools_2.0.12.bb</a><br>
index 59376c8..3e38923 100644<br>
--- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" ta=
rget=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a><br>
+++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.12.bb" ta=
rget=3D"_blank">ke<wbr>xec-tools_2.0.12.bb</a><br>
@@ -8,6 +8,7 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0002-powerpc-chan=
ge-<wbr>the-memory-size-limit.patch</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0001-purgatory-Pa=
ss-r-<wbr>directly-to-linker.patch</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a>file://0001-vmcore-dmesg=
-<wbr>Define-_GNU_SOURCE.patch</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a>
file://kexec-ARM-fix-add_<wbr>buffer_phys_virt-align-issue.<wbr>patch</a> \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>10ddaae0e86af54407b164a1f5a39c<wbr>c3&=
quot;<br>
<span class=3D"m_-918250190295239798hoenzb"><span style=3D"color:#888888">-=
-</span></span><span style=3D"color:#888888"><br>
<span class=3D"m_-918250190295239798hoenzb">1.9.1</span><br>
<br>
<span class=3D"m_-918250190295239798hoenzb">--</span><br>
<span class=3D"m_-918250190295239798hoenzb">______________________________<=
wbr>_________________</span><br>
<span class=3D"m_-918250190295239798hoenzb">Openembedded-core mailing list<=
/span><br>
<span class=3D"m_-918250190295239798hoenzb"><a href=3D"mailto:Openembedded-=
core@lists.openembedded.org" target=3D"_blank">Openembedded-core@lists.<wbr=
>openembedded.org</a></span><br>
<span class=3D"m_-918250190295239798hoenzb"><a href=3D"http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core" target=3D"_blank">http://list=
s.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a></span><=
/span><u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div></div></div>
</div>

</blockquote></div><br></div>

--94eb2c07035656d10d05456de35f--
