Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id E5EE06FFCE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 18:14:22 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id f6so68164678ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jun 2016 11:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j6YT2Fet1VD9ThvrWflynC2zuBwhV+jHF8EJEGBkCpA=;
	b=c4WGXPBZpUCW7unasxnI/nAtbF0fcmsMDn77olMxCcOt9M9+V9pgI4gIM2R1TkSyAZ
	H9OHMHQJY31PmlzO4yaALOGlzXqE1HZl9amHdVMhGmoGD+kwBw79wWRLKm3P+B0E+u0c
	Apt+PXmAWlL2046LLgr8L9Qw2g2mAadX9jAZArP5MXwXeY29lJiLp/CNWl8pYfpAxT8r
	UHAeLu9Szr3wHbRxJK2BoJa6g1cc764hf1uN8GdoD8JJu3XiP1wchEXEVtbNQRZpM2js
	WfXSLAoXZkLWoeKV5NeL3vX2aa0Fj5gnOdzkKfFCPslPt5i+GQvoKJXQ8+Xr8U7eeBIl
	Bdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j6YT2Fet1VD9ThvrWflynC2zuBwhV+jHF8EJEGBkCpA=;
	b=UMezv5ijVJlxaBYliu3slSnMqiZGc9gh0FsZCDVILrLtKJT9AMIHaDs7whdhFuANV2
	rNWWyDO8UmDFpxLbKc692lmP2nUG8M0mYZ/gUlOPKhS0q0KiIfAickx2Du5zp1SdWWIO
	7tIUj9iVH7GaioPAiVjaujQufvMSsfZ0iQ0QCsh/qim+0qKnp7fvVkym/mV1MTGxVFw7
	/uPYWjjk1CsJNlZqnJO9QxIQu5NsTz7o9Qym8/fk5rmJ2Fkyjn0HzKbqB+60FQRbDz43
	9084vEkI3mwLZj3Yk6idvSrpHZYKGsOihwzLkEoZ6+uDf0YMXs9l5NNOfnPbliSfjLy/
	VOqA==
X-Gm-Message-State: ALyK8tKQGuaSY2WPwo32Mg2Mt9sNmzFKHLhLYApUzMlHRpMP8TgtgZbfwpo+EvUqEKoMbt4tsEmDM3CuksDe/89q
X-Received: by 10.36.217.68 with SMTP id p65mr10546806itg.38.1467051262723;
	Mon, 27 Jun 2016 11:14:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.151 with HTTP; Mon, 27 Jun 2016 11:14:03 -0700 (PDT)
In-Reply-To: <2291068.MjvgqpAC42@peggleto-mobl.ger.corp.intel.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
	<506ececdce893c5b3d930faba0c808f797d8dc79.1466683248.git.paul.eggleton@linux.intel.com>
	<CAJTo0LbncHa8b_1cWuKyo7AROcqiHhAG2A0rxNTCavnmin6ySw@mail.gmail.com>
	<2291068.MjvgqpAC42@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jun 2016 19:14:03 +0100
Message-ID: <CAJTo0LaUQGUkKiPmuy+Pf6oPcpt8Rad0g6rx7hBOHtoqnH+-Dw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 02/10] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Mon, 27 Jun 2016 18:14:23 -0000
Content-Type: multipart/alternative; boundary=001a114631b6622e3b0536467d25

--001a114631b6622e3b0536467d25
Content-Type: text/plain; charset=UTF-8

On 27 June 2016 at 18:49, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Great, that's just broken... any suggestions on what to do about it?
>

I'm wondering if cmake can be told to just output the "top level"
percentages, or whether that is basically unknowable.

Ross

--001a114631b6622e3b0536467d25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 June 2016 at 18:49, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":a7s" class=3D"a3s aXjCH m15592fb98c1dbb2f">Great, that&#39;s just brok=
en... any suggestions on what to do about it?<br></div></blockquote></div><=
br>I&#39;m wondering if cmake can be told to just output the &quot;top leve=
l&quot; percentages, or whether that is basically unknowable.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114631b6622e3b0536467d25--
