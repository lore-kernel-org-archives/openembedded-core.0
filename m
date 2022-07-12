Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AFDC433EF
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 20:26:21 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.14285.1657657580286945208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 13:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=Qrl16z9R;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id EAA9F204DE83;
	Tue, 12 Jul 2022 13:26:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EAA9F204DE83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657657579;
	bh=P0pl6UUi3mi2Rp899FRCreJdcdM3xBzPjZWw24/zHig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qrl16z9R75mvP8+9xEddJt4/z29GiNysKnJQYzWP1MiIniYyfHJd+WMNA/unMyzbV
	 S7icucJK+WVleAM3qtRYtzu+9IYSsyp3mS3t0kMnNT8wSp0HzbPHhLy8IiemCyWqdw
	 +S0Qpmh30veZ3MyilOUHXQYAGPKwrHvkaDPk85Ow=
Content-Type: multipart/alternative;
 boundary="------------BQReMhbWUTwgo1BIT1CGsMzC"
Message-ID: <92b5fb18-1394-2f95-7ab9-42a5fb6ab64d@linux.microsoft.com>
Date: Tue, 12 Jul 2022 14:26:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] Reproducible build issues with buildpaths - take 2
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alejandro Hernandez Samaniego <Alejandro.Hernandez@microsoft.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <7140b61c92f4f9d79b8c8b8d9be68f127512b758.camel@linuxfoundation.org>
 <CADkTA4O0Ej3HKMPtwoq_iBue2P43gicwx8rfFKyLY5d3jNTP_A@mail.gmail.com>
 <77dd3defcb6908755d06585d4cfb69a523626a22.camel@linuxfoundation.org>
 <17009EE9B42D5D4F.21011@lists.openembedded.org>
 <1700A558F3D5D3E4.14864@lists.openembedded.org>
 <CADkTA4P=BDAYiZUCN+hhqpyUUAoOckX+RMphyZiwmci3nFrkOA@mail.gmail.com>
 <ce91dc24e3a6d7c011c6b3f0bb79ac404f597a1f.camel@linuxfoundation.org>
 <CADkTA4M8NQgNNodsSnQdPRLfHLWrJAPfdzzmZgNoYxV9bP8JJw@mail.gmail.com>
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: 
 <CADkTA4M8NQgNNodsSnQdPRLfHLWrJAPfdzzmZgNoYxV9bP8JJw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 20:26:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167941

This is a multi-part message in MIME format.
--------------BQReMhbWUTwgo1BIT1CGsMzC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/12/22 06:31, Bruce Ashfield wrote:
> On Tue, Jul 12, 2022 at 6:44 AM Richard Purdie
> <richard.purdie@linuxfoundation.org>  wrote:
>> On Mon, 2022-07-11 at 00:06 -0300, Bruce Ashfield wrote:
>>> On Sun, Jul 10, 2022 at 11:27 PM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=gmail.com@lists.openembedded.org>  wrote:
>>>> On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
>>>> lists.openembedded.org
>>>> <bruce.ashfield=gmail.com@lists.openembedded.org>  wrote:
>>>>> On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
>>>>> <richard.purdie@linuxfoundation.org>  wrote:
>>>>>> On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
>>>>>>> On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
>>>>>>> <richard.purdie@linuxfoundation.org>  wrote:
>>>>>>>> Hi All,
>>>>>>>>
>>>>>>>> We've made good progress and I appreciate the help from people. I ran a
>>>>>>>> fresh build on the autobuilder and I forced it to rerun the QA checks
>>>>>>>> for all recipes. The tricky bit about warnings is that they don't show
>>>>>>>> up for objects from sstate and the addition of the buildpaths QA check
>>>>>>>> doesn't cause the checks to rerun. Due to that a few more previsouly
>>>>>>>> unseen issues cropped up.
>>>>>>>>
>>>>>>>> The list of issues now stands are:
>>>>>>>>
>>>>>>>> qemuppc:
>>>>>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428
>>>>>>>> WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
>>>>>>> I'll take this one. My fix was only for arch/arm, but I'll expand it
>>>>>>> to cover ppc32.
>>>>>> Thanks.
>>>>>>
>>>>>> I built qemuppc locally and got a different failure, I'd really like to
>>>>>> know why I saw that and the autobuilder did not. The failure was:
>>>>>>
>>>>>> WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>>>>>> File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR [buildpaths]
>>>>> I have the devsrc fixed for qeumppc32, fix incoming shortly.
>>>>>
>>>>> But for this one, I don't see it either. What do I need to enable to
>>>>> get the linux-yocto-src package ? Mine is empty, hence no warning. Is
>>>>> it one of the archiver modes ?
>>>> I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
>>>> for the conmakehash issue, I'll have a look at oid_registry next.
>>>
>>> oid_registry is a perl script .. also capturing the full path of the
>>> executable. I did a similar fix for linux-yocto 5.15 and used
>>> 'basename' versus the whole path.
>>>
>>> If these hold up, we can expand the versions that get the fix.
>> Thanks. I spent a bit of time working out why I was seeing things the
>> autobuilder wasn't. It turns out:
>>
>> https://git.yoctoproject.org/poky/commit/?id=c725bdb29b2669e53ea0f9d30f9683f094c9b326
>>
>> broke kernel source handling (and hence SPDX license handling for the
>> kernel too). I was using an older build where that wasn't present,
>> hence I saw more kernel errors.

Sorry about this, I will take a closer look on how we can fix the src paths with externalsrc without these breakages,
but reverting is probably the right path to take at the moment.

Alejandro


>>
>> With your fixes and the above reverted, I ran another build overnight
>> and in that we saw:
>>
>> beaglebone:
>> WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0/linux-beaglebone_yocto-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR
>>
>> beaglebone-alt:
>> stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0/linux-beaglebone_yocto-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>>
>> edgerouter:
>> stdio: WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0/linux-edgerouter-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR
>>
>> edgerouter-alt:
>> stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0/linux-edgerouter-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR
>>
>> meta-intel:
>> tdio: WARNING: linux-intel-5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-intel/5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0/linux-corei7-64-intel-common-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-intel-src contains reference to TMPDIR
>>
>> qemumips-alt:
>> tdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0/linux-qemumips-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>>
>> qemuppc-alt:
>> stdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
>>
>> so thankfully that looks like the two errors we know about spread over
>> different kernel versions. I think a version bump for yocto-bsp would
>> fix some of them and backports to 5.10 some of the others?
> Yup, my fixes should hold for those as well.
>
> I'll send bumps to 5.10 and the BSPs this morning.
>
> Bruce
>
>> I'm sharing the full info in case you spot any patterns I don't! :)
>>
>> In summary, we're down to these and the lttng-modules issue which
>> appears when we start checking .debug files in buildpaths (patch added
>> and reverted in master-next currently).
>>
>> Cheers,
>>
>> Richard
>>
>>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167925):https://lists.openembedded.org/g/openembedded-core/message/167925
> Mute This Topic:https://lists.openembedded.org/mt/92248896/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------BQReMhbWUTwgo1BIT1CGsMzC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/12/22 06:31, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4M8NQgNNodsSnQdPRLfHLWrJAPfdzzmZgNoYxV9bP8JJw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">On Tue, Jul 12, 2022 at 6:44 AM Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On Mon, 2022-07-11 at 00:06 -0300, Bruce Ashfield wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Sun, Jul 10, 2022 at 11:27 PM Bruce Ashfield via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.openembedded.org">&lt;bruce.ashfield=gmail.com@lists.openembedded.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">
On Sun, Jul 10, 2022 at 9:29 PM Bruce Ashfield via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:bruce.ashfield=gmail.com@lists.openembedded.org">&lt;bruce.ashfield=gmail.com@lists.openembedded.org&gt;</a> wrote:
</pre>
            <blockquote type="cite">
              <pre class="moz-quote-pre" wrap="">
On Fri, Jul 8, 2022 at 10:47 AM Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
              <blockquote type="cite">
                <pre class="moz-quote-pre" wrap="">
On Fri, 2022-07-08 at 09:37 -0400, Bruce Ashfield wrote:
</pre>
                <blockquote type="cite">
                  <pre class="moz-quote-pre" wrap="">On Fri, Jul 8, 2022 at 7:07 AM Richard Purdie
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a> wrote:
</pre>
                  <blockquote type="cite">
                    <pre class="moz-quote-pre" wrap="">
Hi All,

We've made good progress and I appreciate the help from people. I ran a
fresh build on the autobuilder and I forced it to rerun the QA checks
for all recipes. The tricky bit about warnings is that they don't show
up for objects from sstate and the addition of the buildpaths QA check
doesn't cause the checks to rerun. Due to that a few more previsouly
unseen issues cropped up.

The list of issues now stands are:

qemuppc:
<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428">https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5428</a>
WARNING: kernel-devsrc-1.0-r0 do_package_qa: QA Issue: File /lib/modules/5.15.48-yocto-standard/build/include/generated/.vdso32-offsets.h.cmd in package kernel-devsrc contains reference to TMPDIR [buildpaths]
</pre>
                  </blockquote>
                  <pre class="moz-quote-pre" wrap="">
I'll take this one. My fix was only for arch/arm, but I'll expand it
to cover ppc32.
</pre>
                </blockquote>
                <pre class="moz-quote-pre" wrap="">
Thanks.

I built qemuppc locally and got a different failure, I'd really like to
know why I saw that and the autobuilder did not. The failure was:

WARNING: linux-yocto-5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR
File /usr/src/debug/linux-yocto/5.15.48+gitAUTOINC+b35d1d1e83_5aa3abf07b-r0/linux-qemuppc-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR [buildpaths]
</pre>
              </blockquote>
              <pre class="moz-quote-pre" wrap="">
I have the devsrc fixed for qeumppc32, fix incoming shortly.

But for this one, I don't see it either. What do I need to enable to
get the linux-yocto-src package ? Mine is empty, hence no warning. Is
it one of the archiver modes ?
</pre>
            </blockquote>
            <pre class="moz-quote-pre" wrap="">
I sent a series with a fix for qemuppc32 kernel-devsrc and a WIP fix
for the conmakehash issue, I'll have a look at oid_registry next.
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">

oid_registry is a perl script .. also capturing the full path of the
executable. I did a similar fix for linux-yocto 5.15 and used
'basename' versus the whole path.

If these hold up, we can expand the versions that get the fix.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Thanks. I spent a bit of time working out why I was seeing things the
autobuilder wasn't. It turns out:

<a class="moz-txt-link-freetext" href="https://git.yoctoproject.org/poky/commit/?id=c725bdb29b2669e53ea0f9d30f9683f094c9b326">https://git.yoctoproject.org/poky/commit/?id=c725bdb29b2669e53ea0f9d30f9683f094c9b326</a>

broke kernel source handling (and hence SPDX license handling for the
kernel too). I was using an older build where that wasn't present,
hence I saw more kernel errors.</pre>
      </blockquote>
    </blockquote>
    <pre>Sorry about this, I will take a closer look on how we can fix the src paths with externalsrc without these breakages,
but reverting is probably the right path to take at the moment.</pre>
    <pre>
</pre>
    <pre>Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:CADkTA4M8NQgNNodsSnQdPRLfHLWrJAPfdzzmZgNoYxV9bP8JJw@mail.gmail.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">

With your fixes and the above reverted, I ran another build overnight
and in that we saw:

beaglebone:
WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe59e7_4c875cf137-r0/linux-beaglebone_yocto-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR

beaglebone-alt:
stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+5b3dacac6f_8038166b72-r0/linux-beaglebone_yocto-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR

edgerouter:
stdio: WARNING: linux-yocto-5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.15.36+gitAUTOINC+f122fe59e7_b978686694-r0/linux-edgerouter-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR

edgerouter-alt:
stdio: WARNING: linux-yocto-5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.113+gitAUTOINC+5b3dacac6f_43577894d2-r0/linux-edgerouter-standard-build/lib/oid_registry_data.c in package linux-yocto-src contains reference to TMPDIR

meta-intel:
tdio: WARNING: linux-intel-5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-intel/5.15.43+gitAUTOINC+ea948a0983_1ec5959a8f-r0/linux-corei7-64-intel-common-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-intel-src contains reference to TMPDIR

qemumips-alt:
tdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+5b3dacac6f_cdec08a505-r0/linux-qemumips-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR

qemuppc-alt:
stdio: WARNING: linux-yocto-5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0 do_package_qa: QA Issue: File /usr/src/debug/linux-yocto/5.10.128+gitAUTOINC+5b3dacac6f_c0821a7ab5-r0/linux-qemuppc-standard-build/drivers/tty/vt/consolemap_deftbl.c in package linux-yocto-src contains reference to TMPDIR

so thankfully that looks like the two errors we know about spread over
different kernel versions. I think a version bump for yocto-bsp would
fix some of them and backports to 5.10 some of the others?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Yup, my fixes should hold for those as well.

I'll send bumps to 5.10 and the BSPs this morning.

Bruce

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I'm sharing the full info in case you spot any patterns I don't! :)

In summary, we're down to these and the lttng-modules issue which
appears when we start checking .debug files in buildpaths (patch added
and reverted in master-next currently).

Cheers,

Richard


</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#167925): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/167925">https://lists.openembedded.org/g/openembedded-core/message/167925</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92248896/4354175">https://lists.openembedded.org/mt/92248896/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------BQReMhbWUTwgo1BIT1CGsMzC--

