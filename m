Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id A26F176802
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 14:43:28 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w18so2238625oie.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2016 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=xLWcqQxuEHhFTpVrke8W4KwLXak5sUnt0957wv/YKpA=;
	b=qNQwPAL0inauqAqrQur8jrN3fx/f70o6G8dtviwdL+JGCd4DRks7bYuMdyt1qkt0XI
	/luQ9+QPjoTLpSqEAlfYPpERPzqPPgIvjZiWGE2bT8pQZclxpJCE387sV/nduqFszDTQ
	BpJXC+3y9/NYH+TJASYqbTkOs7vU6dSfTgc8HGvBlazeQYfKD/X7UTe1B7avtYQQ1Buh
	sQqMLqpwR0GaYqtbg8l4EIZAL9AabXQbti6CreSOXbSB9tGC3aiMTIzYwUeEmshiAlyi
	PtOdfpVmvchwxvjrTTYQkA3XMcarwKabXyPHffGXh4sBeUOOgw/dRnrIBFpO/MpALL82
	mMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=xLWcqQxuEHhFTpVrke8W4KwLXak5sUnt0957wv/YKpA=;
	b=BDNX19mqhP93/z21l0h8WWVr/DAoKeZV1EaqzlnV148B+GD34vvcJQ1tEZRuSI5ns0
	nEgITSpXVdyq9KeV4I35ff+/QhtiQaitjflwdyAXWdD0xxLrmS1S3YSAI3TglfIpX20+
	L8za1WWd+NSlXRqgHQ5wtP0FFcfjLCv7Q5i2psFRT5tEad0IF+BQnViCFFWkDnA9JlQX
	Ac00kAQ2En+cDpssUmco6q9t9MPJDNwvAEo7nLk66F7q6iaWTI2DiqRBEJ6YyuoXtX9K
	wInoIks0r7Vakf5kGdHO/I1AEz2u/Bp0MumCSFWJJLCc0Ij4dBmg+orNC8FbaZCvNVPm
	e3bQ==
X-Gm-Message-State: AD7BkJLtySuQPbnEWpZ/xQ8f02m1QmGxq5awrtTbSx9x5g12uT6OP5WyRmDLPgyCPMKx/cI+aa0ONdgiLy5FFQ==
MIME-Version: 1.0
X-Received: by 10.157.47.207 with SMTP id b15mr14834919otd.118.1459867408690; 
	Tue, 05 Apr 2016 07:43:28 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 5 Apr 2016 07:43:28 -0700 (PDT)
In-Reply-To: <57037C28.8010009@windriver.com>
References: <cover.1456315808.git.zhe.he@windriver.com>
	<56E23C3E.2000101@windriver.com> <56F0AE86.3060105@windriver.com>
	<CADkTA4Mmbpf1=S7wgYoX3VJ_SaeH7-qBZ-26d2qF=uijhuCHqg@mail.gmail.com>
	<CADkTA4NS0JDQ98AK5XSsVk1+jdPa3jAo=GUnBJsCXWaT1aq5FQ@mail.gmail.com>
	<57037C28.8010009@windriver.com>
Date: Tue, 5 Apr 2016 10:43:28 -0400
Message-ID: <CADkTA4N13TKwqiQGKjt0X2_Bn04=VTJa7U3FG4DHwsoYskPsVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/2] Yocto Bug #6945
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
X-List-Received-Date: Tue, 05 Apr 2016 14:43:31 -0000
Content-Type: multipart/alternative; boundary=001a11353a2c5097ff052fbdde13

--001a11353a2c5097ff052fbdde13
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2016 at 4:49 AM, He Zhe <zhe.he@windriver.com> wrote:

>
>
> On 03/23/2016 02:29 AM, Bruce Ashfield wrote:
> >
> >
> > On Mon, Mar 21, 2016 at 11:37 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>>wrote:
> >
> >
> >
> >     On Mon, Mar 21, 2016 at 10:31 PM, He Zhe <zhe.he@windriver.com
> <mailto:zhe.he@windriver.com>>wrote:
> >
> >         Ping.
> >
> >
> >     This slipped through my filters. Sorry about that.
> >
> >     We are too late for the 2.1 release at this point, but I'll review
> the changes again in the
> >     morning and send any comments that I may have.
> >
> >
> > I reviewed this version, and it looks fine to me.
> >
>
> Thank you Bruce. And which version do we expect this to be merged into?
> 2.1.1 or 2.2 M1?
>

In the end, it isn't up to me. But 2.2 M1 is the reasonable target. This
isn't a bug fix, so backporting it to 2.1.1 is unlikely.

Also, since there's always a huge amount of churn, everyone is busy, etc,..
to avoid it slipping through the cracks, I'd
suggest that you re-send the series about a week after 2.1 releases (with a
history of the submissions, so we'll know
that it has been fully reviewed).

Bruce


>
> Zhe
>
> > Bruce
> >
> >
> >
> >     Cheers,
> >
> >     Bruce
> >
> >
> >         Thanks,
> >         Zhe
> >
> >         On 03/11/2016 11:32 AM, He Zhe wrote:
> >         > Any more comments?
> >         >
> >         > Thanks,
> >         > Zhe
> >         >
> >         > On 02/24/2016 08:20 PM, zhe.he@windriver.com <mailto:
> zhe.he@windriver.com>wrote:
> >         >> From: He Zhe <zhe.he@windriver.com <mailto:
> zhe.he@windriver.com>>
> >         >>
> >         >> v1 to v2:
> >         >>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update
> comments
> >         >>  - Update related doc files
> >         >>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
> >         >>  - Link built vmlinuz to boot directory for reference
> >         >>
> >         >> v2 to v3:
> >         >>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
> in order that users can still use the old variables.
> >         >>  - Run oe_rummake in a loop for every types so that we can
> add different configurations to them easily in the future.
> >         >>  - Warn, intead of die, users if one of the types are over
> the size limit.
> >         >>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
> >         >>  - Remove the doc parts. They will be submitted yocto-docs
> later.
> >         >>  - Change some grep usage to make it more clear.
> >         >>  - Correct a typo.
> >         >>
> >         >> The following changes since commit
> 23056103c949b498c23b47579e8dd57ce78e6ed9:
> >         >>
> >         >>   uclibc: Do not use immediate expansion operator (2016-02-22
> 20:42:48 +0000)
> >         >>
> >         >> are available in the git repository at:
> >         >>
> >         >>   git://git.yoctoproject.org/poky-contrib <
> http://git.yoctoproject.org/poky-contrib>zhe/yocto-bug-6945
> >         >>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945
> >         >>
> >         >> for you to fetch changes up to
> dc52a1efbb8248ea274a1cd0cca5734290b3025f:
> >         >>
> >         >>   kernel: Make symbol link to vmlinuz in boot directory
> (2016-02-24 07:08:16 -0500)
> >         >>
> >         >>
> ----------------------------------------------------------------
> >         >> He Zhe (2):
> >         >>       kernel: Add KERNEL_IMAGETYPES to build multi types
> kernel at one time
> >         >>       kernel: Make symbol link to vmlinuz in boot directory
> >         >>
> >         >>  meta/classes/kernel-fitimage.bbclass      |  20
> ++++++++-------
> >         >>  meta/classes/kernel-grub.bbclass          |  44
> +++++++++++++++++++++-----------
> >         >>  meta/classes/kernel-uimage.bbclass        |  22
> ++++++++--------
> >         >>  meta/classes/kernel.bbclass               | 187
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
> >         >>  meta/conf/documentation.conf              |   3 ++-
> >         >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49
> ++++++++++++++++++++++--------------
> >         >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
> >         >>  7 files changed, 218 insertions(+), 109 deletions(-)
> >         >>
> >         >> He Zhe (2):
> >         >>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel
> at one time
> >         >>   kernel: Make symbol link to vmlinuz in boot directory
> >         >>
> >         >>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
> >         >>  meta/classes/kernel-grub.bbclass          |  44 ++++---
> >         >>  meta/classes/kernel-uimage.bbclass        |  22 ++--
> >         >>  meta/classes/kernel.bbclass               | 187
> +++++++++++++++++++++---------
> >         >>  meta/conf/documentation.conf              |   3 +-
> >         >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
> >         >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
> >         >>  7 files changed, 218 insertions(+), 109 deletions(-)
> >         >>
> >
> >         --
> >         _______________________________________________
> >         Openembedded-core mailing list
> >         Openembedded-core@lists.openembedded.org <mailto:
> Openembedded-core@lists.openembedded.org>
> >         http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
> >
> >
> >     --
> >     "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> >
> >
> >
> >
> > --
> > "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11353a2c5097ff052fbdde13
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 5, 2016 at 4:49 AM, He Zhe <span dir=3D"ltr">&lt;<a href=3D=
"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 03/23/2016 02:29 AM, Bruce Ashfield wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Mar 21, 2016 at 11:37 PM, Bruce Ashfield &lt;<a href=3D"mailto=
:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a> &lt;mailto:<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;&gt;wr=
ote:<br>
<span class=3D"">&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Mar 21, 2016 at 10:31 PM, He Zhe &lt;<a hre=
f=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a> &lt;mailto:<a hr=
ef=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;&gt;wrote:<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ping.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0This slipped through my filters. Sorry about that.<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0We are too late for the 2.1 release at this point, =
but I&#39;ll review the changes again in the<br>
&gt;=C2=A0 =C2=A0 =C2=A0morning and send any comments that I may have.<br>
&gt;<br>
&gt;<br>
&gt; I reviewed this version, and it looks fine to me.<br>
&gt;<br>
<br>
</span>Thank you Bruce. And which version do we expect this to be merged in=
to? 2.1.1 or 2.2 M1?<br></blockquote><div><br></div><div>In the end, it isn=
&#39;t up to me. But 2.2 M1 is the reasonable target. This isn&#39;t a bug =
fix, so backporting it to 2.1.1 is unlikely.<br><br></div><div>Also, since =
there&#39;s always a huge amount of churn, everyone is busy, etc,.. to avoi=
d it slipping through the cracks, I&#39;d<br></div><div>suggest that you re=
-send the series about a week after 2.1 releases (with a history of the sub=
missions, so we&#39;ll know<br></div><div>that it has been fully reviewed).=
<br></div><div><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
Zhe<br>
<span class=3D""><br>
&gt; Bruce<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Cheers,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Bruce<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Zhe<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 03/11/2016 11:32 AM, He Zhe wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Any more comments?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Thanks,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Zhe<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On 02/24/2016 08:20 PM, <=
a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a> &lt;mailto:=
<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;wrote:<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; From: He Zhe &lt;<a href=3D"=
mailto:zhe.he@windriver.com">zhe.he@windriver.com</a> &lt;mailto:<a href=3D=
"mailto:zhe.he@windriver.com">zhe.he@windriver.com</a>&gt;&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; v1 to v2:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Change KERNEL_OUTPUT=
 to KERNEL_OUTPUT_DIR and update comments<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Update related doc f=
iles<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Replace all KERNEL_A=
LT_IMAGETYPEs with KERNEL_IMAGETYPES<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Link built vmlinuz t=
o boot directory for reference<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; v2 to v3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Merge existing KERNE=
L_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order that users can still use th=
e old variables.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Run oe_rummake in a =
loop for every types so that we can add different configurations to them ea=
sily in the future.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Warn, intead of die,=
 users if one of the types are over the size limit.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Remove the replaceme=
nt of KERNEL_ALT_IMAGETYPE in v2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Remove the doc parts=
. They will be submitted yocto-docs later.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Change some grep usa=
ge to make it more clear.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 - Correct a typo.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; The following changes since =
commit 23056103c949b498c23b47579e8dd57ce78e6ed9:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0uclibc: Do not u=
se immediate expansion operator (2016-02-22 20:42:48 +0000)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; are available in the git rep=
ository at:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0git://<a =
href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/poky-contrib</a> &lt;<a href=3D"http://git=
.yoctoproject.org/poky-contrib" rel=3D"noreferrer" target=3D"_blank">http:/=
/git.yoctoproject.org/poky-contrib</a>&gt;zhe/yocto-bug-6945<br>
<div><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0=
 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/co=
mmit/?h=3Dzhe/yocto-bug-6945" rel=3D"noreferrer" target=3D"_blank">http://g=
it.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dzhe/yocto-bug-69=
45</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; for you to fetch changes up =
to dc52a1efbb8248ea274a1cd0cca5734290b3025f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0kernel: Make sym=
bol link to vmlinuz in boot directory (2016-02-24 07:08:16 -0500)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; ----------------------------=
------------------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; He Zhe (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ke=
rnel: Add KERNEL_IMAGETYPES to build multi types kernel at one time<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ke=
rnel: Make symbol link to vmlinuz in boot directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-fi=
timage.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++++++++-------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-gr=
ub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 +++++++++++++++++++=
++-----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-ui=
mage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 ++++++++--------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel.bb=
class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++---------------------------------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/conf/documentatio=
n.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++-<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/recipes-kernel/li=
nux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 49 ++++++++++++++++++++++------------=
--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/recipes-kernel/li=
nux/linux-yocto.inc |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 7 files changed, 218 i=
nsertions(+), 109 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt; He Zhe (2):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0kernel: Add KERN=
EL_IMAGETYPES to build multi types kernel at one time<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 =C2=A0kernel: Make sym=
bol link to vmlinuz in boot directory<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-fi=
timage.bbclass=C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-gr=
ub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 44 ++++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel-ui=
mage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/classes/kernel.bb=
class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++=
++++++++++++---------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/conf/documentatio=
n.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/recipes-kernel/li=
nux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 49 +++++---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 meta/recipes-kernel/li=
nux/linux-yocto.inc |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;=C2=A0 7 files changed, 218 i=
nsertions(+), 109 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_____________________________________=
__________<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Openembedded-core mailing list<br>
</div></div>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:Openemb=
edded-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org=
</a> &lt;mailto:<a href=3D"mailto:Openembedded-core@lists.openembedded.org"=
>Openembedded-core@lists.openembedded.org</a>&gt;<br>
<div class=3D""><div class=3D"h5">&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" r=
el=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailman/l=
istinfo/openembedded-core</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; &quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end&quot;<br>
<br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11353a2c5097ff052fbdde13--
