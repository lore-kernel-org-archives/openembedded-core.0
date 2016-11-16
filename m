Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8E2601F1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 17:01:09 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id c47so109571454qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ldsz1Jhhymqv8hKE4DZ8wYqbYjs6mQNgimlhhYq3zRA=;
	b=MZ5pcKnUqkdOvTOC/cFc5HLy6DFMv69O1+STXOSpM+jPU4KMmkzY/3XsXIO0azXgcs
	le7x5kNrKTPCP9A0IL1wiH13GYR1/xjiR0KEIHtcOTr8njIbk2UkCHZdmFHqI0T0Kvcc
	zR/4MBDVeB8Kn4Et71/AuGXKT1RTAy/0Ey1BOYcCdlhJBBFiyLPpBWQgi1x0f+qAV3Lf
	ptDwNYJNkyP0abMhZuMzK7qwBjKyjNItxfRP6L5kbPrTEZnsW6qHgxDMEkAnBHWDmr8H
	gx9U5KPKVwzPo8DeLjzV/qaHtec0/Dbv5x5I85yVn39y/I1OflH/XyPCK4tcE/ym5GSK
	ctoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ldsz1Jhhymqv8hKE4DZ8wYqbYjs6mQNgimlhhYq3zRA=;
	b=imSK6CB+Q25wnrOJvqzx+SNwpSxVehuzUHOOJKxl5Q6u8+/kT4YAzqpJGcKaO4U/ow
	bnujfIt9ngzPeiechbl11bTyNGgR28vdFVJ/slp2cqvIayZvZDdbiU/SNR1H4Cg5i9FY
	meCT1LHPORtkR0BIr0BVEhdqFhJBOdS/E/Bxbzyee5b47K2/+dedTfnFAhRazI9nUelU
	bZ9EDwyeECAUgPGYoRQJtnpJZQsk9L2NqgMK60C3UaqDd6gwPUFNX0S5Pek8um2UXoPr
	jKbF7up39woskqcNxHiT3mlh1at/j2Er7cIJU5nl2VhLsmJ+euqbG+Bs73UIwVRq30n9
	LT9Q==
X-Gm-Message-State: AKaTC03tWQ4e1JOhy26n7nf8jORcbGe+pqTmD1skpXOkGWf5OabsbAcmLiJQqiDOX0BhJjdHt6rrJ6shJ5EUEw==
X-Received: by 10.200.39.90 with SMTP id h26mr2405815qth.88.1479315671213;
	Wed, 16 Nov 2016 09:01:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Wed, 16 Nov 2016 09:01:10 -0800 (PST)
In-Reply-To: <1479310588.18151.22.camel@intel.com>
References: <1479310588.18151.22.camel@intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Nov 2016 12:01:10 -0500
Message-ID: <CADkTA4Pti3PEn7C1AWcy0H0RrWfjphSC1+396tp16z2Wm5PWww@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: truncating quoted text in emails
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
X-List-Received-Date: Wed, 16 Nov 2016 17:01:11 -0000
Content-Type: multipart/alternative; boundary=001a11412dd017ee7d05416e05d8

--001a11412dd017ee7d05416e05d8
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 16, 2016 at 10:36 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> Hello!
>
> While trying to follow patch reviews on this list I noticed that
> (subjectively?) quite a few replies completely quote the original email
> and then just add a few lines. That looks fine in GMail where the quoted
> text is folded, but not so much in mail readers where quoted text is
> unfolded (Evolution).
>
> A random example:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2016-November/128861.html
>
> Not sure what the netiquette is for this list, but at least I would
> appreciate a bit more aggressive trimming in replies - thanks! ;-}
>


We might as well try to agree on an editor to use ;)

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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11412dd017ee7d05416e05d8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Nov 16, 2016 at 10:36 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello!<br>
<br>
While trying to follow patch reviews on this list I noticed that<br>
(subjectively?) quite a few replies completely quote the original email<br>
and then just add a few lines. That looks fine in GMail where the quoted<br=
>
text is folded, but not so much in mail readers where quoted text is<br>
unfolded (Evolution).<br>
<br>
A random example:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2016-N=
ovember/128861.html" rel=3D"noreferrer" target=3D"_blank">http://lists.open=
embedded.org/<wbr>pipermail/openembedded-core/<wbr>2016-November/128861.htm=
l</a><br>
<br>
Not sure what the netiquette is for this list, but at least I would<br>
appreciate a bit more aggressive trimming in replies - thanks! ;-}<br></blo=
ckquote><div><br><br></div><div>We might as well try to agree on an editor =
to use ;)<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">
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
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt n=
ot follow the NULL pointer, for chaos and madness await thee at its end&quo=
t;</div>
</div></div>

--001a11412dd017ee7d05416e05d8--
