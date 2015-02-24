Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9926C71633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:12:06 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id i13so26610933qae.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 04:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+pYtWDqW4AKftVnZRGnLA67WefIuNY3y0vP9rWqSHvU=;
	b=VvzisjT/T870z1vYvrLY80px3Eh8c9xkA/URT+x6sbmeiPpl9HJ4I3AD3+/y8RsVpl
	sapSoSOf8eeYHyVZ7eIZNKv2vazRDJssWGQCHpmxZH2y3W5O1mv3mEEJlRflDMMa32kg
	3TOI7OQp12hS5LnRIqpIAx4Giq4vhMw/KIu3yMECrLoicznyarja9oAudgKK/+uelR1R
	mYMGkgX9UIPS2ebYhra/uhShjDCMs4V9/PieT4v86Wucir8re++CHx6p5wE3Jl0W7XHe
	OxK5AuUa3cYmahu3QwYN5PAdRb9jMZX4A65JzQO95U6Zhv6lsm7rtt5AFQ8kZAOZhQRq
	Qthg==
X-Gm-Message-State: ALoCoQnkmPWjN+ge4K/kFe8Vqfml+CdQSYGpCDMz7lUOxtO0vF5pkAwfLnpk2NSSbMfIVO0M1DCS
X-Received: by 10.140.165.150 with SMTP id l144mr8866365qhl.39.1424779927994; 
	Tue, 24 Feb 2015 04:12:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 24 Feb 2015 04:11:47 -0800 (PST)
In-Reply-To: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Feb 2015 12:11:47 +0000
Message-ID: <CAJTo0LY3ALEB1EXTEjWLLtansnm-zSb8oaUh_=AAOzxM+AKJBQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Tue, 24 Feb 2015 12:12:08 -0000
Content-Type: multipart/alternative; boundary=001a1134effa7ddca6050fd46d14

--001a1134effa7ddca6050fd46d14
Content-Type: text/plain; charset=UTF-8

On 24 February 2015 at 06:39, Khem Raj <raj.khem@gmail.com> wrote:

>  .../glibc/glibc/eglibc-use-option-groups.patch     | 47
> ++++++++++++++++++----
>

Is this chunk related?  The commit log only talks about disabling -Werror.

Ross

--001a1134effa7ddca6050fd46d14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2015 at 06:39, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><div id=3D":gx" class=3D"a3s" sty=
le=3D"overflow:hidden">=C2=A0.../glibc/glibc/eglibc-use-option-groups.patch=
=C2=A0 =C2=A0 =C2=A0| 47 ++++++++++++++++++----<br></div></blockquote></div=
><br>Is this chunk related?=C2=A0 The commit log only talks about disabling=
 -Werror.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1134effa7ddca6050fd46d14--
