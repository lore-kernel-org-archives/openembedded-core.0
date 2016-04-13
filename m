Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE1F600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 14:48:21 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o126so72994054iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 07:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uO1A56LarUiqNkZVnPhxVG1suQhmkF2Bk7Kv/n9mH4Q=;
	b=J3LzwO/cKRFN1LlDCzn1nIQE5X5cwiJ2cSXlRhq2KK3eaoeRVhVeT2ne1vdfsdwOJE
	iSOizWV/EByH/qkGPIbeFjMTxetxmYXsYHoWhUwQJVFM/2zYcnKj4Xt1oxYTEtPRRAWM
	BYD8miaTy7nyGL7aheufnxPLujNvVZwO5gZJTgmSCd84b1JzvlctcjFRgjHf6ns28Rf/
	YoRimEM8eaxuvv+bI50hr7IU6h8wR64uFlva2JHcBXTY8M4czrFrCDz3cfqY4mCQxlJu
	7rqLOyiJJ7agFlU66Aag/T4tJ0tA8ztJ1KFWIS7wmg1m5gnIvZEXTf9Va/OYnUfGvLnL
	nWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uO1A56LarUiqNkZVnPhxVG1suQhmkF2Bk7Kv/n9mH4Q=;
	b=CI8OAXcUhUgBPAzOIDF6f84H1JaxjsZLoCGSH7wEjQeTUO6oRynp5KTAAb0uq4KzjZ
	wDvc3qCI4jjL/7K09+9PC/rIabiaTxeGRYfZ5Ab4ptvNnicsDgcXKn4v588jXF9xsOP9
	frYcYdm9oQMQzgYe9CVbiKLsJRTcVmfULDAZjyt9UjkX0taslobgzYbVaJR/0UE7PoBk
	k0/4AnUkriDP03S9nSQIkVIvtDC+OUXibZ5RpAQ7Atr7l4eirLutYyd+tuZxIlmFFVbF
	bkdMH+zA+sPmzj2wSOmt6iWYY1GilPcolXHyNVRlGTZ3zuuDx8jnoJDCXkMadNzzT+3x
	YzXQ==
X-Gm-Message-State: AOPr4FXNym1yy6iC3EkUNyupUHtS7QY07qEMfNwFkepmL8wJLuJm+aB8x3cCgT4al8howGhVcIVfrgzePPlq0OpK
X-Received: by 10.107.135.74 with SMTP id j71mr11481668iod.133.1460558902241; 
	Wed, 13 Apr 2016 07:48:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Wed, 13 Apr 2016 07:48:02 -0700 (PDT)
In-Reply-To: <570E3EC3.9080307@mlbassoc.com>
References: <1460448862-16134-1-git-send-email-jussi.kukkonen@intel.com>
	<570E2F11.4070308@mlbassoc.com>
	<CAHiDW_GLpb20KWeHX4s6BmcbmX4tAv9ORvbBqzbfaK5CMYQ8JA@mail.gmail.com>
	<570E37F7.3020309@mlbassoc.com>
	<20160413122411.GA11999@mbabyjoh-desk.ger.corp.intel.com>
	<570E3EC3.9080307@mlbassoc.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Apr 2016 15:48:02 +0100
Message-ID: <CAJTo0LakdLa6QMRwerK_13+YcTczgaP-MFJ+bKn0cyAJMu8syw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-keyboard: Hide desktop launcher
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
X-List-Received-Date: Wed, 13 Apr 2016 14:48:22 -0000
Content-Type: multipart/alternative; boundary=001a113f92188ac1f205305edeef

--001a113f92188ac1f205305edeef
Content-Type: text/plain; charset=UTF-8

On 13 April 2016 at 13:42, Gary Thomas <gary@mlbassoc.com> wrote:

> Wow, what an assumption!  Anyway, adding the correct machconfig for
> my target fixes the problem.
>

As the author, I decided that the choice of keyboard or not by default is
pretty much a coin toss, but I suspect the development boards are more
likely to have a keyboard than a working touchscreen.

Yes, this should be in the release notes!

Ross

--001a113f92188ac1f205305edeef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 April 2016 at 13:42, Gary Thomas <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:gary@mlbassoc.com" target=3D"_blank">gary@mlbassoc.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div id=3D":12u" class=3D"a3s" styl=
e=3D"overflow:hidden">Wow, what an assumption!=C2=A0 Anyway, adding the cor=
rect machconfig for<br>
my target fixes the problem.<br></div></blockquote></div><br>As the author,=
 I decided that the choice of keyboard or not by default is pretty much a c=
oin toss, but I suspect the development boards are more likely to have a ke=
yboard than a working touchscreen.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Yes, this should be in the release notes!</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div>=
</div>

--001a113f92188ac1f205305edeef--
