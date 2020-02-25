Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id C6E056183F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:58:59 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id t12so460872vso.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8mPiBCKUQev5AJA+2rUd68QMXRmBrOVOEyBaerywZ/M=;
	b=IueQVjN2TAyVijCIMta2HSuSkhGZOXBANHEbBLnH0DLiewjG8MTFimxAT9inVxYX6g
	TXLuzOpnUUdOMwmIoBN65k+MH1Idh5efbNZcUx4KwMgERWYbOeeNjkOXXZ6GTLg8T0Ub
	QrmaI6jIsMkU6xWqDEHndEiQpu+ImRovqrNZTMPZzR7TczljPNT0H/sb4tQzJWRglIrZ
	BVUbl1ErkYnRABBXH+HsdC3HxW8A+MuMefkt4ovR1B0slnOtkJtahLWS6sfaOedZIbnO
	Vt0JngGzEwLi8lmsH3W6yizHxMD+mAeymgNfYhhBu/WreWJ1UTfU1S6WgYvFZ5sul/Y6
	8EDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8mPiBCKUQev5AJA+2rUd68QMXRmBrOVOEyBaerywZ/M=;
	b=D7wLTrdXaHqQnHt0kRC0NNfuBTAp6KZ9JwxC6+Vm+rcFOS7M0QKyRpi5quhioL52zQ
	X20TpITg4A9fRx+k2u3NYt2fvzBVHNRzEhVz4/5SNZCAQkUYQxqEvMeA7o7u00r896YF
	FbAbeclhC5dRraKvmaWjYFe0WYCcIwey100kysA4coqiV8Nyc08+m3a6wBbwwDhVh0X1
	tCUBf6UXgoTCPrMN/pZweoHlGFFK+gjSK0+pmcFJeQ1/hzCLvaYjtm9cD5Zyr9J99+mO
	U7VNMR1CESnYLhzy1U/XfEiKSOIdoHZtwbuwWJb5/WhFImii57pjqEWmUHdpSJ2RNfMq
	9SOw==
X-Gm-Message-State: APjAAAWLcvefy0NAHZRLGSXSyE2JlNg9BA7NA3GwxFGm536xmJM0XUOW
	u8AEisacEmWNlU5S4pBH7NUKNoAYIH2y6Os+IgyjLw==
X-Google-Smtp-Source: APXvYqyCPGIRYTcz/tu7Hb+bRCLMA45eACEvzeeCF6zFcFN6mr0iJbxFEB/YB6qot+ZZbQoyzumJZ9YkvbhoLjMhEyY=
X-Received: by 2002:a05:6102:405:: with SMTP id
	d5mr1288793vsq.94.1582667940581; 
	Tue, 25 Feb 2020 13:59:00 -0800 (PST)
MIME-Version: 1.0
References: <20200225212233.30114-1-timothy.t.orling@linux.intel.com>
In-Reply-To: <20200225212233.30114-1-timothy.t.orling@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Feb 2020 22:58:49 +0100
Message-ID: <CANNYZj8AP-OdK9-gNTgYbcO4LwshN5ox1iHBnQKGfFc0kuKwsQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 21:59:00 -0000
Content-Type: multipart/alternative; boundary="000000000000655520059f6d9812"

--000000000000655520059f6d9812
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Feb 2020 at 22:30, Tim Orling <timothy.t.orling@linux.intel.com>
wrote:

> +           file://ptest-perl/run-ptest \
> +           file://0001-Committing-changes-from-do_patch.patch \


These two are 'devtool upgrade' noise, and should be removed. The recipe
does weird things which triggers devtool to add items unnecessarily.

Alex

--000000000000655520059f6d9812
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 25 Feb 2020 at 22:30, Tim Orling &lt;<a href=3D"mailto:timot=
hy.t.orling@linux.intel.com">timothy.t.orling@linux.intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ptest-perl/run-ptest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Committing-changes-fr=
om-do_patch.patch \</blockquote><div><br></div><div>These two are &#39;devt=
ool upgrade&#39; noise, and should be removed. The recipe does weird things=
 which triggers devtool to add items unnecessarily.<br></div><div><br></div=
><div>Alex<br></div></div></div>

--000000000000655520059f6d9812--
