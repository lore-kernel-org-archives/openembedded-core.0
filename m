Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id C59E46C230
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 08:24:53 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:2:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 9CE7DA29E6;
	Mon, 29 Jul 2019 10:24:52 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
	dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
	header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1564388690; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	content-type:content-type:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=8pWteW7xnynyRQ3BkpSHbmcNCtOes7F5OFRWgk248kE=;
	b=vDbP5iGBRjTGlSbnOXtgnXD7jNqEunuX9p1wHtAjqoQ4RaMUmE3aGDpB+pwtnzyeB/ao7W
	HcGS4BSS7ZjXVLNTf2UnSsR8wuQV1qS18v3NWn9FjHbojEI6V4aciHwzjjlwmey8x+9HA0
	ttcVeYT2oUxQozHyoJJolHp4GziL8HFXIG3SgFhIfVyiO/JgwVNZNLeOpJkCsaYrkE8O3x
	VBdpa5h/k/quMW7FUQjlLdHh+kjASZ4eD6oNNy9WJSYwgr5LzuFCWESTT1qyuFInjbXTIb
	yVrCB889Ds/5/3RGfj8LjIaZcqB+azShY3ZjzenGmQoWs3ugkt5sYKflko208A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-type:content-type:in-reply-to
	:mime-version:date:date:message-id:from:from:references:subject
	:subject:received; s=mail20150812; t=1564388675; bh=JQDG4NhZlB90
	P3KDbq0+QN04KLRZ7vVhVSVkgxEsM7U=; b=ibiAEjygYYwFFdLa2XnYdGdo4/Hv
	H8maw6HkTxHqEoM9jI5rFz1ZfonuISdh2jyZZUxznzV+o6Vg7Dd36lKcwrjX4DEF
	8AlQ6aQu9ZDa+++QMeehlY9pzYAZCetvyK57ALfmVNF1oQyu5U2h8ilYO73r69Mm
	cF6p/pTY8dc7jFapoj/exwpR94km6yTBsAsZF3FAyBA0GHRIjzaNwMj+kZKaOQj1
	fgXWiwoFeFj5W4NuFdog0LnsU7c7ATAuVuoi2SkSrxAYuQSMShVQEtTZWxAESHo2
	7PHViN1Q0zhnrLi1suRMUrhpR0NoLBFgJMIj66hHVBBoiUSFnggcAyxdOQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
	by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de
	[80.241.56.122]) (amavisd-new, port 10030)
	with ESMTP id kEkEBrMMQrkl; Mon, 29 Jul 2019 10:24:35 +0200 (CEST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	Derek Straka <derek@asterius.io>, Hongxu Jia <hongxu.jia@windriver.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	changhyeok.bae@gmail.com, Chen Qi <Qi.Chen@windriver.com>,
	Yi Zhao <yi.zhao@windriver.com>, Anuj Mittal <anuj.mittal@intel.com>,
	Robert Yang <liezhi.yang@windriver.com>, Armin Kuster
	<akuster808@gmail.com>, "Paul Eggleton (paul.eggleton@linux.intel.com)"
	<paul.eggleton@linux.intel.com>, Tanu Kaskinen <tanuk@iki.fi>,
	Khem Raj <raj.khem@gmail.com>,
	"Hatle, Mark G (Wind River)" <mark.hatle@windriver.com>,
	Fathi Boudra <fathi.boudra@linaro.org>, Tom Rini <trini@konsulko.com>, 
	Denys Dmytriyenko <denys@ti.com>
References: <20190717134750.65BCA440002@auh.yoctoproject.org>
	<014a27db-3a87-c1a8-a8ee-94d9e38f9ef1@mailbox.org>
	<CANNYZj_7w1_6TDjmP2hRpxR3g_0dyR+X_YV7GA3s3Lwys4QONg@mail.gmail.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <0d8e1eae-41ee-3373-421f-a20bbf56702c@mailbox.org>
Date: Mon, 29 Jul 2019 10:24:10 +0200
MIME-Version: 1.0
In-Reply-To: <CANNYZj_7w1_6TDjmP2hRpxR3g_0dyR+X_YV7GA3s3Lwys4QONg@mail.gmail.com>
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
X-List-Received-Date: Mon, 29 Jul 2019 08:24:54 -0000
Content-Type: multipart/alternative;
	boundary="------------7DADF0125399C40C3D1232E9"
Content-Language: en-US

--------------7DADF0125399C40C3D1232E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

OK, an update. I have fixed the recipe, updated both the patch and the 
SRCREV etc. But, the patch itself is not exactly okay anymore. Upstream 
prefers runtime detection of optional features over compile-time 
detection. Also, they are moving away from autotools towards meson, so 
the Makefile.am etc. changes won't do anything.

I'll spend a few more days to update this.


On 17.07.19 21:34, Alexander Kanavin wrote:
> Thanks.
>
> Generally I want to request all of the maintainers to pay attention to 
> those AUH emails and act on them, or put respective action points in 
> your TODO. If you feel like you can't allocate time to this work, or 
> lost interest (which is totally fine), please let the project know; 
> the worst outcome is simply ignoring the emails.
>
> Regards,
> Alex
>
> On Wed, 17 Jul 2019 at 19:41, Carlos Rafael Giani <crg7475@mailbox.org 
> <mailto:crg7475@mailbox.org>> wrote:
>
>     I noticed this already, yes. Working on it.
>
>     On 17.07.19 15:47, auh@auh.yoctoproject.org
>     <mailto:auh@auh.yoctoproject.org> wrote:
>     > Hello,
>     >
>     > You are receiving this email because you are the maintainer
>     > of *kmscube* recipe and this is to let you know that the
>     automatic attempt
>     > to upgrade the recipe to
>     *a12e306ce18ff1c2922219a5342fa419ee80a12e* has Failed (devtool error).
>     >
>     > Detailed error information:
>     >
>     > Running 'devtool upgrade' for recipe kmscube failed.
>     > NOTE: Starting bitbake server...
>     > NOTE: Bitbake server didn't start within 5 seconds, waiting for 90
>     > NOTE: Reconnecting to bitbake server...
>     > NOTE: Retrying server connection (#1)...
>     > WARNING: Layer workspacelayer should set
>     LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file to
>     list the core layer names it is compatible with.
>     > Loading cache...done.
>     > INFO: Extracting current version source...
>     > Loaded 1324 entries from dependency cache.
>     >
>     > Summary: There was 1 WARNING message shown.
>     > NOTE: Resolving any missing task queue dependencies
>     >
>     > Build Configuration:
>     > BB_VERSION           = "1.43.0"
>     > BUILD_SYS            = "x86_64-linux"
>     > NATIVELSBSTRING      = "universal"
>     > TARGET_SYS           = "i686-poky-linux"
>     > MACHINE              = "qemux86"
>     > DISTRO               = "poky"
>     > DISTRO_VERSION       = "2.7+snapshot-20190716"
>     > TUNE_FEATURES        = "m32 core2"
>     > TARGET_FPU           = ""
>     > meta
>     > meta-poky
>     > meta-yocto-bsp       =
>     "tmp-auh-upgrades:d1d025cb80e75952d4a8c5e0e5d44ca6d9716b5a"
>     > workspace            = "<unknown>:<unknown>"
>     >
>     > Initialising tasks...NOTE: No setscene tasks
>     > NOTE: Executing Tasks
>     > NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to
>     be rerun and all succeeded.
>     > NOTE: Writing buildhistory
>     > NOTE: Writing buildhistory took: 2 seconds
>     > INFO: Extracting upgraded version source...
>     > WARNING: Command 'git rebase
>     a12e306ce18ff1c2922219a5342fa419ee80a12e' failed:
>     > First, rewinding head to replay your work on top of it...
>     > Applying: Detect gst_bo_map/_unmap and use it (or avoid it)
>     > Using index info to reconstruct a base tree...
>     > M     Makefile.am
>     > M     kmscube.c
>     > Falling back to patching base and 3-way merge...
>     > Auto-merging kmscube.c
>     > Auto-merging Makefile.am
>     > CONFLICT (content): Merge conflict in Makefile.am
>     > error: Failed to merge in the changes.
>     > Patch failed at 0001 Detect gst_bo_map/_unmap and use it (or
>     avoid it)
>     > The copy of the patch that failed is found in:
>     .git/rebase-apply/patch
>     >
>     > When you have resolved this problem, run "git rebase --continue".
>     > If you prefer to skip this patch, run "git rebase --skip" instead.
>     > To check out the original branch and stop rebasing, run "git
>     rebase --abort".
>     >
>     > You will need to resolve conflicts in order to complete the upgrade.
>     > INFO: Upgraded source extracted to
>     /home/auh/build/workspace/sources/kmscube
>     > INFO: New recipe is
>     /home/auh/build/workspace/recipes/kmscube/kmscube_git.bb
>     <http://kmscube_git.bb>
>     >
>     >
>     >
>     > Please review the attached files for further information and
>     build/update failures.
>     > Any problem please file a bug at
>     https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>     >
>     > Regards,
>     > The Upgrade Helper
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--------------7DADF0125399C40C3D1232E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>OK, an update. I have fixed the recipe, updated both the patch
      and the SRCREV etc. But, the patch itself is not exactly okay
      anymore. Upstream prefers runtime detection of optional features
      over compile-time detection. Also, they are moving away from
      autotools towards meson, so the Makefile.am etc. changes won't do
      anything.</p>
    <p>I'll spend a few more days to update this.</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17.07.19 21:34, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_7w1_6TDjmP2hRpxR3g_0dyR+X_YV7GA3s3Lwys4QONg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">Thanks.
        <div><br>
        </div>
        <div>Generally I want to request all of the maintainers to pay
          attention to those AUH emails and act on them, or put
          respective action points in your TODO. If you feel like you
          can't allocate time to this work, or lost interest (which is
          totally fine), please let the project know; the worst outcome
          is simply ignoring the emails.</div>
        <div><br>
        </div>
        <div>Regards,</div>
        <div>Alex</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, 17 Jul 2019 at 19:41,
          Carlos Rafael Giani &lt;<a href="mailto:crg7475@mailbox.org"
            target="_blank" moz-do-not-send="true">crg7475@mailbox.org</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">I
          noticed this already, yes. Working on it.<br>
          <br>
          On 17.07.19 15:47, <a href="mailto:auh@auh.yoctoproject.org"
            target="_blank" moz-do-not-send="true">auh@auh.yoctoproject.org</a>
          wrote:<br>
          &gt; Hello,<br>
          &gt;<br>
          &gt; You are receiving this email because you are the
          maintainer<br>
          &gt; of *kmscube* recipe and this is to let you know that the
          automatic attempt<br>
          &gt; to upgrade the recipe to
          *a12e306ce18ff1c2922219a5342fa419ee80a12e* has Failed (devtool
          error).<br>
          &gt;<br>
          &gt; Detailed error information:<br>
          &gt;<br>
          &gt; Running 'devtool upgrade' for recipe kmscube failed.<br>
          &gt; NOTE: Starting bitbake server...<br>
          &gt; NOTE: Bitbake server didn't start within 5 seconds,
          waiting for 90<br>
          &gt; NOTE: Reconnecting to bitbake server...<br>
          &gt; NOTE: Retrying server connection (#1)...<br>
          &gt; WARNING: Layer workspacelayer should set
          LAYERSERIES_COMPAT_workspacelayer in its conf/layer.conf file
          to list the core layer names it is compatible with.<br>
          &gt; Loading cache...done.<br>
          &gt; INFO: Extracting current version source...<br>
          &gt; Loaded 1324 entries from dependency cache.<br>
          &gt;<br>
          &gt; Summary: There was 1 WARNING message shown.<br>
          &gt; NOTE: Resolving any missing task queue dependencies<br>
          &gt;<br>
          &gt; Build Configuration:<br>
          &gt; BB_VERSION           = "1.43.0"<br>
          &gt; BUILD_SYS            = "x86_64-linux"<br>
          &gt; NATIVELSBSTRING      = "universal"<br>
          &gt; TARGET_SYS           = "i686-poky-linux"<br>
          &gt; MACHINE              = "qemux86"<br>
          &gt; DISTRO               = "poky"<br>
          &gt; DISTRO_VERSION       = "2.7+snapshot-20190716"<br>
          &gt; TUNE_FEATURES        = "m32 core2"<br>
          &gt; TARGET_FPU           = ""<br>
          &gt; meta<br>
          &gt; meta-poky<br>
          &gt; meta-yocto-bsp       =
          "tmp-auh-upgrades:d1d025cb80e75952d4a8c5e0e5d44ca6d9716b5a"<br>
          &gt; workspace            = "&lt;unknown&gt;:&lt;unknown&gt;"<br>
          &gt;<br>
          &gt; Initialising tasks...NOTE: No setscene tasks<br>
          &gt; NOTE: Executing Tasks<br>
          &gt; NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't
          need to be rerun and all succeeded.<br>
          &gt; NOTE: Writing buildhistory<br>
          &gt; NOTE: Writing buildhistory took: 2 seconds<br>
          &gt; INFO: Extracting upgraded version source...<br>
          &gt; WARNING: Command 'git rebase
          a12e306ce18ff1c2922219a5342fa419ee80a12e' failed:<br>
          &gt; First, rewinding head to replay your work on top of it...<br>
          &gt; Applying: Detect gst_bo_map/_unmap and use it (or avoid
          it)<br>
          &gt; Using index info to reconstruct a base tree...<br>
          &gt; M     Makefile.am<br>
          &gt; M     kmscube.c<br>
          &gt; Falling back to patching base and 3-way merge...<br>
          &gt; Auto-merging kmscube.c<br>
          &gt; Auto-merging Makefile.am<br>
          &gt; CONFLICT (content): Merge conflict in Makefile.am<br>
          &gt; error: Failed to merge in the changes.<br>
          &gt; Patch failed at 0001 Detect gst_bo_map/_unmap and use it
          (or avoid it)<br>
          &gt; The copy of the patch that failed is found in:
          .git/rebase-apply/patch<br>
          &gt;<br>
          &gt; When you have resolved this problem, run "git rebase
          --continue".<br>
          &gt; If you prefer to skip this patch, run "git rebase --skip"
          instead.<br>
          &gt; To check out the original branch and stop rebasing, run
          "git rebase --abort".<br>
          &gt;<br>
          &gt; You will need to resolve conflicts in order to complete
          the upgrade.<br>
          &gt; INFO: Upgraded source extracted to
          /home/auh/build/workspace/sources/kmscube<br>
          &gt; INFO: New recipe is
          /home/auh/build/workspace/recipes/kmscube/<a
            href="http://kmscube_git.bb" rel="noreferrer"
            target="_blank" moz-do-not-send="true">kmscube_git.bb</a><br>
          &gt;<br>
          &gt;<br>
          &gt;<br>
          &gt; Please review the attached files for further information
          and build/update failures.<br>
          &gt; Any problem please file a bug at <a
href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler"
            rel="noreferrer" target="_blank" moz-do-not-send="true">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a><br>
          &gt;<br>
          &gt; Regards,<br>
          &gt; The Upgrade Helper<br>
          -- <br>
          _______________________________________________<br>
          Openembedded-core mailing list<br>
          <a href="mailto:Openembedded-core@lists.openembedded.org"
            target="_blank" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br>
          <a
            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
            rel="noreferrer" target="_blank" moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------7DADF0125399C40C3D1232E9--
