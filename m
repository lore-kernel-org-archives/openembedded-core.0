Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 091DE73710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:27:15 +0000 (UTC)
Received: by qgef3 with SMTP id f3so85943260qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=35o5gy6lpMnca0dvDjLu5eCTud2zubH/JEEQra7n6qc=;
	b=muCfEuc7p10gJ8fdfm2TMf2Auuu6pH8mrAO3GSqM8SZ4FEsyyRaDW6QjU2/p48/v1a
	VHhsDu1O9DvTR+ruOfKIydNGpDttJ7stQKaJrg2LGD3nTYVpcdqJHNYUmsWLOnRV2jUx
	UigFEnG1zdyWHVXEW5lA4FJVUf6n6SFR9zUXNjwiRpL5k+iu1kBLUa8L0iSX/xueFJTY
	wiLUb8Rbq2W1B7Dvv2sgFZGkKy5N+T30DjeLGdcxEFPOMl3U8r4rPf4hFnJITo2T26tL
	zxQL4Qm1jcuDycypGbr8aoqiZ2uGYxsIV5Ksl3Vwghs9/XRKjGZOUqoJe9tA57TXbDJu
	KBSA==
X-Gm-Message-State: ALoCoQlarWH+CpIJgm0IJgcaLG5W8Oh8dBuKeHcU1Ul8bBOLfCwxy7m/0BUQzrs2tkx6NDMrlvUR
X-Received: by 10.140.196.129 with SMTP id r123mr38992253qha.93.1436567235763; 
	Fri, 10 Jul 2015 15:27:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:26:56 -0700 (PDT)
In-Reply-To: <249919a0513534269d16dee1ecaf173d01b7e791.1436176865.git.liezhi.yang@windriver.com>
References: <cover.1436176865.git.liezhi.yang@windriver.com>
	<249919a0513534269d16dee1ecaf173d01b7e791.1436176865.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:26:56 +0100
Message-ID: <CAJTo0LbS0ReW+N3YL=TU+AzeGogrS++jxabp5_=ns_GxFtOC4g@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: skip dev-deps QA checking for ptest package
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
X-List-Received-Date: Fri, 10 Jul 2015 22:27:16 -0000
Content-Type: multipart/alternative; boundary=001a11433952c8b812051a8cdf4e

--001a11433952c8b812051a8cdf4e
Content-Type: text/plain; charset=UTF-8

On 6 July 2015 at 11:01, Robert Yang <liezhi.yang@windriver.com> wrote:

> The ptest pkg such as perl-ptest may need .h, .so or other files in dev
> package to run test cases, so skipping dev-deps checkin for ptest
> package.
>

Is this a common occurrence or is perl the first instance of this? This
warning can be skipped with INSANE_SKIP_${PN}-ptest = "dev-deps", right?

Ross

--001a11433952c8b812051a8cdf4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 July 2015 at 11:01, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1am" clas=
s=3D"a3s" style=3D"overflow:hidden">The ptest pkg such as perl-ptest may ne=
ed .h, .so or other files in dev<br>
package to run test cases, so skipping dev-deps checkin for ptest<br>
package.<br></div></blockquote></div><br>Is this a common occurrence or is =
perl the first instance of this? This warning can be skipped with INSANE_SK=
IP_${PN}-ptest =3D &quot;dev-deps&quot;, right?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11433952c8b812051a8cdf4e--
