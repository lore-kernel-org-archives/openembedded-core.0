Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1281DC7115A
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 10:57:54 +0000 (UTC)
Received: from h4.cmg1.smtp.forpsi.com (h4.cmg1.smtp.forpsi.com [185.129.138.163])
 by mx.groups.io with SMTP id smtpd.web10.12018.1750330665960212367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 03:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=H31RXkAC;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=H31RXkAC;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.163, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([178.143.45.236])
	by cmgsmtp with ESMTPSA
	id SCxjuRvTtwQNXSCxjuZtRS; Thu, 19 Jun 2025 12:57:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750330663; bh=9F4a7aS1rzg3BfF8qxrQcitxS9h59jccstWIrTjkFgs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=H31RXkAC+vJxO/lWphmPvGgPiAvyy1kp/IQMt1ukgXpp0+YIggRZthvrIRmD6arSa
	 MBwWMh4NR/WOVulqZ2Ek6qH2sq0nOvXnbkTv91E+3TlXa+BhyStaBSOHML5sDOZt2R
	 5jVxI2X7U8AAM+RpBqICXOg4KhOIcTnpTxm2Fr5XV/qimMm4S/De/Zp9qKNxVRSrFR
	 XnVi8frpdWWrcJb2G2CJVzwHsm7FD5aucrleekzLaumTcFz/DnAM6mNA3498+AXycF
	 vva0zljulCcsLD4fwMBf6heqvmJVhg4wGmpwqrXRUnmanE4j1NLiA16FO0Di6KrAS7
	 6aAe057MsPY4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1750330663; bh=9F4a7aS1rzg3BfF8qxrQcitxS9h59jccstWIrTjkFgs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:From;
	b=H31RXkAC+vJxO/lWphmPvGgPiAvyy1kp/IQMt1ukgXpp0+YIggRZthvrIRmD6arSa
	 MBwWMh4NR/WOVulqZ2Ek6qH2sq0nOvXnbkTv91E+3TlXa+BhyStaBSOHML5sDOZt2R
	 5jVxI2X7U8AAM+RpBqICXOg4KhOIcTnpTxm2Fr5XV/qimMm4S/De/Zp9qKNxVRSrFR
	 XnVi8frpdWWrcJb2G2CJVzwHsm7FD5aucrleekzLaumTcFz/DnAM6mNA3498+AXycF
	 vva0zljulCcsLD4fwMBf6heqvmJVhg4wGmpwqrXRUnmanE4j1NLiA16FO0Di6KrAS7
	 6aAe057MsPY4g==
Content-Type: multipart/alternative;
 boundary="------------HTGj6InLdFpHwF0LSM53hC0B"
Message-ID: <b8c345d7-af11-49e8-b689-0a8c16f7bc6d@skyrain.eu>
Date: Thu, 19 Jun 2025 12:57:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] perf: nativesdk
To: peter.marko@siemens.com
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
References: <7dee70c7-d0a8-44ea-94a1-2c4be581208e@skyrain.eu>
 <CANNYZj91bFZAMB0XiLyEewy6t0RnrtNAZGEsiV+znM5xSY7S0Q@mail.gmail.com>
 <5a82dfcd-f526-4da7-a39b-081d7b689f57@skyrain.eu>
 <CANNYZj8LHBsahWB6k6SHZygNVh7jcyDLV5H6n77FcTGnmRXdUw@mail.gmail.com>
 <AS1PR10MB569796A8477A0D6B2E8892BBFD7DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <AS1PR10MB569796A8477A0D6B2E8892BBFD7DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
X-CMAE-Envelope: MS4xfHIGzpPrjlleGzd0NBDEKOgogkC5oJdZJHRcqytRJJYGC6Wig3xBcEkMcGd/Ght387rMTz1tJi+aJq/4roVl4ynTZU/kxTcfRiSIIWXOLKwfOZO3vmXU
 q2G1/QUsh+BtqW2DEx6AwnSqot5BHRUIAK8gOhzwqn2BKxnaVzKbwYS4IzR72b7+EMww6mG+XMnu1glFs3lQdE8DsaoNYQ5rpPI6bjW4VU8zoYNMkwRBkVde
 2U0KYpSuqWN9nVZ3ODUF3tM+iX1O71KjJfxFBm5//egk6vV1KEinP0nN1H22PO0W
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 10:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219066

This is a multi-part message in MIME format.
--------------HTGj6InLdFpHwF0LSM53hC0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Thanks for pointing me out to the right direction.

Yes, I know, that the perf sources are coming directly from kernel. So

> It seems as though perf recipe depends on the kernel sources too, so
> as it stands, you can't build it natively. I'd directly eliminate the
> target deps (e.g. actually remove them from the recipe, as an
> experiment) and see how far you get with bitbake perf-native.

is not possible. But anyway, at the begging I was going with the wrong 
direction. But yes, once I commented-out the section in gcc-cross, I was 
able to compile a nativesdk- variant,

file perf
perf: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically 
linked, interpreter 
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-hiltisdk-linux/lib/ld-linux-x86-64.so.2, 
BuildID[sha1]=34bfdb0e321eae26426e45c78c29f63e73ee62d4, for GNU/Linux 
3.2.0, with debug_info, not stripped

but didn't invest more time in tuning or execution.

> Also I doubt that perf supports cross-build, meaning analyzing ARM processor counters on x86.
> You may have to match your native host machine with target device maybe to point of exact processor type, not only architecture type.

I know, that this has to be matching due to ABI, unwinding and so on... 
. On the other hand, if I didn't have confirmation, that x86 could in 
some modes understand arm64 counters I didn't go in this direction.

x86_64 x86_64 x86_64 GNU/Linux variant of perf
perf script -i perf.data --symfs rootfs
unwind: target platform=arm64 is not supported
   systemd-logind     339    65.306223:          1 cycles:P: 
ffff80008007ff30 [unknown] ([kernel.kallsyms])
   systemd-logind     339    65.306230:          1 cycles:P: 
ffff80008007ff30 [unknown] ([kernel.kallsyms])

So yes, script or inject modes can do some stuff. So I wanted to use the 
perf binary directly from Yocto and not from host.

Anyway as I mentioned, I found a correct usable way.
Use qemu-aarch64 for arm binary execution, pass some args and voila:
   systemd-logind     341    43.234008:        711 cycles:P: 
ffff80008007ff30 finish_task_switch.isra.0+0x90 ([kernel.kallsyms])
   systemd-logind     341    43.234016:        711 cycles:P: 
ffff80008007ff30 finish_task_switch.isra.0+0x90 ([kernel.kallsyms])
   systemd-logind     341    43.234020:        711 cycles:P: 
ffff80008007ff30 finish_task_switch.isra.0+0x90 ([kernel.kallsyms])

It can fully unwind the stack... .

BR,
Andy

On 19.06.2025 10:59, Peter Marko via lists.openembedded.org wrote:
> What you want to do is not really possible.
> Perf recipe does not have its own sources, it only copies sources from kernel and then builds them.
> And you cannot depend on target recipe (kernel) in native recipe (perf-native).
>
> Also I doubt that perf supports cross-build, meaning analyzing ARM processor counters on x86.
> You may have to match your native host machine with target device maybe to point of exact processor type, not only architecture type.
>
> Peter
>
>> -----Original Message-----
>> From:openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Alexander Kanavin via
>> lists.openembedded.org
>> Sent: Thursday, June 19, 2025 10:13
>> To: Andrej Valek<andrej.v@skyrain.eu>
>> Cc:openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] perf: nativesdk
>>
>> On Thu, 19 Jun 2025 at 10:07, Andrej Valek<andrej.v@skyrain.eu> wrote:
>>> maybe I have to do some more tuning, but what I did:
>>> BBCLASSEXTEND = "native nativesdk"
>>> DEPENDS:remove:class-native = "virtual/${MLPREFIX}libc"
>>>
>>> then I run: "bitbake perf-native" and I have the same issue:
>>>
>>> ERROR: perf-native-1.0-r0 do_configure: The sstate manifest for task
>>> 'linux-libc-headers:populate_sysroot' (multilib variant '') could not be
>>> found.
>>> The pkgarchs considered were: machineA, cortexa53, cortexa53,
>>> armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
>>> But none of these manifests exists:
>>>
>>> /home/build/tmp/sstate-control/manifest-machineA-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-armv8a-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-aarch64-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-allarch-linux-libc-
>> headers.populate_sysroot
>>> /home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-
>> headers.populate_sysroot
>>> So nope, it's not working.
>> It seems as though perf recipe depends on the kernel sources too, so
>> as it stands, you can't build it natively. I'd directly eliminate the
>> target deps (e.g. actually remove them from the recipe, as an
>> experiment) and see how far you get with bitbake perf-native.
>>
>> Alex
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#219062):https://lists.openembedded.org/g/openembedded-core/message/219062
>> Mute This Topic:https://lists.openembedded.org/mt/113722107/3619876
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

--------------HTGj6InLdFpHwF0LSM53hC0B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <font face="monospace">Thanks for pointing me out to the right
      direction.<br>
      <br>
      Yes, I know, that the perf sources are coming directly from
      kernel. So<br>
    </font>
    <pre wrap="" class="moz-quote-pre">&gt; It seems as though perf recipe depends on the kernel sources too, so
&gt; as it stands, you can't build it natively. I'd directly eliminate the
&gt; target deps (e.g. actually remove them from the recipe, as an
&gt; experiment) and see how far you get with bitbake perf-native.
<font face="monospace" style="white-space: normal;">
</font></pre>
    <font face="monospace" style="white-space: normal;">is not possible.
      But anyway, at the begging I was going with the wrong direction.
      But yes, once I commented-out the section in gcc-cross, I was able
      to compile a nativesdk- variant,<br>
      <br>
      file perf<br>
      perf: ELF 64-bit LSB executable, x86-64, version 1 (SYSV),
      dynamically linked, interpreter
/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-hiltisdk-linux/lib/ld-linux-x86-64.so.2,
      BuildID[sha1]=34bfdb0e321eae26426e45c78c29f63e73ee62d4, for
      GNU/Linux 3.2.0, with debug_info, not stripped<br>
      <br>
      but didn't invest more time in tuning or execution.<br>
    </font>
    <pre wrap="" class="moz-quote-pre">&gt; Also I doubt that perf supports cross-build, meaning analyzing ARM processor counters on x86.
&gt; You may have to match your native host machine with target device maybe to point of exact processor type, not only architecture type.</pre>
    <font face="monospace">I know, that this has to be matching due to
      ABI, unwinding and so on... . On the other hand, if I didn't have
      confirmation, that x86 could in some modes understand arm64
      counters I didn't go in this direction.<br>
      <br>
    </font><font face="monospace" style="white-space: normal;">x86_64
      x86_64 x86_64 GNU/Linux variant of perf<br>
      perf script -i perf.data --symfs rootfs<br>
      unwind: target platform=arm64 is not supported<br>
        systemd-logind     339    65.306223:          1 cycles:P: 
      ffff80008007ff30 [unknown] ([kernel.kallsyms])<br>
        systemd-logind     339    65.306230:          1 cycles:P: 
      ffff80008007ff30 [unknown] ([kernel.kallsyms])<br>
      <br>
      So yes, script or inject modes can do some stuff. So I wanted to
      use the perf binary directly from Yocto and not from host.<br>
      <br>
      Anyway as I mentioned, I found a correct usable way.<br>
      Use qemu-aarch64 for arm binary execution, pass some args and
      voila:<br>
        systemd-logind     341    43.234008:        711 cycles:P: 
      ffff80008007ff30 finish_task_switch.isra.0+0x90
      ([kernel.kallsyms])<br>
        systemd-logind     341    43.234016:        711 cycles:P: 
      ffff80008007ff30 finish_task_switch.isra.0+0x90
      ([kernel.kallsyms])<br>
        systemd-logind     341    43.234020:        711 cycles:P: 
      ffff80008007ff30 finish_task_switch.isra.0+0x90
      ([kernel.kallsyms])<br>
      <br>
      It can fully unwind the stack... .<br>
      <br>
      BR,<br>
      Andy<br>
    </font><br>
    <div class="moz-cite-prefix">On 19.06.2025 10:59, Peter Marko via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:AS1PR10MB569796A8477A0D6B2E8892BBFD7DA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM">
      <pre wrap="" class="moz-quote-pre">What you want to do is not really possible.
Perf recipe does not have its own sources, it only copies sources from kernel and then builds them.
And you cannot depend on target recipe (kernel) in native recipe (perf-native).

Also I doubt that perf supports cross-build, meaning analyzing ARM processor counters on x86.
You may have to match your native host machine with target device maybe to point of exact processor type, not only architecture type.

Peter

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> &lt;openembedded-
<a class="moz-txt-link-abbreviated" href="mailto:core@lists.openembedded.org">core@lists.openembedded.org</a>&gt; On Behalf Of Alexander Kanavin via
lists.openembedded.org
Sent: Thursday, June 19, 2025 10:13
To: Andrej Valek <a class="moz-txt-link-rfc2396E" href="mailto:andrej.v@skyrain.eu">&lt;andrej.v@skyrain.eu&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: Re: [OE-core] perf: nativesdk

On Thu, 19 Jun 2025 at 10:07, Andrej Valek <a class="moz-txt-link-rfc2396E" href="mailto:andrej.v@skyrain.eu">&lt;andrej.v@skyrain.eu&gt;</a> wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">maybe I have to do some more tuning, but what I did:
BBCLASSEXTEND = "native nativesdk"
DEPENDS:remove:class-native = "virtual/${MLPREFIX}libc"

then I run: "bitbake perf-native" and I have the same issue:

ERROR: perf-native-1.0-r0 do_configure: The sstate manifest for task
'linux-libc-headers:populate_sysroot' (multilib variant '') could not be
found.
The pkgarchs considered were: machineA, cortexa53, cortexa53,
armv8a-crc, armv8a, aarch64, allarch, x86_64_x86_64-nativesdk.
But none of these manifests exists:

/home/build/tmp/sstate-control/manifest-machineA-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-cortexa53-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-armv8a-crc-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-armv8a-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-aarch64-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-allarch-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">/home/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-linux-libc-
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">headers.populate_sysroot
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
So nope, it's not working.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
It seems as though perf recipe depends on the kernel sources too, so
as it stands, you can't build it natively. I'd directly eliminate the
target deps (e.g. actually remove them from the recipe, as an
experiment) and see how far you get with bitbake perf-native.

Alex
</pre>
        <br>
        <fieldset class="moz-mime-attachment-header"></fieldset>
        <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#219062): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/219062">https://lists.openembedded.org/g/openembedded-core/message/219062</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/113722107/3619876">https://lists.openembedded.org/mt/113722107/3619876</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:andrej.v@skyrain.eu">andrej.v@skyrain.eu</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------HTGj6InLdFpHwF0LSM53hC0B--

