Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CC7B3712AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Sep 2014 01:48:28 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so2767206wgh.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Sep 2014 18:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=rj555xosWERLvNyc7dhOEG7bSCpSh6sBp9dBu75Kbrk=;
	b=qol+1eL5INc/vnqIz17qbXGYxYFiGwAiAeh3blqC5hNr1fbtz2/L4lnx+Hk9n58h3F
	mAtVHwP4AUbrz2+2hN5dgM6+7dAsbUGKafbhevxl7gR3szcTYhg7iUYfGN8UU0qa4im0
	87iDc02zNbmRhhX92Tq6pws+AWL3TM9nluv6OGZkonvRl5hSvO5BBPmJNGQEDNS/+lw8
	qEHfeY8ghm+OX66p6aqwd1whdSIV5xniaazmikUpQC/uf2bcfwxMxL6WmRKMYlrY/XWO
	5lmgFqU07rx2LmvHpDHnuXQp/YGQdx7+EPQMl0UieWjzHrfVEhQ/lVaQ+2UzMRdjMBWc
	K5Tg==
MIME-Version: 1.0
X-Received: by 10.181.13.73 with SMTP id ew9mr36866032wid.56.1411868909196;
	Sat, 27 Sep 2014 18:48:29 -0700 (PDT)
Received: by 10.217.141.70 with HTTP; Sat, 27 Sep 2014 18:48:29 -0700 (PDT)
In-Reply-To: <54045A5D.6080207@pabigot.com>
References: <CADwFkYeYJVe0KyVY3gipy-cGm4kRhaHoit2WThcKsLnpdyyrOw@mail.gmail.com>
	<54006899.3020609@pabigot.com>
	<CACS+7ZRyJJUxQLU_qzbaoTo6p=x9AxRLYigPB_cgz+zg4gRq5Q@mail.gmail.com>
	<5400E993.3020903@pabigot.com>
	<CACS+7ZSFYoi7Osqbh6kfstSeMUJEk61HrXLBV1mCeDc5_QGaLA@mail.gmail.com>
	<54012565.1050605@pabigot.com>
	<CADwFkYcxf21JuyXSfsnNDPBdZY2_Xg+fQvv8gh8QnYKE0PsiZw@mail.gmail.com>
	<54045A5D.6080207@pabigot.com>
Date: Sun, 28 Sep 2014 09:48:29 +0800
Message-ID: <CADwFkYfAyGNjuvw-SKRZ+OFXSrnnwyw65tre7WLfT2xqVpbR1Q@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: boost 1.56 compile fail
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
X-List-Received-Date: Sun, 28 Sep 2014 01:48:37 -0000
Content-Type: multipart/alternative; boundary=f46d04388eb1cd5b52050416584a

--f46d04388eb1cd5b52050416584a
Content-Type: text/plain; charset=UTF-8

https://github.com/boostorg/atomic/commit/415db7054723291042e4ff1ffa8fdd5bc8b07163

 Please, see if it helps in your case.
https://svn.boost.org/trac/boost/ticket/10446


On Mon, Sep 1, 2014 at 7:37 PM, Peter A. Bigot <pab@pabigot.com> wrote:

>  On 08/31/2014 09:31 PM, Yi Qingliang wrote:
>
> then what's your suggestion for now?
>
>
> If the s3c6410 is ARMv6 and does not support ARMv6-K instructions, then
> boost 1.56 does not work for your platform.  Try downgrading to 1.55, or
> asking the Boost folks for a patch to update
> boost/atomic/detail/caps_gcc_atomic.hpp so that it supports that
> architecture, which lacks the byte, half-word, and double-word atomic
> ldrex/strex instruction variants.
>
> If the s3c6410 does support ARMv6-K instructions, you can try making sure
> it builds with -march=arvm6k.
>
> I don't know the conditions under which this becomes an OE-Core problem.
> It's not a gcc problem.
>
> Peter
>
>
>
>
> On Sat, Aug 30, 2014 at 9:14 AM, Peter A. Bigot <pab@pabigot.com> wrote:
>
>>  On 08/29/2014 04:18 PM, Dan McGregor wrote:
>>
>>> On 29 August 2014 14:58, Peter A. Bigot <pab@pabigot.com> wrote:
>>>
>>>> On 08/29/2014 03:36 PM, Dan McGregor wrote:
>>>>
>>>>> On 29 August 2014 05:48, Peter A. Bigot <pab@pabigot.com> wrote:
>>>>>
>>>>>> On 08/29/2014 06:28 AM, Yi Qingliang wrote:
>>>>>>
>>>>>> hardware: samsung s3c6410
>>>>>>
>>>>>> after updated to latest poky, the boost compile fail!
>>>>>>
>>>>>> error info:
>>>>>> libs/atomic/src/lockpool.cpp:127:5: error: 'thread_fence' is not a
>>>>>> member
>>>>>> of
>>>>>> 'boost::atomics::detail'
>>>>>> libs/atomic/src/lockpool.cpp:138:5: error: 'signal_fence' is not a
>>>>>> member
>>>>>> of
>>>>>> 'boost::atomics::detail'
>>>>>>
>>>>>>
>>>>>> after dig into it, I found that:
>>>>>> the marco 'BOOST_ATOMIC_FLAG_LOCK_FREE' is 0, so it don't include
>>>>>> 'operations_lockfree.hpp' which has 'thread_fence' and 'signal_fence',
>>>>>> but
>>>>>> pthread.h at line 21.
>>>>>>
>>>>>> in file 'caps_gcc_atomic.hpp', 'BOOST_ATOMIC_FLAG_LOCK_FREE' is set to
>>>>>> '0',
>>>>>> the author think if '__GCC_ATOMIC_BOOL_LOCK_FREE' is 1, the atomic
>>>>>> serial
>>>>>> function gcc provided is not lock free.
>>>>>>
>>>>>>
>>>>>> This is the sort of GCC internal header indicator that would have
>>>>>> changed
>>>>>> value as a result of:
>>>>>>
>>>>>>
>>>>>>
>>>>>> http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=0ba6ab39f187ecd4261f08e768f365f461384a3a
>>>>>>
>>>>>>
>>>>>>
>>>>>> at the end of 'caps_gcc_atomic.hpp', it defined
>>>>>> 'BOOST_ATOMIC_THREAD_FENCE'
>>>>>> as 2.
>>>>>>
>>>>>> so the conflict is: BOOST_ATOMIC_THREAD_FENCE and
>>>>>> BOOST_ATOMIC_FLAG_LOCK_FREE
>>>>>>
>>>>>> I don't know it is the new poky problem, or the boost problem, any
>>>>>> idea?
>>>>>>
>>>>>>
>>>>>> My guess is that Boost is making assumptions about what the internal
>>>>>> GCC
>>>>>> predefined symbols mean that aren't entirely accurate.  There are
>>>>>> several
>>>>>> flags that are used in the libstdc++ headers to indicate whether the
>>>>>> compiler is using lock-free instructions.
>>>>>>
>>>>>> Boost-1.56 builds without error for my beaglebone target with poky at:
>>>>>>
>>>>>> * 669c07d (HEAD, origin/master, origin/HEAD, master/upstream,
>>>>>> master/dev)
>>>>>> [Wed Aug 27 14:24:52 2014 +0100] bitbake: build/data: Write out more
>>>>>> complete python run files
>>>>>>
>>>>>> so it may have something to do with your target machine.
>>>>>>
>>>>> It absolutely does. I found that armv6 breaks, but armv6zk and newer
>>>>> work.
>>>>>
>>>>
>>>> Interesting.  There are no armv6zk tune features I can see in poky,
>>>> though
>>>> google suggests it applies to the Raspberry Pi.
>>>>
>>>> The problem then must be with the first override in this:
>>>>
>>>> # ARMv6+ adds atomic instructions that affect the ABI in libraries built
>>>> # with TUNE_CCARGS in gcc-runtime.  Make the compiler default to a
>>>> # compatible architecture.  armv6 and armv7a cover the minimum tune
>>>> # features used in OE.
>>>> EXTRA_OECONF_append_armv6 = " --with-arch=armv6"
>>>> EXTRA_OECONF_append_armv7a = " --with-arch=armv7-a"
>>>>
>>>> ARMv6 has LDREX/STREX, but ARMv6K adds {LD,ST}REX{B,H,D}.  The same
>>>> problem
>>>> addressed above is likely to happen if the libraries are built with
>>>> armv6k
>>>> but the compiler doesn't default to it.
>>>>
>>>> There are no armv6k tune parameters I can locate in poky.  What layers
>>>> have
>>>> the tune configurations that are causing problems?
>>>>
>>>>  For me meta-raspberrypi failed to build. Its tuning is -march=armv6
>>> -mtune=arm1176zjf-s by default. I forced it to -march=armv6zk
>>> -mtune=arm1176jzf-s, and that worked.
>>>
>>
>>  tl;dr: for now, this can be claimed to be a boost problem, but it may
>> rapidly become an OE problem.
>>
>> OK, so there's several issues here.
>>
>> Extracting the predefined symbols from gcc 4.9.1 with:
>>
>>    arm-poky-linux-gnueabi-g++ -march=armv6 -dM -E -xc++ /dev/null
>>
>> and similarly with -march=armv6k shows that the values of these
>> atomic-related predefines are different (- = arvm6, + = armv6k):
>>
>> -#define __GCC_ATOMIC_BOOL_LOCK_FREE 1
>> -#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1
>> +#define __GCC_ATOMIC_BOOL_LOCK_FREE 2
>> +#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2
>> -#define __GCC_ATOMIC_CHAR_LOCK_FREE 1
>> +#define __GCC_ATOMIC_CHAR_LOCK_FREE 2
>> -#define __GCC_ATOMIC_LLONG_LOCK_FREE 1
>> +#define __GCC_ATOMIC_LLONG_LOCK_FREE 2
>> -#define __GCC_ATOMIC_SHORT_LOCK_FREE 1
>> +#define __GCC_ATOMIC_SHORT_LOCK_FREE 2
>> +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1
>> +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1
>> +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1
>>
>> (armv6zk is the same as armv6k for atomic-related capabilities.)
>>
>> boost/atomic/detail/caps_gcc_atomic.hpp apparently does not provide an
>> implementation of thread_fence or signal_fence for the armv6 configuration,
>> only for the armv6k and later ones.
>>
>> That's a boost problem.
>>
>> The fact that -mtune=arm1176jzf-s apparently doesn't enable the armv6k
>> features even though gcc's source code implies it should is an anomaly.
>> (Check this by substituting -mtune=arm1176jzf-s for -march=armv6 and
>> verifying that the predefined symbols are the same for both configurations.)
>>
>> If that anomaly is ever resolved, or if meta-raspberrypi chooses to
>> switch to -march=armv6zk, then gcc-configure-common.inc almost certainly
>> need to recognize armv6k as an override distinct from armv6: mutex-related
>> code built for armv6k via gcc-runtime will result in a different ABI from
>> mutex-related code built for armv6 (what gcc will produce for builds that
>> do not use OE's tuning parameters).
>>
>> If the solution to the boost problem is to change meta-raspberrypi to use
>> -march=armv6k then gcc-configure-common.inc will need to be updated as
>> well.  Probably OE should recognize it as a distinct ARM architecture too.
>>
>>
>> Peter
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>

--f46d04388eb1cd5b52050416584a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>=C2=A0<a href=3D"https://github.com/boostorg/atomic/co=
mmit/415db7054723291042e4ff1ffa8fdd5bc8b07163" target=3D"_blank">https://gi=
thub.com/boostorg/atomic/commit/415db7054723291042e4ff1ffa8fdd5bc8b07163</a=
><br><br>=C2=A0Please, see if it helps in your case.<div class=3D""><div id=
=3D":bb" class=3D"" tabindex=3D"0"><a href=3D"https://svn.boost.org/trac/bo=
ost/ticket/10446" target=3D"_blank">https://svn.boost.org/trac/boost/ticket=
/10446</a><br></div></div><div class=3D""><div class=3D"adm" style=3D"font-=
family:arial,sans-serif;font-size:13px"></div></div><div><span class=3D""><=
font color=3D"#888888"><br></font></span></div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Mon, Sep 1, 2014 at 7:37 PM, Peter A=
. Bigot <span dir=3D"ltr">&lt;<a href=3D"mailto:pab@pabigot.com" target=3D"=
_blank">pab@pabigot.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><span class=3D"">
    <div>On 08/31/2014 09:31 PM, Yi Qingliang
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">then what&#39;s your suggestion for now?</div>
    </blockquote>
    <br></span>
    If the s3c6410 is ARMv6 and does not support ARMv6-K instructions,
    then boost 1.56 does not work for your platform.=C2=A0 Try downgrading =
to
    1.55, or asking the Boost folks for a patch to update
    boost/atomic/detail/caps_gcc_atomic.hpp so that it supports that
    architecture, which lacks the byte, half-word, and double-word
    atomic ldrex/strex instruction variants.<br>
    <br>
    If the s3c6410 does support ARMv6-K instructions, you can try making
    sure it builds with -march=3Darvm6k.<br>
    <br>
    I don&#39;t know the conditions under which this becomes an OE-Core
    problem.=C2=A0 It&#39;s not a gcc problem.<span class=3D"HOEnZb"><font =
color=3D"#888888"><br>
    <br>
    Peter</font></span><div><div class=3D"h5"><br>
    <br>
    <blockquote type=3D"cite">
      <div class=3D"gmail_extra"><br>
        <br>
        <div class=3D"gmail_quote">On Sat, Aug 30, 2014 at 9:14 AM, Peter
          A. Bigot <span dir=3D"ltr">&lt;<a href=3D"mailto:pab@pabigot.com"=
 target=3D"_blank">pab@pabigot.com</a>&gt;</span>
          wrote:<br>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
            <div>
              <div>On 08/29/2014 04:18 PM, Dan McGregor
                wrote:<br>
                <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
                  On 29 August 2014 14:58, Peter A. Bigot &lt;<a href=3D"ma=
ilto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt; wrote:<br>
                  <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">
                    On 08/29/2014 03:36 PM, Dan McGregor wrote:<br>
                    <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                      On 29 August 2014 05:48, Peter A. Bigot &lt;<a href=
=3D"mailto:pab@pabigot.com" target=3D"_blank">pab@pabigot.com</a>&gt;
                      wrote:<br>
                      <blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
                        On 08/29/2014 06:28 AM, Yi Qingliang wrote:<br>
                        <br>
                        hardware: samsung s3c6410<br>
                        <br>
                        after updated to latest poky, the boost compile
                        fail!<br>
                        <br>
                        error info:<br>
                        libs/atomic/src/lockpool.cpp:127:5: error:
                        &#39;thread_fence&#39; is not a member<br>
                        of<br>
                        &#39;boost::atomics::detail&#39;<br>
                        libs/atomic/src/lockpool.cpp:138:5: error:
                        &#39;signal_fence&#39; is not a member<br>
                        of<br>
                        &#39;boost::atomics::detail&#39;<br>
                        <br>
                        <br>
                        after dig into it, I found that:<br>
                        the marco &#39;BOOST_ATOMIC_FLAG_LOCK_FREE&#39; is =
0, so
                        it don&#39;t include<br>
                        &#39;operations_lockfree.hpp&#39; which has
                        &#39;thread_fence&#39; and &#39;signal_fence&#39;,<=
br>
                        but<br>
                        pthread.h at line 21.<br>
                        <br>
                        in file &#39;caps_gcc_atomic.hpp&#39;,
                        &#39;BOOST_ATOMIC_FLAG_LOCK_FREE&#39; is set to<br>
                        &#39;0&#39;,<br>
                        the author think if
                        &#39;__GCC_ATOMIC_BOOL_LOCK_FREE&#39; is 1, the ato=
mic
                        serial<br>
                        function gcc provided is not lock free.<br>
                        <br>
                        <br>
                        This is the sort of GCC internal header
                        indicator that would have changed<br>
                        value as a result of:<br>
                        <br>
                        <br>
                        <a href=3D"http://cgit.openembedded.org/openembedde=
d-core/commit/meta/recipes-devtools/gcc/gcc-configure-common.inc?id=3D0ba6a=
b39f187ecd4261f08e768f365f461384a3a" target=3D"_blank">http://cgit.openembe=
dded.org/openembedded-core/commit/meta/recipes-devtools/gcc/gcc-configure-c=
ommon.inc?id=3D0ba6ab39f187ecd4261f08e768f365f461384a3a</a><br>
                        <br>
                        <br>
                        <br>
                        at the end of &#39;caps_gcc_atomic.hpp&#39;, it def=
ined<br>
                        &#39;BOOST_ATOMIC_THREAD_FENCE&#39;<br>
                        as 2.<br>
                        <br>
                        so the conflict is: BOOST_ATOMIC_THREAD_FENCE
                        and<br>
                        BOOST_ATOMIC_FLAG_LOCK_FREE<br>
                        <br>
                        I don&#39;t know it is the new poky problem, or the
                        boost problem, any idea?<br>
                        <br>
                        <br>
                        My guess is that Boost is making assumptions
                        about what the internal GCC<br>
                        predefined symbols mean that aren&#39;t entirely
                        accurate.=C2=A0 There are several<br>
                        flags that are used in the libstdc++ headers to
                        indicate whether the<br>
                        compiler is using lock-free instructions.<br>
                        <br>
                        Boost-1.56 builds without error for my
                        beaglebone target with poky at:<br>
                        <br>
                        * 669c07d (HEAD, origin/master, origin/HEAD,
                        master/upstream, master/dev)<br>
                        [Wed Aug 27 14:24:52 2014 +0100] bitbake:
                        build/data: Write out more<br>
                        complete python run files<br>
                        <br>
                        so it may have something to do with your target
                        machine.<br>
                      </blockquote>
                      It absolutely does. I found that armv6 breaks, but
                      armv6zk and newer work.<br>
                    </blockquote>
                    <br>
                    Interesting.=C2=A0 There are no armv6zk tune features I
                    can see in poky, though<br>
                    google suggests it applies to the Raspberry Pi.<br>
                    <br>
                    The problem then must be with the first override in
                    this:<br>
                    <br>
                    # ARMv6+ adds atomic instructions that affect the
                    ABI in libraries built<br>
                    # with TUNE_CCARGS in gcc-runtime.=C2=A0 Make the
                    compiler default to a<br>
                    # compatible architecture.=C2=A0 armv6 and armv7a cover
                    the minimum tune<br>
                    # features used in OE.<br>
                    EXTRA_OECONF_append_armv6 =3D &quot; --with-arch=3Darmv=
6&quot;<br>
                    EXTRA_OECONF_append_armv7a =3D &quot; --with-arch=3Darm=
v7-a&quot;<br>
                    <br>
                    ARMv6 has LDREX/STREX, but ARMv6K adds
                    {LD,ST}REX{B,H,D}.=C2=A0 The same problem<br>
                    addressed above is likely to happen if the libraries
                    are built with armv6k<br>
                    but the compiler doesn&#39;t default to it.<br>
                    <br>
                    There are no armv6k tune parameters I can locate in
                    poky.=C2=A0 What layers have<br>
                    the tune configurations that are causing problems?<br>
                    <br>
                  </blockquote>
                  For me meta-raspberrypi failed to build. Its tuning is
                  -march=3Darmv6<br>
                  -mtune=3Darm1176zjf-s by default. I forced it to
                  -march=3Darmv6zk<br>
                  -mtune=3Darm1176jzf-s, and that worked.<br>
                </blockquote>
                <br>
              </div>
            </div>
            tl;dr: for now, this can be claimed to be a boost problem,
            but it may rapidly become an OE problem.<br>
            <br>
            OK, so there&#39;s several issues here.<br>
            <br>
            Extracting the predefined symbols from gcc 4.9.1 with:<br>
            <br>
            =C2=A0 =C2=A0arm-poky-linux-gnueabi-g++ -march=3Darmv6 -dM -E -=
xc++
            /dev/null<br>
            <br>
            and similarly with -march=3Darmv6k shows that the values of
            these atomic-related predefines are different (- =3D arvm6, +
            =3D armv6k):<br>
            <br>
            -#define __GCC_ATOMIC_BOOL_LOCK_FREE 1<br>
            -#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_BOOL_LOCK_FREE 2<br>
            +#define __GCC_ATOMIC_CHAR16_T_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_CHAR_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_CHAR_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_LLONG_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_LLONG_LOCK_FREE 2<br>
            -#define __GCC_ATOMIC_SHORT_LOCK_FREE 1<br>
            +#define __GCC_ATOMIC_SHORT_LOCK_FREE 2<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1<br>
            +#define __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1<br>
            <br>
            (armv6zk is the same as armv6k for atomic-related
            capabilities.)<br>
            <br>
            boost/atomic/detail/caps_gcc_atomic.hpp apparently does not
            provide an implementation of thread_fence or signal_fence
            for the armv6 configuration, only for the armv6k and later
            ones.<br>
            <br>
            That&#39;s a boost problem.<br>
            <br>
            The fact that -mtune=3Darm1176jzf-s apparently doesn&#39;t enab=
le
            the armv6k features even though gcc&#39;s source code implies i=
t
            should is an anomaly.=C2=A0 (Check this by substituting
            -mtune=3Darm1176jzf-s for -march=3Darmv6 and verifying that the
            predefined symbols are the same for both configurations.)<br>
            <br>
            If that anomaly is ever resolved, or if meta-raspberrypi
            chooses to switch to -march=3Darmv6zk, then
            gcc-configure-common.inc almost certainly need to recognize
            armv6k as an override distinct from armv6: mutex-related
            code built for armv6k via gcc-runtime will result in a
            different ABI from mutex-related code built for armv6 (what
            gcc will produce for builds that do not use OE&#39;s tuning
            parameters).<br>
            <br>
            If the solution to the boost problem is to change
            meta-raspberrypi to use -march=3Darmv6k then
            gcc-configure-common.inc will need to be updated as well.=C2=A0
            Probably OE should recognize it as a distinct ARM
            architecture too.
            <div>
              <div><br>
                <br>
                Peter<br>
                -- <br>
                _______________________________________________<br>
                Openembedded-core mailing list<br>
                <a href=3D"mailto:Openembedded-core@lists.openembedded.org"=
 target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
                <a href=3D"http://lists.openembedded.org/mailman/listinfo/o=
penembedded-core" target=3D"_blank">http://lists.openembedded.org/mailman/l=
istinfo/openembedded-core</a><br>
              </div>
            </div>
          </blockquote>
        </div>
        <br>
      </div>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div><br></div>

--f46d04388eb1cd5b52050416584a--
