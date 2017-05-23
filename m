Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7A2606B2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 11:09:24 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id c13so124273105qtc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 04:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hTUue1aysaLPcjtRGMB7phTJ70hWBKpnLpv33qRVkeY=;
	b=u3TyHjibEKzhe1jA5yED0lvbPj0T9rNyEH+RMCVuln5ZJNlNdqYJeRMq0AS8gJEDS9
	5kck/saqc2sTWW4q0Zt63PMRGrbxpSGg3hFiQcgfqugRn17iBM2yvCjHkic38JZn0Xje
	RgKuoAdZjc61oURTkn4sgheeNbnzGvHKHw6QUM8j4K7mTy1XnHl1bkX51iWyG1712ise
	4fTjvCygqT96rgL/8TCWg8F9xRg6/81xqyyT9kXJylmJThAwm556j0bhusmlW9V++zoT
	CIBZmDBEwNGXNZuLEFi3Uk22W/AY7j3x+41J8bPJ1PmsiPYcHeXMM0susise4WvR+87j
	QQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hTUue1aysaLPcjtRGMB7phTJ70hWBKpnLpv33qRVkeY=;
	b=sW/5ohRLSfKbtIDwZu3EDJWpnc+rW77lav9o23dzffqdmzZDapnNcMv3awI+q6uNQW
	6+cWwmrbIQLW1NTGSdInOmNiGMuQ1YgFe3Qqp6XFfZ371FHT1xu6AV99WkRGex+zhiQl
	qOvDVGOG0vpkvD/ZrFNqsTuGq5VIRXEQC4sRbBzMkrnOWpR33TP25UxcQKFs1RpS4Apv
	T6kBDLc98/LG02RfoWySggqBS5MB7s663D13TbvllGJfhgRtSkUUTRnu3TEgeBFXD9GB
	9yx7vnKMtEZ3cHP3Mwy7jT2cmS3jYJosyIzmJRoN7utg97fQbaexa0FmoxtIIsqVXht1
	/WIA==
X-Gm-Message-State: AODbwcAvup4I9w9MgYK9Rpt2qONcsPfFBTJRle6NyDkkyHeUBUF8CQf0
	2HoHJQUUfX5VDyGB2yalNZhsDa061oQI
X-Received: by 10.200.50.67 with SMTP id y3mr27921888qta.27.1495537765755;
	Tue, 23 May 2017 04:09:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Tue, 23 May 2017 04:09:05 -0700 (PDT)
In-Reply-To: <1495509563-62240-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1495509563-62240-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 May 2017 12:09:05 +0100
Message-ID: <CAJTo0LbgS9xA+MRkHxVGy524hQhCyCGB2pBXuhxrF1j1tbWhnA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: 17.0.4 -> 17.1.0
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
X-List-Received-Date: Tue, 23 May 2017 11:09:25 -0000
Content-Type: multipart/alternative; boundary="001a1141047a46d18405502f0596"

--001a1141047a46d18405502f0596
Content-Type: text/plain; charset="UTF-8"

On 23 May 2017 at 04:19, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade mesa from 17.0.4 to 17.1.0.
>

"Mesa 17.1.0 is released. This is a new development release. See the
release notes for more information about the release."

Unless there's a good reason we don't ship development releases, so the
latest stable release is 17.0.6.

(we should fix the upgrade helper regex to exclude .1.0 releases)

Ross

--001a1141047a46d18405502f0596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 May 2017 at 04:19, Huang Qiyu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huangqy.fnst@cn.fujitsu.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-lef=
t-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:187" class=3D"=
gmail-a3s gmail-aXjCH gmail-m15c335209b3cbc46">1) Upgrade mesa from 17.0.4 =
to 17.1.0.<br></div></blockquote></div><br></div>&quot;Mesa 17.1.0 is relea=
sed. This is a new development release. See the release notes for more info=
rmation about the release.&quot;<div><br></div><div>Unless there&#39;s a go=
od reason we don&#39;t ship development releases, so the latest stable rele=
ase is 17.0.6.</div><div><br></div><div>(we should fix the upgrade helper r=
egex to exclude .1.0 releases)</div><div><br></div><div>Ross</div></div>

--001a1141047a46d18405502f0596--
