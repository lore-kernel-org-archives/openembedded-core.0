Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id F02C66FEF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 03:37:18 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e22so10587508oib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 20:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/CjvPYVyDjO0DSulwL9k8upbkMjZufNWsZtOIDXVGfY=;
	b=i6s6pa0Y9p8czNLmfnusxYWgUz3j04FgnUrtUrnTDYshJIotgwYx0fZjiV0UwnBx0g
	iQAW/eRLdpsf9msjPxegiRuVv8vzlxOO6rSiOvBhARm2ccxcwtEjOOH3jjsLhlZWjwpn
	CW9cJNgazIxfzSX5GCjdIg0LEMcE5Urbr0szMms485g4VFXtAKK6i1C9I2y4Qjl6FqMO
	+cKbNhdkzN2MDj77T218C7BgUDQI8T5LoHGADV8yEC1EMrAQALv6JiBRwNAFo+3bDk/9
	CH38YTZFIAZHh949397YgUBX1cm9Kss2gvHdB4p170xxW0Kt9fcq97qIaUptij7ExvD7
	7TGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/CjvPYVyDjO0DSulwL9k8upbkMjZufNWsZtOIDXVGfY=;
	b=f32z1QUf8MQDljcWqgP19GazoN6dCBkN4jwd7iyrvggfb6bf1vuhCzHHcqqGKggxun
	yfh3yRDsMpH7xLqFNDtarCWX+u44q31qD0cn79vy9xiFR9LFlCrIHV7pmiCyaVvZiRVB
	OPt2lq/KFlM1FFW4z/dCfWpYbP7Xc2oU5z+4cLIf4G6T/L1Hn3aOAJKr05pJtf/pU3BG
	PgL1CjevRv73Rg7MQHVjxEeD8I4EzvxjvWkvAqnn008d/9Yt4iHVTtiNZajioCkYiq+S
	aKIHI2KtrovpAdAgSzidObcgbn7npUeg5qrq1Hfy0vuhoNbboTuTmAGWM74fJkc9z0LS
	k3TA==
X-Gm-Message-State: AD7BkJKfu1fqTDQy03udhMhFo9jvI4afmkUK7DEEfq+koUKp6eBxCPP+SA/sXXvQsvMTcOg/0aVEykDNSKqzpQ==
MIME-Version: 1.0
X-Received: by 10.202.170.8 with SMTP id t8mr16250257oie.60.1458617839271;
	Mon, 21 Mar 2016 20:37:19 -0700 (PDT)
Received: by 10.157.8.248 with HTTP; Mon, 21 Mar 2016 20:37:19 -0700 (PDT)
In-Reply-To: <56F0AE86.3060105@windriver.com>
References: <cover.1456315808.git.zhe.he@windriver.com>
	<56E23C3E.2000101@windriver.com> <56F0AE86.3060105@windriver.com>
Date: Mon, 21 Mar 2016 23:37:19 -0400
Message-ID: <CADkTA4Mmbpf1=S7wgYoX3VJ_SaeH7-qBZ-26d2qF=uijhuCHqg@mail.gmail.com>
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
X-List-Received-Date: Tue, 22 Mar 2016 03:37:19 -0000
Content-Type: multipart/alternative; boundary=001a113cbc0c2c443e052e9aeeee

--001a113cbc0c2c443e052e9aeeee
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 21, 2016 at 10:31 PM, He Zhe <zhe.he@windriver.com> wrote:

> Ping.
>
>
This slipped through my filters. Sorry about that.

We are too late for the 2.1 release at this point, but I'll review the
changes again in the
morning and send any comments that I may have.

Cheers,

Bruce


> Thanks,
> Zhe
>
> On 03/11/2016 11:32 AM, He Zhe wrote:
> > Any more comments?
> >
> > Thanks,
> > Zhe
> >
> > On 02/24/2016 08:20 PM, zhe.he@windriver.com wrote:
> >> From: He Zhe <zhe.he@windriver.com>
> >>
> >> v1 to v2:
> >>  - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comments
> >>  - Update related doc files
> >>  - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES
> >>  - Link built vmlinuz to boot directory for reference
> >>
> >> v2 to v3:
> >>  - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES in order
> that users can still use the old variables.
> >>  - Run oe_rummake in a loop for every types so that we can add
> different configurations to them easily in the future.
> >>  - Warn, intead of die, users if one of the types are over the size
> limit.
> >>  - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.
> >>  - Remove the doc parts. They will be submitted yocto-docs later.
> >>  - Change some grep usage to make it more clear.
> >>  - Correct a typo.
> >>
> >> The following changes since commit
> 23056103c949b498c23b47579e8dd57ce78e6ed9:
> >>
> >>   uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48
> +0000)
> >>
> >> are available in the git repository at:
> >>
> >>   git://git.yoctoproject.org/poky-contrib zhe/yocto-bug-6945
> >>
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=zhe/yocto-bug-6945
> >>
> >> for you to fetch changes up to dc52a1efbb8248ea274a1cd0cca5734290b3025f:
> >>
> >>   kernel: Make symbol link to vmlinuz in boot directory (2016-02-24
> 07:08:16 -0500)
> >>
> >> ----------------------------------------------------------------
> >> He Zhe (2):
> >>       kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one
> time
> >>       kernel: Make symbol link to vmlinuz in boot directory
> >>
> >>  meta/classes/kernel-fitimage.bbclass      |  20 ++++++++-------
> >>  meta/classes/kernel-grub.bbclass          |  44
> +++++++++++++++++++++-----------
> >>  meta/classes/kernel-uimage.bbclass        |  22 ++++++++--------
> >>  meta/classes/kernel.bbclass               | 187
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------------------------
> >>  meta/conf/documentation.conf              |   3 ++-
> >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49
> ++++++++++++++++++++++--------------
> >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
> >>  7 files changed, 218 insertions(+), 109 deletions(-)
> >>
> >> He Zhe (2):
> >>   kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time
> >>   kernel: Make symbol link to vmlinuz in boot directory
> >>
> >>  meta/classes/kernel-fitimage.bbclass      |  20 ++--
> >>  meta/classes/kernel-grub.bbclass          |  44 ++++---
> >>  meta/classes/kernel-uimage.bbclass        |  22 ++--
> >>  meta/classes/kernel.bbclass               | 187
> +++++++++++++++++++++---------
> >>  meta/conf/documentation.conf              |   3 +-
> >>  meta/recipes-kernel/linux/linux-dtb.inc   |  49 +++++---
> >>  meta/recipes-kernel/linux/linux-yocto.inc |   2 +-
> >>  7 files changed, 218 insertions(+), 109 deletions(-)
> >>
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

--001a113cbc0c2c443e052e9aeeee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Mar 21, 2016 at 10:31 PM, He Zhe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zhe.he@windriver.com" target=3D"_blank">zhe.he@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Ping.<br>
<br></blockquote><div><br></div><div>This slipped through my filters. Sorry=
 about that.</div><div><br></div><div>We are too late for the 2.1 release a=
t this point, but I&#39;ll review the changes again in the</div><div>mornin=
g and send any comments that I may have.</div><div><br></div><div>Cheers,</=
div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
Thanks,<br>
Zhe<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 03/11/2016 11:32 AM, He Zhe wrote:<br>
&gt; Any more comments?<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Zhe<br>
&gt;<br>
&gt; On 02/24/2016 08:20 PM, <a href=3D"mailto:zhe.he@windriver.com">zhe.he=
@windriver.com</a> wrote:<br>
&gt;&gt; From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@wi=
ndriver.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; v1 to v2:<br>
&gt;&gt;=C2=A0 - Change KERNEL_OUTPUT to KERNEL_OUTPUT_DIR and update comme=
nts<br>
&gt;&gt;=C2=A0 - Update related doc files<br>
&gt;&gt;=C2=A0 - Replace all KERNEL_ALT_IMAGETYPEs with KERNEL_IMAGETYPES<b=
r>
&gt;&gt;=C2=A0 - Link built vmlinuz to boot directory for reference<br>
&gt;&gt;<br>
&gt;&gt; v2 to v3:<br>
&gt;&gt;=C2=A0 - Merge existing KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES=
 in order that users can still use the old variables.<br>
&gt;&gt;=C2=A0 - Run oe_rummake in a loop for every types so that we can ad=
d different configurations to them easily in the future.<br>
&gt;&gt;=C2=A0 - Warn, intead of die, users if one of the types are over th=
e size limit.<br>
&gt;&gt;=C2=A0 - Remove the replacement of KERNEL_ALT_IMAGETYPE in v2.<br>
&gt;&gt;=C2=A0 - Remove the doc parts. They will be submitted yocto-docs la=
ter.<br>
&gt;&gt;=C2=A0 - Change some grep usage to make it more clear.<br>
&gt;&gt;=C2=A0 - Correct a typo.<br>
&gt;&gt;<br>
&gt;&gt; The following changes since commit 23056103c949b498c23b47579e8dd57=
ce78e6ed9:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0uclibc: Do not use immediate expansion operator (2016-=
02-22 20:42:48 +0000)<br>
&gt;&gt;<br>
&gt;&gt; are available in the git repository at:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0git://<a href=3D"http://git.yoctoproject.org/poky-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/poky-contrib=
</a> zhe/yocto-bug-6945<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/p=
oky-contrib/commit/?h=3Dzhe/yocto-bug-6945" rel=3D"noreferrer" target=3D"_b=
lank">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dzh=
e/yocto-bug-6945</a><br>
&gt;&gt;<br>
&gt;&gt; for you to fetch changes up to dc52a1efbb8248ea274a1cd0cca5734290b=
3025f:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in boot directory =
(2016-02-24 07:08:16 -0500)<br>
&gt;&gt;<br>
&gt;&gt; ----------------------------------------------------------------<b=
r>
&gt;&gt; He Zhe (2):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel: Add KERNEL_IMAGETYPES to build m=
ulti types kernel at one time<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in b=
oot directory<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 ++++++++-------<br>
&gt;&gt;=C2=A0 meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 44 +++++++++++++++++++++-----------<br>
&gt;&gt;=C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 ++++++++--------<br>
&gt;&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++------------------------=
---------------<br>
&gt;&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++-<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 =
49 ++++++++++++++++++++++--------------<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-=
<br>
&gt;&gt;=C2=A0 7 files changed, 218 insertions(+), 109 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; He Zhe (2):<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Add KERNEL_IMAGETYPES to build multi types ker=
nel at one time<br>
&gt;&gt;=C2=A0 =C2=A0kernel: Make symbol link to vmlinuz in boot directory<=
br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/kernel-fitimage.bbclass=C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 20 ++--<br>
&gt;&gt;=C2=A0 meta/classes/kernel-grub.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 44 ++++---<br>
&gt;&gt;=C2=A0 meta/classes/kernel-uimage.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 ++--<br>
&gt;&gt;=C2=A0 meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 187 +++++++++++++++++++++---------<br>
&gt;&gt;=C2=A0 meta/conf/documentation.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +-<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-dtb.inc=C2=A0 =C2=A0|=C2=A0 =
49 +++++---<br>
&gt;&gt;=C2=A0 meta/recipes-kernel/linux/linux-yocto.inc |=C2=A0 =C2=A02 +-=
<br>
&gt;&gt;=C2=A0 7 files changed, 218 insertions(+), 109 deletions(-)<br>
&gt;&gt;<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer=
, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113cbc0c2c443e052e9aeeee--
