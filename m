Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id D942462133
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 21:27:47 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b186so2646906vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 14:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zFra8ORWoMgiru0/ViKj+gYyO/UK85i3r/DQ/fVD1wA=;
	b=AeknHjZVt8MAThYNGfvsLmRtjcGVgOso671DNClgGowT4620PNejSNDVhuFcjJPdPw
	1ku96VgKXpOYJErYGzkEYIPlR76SllRVdn2JZl3gq/85Xui40wgtIBYe27ayJPyJNLJn
	gK6iMNy5Na1aCX9rAnKpyxmIWf0v4vIrdUn80uApSrAyFSaxM5y03UXBG/kN3Y/ni+g+
	/U2zxo/zcjSNqKmVEX293gUAyPMpaTJfds21HSg6HFJlDPMDVKydQFFCufWYmHFExksL
	jXlAXwo0ad+sWq4lHBYNmKiBZKLUfYmQzz5quAwXicrO26/VTjWATrCCmIKH4610nzvx
	o4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zFra8ORWoMgiru0/ViKj+gYyO/UK85i3r/DQ/fVD1wA=;
	b=jdEt19RKIzQcUOsYXtdOdFv09GkDa9n2IopG/nCUiwyr0GMMQLife1di6KOon5oW3N
	3gRWj/r5dsHhKrngxhTuOF+PRTm7BNcxyx4FBG+J1TlDa4hKU5gQFNtksye1Sd/MLYzs
	K++chmqFBHme5XdsyO6a7n7I7MDWZnjnGTxscIw+FkZhz+RqfVYUUYySkblu34683dbZ
	856j5+XUo8ZBg2XGvQ9gWFShqvckEvE1Wobe6c3KVerpchuPuMxZTQq6eflFn7m4jsGW
	Ezu27tlRv/n2nFUuLVdFE70pnGpWJXYt4lSzhtv03L7vC+33CphGqOHh+DK2z0e8v1Jl
	ryvw==
X-Gm-Message-State: AA6/9RkIluMQ8XukL6QHg1fQJUBFS3XOC7QNpuukc7tOha/47Lw8kbhNaGhHNI+gkTkgPSQ943hVflQtzf2i2A==
X-Received: by 10.31.15.207 with SMTP id 198mr1766110vkp.93.1476307668453;
	Wed, 12 Oct 2016 14:27:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Wed, 12 Oct 2016 14:27:47 -0700 (PDT)
Received: by 10.176.86.206 with HTTP; Wed, 12 Oct 2016 14:27:47 -0700 (PDT)
In-Reply-To: <731480a7-99a7-9da4-c4ee-f5638f8fbe2b@windriver.com>
References: <1475513685-18627-1-git-send-email-bruce.ashfield@windriver.com>
	<CAMKF1soRbsU8iV35jxKnRfrcvsobF20p_u14EfRZ5uee_9N+gg@mail.gmail.com>
	<CAMKF1src3Dj1p+E5p+6QEu213dkFSFMOtDKx3hoJFT+hKvHn9Q@mail.gmail.com>
	<CAMKF1soOP+440ZhymX8wFHu-Et=77NhscQqm4M8T2i=wQhmGNg@mail.gmail.com>
	<CADkTA4NT6ynC61Pd_qRhwL8phc3Wzx0kXw=bzaDUAa8Or485ng@mail.gmail.com>
	<3ea3b10b-1072-0d3a-8e6b-be082214e5d1@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AA013A2F5C37@SAN-EXCH-DR.corp.ad.wrs.com>
	<731480a7-99a7-9da4-c4ee-f5638f8fbe2b@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2016 23:27:47 +0200
Message-ID: <CAMKF1sozuT+ktieY2MCEcd_TJa19Ei7qTwwT3qCuUr41dAO7rg@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 21:27:48 -0000
Content-Type: multipart/alternative; boundary=001a1143a6b4284eb9053eb1aaed

--001a1143a6b4284eb9053eb1aaed
Content-Type: text/plain; charset=UTF-8

On Oct 12, 2016 10:21 PM, "Randy MacLeod" <randy.macleod@windriver.com>
wrote:
>
> On 2016-10-08 09:17 PM, Huang, Jie (Jackie) wrote:
>>
>>
>>
>>> -----Original Message-----
>>> From: MacLeod, Randy
>>> Sent: Friday, October 07, 2016 4:54 AM
>>> To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)
>>> Cc: Patches and discussions about the oe-core layer
>>> Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: remove
include of if/ip/in6.h
>>>
>>> On 2016-10-03 08:27 PM, Bruce Ashfield wrote:
>>>>
>>>>
>>>> It's something we could drop in the future, but these are mods that
have
>>>> been done since -rc4, and could very well be undone if they start
>>>> breaking things like this.
>>>>
>>>> The alternative is to try and fix the userspace applications, but I
>>>> currently don't see a fast way to do that (and I'm now officially on
>>>> vacation).
>>>>
>>>
>>> I've sent a fix to the net-tools list:
>>>
>>>
https://sourceforge.net/p/net-tools/mailman/net-tools-devel/?viewmonth=201610
>>>
>>> Jackie will be back at work on Saturday and he'll revert
>>> Bruce's change, test all qemu builds and boot an image
>>> to test iptunnel before sending a patch to the list.
>>
>>
>> I just sent patches for this to the list.
>>
>> Thanks,
>> Jackie
>
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
linux-libc-headers:
>
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

Imo if we can fix apps that should be first choice. Second choice would be
run remaining patches by lkml or atleast report the problem. Real lesson is
to not wait for kernel version updates so late in release cycle.

> ../Randy
>
>
> $ git log
meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
>
>
> commit 12451a412fb7b5706c1553618ee7b704234876cc
> Author: Bruce Ashfield <bruce.ashfield@windriver.com>
> Date:   Mon Oct 3 01:54:36 2016 -0400
>
>     linux-libc-headers: fix in/if.h includes
>
>     The following kernel commits broke the compilation of ppp, due to
redefined
>     structures.
>
>     Nothing else breaks in userspace with or without these uapi changes,
so we
>     revert them to keep everything building.
>
>        commit 05ee5de7451796cf9a8aeb2f05a57790d4fd2336
>        Author: Mikko Rapeli <mikko.rapeli@iki.fi>
>        Date:   Mon Aug 22 20:32:42 2016 +0200
>
>            include/uapi/linux/if_pppol2tp.h: include linux/in.h and
linux/in6.h
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
>>
>>>
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
>>
>>
>
>
> --
> # Randy MacLeod. SMTS, Linux, Wind River
> Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON,
Canada, K2K 2W5

--001a1143a6b4284eb9053eb1aaed
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"></p>
<p dir=3D"ltr">On Oct 12, 2016 10:21 PM, &quot;Randy MacLeod&quot; &lt;<a h=
ref=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; On 2016-10-08 09:17 PM, Huang, Jie (Jackie) wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; -----Original Message-----<br>
&gt;&gt;&gt; From: MacLeod, Randy<br>
&gt;&gt;&gt; Sent: Friday, October 07, 2016 4:54 AM<br>
&gt;&gt;&gt; To: Bruce Ashfield; Khem Raj; Huang, Jie (Jackie)<br>
&gt;&gt;&gt; Cc: Patches and discussions about the oe-core layer<br>
&gt;&gt;&gt; Subject: Re: [OE-core] [PATCH] linux-libc-headers: if_tunnel: =
remove include of if/ip/in6.h<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 2016-10-03 08:27 PM, Bruce Ashfield wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It&#39;s something we could drop in the future, but these =
are mods that have<br>
&gt;&gt;&gt;&gt; been done since -rc4, and could very well be undone if the=
y start<br>
&gt;&gt;&gt;&gt; breaking things like this.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; The alternative is to try and fix the userspace applicatio=
ns, but I<br>
&gt;&gt;&gt;&gt; currently don&#39;t see a fast way to do that (and I&#39;m=
 now officially on<br>
&gt;&gt;&gt;&gt; vacation).<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ve sent a fix to the net-tools list:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://sourceforge.net/p/net-tools/mailman/net-too=
ls-devel/?viewmonth=3D201610">https://sourceforge.net/p/net-tools/mailman/n=
et-tools-devel/?viewmonth=3D201610</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Jackie will be back at work on Saturday and he&#39;ll revert<b=
r>
&gt;&gt;&gt; Bruce&#39;s change, test all qemu builds and boot an image<br>
&gt;&gt;&gt; to test iptunnel before sending a patch to the list.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I just sent patches for this to the list.<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt; Jackie<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Jackie,<br>
&gt;<br>
&gt; Thanks for fixing the net-tools bug. A fedora dev acked the patch<br>
&gt; on the SF list so hopefully it will be integrated upstream.<br>
&gt;<br>
&gt; Bruce, Khem<br>
&gt;<br>
&gt; What, if anything, should we do about the other yocto specific changes=
 to linux-libc-headers:<br>
&gt;<br>
&gt; $ ls -1 meta/recipes-kernel/linux-libc-headers/linux-libc-headers<br>
&gt; 0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch<br>
&gt; 0001-ppp-fix-in-if.h-includes.patch<br>
&gt; 0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch<br>
&gt; 0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch<br>
&gt;<br>
&gt; It seems like some of the patches (ppp) could be addressed and<br>
&gt; dropped and that we should do that before releasing oe-core-2.2<br>
&gt; or wait for 2.3.<br>
&gt;</p>
<p dir=3D"ltr">Imo if we can fix apps that should be first choice. Second c=
hoice would be run remaining patches by lkml or atleast report the problem.=
 Real lesson is to not wait for kernel version updates so late in release c=
ycle.</p>
<p dir=3D"ltr">&gt; ../Randy<br>
&gt;<br>
&gt;<br>
&gt; $ git log meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-libc-compat.h-fix-some-issues-arising-from-in6.h.patch<br>
&gt;<br>
&gt;<br>
&gt; commit 12451a412fb7b5706c1553618ee7b704234876cc<br>
&gt; Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.=
com">bruce.ashfield@windriver.com</a>&gt;<br>
&gt; Date:=C2=A0 =C2=A0Mon Oct 3 01:54:36 2016 -0400<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 linux-libc-headers: fix in/if.h includes<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 The following kernel commits broke the compilation of pp=
p, due to redefined<br>
&gt; =C2=A0 =C2=A0 structures.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 Nothing else breaks in userspace with or without these u=
api changes, so we<br>
&gt; =C2=A0 =C2=A0 revert them to keep everything building.<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0commit 05ee5de7451796cf9a8aeb2f05a57790d4fd=
2336<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Author: Mikko Rapeli &lt;<a href=3D"mailto:=
mikko.rapeli@iki.fi">mikko.rapeli@iki.fi</a>&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0Date:=C2=A0 =C2=A0Mon Aug 22 20:32:42 2016 =
+0200<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/linux/if_pppol2t=
p.h: include linux/in.h and linux/in6.h<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Fixes userspace compilation e=
rrors like:<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error: field &lt;E2&gt;&lt;80=
&gt;&lt;98&gt;addr&lt;E2&gt;&lt;80&gt;&lt;99&gt; has incomplete type<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_in addr; /* =
IP address and port to send to */<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error: field &lt;E2&gt;&lt;80=
&gt;&lt;98&gt;addr&lt;E2&gt;&lt;80&gt;&lt;99&gt; has incomplete type<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct sockaddr_in6 addr; /*=
 IP address and port to send to */<br>
&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: Mikko Rapeli &=
lt;<a href=3D"mailto:mikko.rapeli@iki.fi">mikko.rapeli@iki.fi</a>&gt;<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Signed-off-by: David S. Mille=
r &lt;<a href=3D"mailto:davem@davemloft.net">davem@davemloft.net</a>&gt;<br=
>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In oe-core-2.3, we should probably drop net-tools completely o=
r<br>
&gt;&gt;&gt; at least from <a href=3D"http://packagegroup-core-full-cmdline=
.bb">packagegroup-core-full-cmdline.bb</a> since iproute2<br>
&gt;&gt;&gt; replaces it:<br>
&gt;&gt;&gt; =C2=A0 =C2=A0<a href=3D"http://xmodulo.com/linux-tcpip-network=
ing-net-tools-iproute2.html">http://xmodulo.com/linux-tcpip-networking-net-=
tools-iproute2.html</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ( and I&#39;m now officially on vacation for a few days. :) )<=
br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; # Randy MacLeod. SMTS, Linux, Wind River<br>
&gt;&gt;&gt; Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa,=
 ON,<br>
&gt;&gt;&gt; Canada, K2K 2W5<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; -- <br>
&gt; # Randy MacLeod. SMTS, Linux, Wind River<br>
&gt; Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, Can=
ada, K2K 2W5<br></p>

--001a1143a6b4284eb9053eb1aaed--
