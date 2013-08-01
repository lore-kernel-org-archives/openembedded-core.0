Return-Path: <djszapi@archlinux.us>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id AC40E619CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:22:52 +0000 (UTC)
Received: by mail-pb0-f43.google.com with SMTP id md4so2321148pbc.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Aug 2013 10:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=0xG5YSjai0AACnOYbTEbpgKQZJN6YrTYcyj1O7+l6RI=;
	b=fR6wtKkho+mjDmzhJljZklwkRqc6xV51BRjpUQbd4fT4+IrOpUIdLq9SW/ck1UXis/
	I4SFWfMpcMsujkAcgWBGlljQ3scA0lRYRqiuP3A7Rim4z/j9lFWwYBPBjfnoAboEI2+R
	LvpbdGqaGw/6KJyDnmF+8V1rO5k5/xnJrjV+1RiRK1yM5bdsBirFA3Ohuieq58O8mWok
	FiQd4vn0sHt3R/JKz5VWHf2duHDAMZYiADkkdgsaS+ND2yVIjp/7edsKHJSzrAVWONZo
	SBgl+Kbky+eksWOnUxAOqro8qY1wI4FSJR8kInwWIJNorNDROT1ZAe79tJbBhPKVEBND
	OaDA==
MIME-Version: 1.0
X-Received: by 10.68.163.131 with SMTP id yi3mr3451539pbb.55.1375377773144;
	Thu, 01 Aug 2013 10:22:53 -0700 (PDT)
Sender: djszapi@archlinux.us
Received: by 10.70.37.237 with HTTP; Thu, 1 Aug 2013 10:22:53 -0700 (PDT)
In-Reply-To: <CAP9ODKr3g-rSDftBo9uyeUGJUFn2dzSRjgySRxoK8CNOSH3z7Q@mail.gmail.com>
References: <1375351656-12261-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrXScWCUTfL8_hO6Jm+gFHUbzgADZoBd-iW7xjZW1679w@mail.gmail.com>
	<CAOMwXhM5ofGEhzDoQCiuuknpuFyg+6vB-LwuNh8m9yibmGFT3Q@mail.gmail.com>
	<1981575.9KzFInvyxm@helios>
	<CAOMwXhO-g9N3b0b27jrmZYbgDwPDNziJFF9_ryGbXF+RgBZyCw@mail.gmail.com>
	<CAP9ODKr3g-rSDftBo9uyeUGJUFn2dzSRjgySRxoK8CNOSH3z7Q@mail.gmail.com>
Date: Thu, 1 Aug 2013 18:22:53 +0100
X-Google-Sender-Auth: ko8BrmI9TzT8rTbdrG4MgnyT-VM
Message-ID: <CAOMwXhPrS=Z34ZotzxuQgULj4q1ij-au1Utq2ZqUpUyy6TFnUQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQm14bjk+Un2mmVfo9nLcydeqhCSsLrQcPEtOp9Y+Ww0ELK9N0QyH/A2E/bu0txtF5HfKVz/
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][V2] u-boot: state the MACHINE when skipping u-boot
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
X-List-Received-Date: Thu, 01 Aug 2013 17:22:52 -0000
Content-Type: multipart/alternative; boundary=047d7bacb46e99c15604e2e617e6

--047d7bacb46e99c15604e2e617e6
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 1, 2013 at 6:17 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Thu, Aug 1, 2013 at 2:09 PM, Laszlo Papp <lpapp@kde.org> wrote:
> > On Thu, Aug 1, 2013 at 6:02 PM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> >>
> >> I'm afraid this is not practical. The ability to specify the value for
> >> MACHINE
> >> and other variables from the external environment is not just there for
> >> folks
> >> running bitbake manually from the command line, but also external
> scripts
> >> as
> >> well, and they could quite legitimately set it to the same value that
> has
> >> been
> >> specified in the configuration file and showing a warning in that case
> >> would be
> >> undesirable.
> >
> >
> > Oh yeah, it cannot happen with compiler outputs the same way? Answer is:
> it
> > can.
> >
> > You can add another feature later though if you wish to suppress
> warnings.
> > That makes sense to me.
>
> It makes sense to not add the warning. Too many warnings just confuse
> users and does not provide anything useful as users just ignore them
> in the end.
>

"Too many warnings confuse the users" -> Despite your claim below, you have
not talked much to the gcc/clang and so forth users. You are quite off the
reality in here.

If there are users ignoring warnings for no real reasons, it is their
mistake. That does not mean careful users should be limited by those users.
Such users ignoring the warnings have no harm anyway. They will just ignore
them.

 >> I'm not sure I understand the value of showing this warning in any case.

> >> The
> >> system is not going to do anything that the user won't expect - the user
> >> specified the value of MACHINE on the command line and that's the value
> >> that is
> >> being used. The fact that it is the same as what's in the configuration
> >> file is
> >> incidental.
> >
> >
> > Have you used gcc, clang, etc? Do you have experience with warnings in
> > general? They are there in certain cases because the programmer may have
> or
> > probably made a mistake. It is a lot easier to figure out at that time
> than
> > debugging very hard later...
>
> <sarcarsm>
> I am sure we all in Yocto community NEVER used GCC/CLang...
> </sarcarsm>
>
> Did you EVER read your own messages? Please do.
>

You are quite off here, too. It was questioned about the "warning " usage
of those in this context of course. Please get back on track.

 > Actually, it is even getting more serious in your "script" case where it

> > would be totally hidden by the script if it is not logging properly, and
> you
> > would only realize an issue later.
> >
> > Surely, we all copy paste wrong on a daily basis, and we also write "foo"
> > instead "fow" and "bar" at times. So, I do not follow your comment.
> Nothing
> > to reinvent the wheel here, just follow the general practice that other
> > software developers have figured out along the decades.
>
> That's the point; we are folloing Yocto general practice and doing it
> different here won't help. Just confuse.
>

Actually, I was getting a lot more warning than I expected already, so you
are speaking against the reality. In fact, those warnings I got I could
also suppress. I do not claim they are useless though just because I do not
like them.

--047d7bacb46e99c15604e2e617e6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 1, 2013 at 6:17 PM, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">o=
tavio@ossystems.com.br</a>&gt;</span> wrote:<br><div class=3D"gmail_extra">=
<div class=3D"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Thu, Aug 1, 2013 at 2:0=
9 PM, Laszlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt=
; wrote:<br>

&gt; On Thu, Aug 1, 2013 at 6:02 PM, Paul Eggleton<br>
&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@lin=
ux.intel.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m afraid this is not practical. The ability to specify the v=
alue for<br>
&gt;&gt; MACHINE<br>
&gt;&gt; and other variables from the external environment is not just ther=
e for<br>
&gt;&gt; folks<br>
&gt;&gt; running bitbake manually from the command line, but also external =
scripts<br>
&gt;&gt; as<br>
&gt;&gt; well, and they could quite legitimately set it to the same value t=
hat has<br>
&gt;&gt; been<br>
&gt;&gt; specified in the configuration file and showing a warning in that =
case<br>
&gt;&gt; would be<br>
&gt;&gt; undesirable.<br>
&gt;<br>
&gt;<br>
&gt; Oh yeah, it cannot happen with compiler outputs the same way? Answer i=
s: it<br>
&gt; can.<br>
&gt;<br>
&gt; You can add another feature later though if you wish to suppress warni=
ngs.<br>
&gt; That makes sense to me.<br>
<br>
</div>It makes sense to not add the warning. Too many warnings just confuse=
<br>
users and does not provide anything useful as users just ignore them<br>
in the end.<br></blockquote><div><br></div><div>&quot;Too many warnings con=
fuse the users&quot; -&gt; Despite your claim below, you have not talked mu=
ch to the gcc/clang and so forth users. You are quite off the reality in he=
re.</div>
<div><br></div><div>If there are users ignoring warnings for no real reason=
s, it is their mistake. That does not mean careful users should be limited =
by those users. Such users ignoring the warnings have no harm anyway. They =
will just ignore them.</div>
<div><br></div><div>=A0<span style=3D"color:rgb(80,0,80)">&gt;&gt; I&#39;m =
not sure I understand the value of showing this warning in any case.</span>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt;&gt; The<br>
&gt;&gt; system is not going to do anything that the user won&#39;t expect =
- the user<br>
&gt;&gt; specified the value of MACHINE on the command line and that&#39;s =
the value<br>
&gt;&gt; that is<br>
&gt;&gt; being used. The fact that it is the same as what&#39;s in the conf=
iguration<br>
&gt;&gt; file is<br>
&gt;&gt; incidental.<br>
&gt;<br>
&gt;<br>
&gt; Have you used gcc, clang, etc? Do you have experience with warnings in=
<br>
&gt; general? They are there in certain cases because the programmer may ha=
ve or<br>
&gt; probably made a mistake. It is a lot easier to figure out at that time=
 than<br>
&gt; debugging very hard later...<br>
<br>
</div>&lt;sarcarsm&gt;<br>
I am sure we all in Yocto community NEVER used GCC/CLang...<br>
&lt;/sarcarsm&gt;<br>
<br>
Did you EVER read your own messages? Please do.<br></blockquote><div><br></=
div><div>You are quite off here, too. It was questioned about the &quot;war=
ning &quot; usage of those in this context of course. Please get back on tr=
ack.</div>
<div><br></div><div>=A0<span style=3D"color:rgb(80,0,80)">&gt; Actually, it=
 is even getting more serious in your &quot;script&quot; case where it</spa=
n></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">
&gt; would be totally hidden by the script if it is not logging properly, a=
nd you<br>
&gt; would only realize an issue later.<br>
&gt;<br>
&gt; Surely, we all copy paste wrong on a daily basis, and we also write &q=
uot;foo&quot;<br>
&gt; instead &quot;fow&quot; and &quot;bar&quot; at times. So, I do not fol=
low your comment. Nothing<br>
&gt; to reinvent the wheel here, just follow the general practice that othe=
r<br>
&gt; software developers have figured out along the decades.<br>
<br>
</div>That&#39;s the point; we are folloing Yocto general practice and doin=
g it<br>
different here won&#39;t help. Just confuse.<br></blockquote><div><br></div=
><div>Actually, I was getting a lot more warning than I expected already, s=
o you are speaking against the reality. In fact, those warnings I got I cou=
ld also suppress. I do not claim they are useless though just because I do =
not like them.</div>
</div></div></div>

--047d7bacb46e99c15604e2e617e6--
