Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA27D7F3B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 19:17:45 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id r3so59042448vsr.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 12:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7/Qx+NOkG7kKgUI1xXUYhOXRwpFrDf5V9thu8I3Sj/o=;
	b=phhCu1eO0uA8UJSJG7UoRYA5Msf/dW/CexToRYQUWz6ns7edNv9+pFxQmfP5fhKrIc
	98f1VvIzpN/Ul91VFY9IMIHjsBApo7x/q7uVNS2w0ENPdkAclEexQntre2EXdn63xCcG
	1ahTA54qLcA8I545vFN2rXcLbsSjIebSNGeEg5sMjtj4zP+Lny20NmhZFNHRq46O48Os
	Uq4iEvYlDLwMjn7v+WqOtWfRe9tpOKszDpaxPmYkgCWNB+0DHfYzj6f0Ark3oz9n0YoE
	jQ9AiihqLQqk0Vpwl21FwJXOmvmovvlH6Wdsx31rWjpkOxnp2S8YaqKPqMJY60WubRTm
	fx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7/Qx+NOkG7kKgUI1xXUYhOXRwpFrDf5V9thu8I3Sj/o=;
	b=hyjsC4nXtBvB/4YBiInWjzvwGCrn1IBSrQllY0wfhO92BPxW1duqne030dKlXH14+W
	747kiMXtnlATRE6hNdqZ40He92qTtlQ6bOEziQ0W00oz+ABdMskeSIzle/hh29T57kHF
	kg+3ZU3CL1g4+r5LPVdtjGSbZXXlGNAS2dT+XxBc47sNAExkfmCHMJ8YZEIKmhfp/8mW
	nOYGofkK1o8r4wqJaESnjB0O2Z1U0/Mv0MR2G/SeAcYrLKOKfzqFtX8d6YBCeg0Oe82w
	MuRfY+bAb3vZ//9zpIVNfv7z+6uhlKjxJcYOTH3Sba2EQ25wCy2oGsI4f4q5nyYyAauF
	vQaA==
X-Gm-Message-State: APjAAAUer+qCmA0ogCeLihfLa9v2OGV9SC+Rgd2A3nX+8JbknSEr/XKV
	Kc2RTAXMIj5Yo0qjxUTwK+fUCPzpGvn3dRZbZV2NIA==
X-Google-Smtp-Source: APXvYqxtQjNG+2eJuzfJKf4Q23wV4rA0gHs78OzzDpV1cKQ2fBZGGkQAoJJTqeIW4FLRB3jAVclmlWv6lFBuVZD9yqo=
X-Received: by 2002:a05:6102:db:: with SMTP id
	u27mr3332836vsp.83.1565119066667; 
	Tue, 06 Aug 2019 12:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190806173101.28671-1-jason.wessel@windriver.com>
	<CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
	<32e8e38d-b215-b56e-d523-71811803db99@windriver.com>
	<902909f9-0c57-5e0f-9c68-b73722a32869@windriver.com>
In-Reply-To: <902909f9-0c57-5e0f-9c68-b73722a32869@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Aug 2019 21:17:35 +0200
Message-ID: <CANNYZj_h6f6vR83Zbw=H0NGaVLt3bGpd85Ra3ukYaJvwN0Vy-g@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Always build sqlite3-native with zlib
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
X-List-Received-Date: Tue, 06 Aug 2019 19:17:46 -0000
Content-Type: multipart/alternative; boundary="000000000000000485058f77ae9e"

--000000000000000485058f77ae9e
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Aug 2019 at 20:52, Jason Wessel <jason.wessel@windriver.com>
wrote:

>
> Just to follow up to be very specific about how I deleted files, you can
> see the identical failure with:
>
> sudo yum install -y zlib-devel
> rm -rf tmp
>
> bitbake -c cleansstate sqlite3-native
>
> bitbake sqlite3-native
>
> sudo yum remove -y zlib-devel
>
> bitbake -c cleansstate pseudo-native
>
> bitbake pseudo-native
>
>
> I seriously doubt this is exactly what is going on on the host builder
> which failed.  More analysis would be needed as I explained earlier to draw
> a final conclusion.  Either way sqlite3-native should be configured to
> build consistently, which would prevent this kind of contamination.
>

This is not quite what I meant. I meant looking at the source code of
sqlite, and finding out how exactly it is looking for zlib, and where
things might go wrong (e.g. host contamination, or other possible causes of
non-determinism). There might be a configure switch to control that
behavior, or something similar that we can use to achieve deterministic
builds.

Alex

--000000000000000485058f77ae9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 6 Aug 2019 a=
t 20:52, Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jas=
on.wessel@windriver.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><br><p>Just to follow up to be very specific abo=
ut how I deleted files,
      you can see the identical failure with:</p>
    <p>sudo yum install -y zlib-devel</p>
    rm -rf tmp<br>
    <p>bitbake -c cleansstate sqlite3-native</p>
    <p>bitbake sqlite3-native</p>
    <p>sudo yum remove -y zlib-devel</p>
    <p>bitbake -c cleansstate pseudo-native</p>
    <p>bitbake pseudo-native<br>
    </p>
    <p><br>
    </p>
    <p>I seriously doubt this is exactly what is going on on the host
      builder which failed.=C2=A0 More analysis would be needed as I
      explained earlier to draw a final conclusion.=C2=A0 Either way
      sqlite3-native should be configured to build consistently, which
      would prevent this kind of contamination. <br>
    </p></div></blockquote><div><br></div><div>This is not quite what I mea=
nt. I meant looking at the source code of sqlite, and finding out how exact=
ly it is looking for zlib, and where things might go wrong (e.g. host conta=
mination, or other possible causes of non-determinism). There might be a co=
nfigure switch to control that behavior, or something similar that we can u=
se to achieve deterministic builds.<br></div><div><br></div><div>Alex<br></=
div></div></div>

--000000000000000485058f77ae9e--
