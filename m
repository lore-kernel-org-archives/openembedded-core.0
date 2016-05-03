Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDBC7017D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 02:53:46 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id rc4so862926igc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 19:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gDs2WkIeYG66A6wMaRnyK478v2V9bKy7sQwwkSIxyJY=;
	b=mRMD6JoFXYxBFeoSueQQS9D6vSG8RI/VBeoVQeU3Exeg9mOORxnjC+UpMzArjePXD/
	MuwxTPWHf1yur2xbLPRd11Dc1U7xpX1L28RyA+n4RlvOKCx9W47pyThLHsNewIpZWHpM
	zo/J9/dy6GabCSI+hWwpYq/uPfuEEPjZcJR1T/pV6zhfaldh1dOWfQDAEOVXHSn19GmQ
	H5sV5dF8B/5+XNsIE94DwkIpUCbnBH7Z53xi/e1JmFZuOSQrx3wx4t/vBYIOqgggqzKE
	ndY8iS+n66/4tmiYShXydI6rHinpH6cvBxIRntDd/w0k6HGFnx+jcEnJlVMjVochLchW
	xjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gDs2WkIeYG66A6wMaRnyK478v2V9bKy7sQwwkSIxyJY=;
	b=MXfbiJqxxnPCDhA1w3Kpj18wkVSLxewWr6nbJJpyDcBS9r9Yz7wJBcxNDTvCEXdlP5
	VPCuyxPsOANdhJZHpTOaMMk4oO/i2+8CLY0st3hBOLWsjlhrPrYqEQlrv+os9fXunkW3
	/gi2sXWx6Kr4jL2rXq7rLTLgRXCZokP8Bdvs7fsRBD4ZWz7rR1SG5DQCLkKCQJ8DQtoL
	aZPDbEHFKqajcvvmOIj4PeIjMz3JiALdKaxE/GtJXTWCijUISx+1Zt0tfpPN5HoFA+UO
	13XUU0IB+6OsZAGFPwcLB8d4ebxYYwilx5fPHdpXaYjFMpaBtmgVEiPk0dehhLwYRNul
	62tQ==
X-Gm-Message-State: AOPr4FXcKDBQBu4e1bX975wsr/LwYj8VphOFl5lUhfiobPjKsdDjuJOyIM33ffBmGciHAK63pY98HEDAzKWilQ==
X-Received: by 10.50.227.174 with SMTP id sb14mr594539igc.20.1462244027071;
	Mon, 02 May 2016 19:53:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.134.70 with HTTP; Mon, 2 May 2016 19:53:27 -0700 (PDT)
In-Reply-To: <A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 3 May 2016 02:53:27 +0000
Message-ID: <CABcZANmsD5jjnZzXaUGa+5Ea7MTrkfn=mR7xeH35De8CQwLMEw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 May 2016 02:53:47 -0000
Content-Type: multipart/alternative; boundary=f46d04289d01cf02580531e73705

--f46d04289d01cf02580531e73705
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2016 at 9:37 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> On May 2, 2016, at 1:37 PM, Christopher Larson <kergoth@gmail.com> wrote:
>
>
>
> On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>>
>> > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com>
>> wrote:
>> >
>> > From: Christopher Larson <chris_larson@mentor.com>
>> >
>> > We explicitly set the hash style to gnu in our LDFLAGS. Setting the
>> default to
>> > this in the toolchain, while convenient, actually hides bugs, as a
>> failure to
>> > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to
>> how we
>> > poison the sysroot -- rather than relying on the default, notice right
>> away if
>> > somoeone isn't obeying the needed flags.
>> >
>> > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA
>> failure,
>> > which is what's often seen with external toolchains. This brings us al=
l
>> on the
>> > same page, and makes sure a failure to obey LDFLAGS is seen early.
>> >
>>
>>
>> Default or gnu linkers is to use sysv for legacy reasons and by passing
>> this option
>> to configuring the toolchain we want to make sure that components are
>> using sane defaults
>> even if they have not configured these options.
>>
>
> But that's not what we want. We want to know when we're not passing
> arguments we need to be passing. For example, the sysroot is poisoned
> today, so we *know* when the user is trying to run it without --sysroot=
=3D.
>
>
> application makefiles can ignore environment e.g. CC, CXX, LD etc and get
> into same situations.
> as an application writer I may not be interested in using cross
> compilation specific nuances.  We may not
> be able to solve it completely
>


I'm not sure what you mean by that. This is only for gcc-cross and
gcc-cross-canadian. Anyone using those needs to deal with cross issues
regardless.

if you do not pass the right linker flags from compiler driver and also
>> ignore
>> the LDFLAGS then you now have a safe pass for the app to build without
>> GNU hash
>> while I understand it will spread the external toolchain=E2=80=99s pains=
 into
>> internal toolchain
>> I fail to understand the benefit of doing this otherwise.
>
>
> Silently ignoring the fact that recipes ignore LDFLAGS is not good defaul=
t
> behavior, and this is precisely what oe-core is doing today. If you know =
of
> a better way to detect that in another QA check, I'm certainly open to
> hearing it.
>
>
> linker would emit .hash for sysv and .gnu.hash section for gnu hash in
> final ELF, may be adding a QA check for that would be enough ?
>

I don't understand what you mean by this. I don't see how you'd be able to
distinguish between a gnu.hash used because of the toolchain defaults and a
gnu.hash used because it obeyed LDFLAGS, which is what you'd need to be
able to detect the lack of the latter without this patch.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--f46d04289d01cf02580531e73705
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 2, 2016 at 9:37 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div style=3D"word-wrap:br=
eak-word"><br><div><span class=3D""><blockquote type=3D"cite"><div>On May 2=
, 2016, at 1:37 PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com" target=3D"_blank">kergoth@gmail.com</a>&gt; wrote:</div><br><div><div =
dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Mon, May 2, 2016 at 8:34 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><span><br>
&gt; On May 2, 2016, at 1:09 PM, Christopher Larson &lt;<a href=3D"mailto:k=
ergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
" target=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; We explicitly set the hash style to gnu in our LDFLAGS. Setting the de=
fault to<br>
&gt; this in the toolchain, while convenient, actually hides bugs, as a fai=
lure to<br>
&gt; obey LDFLAGS isn&#39;t noticed. By removing this, it&#39;s not dissimi=
lar to how we<br>
&gt; poison the sysroot -- rather than relying on the default, notice right=
 away if<br>
&gt; somoeone isn&#39;t obeying the needed flags.<br>
&gt;<br>
&gt; This will result in a failure to obey LDFLAGS causing a GNU_HASH QA fa=
ilure,<br>
&gt; which is what&#39;s often seen with external toolchains. This brings u=
s all on the<br>
&gt; same page, and makes sure a failure to obey LDFLAGS is seen early.<br>
&gt;<br>
<br>
<br>
</span>Default or gnu linkers is to use sysv for legacy reasons and by pass=
ing this option<br>
to configuring the toolchain we want to make sure that components are using=
 sane defaults<br>
even if they have not configured these options.<br></blockquote><div><br></=
div><div>But that&#39;s not what we want. We want to know when we&#39;re no=
t passing arguments we need to be passing. For example, the sysroot is pois=
oned today, so we *know* when the user is trying to run it without --sysroo=
t=3D.</div></div></div></div></div></blockquote><div><br></div></span><div>=
application makefiles can ignore environment e.g. CC, CXX, LD etc and get i=
nto same situations.</div><div>as an application writer I may not be intere=
sted in using cross compilation specific nuances.=C2=A0 We may not</div><di=
v>be able to solve it completely=C2=A0</div></div></div></blockquote><div><=
br></div><div><br></div><div>I&#39;m not sure what you mean by that. This i=
s only for gcc-cross and gcc-cross-canadian. Anyone using those needs to de=
al with cross issues regardless.</div><div><br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div style=3D"word-wrap:break-word"><div><span class=3D""><blockqu=
ote type=3D"cite"><div><div dir=3D"ltr"><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">
if you do not pass the right linker flags from compiler driver and also ign=
ore<br>
the LDFLAGS then you now have a safe pass for the app to build without GNU =
hash<br>
while I understand it will spread the external toolchain=E2=80=99s pains in=
to internal toolchain<br>
I fail to understand the benefit of doing this otherwise.</blockquote></div=
><br clear=3D"all"><div>Silently ignoring the fact that recipes ignore LDFL=
AGS is not good default behavior, and this is precisely what oe-core is doi=
ng today. If you know of a better way to detect that in another QA check, I=
&#39;m certainly open to hearing it.</div></div></div></div></blockquote><d=
iv><br></div></span><div>linker would emit .hash for sysv and .gnu.hash sec=
tion for gnu hash in final ELF, may be adding a QA check for that would be =
enough ?</div></div></div></blockquote><div><br></div><div>I don&#39;t unde=
rstand what you mean by this. I don&#39;t see how you&#39;d be able to dist=
inguish between a gnu.hash used because of the toolchain defaults and a gnu=
.hash used because it obeyed LDFLAGS, which is what you&#39;d need to be ab=
le to detect the lack of the latter without this patch.</div></div>-- <br><=
div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kergot=
h at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Mainta=
iner - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--f46d04289d01cf02580531e73705--
