Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8E53A7ED51
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 19:34:19 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id j26so17348050vsn.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mgYXtAJ/3sT9k8di4+9gdKhekIT+qcXNc5fpJ1jbMwM=;
	b=gTtcmFgQXddkvhrAnsa1mdgtkffvzkWzsG8Xi3ufPkSrRb8LIR8Mpsbm+hngvcCshO
	OKFwNuTwNj4R9P73B3zyR9Vb01b34JEIyplh7yAo73pkz46LVVQ5ypsyM/d/xoP87XBh
	4I8ol8+Toit5fEMKCcuyiTr7gJl4IgyZXsEbTUYiXmitZlLJAO90LC6T6BoV4PRVd+0x
	Lv7qm2wwxIIbHYzD5Ibx+Kq7X+F9Vfp1ET7FAvQ7p7FAVEFzsh5HDO08yX/k14y9sP9C
	zBfSjOqueXIKVr2A5hKVVShFmkT/41tTHf/oYVv/Vt9C65kw4G2KwYlBSr/idwVXWO+b
	B5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mgYXtAJ/3sT9k8di4+9gdKhekIT+qcXNc5fpJ1jbMwM=;
	b=XzDBSSGXWMGK6hlUqQ/h8Bw/+s1h+BQVdp4oL7HX9Lf7Sbd+YnC0bPXcHCUXypGLvJ
	BQz6SbpvB8sDpeRI7ySmOISKDhaape5smYRaxQmToRyFTx2KZw+PFq+DOS1qjjY54xdx
	F9xAYGKR48xeQ7xKQNLzfWMcU0B0Ucd8MHErkwgIW1h+yQquas+YJNGF3sHLgc6zqzMh
	KDbEZTOO6yFpRQNM85Zsp4rXkkFmBbfWI6KId075b2Urskv/vbOqwDrjZwxbxpaUnvTE
	rrxiO7bYJFS0VBu+ScosnqhPSU0PbiIq+fLg6nFs/tQHylF2WpbdJRU/7wkM9bnGieUv
	bRCw==
X-Gm-Message-State: APjAAAVzyV+LVAz76jxoiYVx3Pi2t/1cxxVaFF7AclPUuhe6xeqJ8w7U
	5gtqQScTl2LMwlumS3mpw4ItXui/ACKPDpE0dFo=
X-Google-Smtp-Source: APXvYqx7c8rnFNaBDfne4y857AgOy0lre7Src3jFf9XXaGr0BKbwZOfYpcUx55gDMxzsRrLx8jv6eiRx9owgnx81XOw=
X-Received: by 2002:a67:8042:: with SMTP id b63mr27304920vsd.23.1563392060348; 
	Wed, 17 Jul 2019 12:34:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190717134750.65BCA440002@auh.yoctoproject.org>
	<014a27db-3a87-c1a8-a8ee-94d9e38f9ef1@mailbox.org>
In-Reply-To: <014a27db-3a87-c1a8-a8ee-94d9e38f9ef1@mailbox.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 Jul 2019 22:34:08 +0300
Message-ID: <CANNYZj_7w1_6TDjmP2hRpxR3g_0dyR+X_YV7GA3s3Lwys4QONg@mail.gmail.com>
To: Carlos Rafael Giani <crg7475@mailbox.org>, Derek Straka <derek@asterius.io>,
	Hongxu Jia <hongxu.jia@windriver.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>, 
	"Burton, Ross" <ross.burton@intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	changhyeok.bae@gmail.com, Chen Qi <Qi.Chen@windriver.com>, 
	Yi Zhao <yi.zhao@windriver.com>, Anuj Mittal <anuj.mittal@intel.com>, 
	Robert Yang <liezhi.yang@windriver.com>,
	Armin Kuster <akuster808@gmail.com>, 
	"Paul Eggleton (paul.eggleton@linux.intel.com)"
	<paul.eggleton@linux.intel.com>, Tanu Kaskinen <tanuk@iki.fi>, 
	Khem Raj <raj.khem@gmail.com>, 
	"Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	Fathi Boudra <fathi.boudra@linaro.org>, 
	Tom Rini <trini@konsulko.com>, Denys Dmytriyenko <denys@ti.com>
Cc: Carlos Rafael Giani <dv@pseudoterminal.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] kmscube: upgrading to a12e306ce18ff1c2922219a5342fa419ee80a12e FAILED
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
X-List-Received-Date: Wed, 17 Jul 2019 19:34:19 -0000
Content-Type: multipart/alternative; boundary="00000000000066e12b058de594ff"

--00000000000066e12b058de594ff
Content-Type: text/plain; charset="UTF-8"

Thanks.

Generally I want to request all of the maintainers to pay attention to
those AUH emails and act on them, or put respective action points in your
TODO. If you feel like you can't allocate time to this work, or lost
interest (which is totally fine), please let the project know; the worst
outcome is simply ignoring the emails.

Regards,
Alex

On Wed, 17 Jul 2019 at 19:41, Carlos Rafael Giani <crg7475@mailbox.org>
wrote:

> I noticed this already, yes. Working on it.
>
> On 17.07.19 15:47, auh@auh.yoctoproject.org wrote:
> > Hello,
> >
> > You are receiving this email because you are the maintainer
> > of *kmscube* recipe and this is to let you know that the automatic
> attempt
> > to upgrade the recipe to *a12e306ce18ff1c2922219a5342fa419ee80a12e* has
> Failed (devtool error).
> >
> > Detailed error information:
> >
> > Running 'devtool upgrade' for recipe kmscube failed.
> > NOTE: Starting bitbake server...
> > NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
> > NOTE: Reconnecting to bitbake server...
> > NOTE: Retrying server connection (#1)...
> > WARNING: Layer workspacelayer should set
> LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to list the
> core layer names it is compatible with.
> > Loading cache...done.
> > INFO: Extracting current version source...
> > Loaded 1324 entries from dependency cache.
> >
> > Summary: There was 1 WARNING message shown.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION           = "1.43.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "universal"
> > TARGET_SYS           = "i686-poky-linux"
> > MACHINE              = "qemux86"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "2.7+snapshot-20190716"
> > TUNE_FEATURES        = "m32 core2"
> > TARGET_FPU           = ""
> > meta
> > meta-poky
> > meta-yocto-bsp       =
> "tmp-auh-upgrades:d1d025cb80e75952d4a8c5e0e5d44ca6d9716b5a"
> > workspace            = "<unknown>:<unknown>"
> >
> > Initialising tasks...NOTE: No setscene tasks
> > NOTE: Executing Tasks
> > NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be
> rerun and all succeeded.
> > NOTE: Writing buildhistory
> > NOTE: Writing buildhistory took: 2 seconds
> > INFO: Extracting upgraded version source...
> > WARNING: Command 'git rebase a12e306ce18ff1c2922219a5342fa419ee80a12e'
> failed:
> > First, rewinding head to replay your work on top of it...
> > Applying: Detect gst_bo_map/_unmap and use it (or avoid it)
> > Using index info to reconstruct a base tree...
> > M     Makefile.am
> > M     kmscube.c
> > Falling back to patching base and 3-way merge...
> > Auto-merging kmscube.c
> > Auto-merging Makefile.am
> > CONFLICT (content): Merge conflict in Makefile.am
> > error: Failed to merge in the changes.
> > Patch failed at 0001 Detect gst_bo_map/_unmap and use it (or avoid it)
> > The copy of the patch that failed is found in: .git/rebase-apply/patch
> >
> > When you have resolved this problem, run "git rebase --continue".
> > If you prefer to skip this patch, run "git rebase --skip" instead.
> > To check out the original branch and stop rebasing, run "git rebase
> --abort".
> >
> > You will need to resolve conflicts in order to complete the upgrade.
> > INFO: Upgraded source extracted to
> /home/auh/build/workspace/sources/kmscube
> > INFO: New recipe is /home/auh/build/workspace/recipes/kmscube/
> kmscube_git.bb
> >
> >
> >
> > Please review the attached files for further information and
> build/update failures.
> > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> >
> > Regards,
> > The Upgrade Helper
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000066e12b058de594ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks.<div><br></div><div>Generally I want to request all=
 of the maintainers to pay attention to those AUH emails and act on them, o=
r put respective action points in your TODO. If you feel like you can&#39;t=
 allocate time to this work, or lost interest (which is totally fine), plea=
se let the project know; the worst outcome is simply ignoring the emails.</=
div><div><br></div><div>Regards,</div><div>Alex</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Jul 2019 =
at 19:41, Carlos Rafael Giani &lt;<a href=3D"mailto:crg7475@mailbox.org" ta=
rget=3D"_blank">crg7475@mailbox.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex=
">I noticed this already, yes. Working on it.<br>
<br>
On 17.07.19 15:47, <a href=3D"mailto:auh@auh.yoctoproject.org" target=3D"_b=
lank">auh@auh.yoctoproject.org</a> wrote:<br>
&gt; Hello,<br>
&gt;<br>
&gt; You are receiving this email because you are the maintainer<br>
&gt; of *kmscube* recipe and this is to let you know that the automatic att=
empt<br>
&gt; to upgrade the recipe to *a12e306ce18ff1c2922219a5342fa419ee80a12e* ha=
s Failed (devtool error).<br>
&gt;<br>
&gt; Detailed error information:<br>
&gt;<br>
&gt; Running &#39;devtool upgrade&#39; for recipe kmscube failed.<br>
&gt; NOTE: Starting bitbake server...<br>
&gt; NOTE: Bitbake server didn&#39;t start within 5 seconds, waiting for 90=
<br>
&gt; NOTE: Reconnecting to bitbake server...<br>
&gt; NOTE: Retrying server connection (#1)...<br>
&gt; WARNING: Layer workspacelayer should set LAYERSERIES_COMPAT_workspacel=
ayer in its conf/layer.conf file to list the core layer names it is compati=
ble with.<br>
&gt; Loading cache...done.<br>
&gt; INFO: Extracting current version source...<br>
&gt; Loaded 1324 entries from dependency cache.<br>
&gt;<br>
&gt; Summary: There was 1 WARNING message shown.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.43.0&qu=
ot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-li=
nux&quot;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;universal&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;i686-poky=
-linux&quot;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;qemu=
x86&quot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot=
;poky&quot;<br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;2.7+snapshot-201907=
16&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;m32 core2&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;&quot;<br=
>
&gt; meta<br>
&gt; meta-poky<br>
&gt; meta-yocto-bsp=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;tmp-auh-upgrades:d1=
d025cb80e75952d4a8c5e0e5d44ca6d9716b5a&quot;<br>
&gt; workspace=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;&lt;unkno=
wn&gt;:&lt;unknown&gt;&quot;<br>
&gt;<br>
&gt; Initialising tasks...NOTE: No setscene tasks<br>
&gt; NOTE: Executing Tasks<br>
&gt; NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn&#39;t need to b=
e rerun and all succeeded.<br>
&gt; NOTE: Writing buildhistory<br>
&gt; NOTE: Writing buildhistory took: 2 seconds<br>
&gt; INFO: Extracting upgraded version source...<br>
&gt; WARNING: Command &#39;git rebase a12e306ce18ff1c2922219a5342fa419ee80a=
12e&#39; failed:<br>
&gt; First, rewinding head to replay your work on top of it...<br>
&gt; Applying: Detect gst_bo_map/_unmap and use it (or avoid it)<br>
&gt; Using index info to reconstruct a base tree...<br>
&gt; M=C2=A0 =C2=A0 =C2=A0Makefile.am<br>
&gt; M=C2=A0 =C2=A0 =C2=A0kmscube.c<br>
&gt; Falling back to patching base and 3-way merge...<br>
&gt; Auto-merging kmscube.c<br>
&gt; Auto-merging Makefile.am<br>
&gt; CONFLICT (content): Merge conflict in Makefile.am<br>
&gt; error: Failed to merge in the changes.<br>
&gt; Patch failed at 0001 Detect gst_bo_map/_unmap and use it (or avoid it)=
<br>
&gt; The copy of the patch that failed is found in: .git/rebase-apply/patch=
<br>
&gt;<br>
&gt; When you have resolved this problem, run &quot;git rebase --continue&q=
uot;.<br>
&gt; If you prefer to skip this patch, run &quot;git rebase --skip&quot; in=
stead.<br>
&gt; To check out the original branch and stop rebasing, run &quot;git reba=
se --abort&quot;.<br>
&gt;<br>
&gt; You will need to resolve conflicts in order to complete the upgrade.<b=
r>
&gt; INFO: Upgraded source extracted to /home/auh/build/workspace/sources/k=
mscube<br>
&gt; INFO: New recipe is /home/auh/build/workspace/recipes/kmscube/<a href=
=3D"http://kmscube_git.bb" rel=3D"noreferrer" target=3D"_blank">kmscube_git=
.bb</a><br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Please review the attached files for further information and build/upd=
ate failures.<br>
&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?pro=
duct=3DAutomated%20Update%20Handler</a><br>
&gt;<br>
&gt; Regards,<br>
&gt; The Upgrade Helper<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--00000000000066e12b058de594ff--
