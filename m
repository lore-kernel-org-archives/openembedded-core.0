Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5E4E775C60
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 21:47:25 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id a5so146746652ita.1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 14:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lMlQ0zzczk77wm8kePTY9QM/BTsIJYHypfiiDFVCVoc=;
	b=nmn7d8WRU/KjFkwAAmjFWgoHZ/FKPm4ngvBRrfZg4H2SPQKK/jtT+YwkDgU5+O61xP
	MUvxzCCYmgKmZkWIrYEWm/Uw+hPlzWiRMBxTyiaxbo3T3cbVWrfzXEkNl/BZnUZSxI14
	mJh2Lt/3GW+TcoBvA008UQHaZvDm7aW6kgSrUV3Pw45eMeDEwCbAkmyzUh7QH2tVVhj5
	uIrjwAWaVBNzc+XB2neaU1ySLum/CmGjQSAkqrWm3Drd/DJpRPkRvUG4KmaUIeCVhoGa
	cqit/AisxwnosmFVZOXDM43gi1QNeHgUBkgC1ZpnTUWJ/Vn++90zcjRAkSSo1JlmbYvM
	Mt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lMlQ0zzczk77wm8kePTY9QM/BTsIJYHypfiiDFVCVoc=;
	b=Gc7Gk3y1e+g/DblT26FzxY6luGpRQFhO+zip2mJENy6mVQIecbu4RflSsKU7ozCQhb
	HfI3r3ztweZmlB+HaEgJlNMsB41raiMi14njioBcxfaQh6qnLORKMFted6w48U8VAFiT
	Q4Rk/+S4dZtib5BClftj9b8GRaTtrFTpQlD75eDJnY7esFNpHOT5GusmCIQVMRfdqEiE
	JXdGLbvNfA9izqPzlkfySEQ/Vu51/GTu3MkYiKebV677UdqlzkxkRhQL33GBpezFfyTr
	ycrL85QCWZjHncu93NTv7Xt2nWdgNfzAx9iWm1z0uMY3XqZcRckPLCEIBw4c+/QHlLFx
	vVkQ==
X-Gm-Message-State: ALyK8tL9N073owwvpJxCrixlUU9jJhhwoLqhblMCIMyividQk+e/jBqzJdOo/GafVGqArlb/4pGovof1AHx5Y/qH
X-Received: by 10.36.120.193 with SMTP id p184mr29682092itc.22.1466113645627; 
	Thu, 16 Jun 2016 14:47:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Thu, 16 Jun 2016 14:47:06 -0700 (PDT)
In-Reply-To: <1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 16 Jun 2016 22:47:06 +0100
Message-ID: <CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Thu, 16 Jun 2016 21:47:25 -0000
Content-Type: multipart/alternative; boundary=001a114aa4280c7ac905356c2f9c

--001a114aa4280c7ac905356c2f9c
Content-Type: text/plain; charset=UTF-8

On 16 June 2016 at 21:49, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> While waiting to hear back about my inquiry I did take some
> time to put together this patch that allows things that
> require the older vte to continue to build. Since xfce4-terminal
> lives in meta-openembedded this might make more sense to carry
> over there. I am sure folks will have an opinion so sending this
> out as an RFC.
>

That's certainly a good argument for putting the old vte in meta-oe.

Ross

--001a114aa4280c7ac905356c2f9c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2016 at 21:49, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"=
mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstine@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":7i0" class=3D"a3s aXjCH m1555afac87e6c780">While waiting to hear back =
about my inquiry I did take some<br>
time to put together this patch that allows things that<br>
require the older vte to continue to build. Since xfce4-terminal<br>
lives in meta-openembedded this might make more sense to carry<br>
over there. I am sure folks will have an opinion so sending this<br>
out as an RFC.</div></blockquote></div><br>That&#39;s certainly a good argu=
ment for putting the old vte in meta-oe.</div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">Ross</div></div>

--001a114aa4280c7ac905356c2f9c--
