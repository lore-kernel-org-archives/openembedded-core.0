Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 749F36093D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 16:02:50 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id z190so322621qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2016 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=w2ezIRqHiJ8RHCzQ0666vI8R51pdT85zKdRzyztJGGw=;
	b=Z06VErE6jKqqFg2naRQTRt+WqotiJxyd/a5H/sL4PRp9rFXb2Hpj8MnJZTdacBGZeB
	7UWW2thtiTgrVMDT2whpI6FlPt5Znh9ag/JeIF57kAosDayY2s2YtJ3n3k7TjNVM1y77
	z4RGVQl0k8BZkO8dkW9OEcwJUyevI75rSe0FBQdtjZhdNyJRGUfiECzUBk7HJOibIFSU
	fMgsfgw91U+Yuxwgrz/x+NeL1yYh3hZ82aITGdfatIO/Fl0fop26c5E4JF4mTPrnMMCh
	derZzG2UkRQiA4i1njcZ0J9YDAozDHlW5BXQIb12/JBj8ILHxDrKMa4po3q5N8WtDd5v
	6lYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=w2ezIRqHiJ8RHCzQ0666vI8R51pdT85zKdRzyztJGGw=;
	b=TsPFqTQMlEjcJJn3qQNWuRZl3IFKCYOGk/PvogQuyWCY+TqygkT7Fd1UErWQ5QNKSa
	zB1OZRkWPBOuMHyPvdqXmL5GCNGnjZsBQ2OaLQ0RaxtfmaZoNwrPOScqXcYzYO07ZvRr
	rXNUY/41t0EE+A4jfRzoQC+akfQmIXGxmSANBT3T9s/V1dMfY0+C7mRjXBkiUR0JFizR
	fExOu+IuET1ZLB/Bg0iUo6VwlKBU4gadPVtYENdBWq9iZl1JfNPNIzw9xYNiUTMoCioU
	uKGa2HB5APmquCLi2Ny0h2u1oh04z9OTIwRXq15nCiU7Po2sdBMCjD2/DTO/PWFeQfWo
	071A==
X-Gm-Message-State: AA6/9RlTeX1NdErgnz/nfZ8yMW+sQKSiLndjUrAyECOMaJflMI+SA/vusPvkbeSLe1luOq1F413ahdsQLH50MQ==
X-Received: by 10.55.182.4 with SMTP id g4mr19657419qkf.120.1475510571600;
	Mon, 03 Oct 2016 09:02:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.203 with HTTP; Mon, 3 Oct 2016 09:02:51 -0700 (PDT)
In-Reply-To: <CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
References: <cover.1475473494.git.bruce.ashfield@windriver.com>
	<CAJTo0LacaDPQawfsK45GTwOVPohsxQN+e2FtZjEYvT91Ruxb5g@mail.gmail.com>
	<d5b8ad07-09f4-bb3e-46ed-3a93df33ba76@windriver.com>
	<CADkTA4OX5OYXTRaP_JxWhE6CNYq20LXA6e5X4OOEf9=7w3trew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 3 Oct 2016 12:02:51 -0400
Message-ID: <CADkTA4N=BZUNStxbRB0iVH+CsPyJhQSjXkOnihQgdNPf5gv-Dw@mail.gmail.com>
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
X-List-Received-Date: Mon, 03 Oct 2016 16:02:53 -0000
Content-Type: multipart/alternative; boundary=94eb2c060cf07b9505053df813dd

--94eb2c060cf07b9505053df813dd
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 3, 2016 at 11:57 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Mon, Oct 3, 2016 at 11:51 AM, Bruce Ashfield <
> bruce.ashfield@windriver.com> wrote:
>
>> On 2016-10-03 11:45 AM, Burton, Ross wrote:
>>
>>>
>>> On 3 October 2016 at 06:54, Bruce Ashfield <bruce.ashfield@windriver.com
>>> <mailto:bruce.ashfield@windriver.com>> wrote:
>>>
>>>     The big thing to note about this update .. is that the libc-headers
>>> bump
>>>     to the 4.8 final tarball picked up some uapi headers that broke the
>>>     build
>>>     of ppp. I never would have thought it was possible, but it happened.
>>>
>>>
>>> | In file included from
>>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>>> lude/linux/if_tunnel.h:6:0,
>>> |                  from iptunnel.c:39:
>>> |
>>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>>> lude/linux/ip.h:85:8:
>>> error: redefinition of 'struct iphdr'
>>> |  struct iphdr {
>>> |         ^~~~~
>>> | In file included from iptunnel.c:29:0:
>>> |
>>> /data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/inc
>>> lude/netinet/ip.h:44:8:
>>> note: originally defined here
>>> |  struct iphdr
>>> |         ^~~~~
>>> | <builtin>: recipe for target 'iptunnel.o' failed
>>> | make: *** [iptunnel.o] Error 1
>>> | ERROR: Function failed: do_compile (log file is located at
>>> /data/poky-master/tmp-glibc/work/corei7-64-poky-linux/net-to
>>> ols/1.60-26-r0/temp/log.do_compile.27643)
>>>
>>> Looks like net-tools is broken by something else too.
>>>
>>
>> I'm out of the office in about one hour. So someone else is
>> going to have to pick up the libc-headers fix.
>>
>
>
> Switching to my gmail, so I can follow along.
>
> I do have about a half hour now, I'll check the net uapi code in the
> kernel and see
> if there's another fixup I can do.
>
> These errors have been lurking for about the last year, the answer from
> the kernel
> folks is typically "change the order of your includes".
>
> So there are two routes to fix it. See if there's a newer userspace with
> the includes
> changed, or do what I did, take the change out of libc-headers.
>

Yep. Same criminals, it is very likely this. I started a build, if it
breaks, I'll test a removal
of this:

-----------

commit 1fe8e0f074c77aa41aaa579345a9e675acbebfa9

Author: Mikko Rapeli <mikko.rapeli@iki.fi>

Date:   Mon Aug 22 20:32:39 2016 +0200


    include/uapi/linux/if_tunnel.h: include linux/if.h, linux/ip.h and
linux/in6.h



    Fixes userspace compilation errors like:



    error: field <E2><80><98>iph<E2><80><99> has incomplete type

    error: field <E2><80><98>prefix<E2><80><99> has incomplete type



    Signed-off-by: Mikko Rapeli <mikko.rapeli@iki.fi>

    Signed-off-by: David S. Miller <davem@davemloft.net>


:100644 100644 1046f5515174... 777b6cdb1b7b... M
include/uapi/linux/if_tunnel.h

--------


>
> I'll check to see if I can do the latter here.
>
> Out of curiosity, what image type is this ?  built core-image-sato,
> kernel-dev for
> x86-64 and they all worked.
>
> Bruce
>
>
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>> Ross
>>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c060cf07b9505053df813dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Oct 3, 2016 at 11:57 AM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote"><div><div class=3D"gmail-h5">On Mon, Oct 3, 2016 at 11:51 =
AM, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@w=
indriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span>On 2016-=
10-03 11:45 AM, Burton, Ross wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><span>
<br>
On 3 October 2016 at 06:54, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashf=
ield@windriver.com" target=3D"_blank">bruce.ashfield@windriver.com</a><br><=
/span><span>
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
iv><div><br></div></div></div><div>Switching to my gmail, so I can follow a=
long.</div><div><br></div><div>I do have about a half hour now, I&#39;ll ch=
eck the net uapi code in the kernel and see</div><div>if there&#39;s anothe=
r fixup I can do.</div><div><br></div><div>These errors have been lurking f=
or about the last year, the answer from the kernel</div><div>folks is typic=
ally &quot;change the order of your includes&quot;.</div><div><br></div><di=
v>So there are two routes to fix it. See if there&#39;s a newer userspace w=
ith the includes</div><div>changed, or do what I did, take the change out o=
f libc-headers.</div></div></div></div></blockquote><div><br></div><div>Yep=
. Same criminals, it is very likely this. I started a build, if it breaks, =
I&#39;ll test a removal</div><div>of this:</div><div><br></div><div>-------=
----</div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">commit 1fe8e0f074c77aa41aaa5=
79345a9e675acbebfa9</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Author: Mikko Rapeli &lt;<a =
href=3D"mailto:mikko.rapeli@iki.fi">mikko.rapeli@iki.fi</a>&gt;</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">Date: =C2=A0 Mon Aug 22 20:3=
2:39 2016 +0200</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 include/uapi/l=
inux/if_tunnel.h: include linux/if.h, linux/ip.h and linux/in6.h</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 Fixes userspac=
e compilation errors like:</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 error: field <=
/span><span class=3D"gmail-s2">&lt;E2&gt;&lt;80&gt;&lt;98&gt;</span><span c=
lass=3D"gmail-s1">iph</span><span class=3D"gmail-s2">&lt;E2&gt;&lt;80&gt;&l=
t;99&gt;</span><span class=3D"gmail-s1"> has incomplete type</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 error: field <=
/span><span class=3D"gmail-s2">&lt;E2&gt;&lt;80&gt;&lt;98&gt;</span><span c=
lass=3D"gmail-s1">prefix</span><span class=3D"gmail-s2">&lt;E2&gt;&lt;80&gt=
;&lt;99&gt;</span><span class=3D"gmail-s1"> has incomplete type</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1">=C2=A0=C2=A0 =C2=A0</span></=
p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 Signed-off-by:=
 Mikko Rapeli &lt;<a href=3D"mailto:mikko.rapeli@iki.fi">mikko.rapeli@iki.f=
i</a>&gt;</span></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">=C2=A0 =C2=A0 Signed-off-by:=
 David S. Miller &lt;<a href=3D"mailto:davem@davemloft.net">davem@davemloft=
.net</a>&gt;</span></p>
<p class=3D"gmail-p3"><span class=3D"gmail-s1"></span><br></p>
<p class=3D"gmail-p2"><span class=3D"gmail-s1">:100644 100644 1046f5515174.=
.. 777b6cdb1b7b... M=C2=A0 =C2=A0 =C2=A0 =C2=A0 include/uapi/linux/if_tunne=
l.h<br><br></span></p><p class=3D"gmail-p2"><span class=3D"gmail-s1">------=
--</span></p></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><div><br></div><div>I&#39;ll check to see if I can do the latter her=
e.</div><div><br></div><div>Out of curiosity, what image type is this ? =C2=
=A0built core-image-sato, kernel-dev for</div><div>x86-64 and they all work=
ed.</div><div><br></div><div>Bruce</div><span class=3D"gmail-"><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Bruce<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Ross<br>
</blockquote><div class=3D"gmail-m_6914507172855525602HOEnZb"><div class=3D=
"gmail-m_6914507172855525602h5">
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></span></div><span class=3D"gmail-HOEnZb"><font co=
lor=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"g=
mail-m_6914507172855525602gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--94eb2c060cf07b9505053df813dd--
