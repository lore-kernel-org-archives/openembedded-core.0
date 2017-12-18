Return-Path: <bounce+8e2b5a.3a5685-openembedded-core=lists.openembedded.org@asterius.io>
X-Greylist: delayed 300 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Dec 2017 20:22:25 UTC
Received: from mail4.static.mailgun.info (mail4.static.mailgun.info
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id F173678087
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:22:25 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1513628547; h=Content-Type: Cc: To: Subject: Message-ID:
	Date: From: References: In-Reply-To: MIME-Version: Sender;
	bh=TlT8DV6lEbciyXkU3uMwGxWhs+c2de1Wn7AIWUK0Quw=;
	b=KipFHELzeXIbA2nOmK6ZX7rJmsNm0bWv1I8SEmCkusMb/EGT2+tYGElQTvRgJwRXZ+9hl8Qt
	ZCcrxQ6AAV/ifV+uEJG4YZbALH4qIO1/V73eDed+8G087/3wRdgbkwcYYPB7PlNY0kaDbIWP
	AZ0Ek2opnef062wTA5AHXHBjW+8=
X-Mailgun-Sending-Ip: 104.130.122.4
X-Mailgun-Sid: WyJiMTQwMSIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjNhNTY4NSJd
Sender: derek@asterius.io
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mxa.mailgun.org with ESMTP id 5a382256.7f8506e057f0-smtp-out-n02;
	Mon, 18 Dec 2017 20:17:26 -0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id r184so12245384qke.8;
	Mon, 18 Dec 2017 12:17:26 -0800 (PST)
X-Gm-Message-State: AKGB3mK2rGsks0ztrcv+xm6SL+atDV6jAt8uEBaM4CD2z/isLozdQ2YZ
	TR5q3/2JHaTDd8lLh6wMwW6o0JEmykrVEdTfxBE=
X-Google-Smtp-Source: ACJfBosFYZ1C+jtreLxTtDGD3rl3fdDW0Vgd3jlHeh73EQBw+N1MMtiuctQRPsnJqCCOq4cn79i8516Nzot4QO7z3Hg=
X-Received: by 10.55.191.1 with SMTP id p1mr1465742qkf.152.1513628246281; Mon,
	18 Dec 2017 12:17:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.177 with HTTP; Mon, 18 Dec 2017 12:17:25 -0800 (PST)
In-Reply-To: <CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Mon, 18 Dec 2017 15:17:25 -0500
X-Gmail-Original-Message-ID: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
Message-ID: <CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 20:22:26 -0000
Content-Type: multipart/alternative; boundary="94eb2c0437b0f1138c0560a309a2"

--94eb2c0437b0f1138c0560a309a2
Content-Type: text/plain; charset="UTF-8"

I have several customers who have optimized for space and would like to see
the capability maintained unless core removes the ability to split python
packages out.  They also remove the *.py files in favor of *.pyo files (via
a custom packaging mechanism).  I have automated tests that go through the
module importing on each of the meta-python packages to ensure it works on
minimal python installations.  When other contributors don't do provide
that functionality, I either catch it when I do package update or when it
breaks for one of my customers.  I'm fine if you don't want to perform the
checks yourself and it breaks my use case with missing dependencies, but I
would prefer that you don't remove the dependencies that are currently in
place.  Thanks.

-Derek

On Mon, Dec 18, 2017 at 11:56 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> On Mon, Dec 18, 2017 at 11:37 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
> > On 12/18/2017 06:15 PM, Mark Asselstine wrote:
> >>
> >> On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com
> >
> >> wrote:
> >>>
> >>> All our python recipes should be explicitly listing the python module
> >>> packages they require. No python module recipes should be depending on
> >>> python-modules or python3-modules, but explicitly what they require.
> >>
> >>
> >> This is a giant PITA for little gain in my opinion. The typical python
> >> 'vehicles' to define dependencies, things like setup.py, requires.txt,
> >> requirements.txt..., never bother to list stdlibs. These are standard
> >> libs that are just expected to be there. If a system is being
> >> installed with only select python modules it will behave differently
> >> than python found on any other system violating the rule of least
> >> surprise. On top of this most of these modules are ~40K in size and
> >> there are roughly 60 in the stdlib so the size gain in installing a
> >> few vs. all of them is extremely negligible. All of this seems to add
> >> way more work and churn that outweighs any real benefit.
> >
> >
> > I tend to agree with this. Add also the situation that the yocto project
> > needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7
> soon
> > after, no one has enough time to do this rather non-trivial job, and I'm
> > beginning to wonder if the best way out is to remove the module splitting
> > altogether, and write a clean, simple and maintainable python3 recipe
> from
> > scratch with minimal amount of custom patching and hopefully no
> write-only
> > hacks.
> >
> > Alex
>
> Thanks Alex for the support. To get a better idea as to what the size
> delta is I took the installed sizes from a rootfs logfile and the
> total size for all modules (python2.7) is 6.5M python-misc is almost
> 2M of this and python-codecs contributing over 0.5M. The savings will
> never be the full 6.5M as there will always be python-lang and some
> other modules needed. There was a time where 32M restrictions existed
> are some systems but are we really seeing devices with these
> restrictions any more? what about exploring not shipping the pyc
> files? I would much rather see this than imposing so much work and
> churn for very little gain. Anyways, maybe this isn't the best forum
> for this and it should be brought up to the architecture group.
>
> Mark
>
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--94eb2c0437b0f1138c0560a309a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have several customers who have optimized for space and =
would like to see the capability maintained unless core removes the ability=
 to split python packages out.=C2=A0 They also remove the *.py files in fav=
or of *.pyo files (via a custom packaging mechanism).=C2=A0 I have automate=
d tests that go through the module importing on each of the meta-python pac=
kages to ensure it works on minimal python installations.=C2=A0 When other =
contributors don&#39;t do provide that functionality, I either catch it whe=
n I do package update or when it breaks for one of my customers.=C2=A0 I&#3=
9;m fine if you don&#39;t want to perform the checks yourself and it breaks=
 my use case with missing dependencies, but I would prefer that you don&#39=
;t remove the dependencies that are currently in place.=C2=A0 Thanks.<div><=
br></div><div>-Derek</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Mon, Dec 18, 2017 at 11:56 AM, Mark Asselstine <span di=
r=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@windriver.com" target=3D"_b=
lank">mark.asselstine@windriver.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On Mon, Dec 18, 20=
17 at 11:37 AM, Alexander Kanavin<br>
&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@=
linux.<wbr>intel.com</a>&gt; wrote:<br>
&gt; On 12/18/2017 06:15 PM, Mark Asselstine wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson &lt;<a href=
=3D"mailto:kergoth@gmail.com">kergoth@gmail.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; All our python recipes should be explicitly listing the python=
 module<br>
&gt;&gt;&gt; packages they require. No python module recipes should be depe=
nding on<br>
&gt;&gt;&gt; python-modules or python3-modules, but explicitly what they re=
quire.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; This is a giant PITA for little gain in my opinion. The typical py=
thon<br>
&gt;&gt; &#39;vehicles&#39; to define dependencies, things like setup.py, r=
equires.txt,<br>
&gt;&gt; requirements.txt..., never bother to list stdlibs. These are stand=
ard<br>
&gt;&gt; libs that are just expected to be there. If a system is being<br>
&gt;&gt; installed with only select python modules it will behave different=
ly<br>
&gt;&gt; than python found on any other system violating the rule of least<=
br>
&gt;&gt; surprise. On top of this most of these modules are ~40K in size an=
d<br>
&gt;&gt; there are roughly 60 in the stdlib so the size gain in installing =
a<br>
&gt;&gt; few vs. all of them is extremely negligible. All of this seems to =
add<br>
&gt;&gt; way more work and churn that outweighs any real benefit.<br>
&gt;<br>
&gt;<br>
&gt; I tend to agree with this. Add also the situation that the yocto proje=
ct<br>
&gt; needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7=
 soon<br>
&gt; after, no one has enough time to do this rather non-trivial job, and I=
&#39;m<br>
&gt; beginning to wonder if the best way out is to remove the module splitt=
ing<br>
&gt; altogether, and write a clean, simple and maintainable python3 recipe =
from<br>
&gt; scratch with minimal amount of custom patching and hopefully no write-=
only<br>
&gt; hacks.<br>
&gt;<br>
&gt; Alex<br>
<br>
</div></div>Thanks Alex for the support. To get a better idea as to what th=
e size<br>
delta is I took the installed sizes from a rootfs logfile and the<br>
total size for all modules (python2.7) is 6.5M python-misc is almost<br>
2M of this and python-codecs contributing over 0.5M. The savings will<br>
never be the full 6.5M as there will always be python-lang and some<br>
other modules needed. There was a time where 32M restrictions existed<br>
are some systems but are we really seeing devices with these<br>
restrictions any more? what about exploring not shipping the pyc<br>
files? I would much rather see this than imposing so much work and<br>
churn for very little gain. Anyways, maybe this isn&#39;t the best forum<br=
>
for this and it should be brought up to the architecture group.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Mark<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-devel mailing list<br>
&gt; <a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembed=
ded-devel@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-devel" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/=
<wbr>mailman/listinfo/openembedded-<wbr>devel</a><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-d=
evel@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>=
mailman/listinfo/openembedded-<wbr>devel</a><br>
</div></div></blockquote></div><br></div>

--94eb2c0437b0f1138c0560a309a2--
