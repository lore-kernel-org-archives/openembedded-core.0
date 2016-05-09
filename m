Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2D94673167
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 12:08:54 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id x1so81630597obt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=mwkM8yLWSmXT/xueantjEkXTAgqv2SjM+1zr5qEx/yM=;
	b=iMuUAyLYo3ggWbOd9/6uJSTQvHY4t3BSNvKRRoQc5G6ZslAo8/Yc8iw7nVTapMUAJo
	3XpK7A8TmgFUge3B1v5H9f9F/AL7DcqQWsbfvRqZtGkYhywi/w+0Z/mUT4U3K7tDgiRC
	goavEBuZdFaBlevFsOgXtEU54Po0dniLAk6wPfkoCONWfAJWWG9hsKCffj2878awJeZg
	Roj7+ghleicN5MjvMkA8c06Ux0F138l5iWrhZyuE9sL3PNr9Jd3GBkW9xS5ojdO+QvsQ
	jgEo+JcTfqB/dvy78raxSlaqZovTE18V6s/HKciZO0kmPu0Rm7WmpBrqbetHvNn/Tgc+
	h8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=mwkM8yLWSmXT/xueantjEkXTAgqv2SjM+1zr5qEx/yM=;
	b=aL4OZSgbFQd/25593i5F+gqsHFDT8ib7K9uPPDgcjq26FKCEZOvCSIHda8EqwBICt8
	QE8r5F2t/qUZLvNO+8aMJLSGUOl3pss8zg0YNgKgtrbCymE1KMDNNv8qFiiJA61AAOZn
	RO7hZJ5isPuxzIOT7D333apq9CQVnsYBScG/jPRev844sEewguDfgwAZ2eBvbTO8GXkq
	700HKhfhf2uaRDa3DR2xXdy941CX17bYO5LkMJduWXlWLFEor8+vTgFK1Pn3QkS5PMpp
	93oWUMEkaRyA6LHyWgjfcZvSc58ZE9H+n+5yOxovxJaMKptCXJCkbyRpEnfW1CPDlbjk
	eh8w==
X-Gm-Message-State: AOPr4FVgkRHf8Ux/J+oyslAP99mlyhvVaRXK0lrAioUCbxgTy7nCeeZSgcyHmc6JiFNk7RkoXCYsSaYtd/3Gkw==
MIME-Version: 1.0
X-Received: by 10.182.190.43 with SMTP id gn11mr15828711obc.15.1462795735565; 
	Mon, 09 May 2016 05:08:55 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Mon, 9 May 2016 05:08:55 -0700 (PDT)
In-Reply-To: <cover.1462768634.git.paul.eggleton@linux.intel.com>
References: <cover.1462768634.git.paul.eggleton@linux.intel.com>
Date: Mon, 9 May 2016 08:08:55 -0400
Message-ID: <CADkTA4OUeFUdVVqoLaTH6+yW+E6rL6sbz4pZnBn1e6RnMOUCgg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/6] Kernel configuration check for recipes
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
X-List-Received-Date: Mon, 09 May 2016 12:08:55 -0000
Content-Type: multipart/alternative; boundary=f46d0418273a32973c053267ac98

--f46d0418273a32973c053267ac98
Content-Type: text/plain; charset=UTF-8

On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Add the capability for other recipes to verify that kernel
> configuration options they depend upon at runtime are present, and warn
> if they are missing. This seems functional enough to me but is still in
> RFC - please let me know if it looks OK to you or I've missed anything
> (no doubt there are recipes we could add the checks to, I refer mainly
> to the mechanism itself).
>
>
> Please review the following changes for suitability for inclusion. If you
> have
> any objections or suggestions for improvement, please respond to the
> patches. If
> you agree with the changes, please provide your Acked-by.
>
>
See my replies to the patches. I'm sure it won't matter in the end, but
this is a duplication
of the mechanisms that we already have in the kernel config check phase. I
have a whole
set of changes that I completed early this year that extends that mechanism
to any kernel
(not just kernel-yocto) classes. In that mechanism there's the concept of
"required" and
"optional" Kconfig options. If they aren't present in the final .config, we
warn and optionally
error (this is versus the currently mechanism of only warning if boot
critical options are
dropped).

I'm betting that the follow on to this series will be "Hey recipes should
set the options for the kernel if
they really need them" .. which IMHO is an incredibly bad idea.

Cheers,

Bruce


> The following changes since commit
> ece101be5158beee709cdfbb85ecdbdc8d9fb864:
>
>   test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/kernel-check
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/kernel-check
>
> Paul Eggleton (6):
>   classes/kernel-check: add a class to check kernel config options
>   eudev: check for required kernel config options
>   systemd: check for required kernel config options
>   classes/kernel: fix typo
>   classes/kernel: check OLDEST_KERNEL at configure time
>   classes/image: check kernel config supports IMAGE_FSTYPES items
>
>  meta/classes/image.bbclass               | 23 ++++++++
>  meta/classes/image_types.bbclass         | 11 ++++
>  meta/classes/kernel-check.bbclass        | 97
> ++++++++++++++++++++++++++++++++
>  meta/classes/kernel.bbclass              | 16 +++++-
>  meta/recipes-core/systemd/systemd_229.bb | 19 ++++++-
>  meta/recipes-core/udev/eudev_3.1.5.bb    | 22 +++++++-
>  6 files changed, 185 insertions(+), 3 deletions(-)
>  create mode 100644 meta/classes/kernel-check.bbclass
>
> --
> 2.5.5
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

--f46d0418273a32973c053267ac98
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, May 9, 2016 at 12:43 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Add the capability for other recipes to verify that kernel<br>
configuration options they depend upon at runtime are present, and warn<br>
if they are missing. This seems functional enough to me but is still in<br>
RFC - please let me know if it looks OK to you or I&#39;ve missed anything<=
br>
(no doubt there are recipes we could add the checks to, I refer mainly<br>
to the mechanism itself).<br>
<br>
<br>
Please review the following changes for suitability for inclusion. If you h=
ave<br>
any objections or suggestions for improvement, please respond to the patche=
s. If<br>
you agree with the changes, please provide your Acked-by.<br>
<br></blockquote><div><br></div><div>See my replies to the patches. I&#39;m=
 sure it won&#39;t matter in the end, but this is a duplication</div><div>o=
f the mechanisms that we already have in the kernel config check phase. I h=
ave a whole</div><div>set of changes that I completed early this year that =
extends that mechanism to any kernel</div><div>(not just kernel-yocto) clas=
ses. In that mechanism there&#39;s the concept of &quot;required&quot; and<=
/div><div>&quot;optional&quot; Kconfig options. If they aren&#39;t present =
in the final .config, we warn and optionally</div><div>error (this is versu=
s the currently mechanism of only warning if boot critical options are</div=
><div>dropped).</div><div><br></div><div>I&#39;m betting that the follow on=
 to this series will be &quot;Hey recipes should set the options for the ke=
rnel if</div><div>they really need them&quot; .. which IMHO is an incredibl=
y bad idea.</div><div><br></div><div>Cheers,</div><div><br></div><div>Bruce=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
The following changes since commit ece101be5158beee709cdfbb85ecdbdc8d9fb864=
:<br>
<br>
=C2=A0 test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:47:59 +01=
00)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> paule/kernel-check<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Dpaule/kernel-check" rel=3D"noreferrer" target=3D"_blank">ht=
tp://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dpaul=
e/kernel-check</a><br>
<br>
Paul Eggleton (6):<br>
=C2=A0 classes/kernel-check: add a class to check kernel config options<br>
=C2=A0 eudev: check for required kernel config options<br>
=C2=A0 systemd: check for required kernel config options<br>
=C2=A0 classes/kernel: fix typo<br>
=C2=A0 classes/kernel: check OLDEST_KERNEL at configure time<br>
=C2=A0 classes/image: check kernel config supports IMAGE_FSTYPES items<br>
<br>
=C2=A0meta/classes/image.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 23 ++++++++<br>
=C2=A0meta/classes/image_types.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
1 ++++<br>
=C2=A0meta/classes/kernel-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 97 +++=
+++++++++++++++++++++++++++++<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 16 +++++-<br>
=C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_229.bb" rel=3D"no=
referrer" target=3D"_blank">systemd_229.bb</a> | 19 ++++++-<br>
=C2=A0meta/recipes-core/udev/<a href=3D"http://eudev_3.1.5.bb" rel=3D"noref=
errer" target=3D"_blank">eudev_3.1.5.bb</a>=C2=A0 =C2=A0 | 22 +++++++-<br>
=C2=A06 files changed, 185 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 meta/classes/kernel-check.bbclass<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--f46d0418273a32973c053267ac98--
