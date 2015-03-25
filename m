Return-Path: <kergoth@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id D474D6AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 17:31:50 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so51344000qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 10:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=xYEiKB3o4Qs9jPc+S/1g73tN3y2wn+IUS912JpXtnR0=;
	b=dGz7RM9+lv8UxueAwrVJu26FrsL2T7dYSxTSWjpZ3Ot7MGwMI2W/1bxSZb/USNrZDF
	QCRjYsvFnEMNqZ4lJy4KaQ5RB9p3sImxpLWIDPwktRXQ1Dwp88EG/Nn+vGFpn3gRAO+B
	FuojFXB0Wn7Ty7FtodvclIF53XidoUQpuyZci4JFT39tsjL+9ZfD27Peyv5GDs0Xf6fE
	Vq2AY6k8AFqss6L5C82sCaNtgkI2U+YM85Mwx87/9ZkdSLpa17Jy1pWtwUKK2UyVHspT
	k51S9OAisZ/ubgWMruk8alKnVFCPGUkNfJsDuUj8LqkCXPbd9I8Ivgs+PmYv76uH2zwU
	L1OQ==
X-Received: by 10.140.16.99 with SMTP id 90mr12856730qga.105.1427304703797;
	Wed, 25 Mar 2015 10:31:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.75 with HTTP; Wed, 25 Mar 2015 10:31:23 -0700 (PDT)
In-Reply-To: <1427242586-23928-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1427242586-23928-1-git-send-email-randy.e.witt@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 25 Mar 2015 10:31:23 -0700
X-Google-Sender-Auth: A27JRDgsRalHkdpRBGINmogwAmQ
Message-ID: <CABcZANkfjcqPVHPOKZBjQYGAr2HRwmAEha1LgPM3spZ90NwxBw@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_ext: Log the "Preparing build system" step
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
X-List-Received-Date: Wed, 25 Mar 2015 17:31:51 -0000
Content-Type: multipart/alternative; boundary=001a11c067a0db2f1f0512204585

--001a11c067a0db2f1f0512204585
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 24, 2015 at 5:16 PM, Randy Witt <randy.e.witt@linux.intel.com>
wrote:

> When using bitbake to do the setscene as part of sdk setup, it would be
> useful to have a log in the case where it fails.
>
> The log is called preparing_build_system.log and is in the top level
> directory of the extracted sdk.
>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
>

Is this step just doing a setscene from shipped sstate, or is it intended
to build anything from scratch? Because I've seen cases where the sstate
isn't used as it should be, and it ends up taking ages to run real tasks.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c067a0db2f1f0512204585
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Mar 24, 2015 at 5:16 PM, Randy Witt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@lin=
ux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":2u" class=3D"a3s" style=3D"overflow:hidden">When using <span class=3D=
"il">bitbake</span> to do the setscene as part of sdk setup, it would be<br=
>
useful to have a log in the case where it fails.<br>
<br>
The log is called preparing_build_system.log and is in the top level<br>
directory of the extracted sdk.<br>
<br>
Signed-off-by: Randy Witt &lt;<a href=3D"mailto:randy.e.witt@linux.intel.co=
m">randy.e.witt@linux.intel.com</a>&gt;</div></blockquote></div><br>Is this=
 step just doing a setscene from shipped sstate, or is it intended to build=
 anything from scratch? Because I&#39;ve seen cases where the sstate isn&#3=
9;t used as it should be, and it ends up taking ages to run real tasks.<br>=
-- <br><div class=3D"gmail_signature">Christopher Larson<br>clarson at kerg=
oth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - =
Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a11c067a0db2f1f0512204585--
