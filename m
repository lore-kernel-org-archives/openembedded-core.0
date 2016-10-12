Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5247017D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 21:42:15 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id f6so28831391qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ab5j/F95SBu1OUMnYbqGD3eCIjiftugskC2i8sr4zVc=;
	b=mJzVttYDjuo45IO/tvBorxt+HLdJpW+gsSI9mz9bpF/Wm5Cd7sTMBWjgEwMa9HgqIQ
	ONpQfewgYa3hlw8V+3rnZITWrnYx3O0CGNZLSTRIyKhCu0JGhyKb+vmieubSzxMnpYHz
	zcTwdtLI/QjdHRuRVBxqNpyI9eUnaJPcNsrkNtBscDY5xc5BxQUW0pvxviX1Gi4ta4mu
	8V0uitnFfyCH6v1VdId+pPtDY72LqpGOCz3+t6erCqz6OIdGiKw4rUagMiGKwBYZ9cqQ
	yRaWaTbtrT8OBYe1x7Pm7eJVqbmf7p0J1PAqNJDmw4gofDMU1ql2x6KH4OGqc6NDi8o6
	voyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ab5j/F95SBu1OUMnYbqGD3eCIjiftugskC2i8sr4zVc=;
	b=Gvb6T+AR4v1734tQafsID5M3qVqRFVUGItt35AnJefcI2ByL6YRh36LPjgFk5ZyU3U
	HQmQ5PYKvvRS/PILfoptR88lVZcX0JwpFUXNMF3xukM3kqF89E2oF5wrX24gSfqpMR6P
	mvS+2mmnjcJgiEvmvnZBXzBQ8N95KVFFHs00+v9/9eypv9ydvnvLuwh4yGJPp3Avd6cQ
	SKPOc0J4w6QVLPXXSwAxTLaUOmCoc16CCP1vaRDSd09JL24wwbCGYXQhTn1qYyHmMzNs
	Bp2C+W9W1ZaYs65aWZjp+BPULSlqHWYg/xJEYr52hhDq6gFXCLLlNyC6TK8UwSg8AJc4
	s0MA==
X-Gm-Message-State: AA6/9RmUSdAMI0IixUFdLqzIcwKVI+iz2wRA1lsXI960Iruqf2lb6lCKqmEAStoZX/tyqIz7UGf0G2wofwojEA==
X-Received: by 10.200.36.202 with SMTP id t10mr3567140qtt.85.1476308536984;
	Wed, 12 Oct 2016 14:42:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Wed, 12 Oct 2016 14:42:16 -0700 (PDT)
In-Reply-To: <731480a7-99a7-9da4-c4ee-f5638f8fbe2b@windriver.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
	<CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
	<3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA013A2F5C37@SAN-EXCH-DR.corp.ad.wrs.com>
	<731480a7-99a7-9da4-c4ee-f5638f8fbe2b@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Oct 2016 17:42:16 -0400
Message-ID: <CADkTA4Px7NMMyvC+Lfz+X92a7CC5vW=Z=dSaWBusEZNgj1b=7g@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-libc-headers: if_tunnel: remove include of if/ip/in6.h
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
X-List-Received-Date: Wed, 12 Oct 2016 21:42:16 -0000
Content-Type: multipart/alternative; boundary=001a113bf158ed1b87053eb1dd93

--001a113bf158ed1b87053eb1dd93
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2016 at 4:21 PM, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> On 2016-10-08 09:17 PM, Huang, Jie (Jackie) wrote:
>
>>
>>
>> -----Original Message-----
>>> From: MacLeod, Randy
>>> Sent: Friday, October 07, 2016 4:54 AM
>>> To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)
>>> Cc: Patches and discussions about the oe-core layer
>>> Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove
>>> include of if/ip/in6.h
>>>
>>> On 2016-10-03 08:27 PM, Bruce Ashfield wrote:
>>>
>>>>
>>>> It's something we could drop in the future, but these are mods that have
>>>> been done since -rc4, and could very well be undone if they start
>>>> breaking things like this.
>>>>
>>>> The alternative is to try and fix the userspace applications, but I
>>>> currently don't see a fast way to do that (and I'm now officially on
>>>> vacation).
>>>>
>>>>
>>> I've sent a fix to the net-tools list:
>>>
>>> https://sourceforge.net/p/net-tools/mailman/net-tools-devel/
>>> ?viewmonth=201610
>>>
>>> Jackie will be back at work on Saturday and he'll revert
>>> Bruce's change, test all qemu builds and boot an image
>>> to test iptunnel before sending a patch to the list.
>>>
>>
>> I just sent patches for this to the list.
>>
>> Thanks,
>> Jackie
>>
>
>
> Jackie,
>
> Thanks for fixing the net-tools bug. A fedora dev acked the patch
> on the SF list so hopefully it will be integrated upstream.
>
> Bruce, Khem
>
> What, if anything, should we do about the other yocto specific changes to
> linux-libc-headers:
>
>
Feel free to fix ppp in a similar way to the other change. It is likely a
header inclusion
order change.

I'm just doing the kernel header changes, I can't always detangle the user
space issues,
that's where others need to step in and help.

There's no issue in carrying it, since it isn't like we are developing
software that will
be incompatible through the change, or that will have ABI issues.

Bruce


> $ ls -1 meta/recipes-kernel/linux-libc-headers/linux-libc-headers
> 0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
> 0001-ppp-fix-in-if.h-includes.patch
> 0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
> 0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
>
> It seems like some of the patches (ppp) could be addressed and
> dropped and that we should do that before releasing oe-core-2.2
> or wait for 2.3.
>
> ../Randy
>
>
> $ git log meta/recipes-kernel/linux-libc-headers/linux-libc-headers/
> 0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
>
>
> commit 12451a412fb7b5706c1553618ee7b704234876cc
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Mon Oct 3 01:54:36 2016 -0400
>
>     linux-libc-headers: fix in/if.h includes
>
>     The following kernel commits broke the compilation of ppp, due to
> redefined
>     structures.
>
>     Nothing else breaks in userspace with or without these uapi changes,
> so we
>     revert them to keep everything building.
>
>        commit 05ee5de7451796cf9a8aeb2f05a57790d4fd2336
>        Author: Mikko Rapeli <mikko.rapeli@iki.fi>
>        Date:   Mon Aug 22 20:32:42 2016 +0200
>
>            include/uapi/linux/if_pppol2tp.h: include linux/in.h and
> linux/in6.h
>
>            Fixes userspace compilation errors like:
>
>            error: field <E2><80><98>addr<E2><80><99> has incomplete type
>             struct sockaddr_in addr; /* IP address and port to send to */
>                                ^
>            error: field <E2><80><98>addr<E2><80><99> has incomplete type
>             struct sockaddr_in6 addr; /* IP address and port to send to */
>
>            Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>
>            Signed-off-by: David S. Miller <davem@davemloft.net>
>
>
>
>
>
>
>>
>>> In oe-core-2.3, we should probably drop net-tools completely or
>>> at least from packagegroup-core-full-cmdline.bb since iproute2
>>> replaces it:
>>>    http://xmodulo.com/linux-tcpip-networking-net-tools-iproute2.html
>>>
>>> ( and I'm now officially on vacation for a few days. :) )
>>>
>>>
>>> --
>>> # Randy MacLeod. SMTS, Linux, Wind River
>>> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
>>> Canada, K2K 2W5
>>>
>>
>>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
> Canada, K2K 2W5
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113bf158ed1b87053eb1dd93
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Oct 12, 2016 at 4:21 PM, Randy MacLeod <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleo=
d@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On 2016-10-08 09:17 PM, Huang, Jie (Jackie) wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
-----Original Message-----<br>
From: MacLeod, Randy<br>
Sent: Friday, October 07, 2016 4:54 AM<br>
To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)<br>
Cc: Patches and discussions about the oe-core layer<br>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove includ=
e of if/ip/in6.h<br>
<br>
On 2016-10-03 08:27 PM, Bruce Ashfield wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
It&#39;s something we could drop in the future, but these are mods that hav=
e<br>
been done since -rc4, and could very well be undone if they start<br>
breaking things like this.<br>
<br>
The alternative is to try and fix the userspace applications, but I<br>
currently don&#39;t see a fast way to do that (and I&#39;m now officially o=
n<br>
vacation).<br>
<br>
</blockquote>
<br>
I&#39;ve sent a fix to the net-tools list:<br>
<br>
<a href=3D"https://sourceforge.net/p/net-tools/mailman/net-tools-devel/?vie=
wmonth=3D201610" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.n=
et/p/net-<wbr>tools/mailman/net-tools-devel/<wbr>?viewmonth=3D201610</a><br=
>
<br>
Jackie will be back at work on Saturday and he&#39;ll revert<br>
Bruce&#39;s change, test all qemu builds and boot an image<br>
to test iptunnel before sending a patch to the list.<br>
</blockquote>
<br>
I just sent patches for this to the list.<br>
<br>
Thanks,<br>
Jackie<br>
</blockquote>
<br>
<br></span>
Jackie,<br>
<br>
Thanks for fixing the net-tools bug. A fedora dev acked the patch<br>
on the SF list so hopefully it will be integrated upstream.<br>
<br>
Bruce, Khem<br>
<br>
What, if anything, should we do about the other yocto specific changes to l=
inux-libc-headers:<br>
<br></blockquote><div><br></div><div>Feel free to fix ppp in a similar way =
to the other change. It is likely a header inclusion</div><div>order change=
.</div><div><br></div><div>I&#39;m just doing the kernel header changes, I =
can&#39;t always detangle the user space issues,</div><div>that&#39;s where=
 others need to step in and help.</div><div><br></div><div>There&#39;s no i=
ssue in carrying it, since it isn&#39;t like we are developing software tha=
t will</div><div>be incompatible through the change, or that will have ABI =
issues.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
$ ls -1 meta/recipes-kernel/linux-libc<wbr>-headers/linux-libc-headers<br>
0001-libc-compat.h-fix-some-is<wbr>sues-arising-from-in6.h.patch<br>
0001-ppp-fix-in-if.h-includes.<wbr>patch<br>
0002-libc-compat.h-prevent-red<wbr>efinition-of-struct-ethhdr.pat<wbr>ch<br=
>
0003-remove-inclusion-of-sysin<wbr>fo.h-in-kernel.h.patch<br>
<br>
It seems like some of the patches (ppp) could be addressed and<br>
dropped and that we should do that before releasing oe-core-2.2<br>
or wait for 2.3.<br>
<br>
../Randy<br>
<br>
<br>
$ git log meta/recipes-kernel/linux-libc<wbr>-headers/linux-libc-headers/<w=
br>0001-libc-compat.h-fix-some-<wbr>issues-arising-from-in6.h.<wbr>patch<br=
>
<br>
<br>
commit 12451a412fb7b5706c1553618ee7b7<wbr>04234876cc<br>
Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com" =
target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;<br>
Date:=C2=A0 =C2=A0Mon Oct 3 01:54:36 2016 -0400<br>
<br>
=C2=A0 =C2=A0 linux-libc-headers: fix in/if.h includes<br>
<br>
=C2=A0 =C2=A0 The following kernel commits broke the compilation of ppp, du=
e to redefined<br>
=C2=A0 =C2=A0 structures.<br>
<br>
=C2=A0 =C2=A0 Nothing else breaks in userspace with or without these uapi c=
hanges, so we<br>
=C2=A0 =C2=A0 revert them to keep everything building.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0commit 05ee5de7451796cf9a8aeb2f05a577<wbr>90d4fd=
2336<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Mikko Rapeli &lt;<a href=3D"mailto:mikko=
.rapeli@iki.fi" target=3D"_blank">mikko.rapeli@iki.fi</a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0Date:=C2=A0 =C2=A0Mon Aug 22 20:32:42 2016 +0200=
<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/linux/if_pppol2t<wbr>=
p.h: include linux/in.h and linux/in6.h<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fixes userspace compilation errors=
 like:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error: field &lt;E2&gt;&lt;80&gt;&=
lt;98&gt;addr&lt;E2&gt;&lt;80&gt;&lt;99&gt; has incomplete type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_in addr; /* IP ad=
dress and port to send to */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error: field &lt;E2&gt;&lt;80&gt;&=
lt;98&gt;addr&lt;E2&gt;&lt;80&gt;&lt;99&gt; has incomplete type<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_in6 addr; /* IP a=
ddress and port to send to */<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Mikko Rapeli &lt;<a=
 href=3D"mailto:mikko.rapeli@iki.fi" target=3D"_blank">mikko.rapeli@iki.fi<=
/a>&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: David S. Miller &lt=
;<a href=3D"mailto:davem@davemloft.net" target=3D"_blank">davem@davemloft.n=
et</a>&gt;<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
In oe-core-2.3, we should probably drop net-tools completely or<br>
at least from <a href=3D"http://packagegroup-core-full-cmdline.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-core-full-cmdline<wbr>.bb</a> sin=
ce iproute2<br>
replaces it:<br>
=C2=A0 =C2=A0<a href=3D"http://xmodulo.com/linux-tcpip-networking-net-tools=
-iproute2.html" rel=3D"noreferrer" target=3D"_blank">http://xmodulo.com/lin=
ux-tcpi<wbr>p-networking-net-tools-iproute<wbr>2.html</a><br>
<br>
( and I&#39;m now officially on vacation for a few days. :) )<br>
<br>
<br>
--<br>
# Randy MacLeod. SMTS, Linux, Wind River<br>
Direct: <a href=3D"tel:613.963.1350" value=3D"+16139631350" target=3D"_blan=
k">613.963.1350</a> | 350 Terry Fox Drive, Suite 200, Ottawa, ON,<br>
Canada, K2K 2W5<br>
</blockquote>
<br>
</blockquote>
<br>
<br>
-- <br>
# Randy MacLeod. SMTS, Linux, Wind River<br>
Direct: <a href=3D"tel:613.963.1350" value=3D"+16139631350" target=3D"_blan=
k">613.963.1350</a> | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Canada, K=
2K 2W5<br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a113bf158ed1b87053eb1dd93--
