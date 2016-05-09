Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3C5606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 22:42:14 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d62so19992664iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=04gq3rU4VjnN2n38s27ADU73tr3unBFNVlNsBB66Aco=;
	b=WCJVf2HSYiRGO/oMYM4I/n/2GMOZnUoMtWZEmIlAyvUs9J46SGbIRNQ6tRlYnvZmZt
	B9lGDXqylnQl4dy/YPSmlM0agLPO/M1Jj0Y1TC9dp211JoGTLl5OzUwIYfhuOH8+c7ji
	zeq8vuFLA+X9JuDfDHSmhoTBERwkisrELBT6WvQZWiFbslW09LmhzrwZ6mnl39WpDXrb
	u+PDa0cocfG3r0YyLsDTW3MuXQWVAHPpZqqcQqanOlF9AJrNAEhaUh7bzm9QDqy9TEDT
	UifORolMnB9cDjM+2FxVAjxzveoxb06UfZVDcAnfiVuxMTAE8j5iPWx0YM5Ja3F7w7ev
	pqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=04gq3rU4VjnN2n38s27ADU73tr3unBFNVlNsBB66Aco=;
	b=kvHite3343/OqjP8xQKVjUoJvAFQo0OB/ujE21dHcELSo5CVOrACPUx9yL+XxYy2Y0
	JEAPEZ8zGcNpxiNifgbvAt0lblf12303hq6ThRnx2pcKNziXTOMmjYkD1Z3OPk5z7GFd
	DNvVIR+H6T3S4fCOf+XmQKBE/j/y6eL0DFvmyE4VNtTbE3O/eK6nvHCJglfiXeh0uG+1
	xdZ0pqOg0VP6tfsenFGW3I8xPQr8hIHMXbZc4lON6BxkvDYsu67a6cOW03Q0U/wXLBdB
	zP4lqJ9gsX1Of28hHJQZyQPe8c56bsnSDcyLYKN6T02t0kGU0gkcOkt/XuYrRhtaxR6z
	L0EQ==
X-Gm-Message-State: AOPr4FVMTQScGtZMcTRPQq6sFGvk/pdX7l/nyy2+4bLoJYNBArkJNiy/fhfRJIGw67ObHM+msn9P3DqgBHY28A==
X-Received: by 10.107.2.70 with SMTP id 67mr41560475ioc.70.1462833735199; Mon,
	09 May 2016 15:42:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 9 May 2016 15:41:55 -0700 (PDT)
In-Reply-To: <CABcZAN=yO4rnaGLMvp6pFcAThE+u4AQ5GugPK2Yw-9ZOWufQSQ@mail.gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
	<CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
	<CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
	<1462832190.21831.156.camel@linuxfoundation.org>
	<CABcZAN=yO4rnaGLMvp6pFcAThE+u4AQ5GugPK2Yw-9ZOWufQSQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Mon, 9 May 2016 15:41:55 -0700
Message-ID: <CABcZANnDfYVQY5D5YYOGXCdVoU45Gku_hcA=wOat=6_=f9vrfw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 09 May 2016 22:42:15 -0000
Content-Type: multipart/alternative; boundary=001a1139681426f5980532708529

--001a1139681426f5980532708529
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 3:34 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> On Mon, May 9, 2016 at 3:16 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> On Mon, 2016-05-09 at 09:39 -0700, Christopher Larson wrote:
>> >
>> >
>> > On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro <
>> > juro.bystricky@intel.com> wrote:
>> > > Two additional GNU_HASH related errors were observed (breaking some
>> > > builds) that seem to be related to the patch:
>> > >
>> > > ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in the
>> > > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
>> > > -non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48
>> > > -r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho'
>> > > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
>> > > -autobuilder/yocto-worker/nightly-non
>> > > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
>> > > -split/bash-ptest/usr/lib/bash/ptest/tests/zecho'
>> > > No GNU_HASH in the elf binary: '/home/pokybuild/yocto
>> > > -autobuilder/yocto-worker/nightly-non
>> > > -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packages
>> > > -split/bash-ptest/usr/lib/bash/ptest/tests/printenv' [ldflags]
>> > > ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors.
>> > > Please consider fixing them.
>> > >
>> > >
>> > > ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the
>> > > elf binary: '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly
>> > > -qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1
>> > > -r0/packages-split/service/usr/sbin/skeleton-test' [ldflags]
>> > >
>> > Huh, I must not have had ptest enabled in my test builds. Thanks,
>> > will take a look.
>>
>> The above is an older gplv2 recipe failure which is probably why you
>> didn't see it.
>>
>> I'm afraid there were more. pseudo:
>>
>> https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
>> ds/747/steps/BuildImages_1/logs/stdio
>> <https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/747/steps/BuildImages_1/logs/stdio>
>>
>> qt-x11-free:
>>
>> https://autobuilder.yoctoproject.or
>> g/main/builders/nightly-arm-lsb/builds/734/steps/BuildImages/logs/stdio
>> https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/buil
>> ds/744/steps/BuildImages/logs/stdio
>> <https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/744/steps/BuildImages/logs/stdio>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b
>> uilds/779/steps/BuildImages/logs/stdio
>> <https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/builds/779/steps/BuildImages/logs/stdio>
>>
>> service in qa-skeleton:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/
>> builds/753/steps/BuildImages/logs/stdio
>> <https://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/builds/753/steps/BuildImages/logs/stdio>
>>
>> ruby and mkefiimage:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/build
>> s/104/steps/BuildImages/logs/stdio
>> <https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/104/steps/BuildImages/logs/stdio>
>>
>> (selftest also showed mkefimage failure)
>
>
> I'll take a look asap, unless someone else gets to it first. As mentioned,
> ruby, mkelfimage and one other were already on the list as of last thursday.
>

I have to say, I didn't realize oe-core patches require testing with
meta-qt3. I can't remember the last time I touched qt that old. I'll have
to add more non-core layers to my local testing in the future.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1139681426f5980532708529
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, May 9, 2016 at 3:34 PM, Christopher Larson <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_quo=
te"><div class=3D"adM"><div class=3D"">On Mon, May 9, 2016 at 3:16 PM, Rich=
ard Purdie <span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoun=
dation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span>On Mon, 2016-05-09 at 0=
9:39 -0700, Christopher Larson wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, May 9, 2016 at 9:35 AM, Bystricky, Juro &lt;<br>
&gt; <a href=3D"mailto:juro.bystricky@intel.com" target=3D"_blank">juro.bys=
tricky@intel.com</a>&gt; wrote:<br>
&gt; &gt; Two additional GNU_HASH related errors were observed (breaking so=
me<br>
&gt; &gt; builds) that seem to be related to the patch:<br>
&gt; &gt;<br>
&gt; &gt; ERROR: bash-3.2.48-r11 do_package_qa: QA Issue: No GNU_HASH in th=
e<br>
&gt; &gt; elf binary: &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly<br>
&gt; &gt; -non-gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48<br>
&gt; &gt; -r11/packages-split/bash-ptest/usr/lib/bash/ptest/tests/recho&#39=
;<br>
&gt; &gt; No GNU_HASH in the elf binary: &#39;/home/pokybuild/yocto<br>
&gt; &gt; -autobuilder/yocto-worker/nightly-non<br>
&gt; &gt; -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packag=
es<br>
</span>&gt; &gt; -split/bash-ptest/usr/lib/bash/ptest/tests/zecho&#39;<br>
<span>&gt; &gt; No GNU_HASH in the elf binary: &#39;/home/pokybuild/yocto<b=
r>
&gt; &gt; -autobuilder/yocto-worker/nightly-non<br>
&gt; &gt; -gpl3/build/build/tmp/work/i586-poky-linux/bash/3.2.48-r11/packag=
es<br>
</span><span>&gt; &gt; -split/bash-ptest/usr/lib/bash/ptest/tests/printenv&=
#39; [ldflags]<br>
&gt; &gt; ERROR: bash-3.2.48-r11 do_package_qa: QA run found fatal errors.<=
br>
&gt; &gt; Please consider fixing them.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; ERROR: service-0.1-r0 do_package_qa: QA Issue: No GNU_HASH in the=
<br>
&gt; &gt; elf binary: &#39;/home/pokybuild/yocto-autobuilder/yocto-worker/n=
ightly<br>
&gt; &gt; -qa-skeleton/build/build/tmp/work/core2-64-poky-linux/service/0.1=
<br>
&gt; &gt; -r0/packages-split/service/usr/sbin/skeleton-test&#39; [ldflags]<=
br>
&gt; &gt;<br>
&gt; Huh, I must not have had ptest enabled in my test builds. Thanks,<br>
&gt; will take a look.<br>
<br>
</span>The above is an older gplv2 recipe failure which is probably why you=
<br>
didn&#39;t see it.<br>
<br>
I&#39;m afraid there were more. pseudo:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/build-applian=
ce/builds/747/steps/BuildImages_1/logs/stdio" rel=3D"noreferrer" target=3D"=
_blank">https://autobuilder.yoctoproject.org/main/builders/build-appliance/=
buil<br>
ds/747/steps/BuildImages_1/logs/stdio</a><br>
<br>
qt-x11-free:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.or" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.or</a><br>
g/main/builders/nightly-arm-lsb/builds/734/steps/BuildImages/logs/stdio<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-l=
sb/builds/744/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_b=
lank">https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/bu=
il<br>
ds/744/steps/BuildImages/logs/stdio</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-x86-6=
4-lsb/builds/779/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D=
"_blank">https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-=
lsb/b<br>
uilds/779/steps/BuildImages/logs/stdio</a><br>
<br>
service in qa-skeleton:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-qa-sk=
eleton/builds/753/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=
=3D"_blank">https://autobuilder.yoctoproject.org/main/builders/nightly-qa-s=
keleton/<br>
builds/753/steps/BuildImages/logs/stdio</a><br>
<br>
ruby and mkefiimage:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-no-x1=
1/builds/104/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/buil=
d<br>
s/104/steps/BuildImages/logs/stdio</a><br>
<br>
(selftest also showed mkefimage failure)</blockquote><div><br></div></div><=
/div><div>I&#39;ll take a look asap, unless someone else gets to it first. =
As mentioned, ruby, mkelfimage and one other were already on the list as of=
 last thursday.</div></div></blockquote></div><br>I have to say, I didn&#39=
;t realize oe-core patches require testing with meta-qt3. I can&#39;t remem=
ber the last time I touched qt that old. I&#39;ll have to add more non-core=
 layers to my local testing in the future.<br>-- <br><div class=3D"gmail_si=
gnature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senio=
r Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1139681426f5980532708529--
