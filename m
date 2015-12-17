Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id E3666605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 09:26:18 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ph11so7590694igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 01:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wR8sEuYXdVY+S6iK0/qHYPOl5MSHOer/SgGcGsqWwiY=;
	b=0oVPzkxsHFnIondbAKvGydBBs9V735qF8dd5U+gropLfi7UMpxbbsSVS/Or06ybDju
	blgErlRGzri293+AEiJnvfxMuCu2q7BO5dDUwEk+o+/9gPF1a97t8CQ2ZLeJqn/n1YkE
	01gMVQgTKxj250BIZLVfCflW/1BZeDXgZ4gxSiYRKoR/i52op5OZtbH0WaBc26vimk5e
	PIF1BumNF+VrF1jAN7Z8fzptMg9dm48YLddjTZEh+cOI8hhOpkoSmA6IqIHHFxOSm2rz
	vkhLhfvfVOcOBMgQi5tsvhzk6E7IvlxLWIXgZ4bo7QrdqPHfEZ1tl/AlO+BOqoB70IDl
	VRdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wR8sEuYXdVY+S6iK0/qHYPOl5MSHOer/SgGcGsqWwiY=;
	b=PsTRFEkohpJzpSXQM8IZmuRNglPqR5OQL3ki0oaeO5sCAwMltsNgMLKuXfTGw/5SKX
	uCwMHIBKCBknARE9LZ9D514AHTZJ0KijHu9LHwfn7nMT/tv2ZYNkp6mgEcQFdK4J7YZx
	IkCOfCEEyYRSM4NfFhFR42P47yvOixDf5DdCX5tUqmx9M+U7udnn6/a+Eza+5N5mXo1B
	/+PlVIOf3Ttmg0eVHPvQHEOb8Imm7y+oS1qQa3tukephyVo953UUbw8Y9nlTrwCAc/SW
	Racs6NDw3AYmYuWZvk7YOqt8MXWGOrntINoPI3NBt2GHoVs47eW9dOMe3+GogByL/edo
	1xHg==
X-Gm-Message-State: ALoCoQnfdSv4QWay61CD283iDaMConkpzeTyp3gUsl1Tg+rZKhu7JPBbVfmbiR1dvmrh3kqdSJqFH8lOemBcUaYXAAkkT9jRyYBlOPGjLbetlctuC1rmlbw=
X-Received: by 10.50.126.8 with SMTP id mu8mr2449833igb.52.1450344378779; Thu,
	17 Dec 2015 01:26:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 17 Dec 2015 01:25:59 -0800 (PST)
In-Reply-To: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
References: <DUB130-W63DCB3C4CAD84E460BB03FDAE00@phx.gbl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Dec 2015 09:25:59 +0000
Message-ID: <CAJTo0LYW=LbsM8kaaqUnukH_p7U1i-EpXcPsekjbjwFooxXW9g@mail.gmail.com>
To: Chris Trobridge <christrobridge@hotmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Thu, 17 Dec 2015 09:26:20 -0000
Content-Type: multipart/alternative; boundary=047d7b1635bf7fe6480527149d14

--047d7b1635bf7fe6480527149d14
Content-Type: text/plain; charset=UTF-8

On 17 December 2015 at 09:16, Chris Trobridge <christrobridge@hotmail.com>
wrote:

> I have successfully run my own python3 service, which uses python3 dbus
> and GObject from gi.repository.
>

Thanks for the feedback, it's much appreciated.

Ross

--047d7b1635bf7fe6480527149d14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 December 2015 at 09:16, Chris Trobridge <span dir=3D"ltr">&lt;<a href=
=3D"mailto:christrobridge@hotmail.com" target=3D"_blank">christrobridge@hot=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>I h=
ave successfully run my own python3 service, which uses python3 dbus and GO=
bject from gi.repository.</div><div></div></blockquote></div><br>Thanks for=
 the feedback, it&#39;s much appreciated.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7b1635bf7fe6480527149d14--
