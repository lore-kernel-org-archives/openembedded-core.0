Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 41A4477045
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:49:22 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ui10so65715345igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MvUJgJjjfSRv3E1ovtbMvCXz1WWCsGQhEoTV/Uqc5uM=;
	b=Ljm41j8wUYWzwU/KqnwlQKToomGrS3RIbLPBQQCrdnvknt0iMM03zxw+zF21IklIdx
	431ZJw/yKTEvaEzbhfbgRfJ3dqTJjVBBxlz0KbavhdGLKLWE7T54zuBMEGUIWIM8Govj
	IEkpBEYCZzd8K7sBLzgQUm+8lw9cZnhnNo9E9l14+XaPlDljeQ2kfmEnVvKcPCgkpH+p
	zLhWRRBfDT6seMWX9JmpFnB6jxvRJpbk0gIAf2HpzkWkkLeewsUud7xUjY8Jbbzgu1Kc
	jhBRdlYKO4uwc50BkSnus9MzBINQedgo9+TelOW4EV3UC4KYTB8tGE9em+RRFFmWq6us
	eaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MvUJgJjjfSRv3E1ovtbMvCXz1WWCsGQhEoTV/Uqc5uM=;
	b=D5YXFtVHPh/hiMK3ENrTSM45YEyHWoq7gP5bNpjnWl0J9pXlWxqj/+hl1XnyCpOSzJ
	knG7oIu0LpfdIffCGSuEPA0bjoWcA9qJoRsnpwRxlZyMDQW7DwePjmfT3TT+2Aclmgt2
	zHEBmvdfo8/TlfE7nPLethW1vqg6RUxHCY1gOJugcmS+15LrZycFKtnqNWU7uD8YVRYy
	mSAia/55saKwJDRRWgzmcBwNMsMF2BXdY2L4odkYjcltQ9oJArDBSneGT3noTUU6nbkY
	WOsDPZylXjURZ8uhRvmj0pNyppsvbcFbdPmqKEaP6yWzAHwE8mgLIA/xfxzBrT3cfO/6
	ESbQ==
X-Gm-Message-State: AD7BkJICv8+qiYJr2+YveLmPTAWAUd8w3WS2w75JdhavJSBOBQM9urZhEnADiXsyzi6TmkkCI7UQgNXl2oLspTaS
X-Received: by 10.50.155.67 with SMTP id vu3mr25608935igb.52.1460022563699;
	Thu, 07 Apr 2016 02:49:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 02:49:04 -0700 (PDT)
In-Reply-To: <7233483e1d443fd02bf6fa1282dff28190b6de76.1459966555.git.pkj@axis.com>
References: <cover.1459966555.git.pkj@axis.com>
	<7233483e1d443fd02bf6fa1282dff28190b6de76.1459966555.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 10:49:04 +0100
Message-ID: <CAJTo0LYtoAyk21MnLVd8VcfiWhzfO=4Xi0nv0_ZaLSFL2SFc9Q@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libnl: Make sure files end up in libnl-cli as they should
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
X-List-Received-Date: Thu, 07 Apr 2016 09:49:23 -0000
Content-Type: multipart/alternative; boundary=001a1134dbec463d02052fe1fe20

--001a1134dbec463d02052fe1fe20
Content-Type: text/plain; charset=UTF-8

On 6 April 2016 at 19:16, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> The modules that belong to libnl-cli ended up in libnl-dev since the
> latter appeared earlier in PACKAGES than the former. This also avoids
> warnings like the following:
>

This doesn't result in any files moving around for me.  In particular,
libnl-cli contains /usr/lib/libnl/cli/cls/basic.so.

Ross

--001a1134dbec463d02052fe1fe20
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 April 2016 at 19:16, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":fug" class=
=3D"" style=3D"overflow:hidden">The modules that belong to libnl-cli ended =
up in libnl-dev since the<br>
latter appeared earlier in PACKAGES than the former. This also avoids<br>
warnings like the following:</div></blockquote></div><br>This doesn&#39;t r=
esult in any files moving around for me.=C2=A0 In particular, libnl-cli con=
tains=C2=A0/usr/lib/libnl/cli/cls/basic.so.</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1134dbec463d02052fe1fe20--
