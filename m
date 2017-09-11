Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7366071A35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 13:19:14 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id c82so9670163vkd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 06:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+zmRsB10yKpldDOxCV4bH12Tc89rjQgE+UsgXRKXDQ8=;
	b=sBmqQN8XWMFrQil6PLDsVokTOrQjOGt2M0hZGb8VQ7Ex7dVDIEIdUoOdoGvTzwr1Rz
	dGnigR7QtGJ+pAMPaDcqURgAbVNL7wcDQxVwSAWFIahRkrnJ/wIOb1Akujfi/4t49RCu
	8ljbXfvI0kA7dNawyZ/BvwxiOvSIDqifkvwJP6W/VS/keuqVe+bqwpsfg5QcCe4J5EE9
	b8WfNSvHLSHALOhl8dGi8/wq8I8kmBNde1SP/mM56amrlvyM+bwWsUIw777S6WuksQLg
	DNXHjL+p+OQMFocZaW2Ei2/Iob/Wzr9/HooUHDiHW8xg9ijj4NXMIl2LXX8l2Ti7bUib
	6V7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+zmRsB10yKpldDOxCV4bH12Tc89rjQgE+UsgXRKXDQ8=;
	b=M/bh5FJZ9kOCbtmy8LsEqY7i9XfINpjG9dLMndjQU1a0fXSvMnFGNiPme/E/uVODTD
	jBnM5/wVA9cUkegB1PDdSxdQ/ka1NbKbdEMzG/sU4TRltYMPoVFEQA473pOrMnK5LOwJ
	Xc4dEZBCza57vaSbACqzMeRxamtNSQSoN8uCTvWwKty55YIr1cLMkgJ3anNI7KWL8BvN
	Ou7hVDTo/dXN8Y6+xs6VLbmicSWNafEtzlo4YSCkJNCtBfzxhuaA8gE+XoYwxqTG2fi2
	OSMlSc+yNydMhF85swwNr+N0Jy7lQE1066LmG8GKXoWPRIvbr535pYQXO5Re1lr1TJuL
	1clg==
X-Gm-Message-State: AHPjjUg2pANXQs8UUXr/ZsYp8DiWbsjkd3YkAOS22GRQRYay5ZtqPFb6
	L6qEKzR7F0FNIYC8uRECBbjP+HkQkw==
X-Google-Smtp-Source: AOwi7QA+6sU69AYjNmdwS9apvKyyL0KhW+/y3bt9iNEu3t9ldymdZJ2GZvSECE+K/57M2rAM31xB/jC7Z4KGMn8eo4o=
X-Received: by 10.31.164.2 with SMTP id n2mr3320541vke.144.1505135955262; Mon,
	11 Sep 2017 06:19:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.34.235 with HTTP; Mon, 11 Sep 2017 06:19:14 -0700 (PDT)
In-Reply-To: <1505119726.9633.18.camel@intel.com>
References: <1505119726.9633.18.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Sep 2017 09:19:14 -0400
Message-ID: <CADkTA4Nbg3ammUYUKzbygchTDHyc3DYj1it_LniGeOJUMOkPcA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: hidraw support in the kernel(s)
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
X-List-Received-Date: Mon, 11 Sep 2017 13:19:14 -0000
Content-Type: multipart/alternative; boundary="001a114166f0f3bfd10558e9c5c2"

--001a114166f0f3bfd10558e9c5c2
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 11, 2017 at 4:48 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> Hello!
>
> I am currently trying to get fwupd [1] working. For updating a Lenovo
> Unifying Dongle (the USB thingie which connects to wireless mice and
> keyboards), the kernel has to support hidraw, aka CONFIG_HIDRAW,
> otherwise fwupd does not find the dongle.
>
> http://www.signal11.us/oss/udev/ is an article that seems to explain
> the underlying API used by fwupd. Other apps might also need it. The
> recommendation is to enable it unless there are reasons not to do so:
> http://cateee.net/lkddb/web-lkddb/HIDRAW.html
>
> So is there a reason why CONFIG_HIDRAW is disabled in linux-intel and
> (presumably, I haven't checked) linux-yocto for intel-corei7-64?
>

The only reason it wouldn't be enabled is simply that we haven't had a
use case for it (up until now), and (for the most part) anything that isn't
strictly needed (or has a known peripheral) is disabled to keep the default
kernel's smaller.

For this option, it doesn't add much size to the kernel, has broad arch
support and could be generally useful .. so there really isn't much of an
issue enabling it in the core configs.

A lot of the HID enablement is currently in BSP fragments, but that tends
to limit their ability to be reused.


>
> What would be the right way of enabling it? On by default as part of
> some existing kernel feature perhaps? Or a new feature?
>

There are several features that already deal with HID devices, so it could
be added there (i.e. features/iio/iio.cfg) done there, or create a similar
feature
if there's a reason do not enable what is in the existing fragments when
this
one is used.

Once the option is in a fragment, it is a matter of just ensuring that
either a
ktype (i.e. standard) includes it, if we want it everywhere .. or the
relevant
BSPs include it if you want to limit it.

And finally, KERNEL_FEATURES are available if you want it to be optionally
enabled via a kernel recipe.

Cheers,

Bruce


>
> --
> Best Regards, Patrick Ohly
>
> The content of this message is my personal opinion only and although
> I am an employee of Intel, the statements I make here in no way
> represent Intel's position on the issue, nor am I authorized to speak
> on behalf of Intel on this matter.
>
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114166f0f3bfd10558e9c5c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Sep 11, 2017 at 4:48 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a =
href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello!<br>
<br>
I am currently trying to get fwupd [1] working. For updating a Lenovo<br>
Unifying Dongle (the USB thingie which connects to wireless mice and<br>
keyboards), the kernel has to support hidraw, aka CONFIG_HIDRAW,<br>
otherwise fwupd does not find the dongle.<br>
<br>
<a href=3D"http://www.signal11.us/oss/udev/" rel=3D"noreferrer" target=3D"_=
blank">http://www.signal11.us/oss/<wbr>udev/</a> is an article that seems t=
o explain<br>
the underlying API used by fwupd. Other apps might also need it. The<br>
recommendation is to enable it unless there are reasons not to do so:<br>
<a href=3D"http://cateee.net/lkddb/web-lkddb/HIDRAW.html" rel=3D"noreferrer=
" target=3D"_blank">http://cateee.net/lkddb/web-<wbr>lkddb/HIDRAW.html</a><=
br>
<br>
So is there a reason why CONFIG_HIDRAW is disabled in linux-intel and<br>
(presumably, I haven&#39;t checked) linux-yocto for intel-corei7-64?<br></b=
lockquote><div><br></div><div>The only reason it wouldn&#39;t be enabled is=
 simply that we haven&#39;t had a=C2=A0</div><div>use case for it (up until=
 now), and (for the most part) anything that isn&#39;t</div><div>strictly n=
eeded (or has a known peripheral) is disabled to keep the default</div><div=
>kernel&#39;s smaller.</div><div><br></div><div>For this option, it doesn&#=
39;t add much size to the kernel, has broad arch</div><div>support and coul=
d be generally useful .. so there really isn&#39;t much of an</div><div>iss=
ue enabling it in the core configs.</div><div><br></div><div>A lot of the H=
ID enablement is currently in BSP fragments, but that tends</div><div>to li=
mit their ability to be reused.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
What would be the right way of enabling it? On by default as part of<br>
some existing kernel feature perhaps? Or a new feature?<br></blockquote><di=
v><br></div><div>There are several features that already deal with HID devi=
ces, so it could</div><div>be added there (i.e. features/iio/iio.cfg) done =
there, or create a similar feature</div><div>if there&#39;s a reason do not=
 enable what is in the existing fragments when this</div><div>one is used.<=
/div><div><br></div><div>Once the option is in a fragment, it is a matter o=
f just ensuring that either a</div><div>ktype (i.e. standard) includes it, =
if we want it everywhere .. or the relevant</div><div>BSPs include it if yo=
u want to limit it.</div><div><br></div><div>And finally, KERNEL_FEATURES a=
re available if you want it to be optionally</div><div>enabled via a kernel=
 recipe.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Best Regards, Patrick Ohly<br>
<br>
The content of this message is my personal opinion only and although<br>
I am an employee of Intel, the statements I make here in no way<br>
represent Intel&#39;s position on the issue, nor am I authorized to speak<b=
r>
on behalf of Intel on this matter.<br>
<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a114166f0f3bfd10558e9c5c2--
