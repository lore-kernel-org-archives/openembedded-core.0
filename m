Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 34EDC7797E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 14:07:39 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id 1so110686122qkl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 07:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=71yTXgKajMzuE0m59Ircjn1aIWoFIoi6VgC6J/luPgU=;
	b=J6PeUxB14DUAn2PDnbbvL+CKtgf+HQkdSHDM60JEDc9ebBI3ixginvgdHLGKafEaWs
	BuBCCDdMuXnurAMro+JRkmMzdlsQ6rg/OlMypCq5Z68QGNSOKNZBTPo201LvFpJZ7HwC
	1vw5jYIuNoGG1wsK0mb6wQcYGUDvc1922cX4Erhu8+PYPx1MPHtPgIPvzsrPig0Pl5JR
	buUhZKIYJVOo8t5iSIl59GCBnzN6RDo4gurVdWdQH12/zLzNiCC/sW7XhZBoABwpkQ04
	3i1FSTHiDxTPmrt2mKRrhwczWZDbRXzswbvz7bQQ1oZOnMyVi3jjJWlHv8gMXsSGsToT
	pLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=71yTXgKajMzuE0m59Ircjn1aIWoFIoi6VgC6J/luPgU=;
	b=uF/wQ+0brYA+Upywj3zpwj2VonHZfxj1dIxejP6URHEvg/gPxB51n+yrMWMl02Pv4U
	2l2X+93a9XgFTZWpXGa0AmTf8fY1p7gdPnNDxHpraNeUgjPWsJS3AXTXYB60DHREc0+6
	TBONU21eDJvLeaE6j8YVCLwXERo0pIxRbylL0nyFDb5pq+Hg0gBkozc3ykquE6oR2vG+
	n6+km/t3Qo4iMM48iTEGdI8tFB3f1VvN6qJflqoWy4chbVL4AmWaG6vwCwlHDsYNM/8Z
	vP4NCmH9WaeD94ILquBKkIc0+PiZIEMSZq/3mW0fMhs9DBDjwtwd83QKSQWQTezjDSQ2
	LvkQ==
X-Gm-Message-State: AFeK/H2PWsTe2D/OLg9ULeSzOvQlM/3y3ASuZgT6CbXEb3gDIyxI8t8oyOB72v8LSMNMDounOtgXwdOtnh37WHAH
X-Received: by 10.55.192.145 with SMTP id v17mr27680527qkv.3.1490018861047;
	Mon, 20 Mar 2017 07:07:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 20 Mar 2017 07:07:20 -0700 (PDT)
In-Reply-To: <b89d6532-f5d0-5ac2-f706-7dc8cf4fe578@advancedtelematic.com>
References: <b89d6532-f5d0-5ac2-f706-7dc8cf4fe578@advancedtelematic.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Mar 2017 14:07:20 +0000
Message-ID: <CAJTo0LZauhWh2VGro526VZTThWUBtkxUXKSCiXvYOAghomTByA@mail.gmail.com>
To: Anton Gerasimov <anton@advancedtelematic.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Status of usrmerge merger
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
X-List-Received-Date: Mon, 20 Mar 2017 14:07:40 -0000
Content-Type: multipart/alternative; boundary=001a1149a1c2ec17c9054b2a0c7f

--001a1149a1c2ec17c9054b2a0c7f
Content-Type: text/plain; charset=UTF-8

On 18 March 2017 at 22:25, Anton Gerasimov <anton@advancedtelematic.com>
wrote:

> what is the current status of the usrmerge patch [1]? It was submitted
> quite a long time ago and I can't find any discussion about it. If there
> is something I can do to help with testing/tweaking to get it merged
> please let me know.
>

The bulk of the patches have been merged now, the only outstanding ones are
the actual changes to bitbake.conf to add a distro feature.

I'm not massively keen on how it's been implemented but right now don't
have a better solution.  Either way, with 2.3 (releasing next month) you
can trivially setup usrmerge by just fidding the paths in your distro.

Ross

--001a1149a1c2ec17c9054b2a0c7f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2017 at 22:25, Anton Gerasimov <span dir=3D"ltr">&lt;<a href=3D=
"mailto:anton@advancedtelematic.com" target=3D"_blank">anton@advancedtelema=
tic.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:ge" class=3D"a3s aXjCH m15ae38d651ff1934">what is the current status of th=
e usrmerge patch [1]? It was submitted<br>
quite a long time ago and I can&#39;t find any discussion about it. If ther=
e<br>
is something I can do to help with testing/tweaking to get it merged<br>
please let me know.<br></div></blockquote></div><br>The bulk of the patches=
 have been merged now, the only outstanding ones are the actual changes to =
bitbake.conf to add a distro feature.</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">I&#39;m not massively keen on how it&#39;s =
been implemented but right now don&#39;t have a better solution.=C2=A0 Eith=
er way, with 2.3 (releasing next month) you can trivially setup usrmerge by=
 just fidding the paths in your distro.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149a1c2ec17c9054b2a0c7f--
