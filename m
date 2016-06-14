Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4BFBE60249
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:11:58 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id h190so431931ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 12:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=EJUjaAz1enpHRiRCTksSHkv1y5q+aixXEgAuxBbo1fI=;
	b=DXV5uJeh8m6GMLOB332h4D839yQcEhD9jUZxNb7iWUwp0RjTQBkXyFpeheBEcOZ1eM
	ZP6vatUOeJhV/CtAF+VtTslBznRIGD7bpKZpWAeiUVF+M94iqNHx8zumU4VnnQeGz+EJ
	wPcfvwI2s3jMsx/d68HwKWtF27lNQiJuDOQ7g3p472l2D/kyiLYKgxSpTPhqQDTgt78P
	fg+pvCzj0zCcMvLA1MiYwg/uRLwusUstVdnrxrzsSfS1FB7HhoYoAV5Un//iwZcibbos
	Qd/cPAhGrmrLXNKjlaFHnlcfjyNkDJYXf1v4aATm8e+/HHCeQXEyqlskT0twRrH7RjpV
	tVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=EJUjaAz1enpHRiRCTksSHkv1y5q+aixXEgAuxBbo1fI=;
	b=eZCEjiDIroG7u/vcG0WbF/CKSSa8uS0B4rSxDr66CJg5sZTk2c01MvlJhGxjT2W8Ge
	ND5F/9ceRH3EDvN+yXyddauPlm0UYNrALU0vgNEtZyNAAwNg3GHVn9bXTE3daVSqeWa7
	zGHiYTMw9gSPnOFPZ/QcMs6InGreS6YHoWQ9Fi+gPCmaqROE6u5SilOMEgJIndj+JmSS
	DWQdG2k6qQUfyP6FdFa+vBOMlGtHYy3lyl+UYniOMS1ZpWjKIw3tJP1pVZjPSAIssobA
	QFgqSYF73V0+h/ebbVhImRe/SD0FxMYLqY6VWR9XPYmfYWY09x6zoO6UFloPhAn8g0Vs
	5Mcw==
X-Gm-Message-State: ALyK8tIXgBd2RC/8cMl4CNs3oAFiSSoGBkxhgWXZe7qne8Qyer3F6lDQgc59GhEo2dPemfxGOFIrglKJ857l+A==
X-Received: by 10.36.142.193 with SMTP id h184mr29964288ite.66.1465931519391; 
	Tue, 14 Jun 2016 12:11:59 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.130.66 with HTTP; Tue, 14 Jun 2016 12:11:40 -0700 (PDT)
In-Reply-To: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
References: <1465917529-18674-1-git-send-email-ross.burton@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 14 Jun 2016 12:11:40 -0700
X-Google-Sender-Auth: OK5jFsQAenaBxPRuHZicmRB7q2U
Message-ID: <CABcZAN=DXBtL3cMurX5rbEFGm-hRPFerGs0bphtBibCTEutjpg@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/rm_work: use the idle I/O scheduler class
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
X-List-Received-Date: Tue, 14 Jun 2016 19:12:01 -0000
Content-Type: multipart/alternative; boundary=94eb2c04bbce7a7cd6053541c746

--94eb2c04bbce7a7cd6053541c746
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 14, 2016 at 8:18 AM, Ross Burton <ross.burton@intel.com> wrote:

> As rm_work is just cleanup it shouldn't starve more important tasks such as
> do_compile of I/O, so use BB_TASK_IONICE_LEVEL to run the task in the idle
> scheduler class.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Nice.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c04bbce7a7cd6053541c746
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jun 14, 2016 at 8:18 AM, Ross Burton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":395" cla=
ss=3D"a3s aXjCH m1554f7ea46270a5d">As rm_work is just cleanup it shouldn&#3=
9;t starve more important tasks such as<br>
do_compile of I/O, so use BB_TASK_IONICE_LEVEL to run the task in the idle<=
br>
scheduler <span class=3D"il">class</span>.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;</div></blockquote></div><br>Nice.<br>-- <br><div=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature">Christopher L=
arson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, Ope=
nZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics<=
/div>
</div></div>

--94eb2c04bbce7a7cd6053541c746--
