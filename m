Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by mail.openembedded.org (Postfix) with ESMTP id 02E57731D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 17:37:21 +0000 (UTC)
Received: by mail-vk0-f53.google.com with SMTP id k196so92772330vka.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 09:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Mn9OhDysAC/DY9UI/kvvtaxg9ckOnZufQ/hT+9rfQfg=;
	b=rvwvJk4TzHXmVtY7oI/qe4RhYdodOnqaqTJGnGM94qbGrTuUN959h3TD/LPBnH8eNx
	v6aBDyOY1XyU9kli+CzlNGNmVfjaUb/Z5E5kH9syAx+j4hI+NzTG+2Tql+1RGiFVnsd9
	kvb3H4aESSLHDftzlrCu/3M6qFWDBL38uQHtm9a3bO3ur56AeapsLyGDi6wIot/8a6mD
	m78zQwR+8aUZ8Ow1Q4eXcozXbKIKodJYy17+ybuLeASgO4f6YA+UtK1bREvVesPMwL1V
	7+zgxt+x2NTW8JhfDsKnrckdpx3dO5zEn9zZdpukZayeohsbjjLhb7fpSl/Jd91Su+nZ
	SdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Mn9OhDysAC/DY9UI/kvvtaxg9ckOnZufQ/hT+9rfQfg=;
	b=k3glw6cp39uCvDxLiUrLBPW0Yigv/Ebca/rvEDIwdfRYyZQ1PqBIHoYq2zCLeRKvmx
	mYAItT2RCDp13k4U48BKyySnWYSdp8MtjRY/zUybtitlADPpcH1+r7yLDe2+NL/m9/+s
	ldfu19qCKXV4FZV/U3NbyOnkWQTPj4cu+7pOPXmxQEXwyBZ7y/kOzW6O0bZUzhv1ASBJ
	XkkpWBuI6ECwxs8PHels1VYyaQKY9082C8Iq8ZqleQ9ygwGixSWZ6H9tE0fEPTozx/Cl
	li94VeHPsvtELk+nKG8Sh3//aIxxARQUw6dRD0xUj34jnsxyvZUrnb54ik3PCOuQZOjL
	9fCw==
X-Gm-Message-State: AG10YOSdX57B26Kx6xXBwunVMfOFNfESBZNKeL9h8wUpyflUCdOBVojpgT/LCbHUczQPiDwXm2NGNf2RNdyP/A==
MIME-Version: 1.0
X-Received: by 10.31.141.194 with SMTP id p185mr8996338vkd.57.1455471442096;
	Sun, 14 Feb 2016 09:37:22 -0800 (PST)
Received: by 10.176.0.50 with HTTP; Sun, 14 Feb 2016 09:37:22 -0800 (PST)
In-Reply-To: <1455441934.16142.376.camel@linuxfoundation.org>
References: <1455441934.16142.376.camel@linuxfoundation.org>
Date: Sun, 14 Feb 2016 12:37:22 -0500
Message-ID: <CADkTA4MgV64k0yjihZaGYDNJDUt+Kh3FAwLjy4ik0QKV4e=b5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Work around PAT issue on qemux86
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
X-List-Received-Date: Sun, 14 Feb 2016 17:37:22 -0000
Content-Type: multipart/alternative; boundary=001a114262144978ed052bbe5ab4

--001a114262144978ed052bbe5ab4
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 14, 2016 at 4:25 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> We have an issue with PAT handling on older processes with limited PAT
> bits,
> see the patch description for the full problem. This replaces the runqemu
> workaround with a kernel patch until we can get the kernel trees sorted
> out and discuss a proper fix with upstream. It should be safe everywhere
> so is applied unconditionally.
>

I could also merge this to the kernel tree directly, but since this is
designed to be
transient, patching it this way is fine with me as well.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git
> a/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch
> b/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch
> new file mode 100644
> index 0000000..367d9b4a
> --- /dev/null
> +++
> b/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patch
> @@ -0,0 +1,100 @@
> +From 9bfb2c711f66fc8eb6482f5ca6ea33c2ec1d792f Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Sat, 13 Feb 2016 17:36:23 +0000
> +Subject: [PATCH] Fix qemux86 pat issue
> +
> +on qemux86, X doesn't start and there is
> +a backtrace in the logs:
> +
> +x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem
> 0xfd000000-0xfdffffff], got write-combining
> +------------[ cut here ]------------
> +WARNING: CPU: 0 PID: 705 at
> /media/build1/poky/build/tmp/work-shared/qemux86/kernel-source/arch/x86/mm/pat.c:985
> untrack_pfn+0xaf/0xc0()
> +Modules linked in: uvesafb
> +CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1
> +Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.8.2-0-g33fbe13 by qemu-project.org 04/01/2014
> + 00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c
> + 00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000
> + 00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0
> +Call Trace:
> + [<c1397ab2>] dump_stack+0x4b/0x79
> + [<c1051477>] warn_slowpath_common+0x87/0xc0
> + [<c104b98f>] ? untrack_pfn+0xaf/0xc0
> + [<c104b98f>] ? untrack_pfn+0xaf/0xc0
> + [<c1051552>] warn_slowpath_null+0x22/0x30
> + [<c104b98f>] untrack_pfn+0xaf/0xc0
> + [<c104d54c>] ? kmap_atomic_prot+0x3c/0xf0
> + [<c114e17f>] unmap_single_vma+0x4ef/0x500
> + [<c114f007>] unmap_vmas+0x37/0x50
> + [<c1154f8f>] exit_mmap+0x5f/0xf0
> + [<c104eedd>] mmput+0x2d/0xb0
> + [<c105009c>] copy_process+0xd2c/0x13c0
> + [<c1050892>] _do_fork+0x82/0x340
> + [<c105f2d1>] ? SyS_rt_sigaction+0x51/0xa0
> + [<c1050c3c>] SyS_clone+0x2c/0x30
> + [<c1001a03>] do_syscall_32_irqs_on+0x53/0xb0
> + [<c189a94a>] entry_INT80_32+0x2a/0x2a
> +---[ end trace be3e0a61097feddc ]---
> +x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem
> 0xfd000000-0xfdffffff], got write-combining
> +
> +The entry in question is setup by uvesafb which in its
> +uvesafb_ioremap() function calls ioremap_wc().
> +
> +It appears that Xorg mmaps this from userspace, then later does a
> +fork() to execute a utility. At this point, when creating the vmas for
> +the new process, the pat code says "eeek!" as the protection mode for
> +the new vmas don't match the old one, returns -EINVAL, the process dies
> +and X goes with it.
> +
> +There are a few hammers we can hit this with, we can boot with "nopat"
> +option which makes the problem go away, or turn off CONFIG_X86_PAT. No
> +surprises there. Changing uvesafb to use mtrr=0 doesn't help since the
> +ioremap_wc call still happens.
> +
> +The real issue is the "expected mapping type uncached-minus for got
> +write-combining" message, it all goes wrong from there.
> +
> +Upon looking at the code and scratching my head for a long while, I
> +notice that there are two ways of representing the protection mode
> +data, "enum page_cache_mode" and "pgprot_t & _PAGE_CACHE_MASK".
> +
> +The exact meaning of pgprot_t depends on which CPU you're running,
> +older CPUs have errata meaning only a small number of bits can be used.
> +The exact mapping table is determined by __cachemode2pte_tbl and is
> +updated at boot by calls from update_cache_mode_entry().
> +
> +The result of this if you map enum -> pgprot_t, then try to do pgprot_t
> +-> enum, you can get different values since its not a 1:1 mapping.
> +
> +This means the comparison in reserve_pfn_range() where it does "pcm !=
> +want_pcm" isn't correct and can trigger even in cases where there isn't
> +a problem.
> +
> +This can be "fixed" by doing cachemode2protval(pcm) !=
> +cachemode2protval(want_pcm) and checking whether the protection bits
> +match, rather than the enum values, since in reality this is what we
> +really care about. With that change, X boots up just fine.
> +
> +We don't see this on qemux86-64 since that has more PAT bits working
> +and hence the values map correctly.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +---
> + arch/x86/mm/pat.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/arch/x86/mm/pat.c b/arch/x86/mm/pat.c
> +index 031782e..11064fb 100644
> +--- a/arch/x86/mm/pat.c
> ++++ b/arch/x86/mm/pat.c
> +@@ -833,7 +833,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long
> size, pgprot_t *vma_prot,
> +       if (ret)
> +               return ret;
> +
> +-      if (pcm != want_pcm) {
> ++      if (cachemode2protval(pcm) != cachemode2protval(want_pcm)) {
> +               if (strict_prot ||
> +                   !is_new_memtype_allowed(paddr, size, want_pcm, pcm)) {
> +                       free_memtype(paddr, paddr + size);
> +--
> +2.5.0
> +
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 1beeea6..c0edcf1 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -40,3 +40,5 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "" ,d)}"
> +
> +SRC_URI_append = " file://0001-Fix-qemux86-pat-issue.patch"
> diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
> index ad854d1..ebed2bd 100755
> --- a/scripts/runqemu-internal
> +++ b/scripts/runqemu-internal
> @@ -434,7 +434,7 @@ if [ "$MACHINE" = "qemux86" ]; then
>      fi
>      # Currently oprofile's event based interrupt mode doesn't work(Bug
> #828) in
>      # qemux86 and qemux86-64. We can use timer interrupt mode for now.
> -    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1 nopat"
> +    KERNCMDLINE="$KERNCMDLINE oprofile.timer=1"
>  fi
>
>  if [ "$MACHINE" = "qemux86-64" ]; then
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114262144978ed052bbe5ab4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Feb 14, 2016 at 4:25 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">We have an issue with PAT handling on older processes with li=
mited PAT bits,<br>
see the patch description for the full problem. This replaces the runqemu<b=
r>
workaround with a kernel patch until we can get the kernel trees sorted<br>
out and discuss a proper fix with upstream. It should be safe everywhere<br=
>
so is applied unconditionally.<br></blockquote><div><br></div><div>I could =
also merge this to the kernel tree directly, but since this is designed to =
be</div><div>transient, patching it this way is fine with me as well.</div>=
<div><br></div><div>Acked-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.as=
hfield@windriver.com">bruce.ashfield@windriver.com</a>&gt;</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-iss=
ue.patch b/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue=
.patch<br>
new file mode 100644<br>
index 0000000..367d9b4a<br>
--- /dev/null<br>
+++ b/meta/recipes-kernel/linux/linux-yocto/0001-Fix-qemux86-pat-issue.patc=
h<br>
@@ -0,0 +1,100 @@<br>
+From 9bfb2c711f66fc8eb6482f5ca6ea33c2ec1d792f Mon Sep 17 00:00:00 2001<br>
+From: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.=
org">richard.purdie@linuxfoundation.org</a>&gt;<br>
+Date: Sat, 13 Feb 2016 17:36:23 +0000<br>
+Subject: [PATCH] Fix qemux86 pat issue<br>
+<br>
+on qemux86, X doesn&#39;t start and there is<br>
+a backtrace in the logs:<br>
+<br>
+x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0x=
fd000000-0xfdffffff], got write-combining<br>
+------------[ cut here ]------------<br>
+WARNING: CPU: 0 PID: 705 at /media/build1/poky/build/tmp/work-shared/qemux=
86/kernel-source/arch/x86/mm/pat.c:985 untrack_pfn+0xaf/0xc0()<br>
+Modules linked in: uvesafb<br>
+CPU: 0 PID: 705 Comm: Xorg Not tainted 4.4.1-yocto-standard #1<br>
+Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.8.2-0-g3=
3fbe13 by <a href=3D"http://qemu-project.org" rel=3D"noreferrer" target=3D"=
_blank">qemu-project.org</a> 04/01/2014<br>
+ 00000000 00000000 cf14dd78 c1397ab2 00000000 cf14dda8 c1051477 c1aa4f6c<b=
r>
+ 00000000 000002c1 c1a9fa4c 000003d9 c104b98f c104b98f cf244000 b6355000<b=
r>
+ 00000000 cf14ddb8 c1051552 00000009 00000000 cf14dde0 c104b98f cf14ddd0<b=
r>
+Call Trace:<br>
+ [&lt;c1397ab2&gt;] dump_stack+0x4b/0x79<br>
+ [&lt;c1051477&gt;] warn_slowpath_common+0x87/0xc0<br>
+ [&lt;c104b98f&gt;] ? untrack_pfn+0xaf/0xc0<br>
+ [&lt;c104b98f&gt;] ? untrack_pfn+0xaf/0xc0<br>
+ [&lt;c1051552&gt;] warn_slowpath_null+0x22/0x30<br>
+ [&lt;c104b98f&gt;] untrack_pfn+0xaf/0xc0<br>
+ [&lt;c104d54c&gt;] ? kmap_atomic_prot+0x3c/0xf0<br>
+ [&lt;c114e17f&gt;] unmap_single_vma+0x4ef/0x500<br>
+ [&lt;c114f007&gt;] unmap_vmas+0x37/0x50<br>
+ [&lt;c1154f8f&gt;] exit_mmap+0x5f/0xf0<br>
+ [&lt;c104eedd&gt;] mmput+0x2d/0xb0<br>
+ [&lt;c105009c&gt;] copy_process+0xd2c/0x13c0<br>
+ [&lt;c1050892&gt;] _do_fork+0x82/0x340<br>
+ [&lt;c105f2d1&gt;] ? SyS_rt_sigaction+0x51/0xa0<br>
+ [&lt;c1050c3c&gt;] SyS_clone+0x2c/0x30<br>
+ [&lt;c1001a03&gt;] do_syscall_32_irqs_on+0x53/0xb0<br>
+ [&lt;c189a94a&gt;] entry_INT80_32+0x2a/0x2a<br>
+---[ end trace be3e0a61097feddc ]---<br>
+x86/PAT: Xorg:705 map pfn expected mapping type uncached-minus for [mem 0x=
fd000000-0xfdffffff], got write-combining<br>
+<br>
+The entry in question is setup by uvesafb which in its<br>
+uvesafb_ioremap() function calls ioremap_wc().<br>
+<br>
+It appears that Xorg mmaps this from userspace, then later does a<br>
+fork() to execute a utility. At this point, when creating the vmas for<br>
+the new process, the pat code says &quot;eeek!&quot; as the protection mod=
e for<br>
+the new vmas don&#39;t match the old one, returns -EINVAL, the process die=
s<br>
+and X goes with it.<br>
+<br>
+There are a few hammers we can hit this with, we can boot with &quot;nopat=
&quot;<br>
+option which makes the problem go away, or turn off CONFIG_X86_PAT. No<br>
+surprises there. Changing uvesafb to use mtrr=3D0 doesn&#39;t help since t=
he<br>
+ioremap_wc call still happens.<br>
+<br>
+The real issue is the &quot;expected mapping type uncached-minus for got<b=
r>
+write-combining&quot; message, it all goes wrong from there.<br>
+<br>
+Upon looking at the code and scratching my head for a long while, I<br>
+notice that there are two ways of representing the protection mode<br>
+data, &quot;enum page_cache_mode&quot; and &quot;pgprot_t &amp; _PAGE_CACH=
E_MASK&quot;.<br>
+<br>
+The exact meaning of pgprot_t depends on which CPU you&#39;re running,<br>
+older CPUs have errata meaning only a small number of bits can be used.<br=
>
+The exact mapping table is determined by __cachemode2pte_tbl and is<br>
+updated at boot by calls from update_cache_mode_entry().<br>
+<br>
+The result of this if you map enum -&gt; pgprot_t, then try to do pgprot_t=
<br>
+-&gt; enum, you can get different values since its not a 1:1 mapping.<br>
+<br>
+This means the comparison in reserve_pfn_range() where it does &quot;pcm !=
=3D<br>
+want_pcm&quot; isn&#39;t correct and can trigger even in cases where there=
 isn&#39;t<br>
+a problem.<br>
+<br>
+This can be &quot;fixed&quot; by doing cachemode2protval(pcm) !=3D<br>
+cachemode2protval(want_pcm) and checking whether the protection bits<br>
+match, rather than the enum values, since in reality this is what we<br>
+really care about. With that change, X boots up just fine.<br>
+<br>
+We don&#39;t see this on qemux86-64 since that has more PAT bits working<b=
r>
+and hence the values map correctly.<br>
+<br>
+Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
+---<br>
+ arch/x86/mm/pat.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/arch/x86/mm/pat.c b/arch/x86/mm/pat.c<br>
+index 031782e..11064fb 100644<br>
+--- a/arch/x86/mm/pat.c<br>
++++ b/arch/x86/mm/pat.c<br>
+@@ -833,7 +833,7 @@ static int reserve_pfn_range(u64 paddr, unsigned long =
size, pgprot_t *vma_prot,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+<br>
+-=C2=A0 =C2=A0 =C2=A0 if (pcm !=3D want_pcm) {<br>
++=C2=A0 =C2=A0 =C2=A0 if (cachemode2protval(pcm) !=3D cachemode2protval(wa=
nt_pcm)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (strict_prot ||<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_n=
ew_memtype_allowed(paddr, size, want_pcm, pcm)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0free_memtype(paddr, paddr + size);<br>
+--<br>
+2.5.0<br>
+<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.4.bb</a><br>
index 1beeea6..c0edcf1 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
@@ -40,3 +40,5 @@ KERNEL_FEATURES_append_qemuall=3D&quot; cfg/virtio.scc&qu=
ot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg/paravirt_kv=
m.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
+<br>
+SRC_URI_append =3D &quot; file://0001-Fix-qemux86-pat-issue.patch&quot;<br=
>
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal<br>
index ad854d1..ebed2bd 100755<br>
--- a/scripts/runqemu-internal<br>
+++ b/scripts/runqemu-internal<br>
@@ -434,7 +434,7 @@ if [ &quot;$MACHINE&quot; =3D &quot;qemux86&quot; ]; th=
en<br>
=C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0# Currently oprofile&#39;s event based interrupt mode d=
oesn&#39;t work(Bug #828) in<br>
=C2=A0 =C2=A0 =C2=A0# qemux86 and qemux86-64. We can use timer interrupt mo=
de for now.<br>
-=C2=A0 =C2=A0 KERNCMDLINE=3D&quot;$KERNCMDLINE oprofile.timer=3D1 nopat&qu=
ot;<br>
+=C2=A0 =C2=A0 KERNCMDLINE=3D&quot;$KERNCMDLINE oprofile.timer=3D1&quot;<br=
>
=C2=A0fi<br>
<br>
=C2=A0if [ &quot;$MACHINE&quot; =3D &quot;qemux86-64&quot; ]; then<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114262144978ed052bbe5ab4--
