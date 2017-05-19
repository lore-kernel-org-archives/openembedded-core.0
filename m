Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4C160777
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 15:48:03 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id v27so61277428qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 08:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Nfl4+0IxtzfHFrmsRXqgW5LpSKXBYNN8iZJqEakcmc=;
	b=rapR6FCO6tMyxyCMRFaSqjWyeVeGYwC8x3v1HhJM+iA5o07/1fyevYrxKyEfgyyyuS
	5Cd+ippwlU159BxFjeiuXP3HTU7OdpA2ALBTlVaPoCWdHje26lZS/MZZZ0nuDASgESYh
	gOYbSOZ6B8gJGrBswzWPVRSpwnUQM76q+OsgjrgMB4vx8euJFKDmn+IGs6Khy8ct8I05
	u+AFvqsIq+XsMX5hrUD8KO9Ladh/2mm+60TteJ/6vzzIPA5vgqDGkB1YObJcpPjAtI3H
	ywbtL8OCbpe2T/Qbh5oT/trHuWgV3/Ifcz+sBCCRhpnjJGcVBIYQGmmefD7WAjSYELIW
	8UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Nfl4+0IxtzfHFrmsRXqgW5LpSKXBYNN8iZJqEakcmc=;
	b=PkOyj7GM1rhg5lTOJm+v6JHCkrVD58U3IMVXRFOYUIUFi+OxhaGSj+C0vLvBaoZ78f
	5gjNryxmUYYdK2/qEQN4d3/Za+6xpWgK3CX+xVO/aUgE0VTOFHE/HbNhhwN1gJv58f9r
	fAlVTyUy6EV+MxClw4doNyxRE15uk94L+o//P9DEtW+iD6wfRByoESWnAH3qi/kSH9Fu
	84zt32VNXw6KBEkgklmWgqOaFpvU70azp+Z/RLIQACYtenHN/gD9OLiT/FuJVwW7VtRN
	XCx4SvmcaS57yasj9cbEWAI2ZACyXFxrT7UUWOvIxJ2y4dAAyPwrEQIjCubj/FhnCyZK
	AH4w==
X-Gm-Message-State: AODbwcCNuFlDLbSpfiOgmI4bA4oV35stj4SxAegVAyXk513GfVfuVUQJ
	YkrtdOD0sQ7W3WZxLUZJdN1+SDmGg6l/
X-Received: by 10.200.50.49 with SMTP id x46mr10554488qta.105.1495208885016;
	Fri, 19 May 2017 08:48:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Fri, 19 May 2017 08:47:44 -0700 (PDT)
In-Reply-To: <f327a215-04da-26fa-37b7-3081121385cc@linux.intel.com>
References: <1495146527-32073-1-git-send-email-jose.a.lamego@linux.intel.com>
	<1495146527-32073-2-git-send-email-jose.a.lamego@linux.intel.com>
	<1495149157.27342.142.camel@linuxfoundation.org>
	<CAMKF1so_wFUH=eNqBc_Qhach4+C1mW73ZFUuK=TqLaYZ81C=Hg@mail.gmail.com>
	<20170519090232.5z53crs2ocxbbvno@ad.chargestorm.se>
	<f327a215-04da-26fa-37b7-3081121385cc@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 16:47:44 +0100
Message-ID: <CAJTo0LbLgGTfhD4OEzQDAAfC5RcOWhoF52FowDLK7vQakeJ9Uw@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] conf/bitbake.conf: include ed in hosttools
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
X-List-Received-Date: Fri, 19 May 2017 15:48:04 -0000
Content-Type: multipart/alternative; boundary="001a113577a2750158054fe27212"

--001a113577a2750158054fe27212
Content-Type: text/plain; charset="UTF-8"

On 19 May 2017 at 13:54, Jose Lamego <jose.a.lamego@linux.intel.com> wrote:

> This patch is a requisite for the bc recipe update from 1.06 to 1.07.1,
> which fails due to ed command not found during building.
>

I just replied to the bc patch, the new version is broken in several
interesting ways.

Ross

--001a113577a2750158054fe27212
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 May 2017 at 13:54, Jose Lamego <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jose.a.lamego@linux.intel.com" target=3D"_blank">jose.a.lamego@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2=
ig" class=3D"a3s aXjCH m15c20c654e2b670a">This patch is a requisite for the=
 bc recipe update from 1.06 to 1.07.1,<br>
which fails due to ed command not found during building.<br>
<div class=3D"HOEnZb"></div></div></blockquote></div><br>I just replied to =
the bc patch, the new version is broken in several interesting ways.</div><=
div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></=
div>

--001a113577a2750158054fe27212--
