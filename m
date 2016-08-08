Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4287719B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 11:23:38 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id u186so70997821ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 04:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y8tTUswZTI4qwtkrtj5Hek4RcDBLKRg47v02TdwjRxE=;
	b=uLTB1dF66iDi98Nue/C8Z376bU2ftffk2YK70KkoEeclellLXza6IV2Qs8BHiDF/Bh
	j0kzrEHYfbZ20Oa6p8mkWvn8XFhCtnpRswoR5xbrw0o0GBOi3IqSfS1Mhs+ZwQDrFaZj
	nKgrc1d/IKKO3tuR1vTQWS61+tKl9me31kRdWEZuFQhorRM5evFBR623hW04sbbcgy1z
	ZLfeVMw0Si1LIyBS35pL2Tc7YngyEMf58URTyAJfZCgJ8R83ywGV4SXSKF+tNYuS5AHD
	0y5Cmgt/cCzA4pBppvDCenBJCNgTD5vTxV4lwCYrf92x3SLo2aj1yJ4jXE8BJFuM/q1D
	XEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y8tTUswZTI4qwtkrtj5Hek4RcDBLKRg47v02TdwjRxE=;
	b=Ecq1/6iBHVQ/2iWpNTUNpOvKrgsvSXvat9LW4cuCatTCm43GUQ4146beDPCJsr+2wP
	UTuf5YFVK3L4gQHQ0EhtRLAVjWPZAqVx/PejqtyzmghoeDqeZH2pW+ZrSTwWvJTdS8IT
	XFki7lRi/YOvkT2EcyfwMxabNz5YahRCc9rVbg0nOj/0zRr6Kde/Ixj9oIOcNfVtGeZK
	+Gp5qbhX7FInIz9+cAgCPGhl8xSHerdn5maWvQRBasbOa6L2GUQ5reSqC7HgFXUOxMlW
	1TyZc8ccOgARHTyugNEbg0VWQOwZBqgeI8i3O17Zklczo+M7AxPvd749ZOK65+JHgIcW
	tkyg==
X-Gm-Message-State: AEkoouutq9izMIWTrdg26v4QC00YypuGyRGjNNKX9WJ8qTivKCSs9Sqlaph1zcogb9gIOfa/CJISxO/Y3hPKiRUq
X-Received: by 10.36.87.140 with SMTP id u134mr18022008ita.38.1470655418940;
	Mon, 08 Aug 2016 04:23:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 04:23:18 -0700 (PDT)
In-Reply-To: <1470654788-8717-2-git-send-email-maxin.john@intel.com>
References: <1470654788-8717-1-git-send-email-maxin.john@intel.com>
	<1470654788-8717-2-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 12:23:18 +0100
Message-ID: <CAJTo0LYCYsUFZ3_W-vRCh=TtmZe33zm-RFyukxbr84CQfi2+tQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] hdparm: update LICENSE info
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
X-List-Received-Date: Mon, 08 Aug 2016 11:23:39 -0000
Content-Type: multipart/alternative; boundary=001a1135018cd55a6305398da52e

--001a1135018cd55a6305398da52e
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 12:13, Maxin B. John <maxin.john@intel.com> wrote:

> -LICENSE = "BSD"
> +LICENSE = "BSD & GPLv2"
>  LICENSE_wiper = "GPLv2"
>

I sent a patch for this one last week but forgot to update the bug, sorry.

This isn't quite right as the hdparm utility itself is BSD licensed, so you
also need LICENSE_${PN} = BSD.

That said Markus was saying last week that this behaviour isn't great (and
neither was the original behaviour), so there may be more patches to
improve how LICENSE works.

Ross

--001a1135018cd55a6305398da52e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 12:13, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex"><div id=3D":24p" class=3D"">-LICENSE =3D =
&quot;BSD&quot;<br>
+LICENSE =3D &quot;BSD &amp; GPLv2&quot;<br>
=C2=A0LICENSE_wiper =3D &quot;GPLv2&quot;</div></blockquote></div><div clas=
s=3D"gmail_extra"><br></div>I sent a patch for this one last week but forgo=
t to update the bug, sorry.<br><br></div><div class=3D"gmail_extra">This is=
n&#39;t quite right as the hdparm utility itself is BSD licensed, so you al=
so need LICENSE_${PN} =3D BSD.</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">That said Markus was saying last week that this be=
haviour isn&#39;t great (and neither was the original behaviour), so there =
may be more patches to improve how LICENSE works.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1135018cd55a6305398da52e--
