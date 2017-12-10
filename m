Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE4FA605BE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 17:44:40 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id d4so32671102qtj.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Dec 2017 09:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0WF2KLw4sIcJrNVtMJ2F19XprZLyP2N6DXSZKdpToHs=;
	b=o39sO7A4qDnpbvVJHLY1sSHgV758gPLqJiVhqmA6Sm4VMuNngsqj1CXk9L/z1Qgo0u
	Z1f2pNe4k8fl8g033093W91t/iq8IgK6Nn763MVPjb4KlkdlfnTuxq8AWLnsiXNC0fah
	17d5NKQ6S4ZEaRNAmHQLBYcmSqiT3e1pQ4Myk14NI66UN60AgTgkv4oQx7AOKwUcH/sF
	mSWbvdZwYl9xv7qj63YAmE89NVuNHOetPSXDTt43NeypwDkt02KxFOC4OpKkWZT9Zofo
	nevq0jz1o0NQik31uz3HAeFmLMxyvD7hjdyM+L9/U1WKdwyN2vFX70lwiby3WzQJL9vE
	BlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0WF2KLw4sIcJrNVtMJ2F19XprZLyP2N6DXSZKdpToHs=;
	b=NXyXCnq6fGDQoLYYPsZOdftj1M4yZdEy3egmfxQNS/P8BJZoD4GsgkNlCJOGBeXR0b
	OSWJM2frP2olHcpY7ojn6B5OnSIHIQWev+baOHmrSgGd04tdvuWuFrg8DsUAnon1LVLI
	8Pu90ezAOfAqL2UxCarGphbirNpTgINrBui07hf83uuV7cYucgPBbqUHNEAq5vVW5HoO
	kvpU1ujRmdwUqFZtkH8RdYiq8jCaXNEmH0ZAgKe1NypSwKpT+NR3Z90SOljGNtu9GpCq
	kFvfJzf16mrN4YNcLA988cUngMKkPh2zQLQm6W29tYq5mTPdvkaFreEGLS/LZTwAnO/k
	QCJw==
X-Gm-Message-State: AKGB3mJXawrpaM9hjeR0Ry/jRnVUKL59WerbSktIAun9JJWza6aS8D0a
	aCEGOblEhlFl7vc7OT87ABptW405GN4RhdtDEEo=
X-Google-Smtp-Source: AGs4zMailexLHVBcgB/9uhP6g/fMhz5XfDxRUPYsPeJ9JtjHapQUc96X/0aLTh9gUKHmRJi7m/xITOowdT942b2jgJc=
X-Received: by 10.55.195.216 with SMTP id r85mr40941669qkl.218.1512927881369; 
	Sun, 10 Dec 2017 09:44:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 10 Dec 2017 09:44:40 -0800 (PST)
In-Reply-To: <1512909166.19417.134.camel@linuxfoundation.org>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<1512909166.19417.134.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 10 Dec 2017 12:44:40 -0500
Message-ID: <CADkTA4OXHDADg=LHcjQ3DknbMEN=62NTDjuik2jWt=CxQhvznw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Wold,
	Saul" <saul.wold@intel.com>
Subject: Re: [PATCH 0/8] kernel-yocto: consolidated pull request
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
X-List-Received-Date: Sun, 10 Dec 2017 17:44:40 -0000
Content-Type: multipart/alternative; boundary="001a1146ef26f09da8055ffff866"

--001a1146ef26f09da8055ffff866
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 10, 2017 at 7:32 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2017-12-04 at 10:39 -0500, Bruce Ashfield wrote:
> > Here is the latest set of kernel updates and bug fixes to the kernel-
> > yocto
> > build.
> >
> > The 4.9 and 4.12 updates are routine -stable updates. I realize we
> > are
> > still fighting some boot/hang issues with 4.12, but I didn't see any
> > new issues with the 4.12 updates, so I included them in this pull
> > request.
> >
> > I've also included Saul's in-tree defconfig fixes + one additional
> > patch
> > of my own.
> >
> > I also bump linux-yocto-dev to 4.15-rcX, which brought in some build
> > issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I've
> > added the new dependencies directly in the linux-yocto-dev recipe,
> > but
> > they will very likely have to move lower into the stack over time.
> >
> > I have some additional, structural changes that are coming shortly,
> > but I'm traveling for the next 5 days and will send them when I
> > return.
>
> I tried this series, minus the -dev kernel change in -next and we see:
>
> https://autobuilder.yocto.io/builders/nightly-oe-selftest/
> builds/676/steps/Running%20oe-selftest/logs/stdio
>
> The duplicate logging bug makes it hard to read but the key takeaway is:
>
> 2017-12-09 10:49:53,667 - oe-selftest - INFO - Ran 317 tests in 14099.939s
> 2017-12-09 10:49:53,667 - oe-selftest - INFO -  (failures=16, skipped=1)
>
> I can reproduce easily with:
>
> oe-selftest -r runqemu.RunqemuTests.test_boot_deploy
>

I checked the wiki and didn't find a good reference on how to enable this.
I tried
to run the command here, and got an immediate error.

Is there a link I can use as a reference ? Either my build or runtime env
is messed up.

If i can get this up and running, I'll add the oe-selftests to my local
sanity loop.

Bruce


>
> which fails locally too. If I revert "linux-yocto/4.12: update to
> v4.12.16" it works.
>
> The test checks if it can login over the serial port so I'm guessing
> some serial driver either got turned off or regressed?
>
> Cheers,
>
> Richard
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

--001a1146ef26f09da8055ffff866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Dec 10, 2017 at 7:32 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><span class=3D"">On Mon, 2017-12-04 at 10:39 -0500, Bruce Ash=
field wrote:<br>
&gt; Here is the latest set of kernel updates and bug fixes to the kernel-<=
br>
&gt; yocto<br>
&gt; build.<br>
&gt;<br>
&gt; The 4.9 and 4.12 updates are routine -stable updates. I realize we<br>
&gt; are<br>
&gt; still fighting some boot/hang issues with 4.12, but I didn&#39;t see a=
ny<br>
&gt; new issues with the 4.12 updates, so I included them in this pull<br>
&gt; request.<br>
&gt;<br>
&gt; I&#39;ve also included Saul&#39;s in-tree defconfig fixes + one additi=
onal<br>
&gt; patch<br>
&gt; of my own.<br>
&gt;<br>
&gt; I also bump linux-yocto-dev to 4.15-rcX, which brought in some build<b=
r>
&gt; issues due to x86 ORC_UNWINDER changes, and ssl cert generation. I&#39=
;ve<br>
&gt; added the new dependencies directly in the linux-yocto-dev recipe,<br>
&gt; but<br>
&gt; they will very likely have to move lower into the stack over time.<br>
&gt;<br>
&gt; I have some additional, structural changes that are coming shortly,<br=
>
&gt; but I&#39;m traveling for the next 5 days and will send them when I<br=
>
&gt; return.<br>
<br>
</span>I tried this series, minus the -dev kernel change in -next and we se=
e:<br>
<br>
<a href=3D"https://autobuilder.yocto.io/builders/nightly-oe-selftest/builds=
/676/steps/Running%20oe-selftest/logs/stdio" rel=3D"noreferrer" target=3D"_=
blank">https://autobuilder.yocto.io/<wbr>builders/nightly-oe-selftest/<wbr>=
builds/676/steps/Running%20oe-<wbr>selftest/logs/stdio</a><br>
<br>
The duplicate logging bug makes it hard to read but the key takeaway is:<br=
>
<br>
2017-12-09 10:49:53,667 - oe-selftest - INFO - Ran 317 tests in 14099.939s<=
br>
2017-12-09 10:49:53,667 - oe-selftest - INFO -=C2=A0=C2=A0(failures=3D16, s=
kipped=3D1)<br>
<br>
I can reproduce easily with:<br>
<br>
oe-selftest -r runqemu.RunqemuTests.test_<wbr>boot_deploy<br></blockquote><=
div><br></div><div>I checked the wiki and didn&#39;t find a good reference =
on how to enable this. I tried</div><div>to run the command here, and got a=
n immediate error.</div><div><br></div><div>Is there a link I can use as a =
reference ? Either my build or runtime env is messed up.</div><div><br></di=
v><div>If i can get this up and running, I&#39;ll add the oe-selftests to m=
y local sanity loop.</div><div><br></div><div>Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
which fails locally too.=C2=A0If I revert &quot;linux-yocto/4.12: update to=
<br>
v4.12.16&quot; it works.<br>
<br>
The test checks if it can login over the serial port so I&#39;m guessing<br=
>
some serial driver either got turned off or regressed?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--001a1146ef26f09da8055ffff866--
