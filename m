Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADEF776BE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 13:49:39 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id h9so21589947qke.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Mar 2017 05:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lEK4ccCB4rAOum9CcgccbpuOYSTqB36aPmsfqqGEliw=;
	b=dDK8M/Kla5CgLmRcIolwiLBl/rUKvQqzXRMMHzSS3mmPs/afzlfQi48uwBMFSPP9wJ
	WUzaCGmvr+69Y67VV2pwmg90GyVvyMQvYZgRGPAVzIPsnvYKRiFjGysydGnVP8F7YYq7
	J6P+mZdn2ruutat4+Vb1o4mFciSsQDzV3rGn7Xihq4PmxG49YfJ8/bPuda6AGFfDF8es
	lvCyogfEoTlseZ0VrEcFGIHZutAJD7GHMGc6DSrlaDO9KOpRj27LLPLKBkQrPomY4L2v
	TB/rmm/SJDNmNAEoaf/KKMTnSw/CeOHRxg1MLCQHqGvxgHoLd8oL2cITlnkK4nxd+hIz
	r7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lEK4ccCB4rAOum9CcgccbpuOYSTqB36aPmsfqqGEliw=;
	b=g9kVjBKxpN42TRpi/GBWf9vUfSU0w92t+f7mWSl59+6IAVTnjlR8fE/LXAe1YMOVOG
	q5o4dIp23O46WbPmrdiZTanVm6ov1V8PI+L4FIr5UI0Y9/Navmi40yfh387s9tKxBffv
	5LMwvkJCTp+620LAphG4WYwmtVj/GoGR+6C7s6xn0PRUhMLisGm3PdhPETM2ZOBynYLg
	MokxilRozWHH6tuKjbYfzYuT82VSPTUDXs18vs2PgurK3YryYqJuiCUG24soJxjkicTd
	Qh11u0hY6BOesbIUm7Pi8B48GNbrd6HzTfA9CmEMdUSG++zWadXcgG0mRGb3BlTxczvC
	QrlQ==
X-Gm-Message-State: AMke39knG5u4ijb2BWDgwi2mXCotbl/dqaokmBuvD98coxw4kQbyG9m52TN0u0o7Uqvnzubji6Lc94HzhPueYFzM
X-Received: by 10.55.183.133 with SMTP id h127mr2790691qkf.121.1488548981154; 
	Fri, 03 Mar 2017 05:49:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 3 Mar 2017 05:49:20 -0800 (PST)
In-Reply-To: <d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Mar 2017 13:49:20 +0000
Message-ID: <CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Fri, 03 Mar 2017 13:49:41 -0000
Content-Type: multipart/alternative; boundary=94eb2c06005641185f0549d3d1c6

--94eb2c06005641185f0549d3d1c6
Content-Type: text/plain; charset=UTF-8

On 3 March 2017 at 12:12, Fabio Berton <fabio.berton@ossystems.com.br>
wrote:

> Sorry for delay. This error for qemux86 is because common.wks.inc and
> directdisk-gpt.wks files in scripts/lib/wic/canned-wks directory doesn't
> have option --fstype= for part /boot.
>
> For qemuarm machines I get the error:
>
> | DEBUG: Executing python function set_image_size
> | DEBUG: Python function set_image_size finished
> | DEBUG: Executing shell function do_image_wic
> | Error: Please build syslinux first
>

There's patches queued that will change the behaviour here and likely cause
your patch to not apply - can you rebase on top of poky-contrib:ed/wic/wip
and see what happens?  The build dependency is now wic-tools.

Ross

--94eb2c06005641185f0549d3d1c6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 March 2017 at 12:12, Fabio Berton <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.berton@ossystems=
.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><p><tt>Sorr=
y for delay. This error for qemux86 is because
        common.wks.inc and directdisk-gpt.wks files in
        scripts/lib/wic/canned-wks directory doesn&#39;t have option
        --fstype=3D for part /boot.<br>
      </tt></p>
    <p><tt>For qemuarm machines I get the error:</tt></p>
    <p><tt>| DEBUG: Executing python function set_image_size<br>
        | DEBUG: Python function set_image_size finished<br>
        | DEBUG: Executing shell function do_image_wic<br>
        | Error: Please build syslinux first</tt></p></blockquote><div><br>=
</div><div>There&#39;s patches queued that will change the behaviour here a=
nd likely cause your patch to not apply - can you rebase on top of poky-con=
trib:ed/wic/wip and see what happens?=C2=A0 The build dependency is now wic=
-tools.=C2=A0</div></div><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--94eb2c06005641185f0549d3d1c6--
