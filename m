Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id E9259719C2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 15:57:21 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j129so10218096qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x8FHKbX5j1pbWI0X4NMNJGrybQw/qadDgyekmpatbi0=;
	b=v0Pm/DF7PMowUgsuqCQTpajNDOiJRc4/9QKcnjuNZtq3geciPLmk8fOkkxvxu1wGcq
	Wn9lbHpqgEBU23xSESlRhqf2qYgVWKEmhiYK7/QQqxcjqcjtL3k2phKqmo9OX7i966m6
	6vHV1Ijm2fn6agJvQU1XqSFBDIo6rSCWfMAERO5YKx6bnkvB07MM3KmXybYn1ZmD8z0f
	joGuypQ4cEgWKJwP1Mz+ECBtqmJVt/niXcqvEEMlOruSo4EojEeEch5ubtdqpeH98kTq
	tx8A0dB4oi2fVNJfMMvBty0vlPSylIqb3Adbg9eXxjH4Crh5qhmFjgPSlAM92PruDYDT
	NOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x8FHKbX5j1pbWI0X4NMNJGrybQw/qadDgyekmpatbi0=;
	b=PVbfyLmKuEcWh6ZV7p8xa9NXCwhlzuu03xqIonxNN/+RKmmb6W9GERFd3hqk7P8Xjq
	YO9+Zj/nL/PoI+89rZVq/TsvYJuk3Mh8fTOVAPw01xEVRUjVYyhRUorLfVdbYPt56Q9J
	hJiShCKBc9lsUFI75tF/HSzyg0JWwDYz52OR5dSLE5bewp6HUZfVvRix8qVjCjm1uemN
	re4fRdn4lv7zbwHHtZjnk6x1xMCwjWgCUKRA30nj2IFdorG8c3eYSXt5Ke3mNtF4jIXY
	0trBn5njHbLCZBHak9n75A6ecccOC/aCDZHo1HKBdDaW2m+N558/Qv2LTtTR9AG/2FVj
	XHww==
X-Gm-Message-State: AA6/9Rmz4jiRP5xywSKkHqvYkl7lyF4oQuVI9Ur3pz/W3/Rj3mkzmGJwkAk3gAr24SEYa/KssU5acIWJc9MuTQ==
X-Received: by 10.55.164.195 with SMTP id n186mr21708701qke.197.1475510242944; 
	Mon, 03 Oct 2016 08:57:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 3 Oct 2016 08:57:22 -0700 (PDT)
In-Reply-To: <d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Oct 2016 11:57:22 -0400
Message-ID: <CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] linux-yocto: consolidated (and hopefully final) pull request
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
X-List-Received-Date: Mon, 03 Oct 2016 15:57:23 -0000
Content-Type: multipart/alternative; boundary=001a114fbd60e4afee053df7ffdc

--001a114fbd60e4afee053df7ffdc
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 11:51 AM, Bruce Ashfield <
bruce.ashfield@windriver.com> wrote:

> On 2016-10-03 11:45 AM, Burton, Ross wrote:
>
>>
>> On 3 October 2016 at 06:54, Bruce Ashfield <bruce.ashfield@windriver.com
>> <mailto:bruce.ashfield@windriver.com>> wrote:
>>
>>     The big thing to note about this update .. is that the libc-headers
>> bump
>>     to the 4.8 final tarball picked up some uapi headers that broke the
>>     build
>>     of ppp. I never would have thought it was possible, but it happened.
>>
>>
>> | In file included from
>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>> lude/linux/if_tunnel.h:6:0,
>> |                  from iptunnel.c:39:
>> |
>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>> lude/linux/ip.h:85:8:
>> error: redefinition of 'struct iphdr'
>> |  struct iphdr {
>> |         ^~~~~
>> | In file included from iptunnel.c:29:0:
>> |
>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>> lude/netinet/ip.h:44:8:
>> note: originally defined here
>> |  struct iphdr
>> |         ^~~~~
>> | <builtin>: recipe for target 'iptunnel.o' failed
>> | make: *** [iptunnel.o] Error 1
>> | ERROR: Function failed: do_compile (log file is located at
>> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/net-to
>> ols/1.60-26-r0/temp/log.do_compile.27643)
>>
>> Looks like net-tools is broken by something else too.
>>
>
> I'm out of the office in about one hour. So someone else is
> going to have to pick up the libc-headers fix.
>


Switching to my gmail, so I can follow along.

I do have about a half hour now, I'll check the net uapi code in the kernel
and see
if there's another fixup I can do.

These errors have been lurking for about the last year, the answer from the
kernel
folks is typically "change the order of your includes".

So there are two routes to fix it. See if there's a newer userspace with
the includes
changed, or do what I did, take the change out of libc-headers.

I'll check to see if I can do the latter here.

Out of curiosity, what image type is this ?  built core-image-sato,
kernel-dev for
x86-64 and they all worked.

Bruce


>
> Cheers,
>
> Bruce
>
>
>> Ross
>>
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

--001a114fbd60e4afee053df7ffdc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 3, 2016 at 11:51 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashf=
ield@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On 2016-10-03 11:45 AM, Burton, Ross wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
On 3 October 2016 at 06:54, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashf=
ield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br><=
/span><span class=3D"">
&lt;mailto:<a href=3D"mailto:bruce.ashfield@windriver.com" target=3D"_blank=
">bruce.ashfield@windriv<wbr>er.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 The big thing to note about this update .. is that the libc-h=
eaders bump<br>
=C2=A0 =C2=A0 to the 4.8 final tarball picked up some uapi headers that bro=
ke the<br>
=C2=A0 =C2=A0 build<br>
=C2=A0 =C2=A0 of ppp. I never would have thought it was possible, but it ha=
ppened.<br>
<br>
<br>
| In file included from<br>
/data/poky-master/tmp-glibc/sy<wbr>sroots/intel-corei7-64/usr/inc<wbr>lude/=
linux/if_tunnel.h:6:0,<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from iptunn=
el.c:39:<br>
|<br>
/data/poky-master/tmp-glibc/sy<wbr>sroots/intel-corei7-64/usr/inc<wbr>lude/=
linux/ip.h:85:8:<br>
error: redefinition of &#39;struct iphdr&#39;<br>
|=C2=A0 struct iphdr {<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
| In file included from iptunnel.c:29:0:<br>
|<br>
/data/poky-master/tmp-glibc/sy<wbr>sroots/intel-corei7-64/usr/inc<wbr>lude/=
netinet/ip.h:44:8:<br>
note: originally defined here<br>
|=C2=A0 struct iphdr<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~<br>
| &lt;builtin&gt;: recipe for target &#39;iptunnel.o&#39; failed<br>
| make: *** [iptunnel.o] Error 1<br>
| ERROR: Function failed: do_compile (log file is located at<br>
/data/poky-master/tmp-glibc/wo<wbr>rk/corei7-64-poky-linux/net-to<wbr>ols/1=
.60-26-r0/temp/log.do_com<wbr>pile.27643)<br>
<br>
Looks like net-tools is broken by something else too.<br>
</span></blockquote>
<br>
I&#39;m out of the office in about one hour. So someone else is<br>
going to have to pick up the libc-headers fix.<br></blockquote><div><br></d=
iv><div><br></div><div>Switching to my gmail, so I can follow along.</div><=
div><br></div><div>I do have about a half hour now, I&#39;ll check the net =
uapi code in the kernel and see</div><div>if there&#39;s another fixup I ca=
n do.</div><div><br></div><div>These errors have been lurking for about the=
 last year, the answer from the kernel</div><div>folks is typically &quot;c=
hange the order of your includes&quot;.</div><div><br></div><div>So there a=
re two routes to fix it. See if there&#39;s a newer userspace with the incl=
udes</div><div>changed, or do what I did, take the change out of libc-heade=
rs.</div><div><br></div><div>I&#39;ll check to see if I can do the latter h=
ere.</div><div><br></div><div>Out of curiosity, what image type is this ? =
=C2=A0built core-image-sato, kernel-dev for</div><div>x86-64 and they all w=
orked.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
Ross<br>
</blockquote><div class=3D"HOEnZb"><div class=3D"h5">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a114fbd60e4afee053df7ffdc--
