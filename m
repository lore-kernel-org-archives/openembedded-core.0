Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6DB29772E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 13:34:13 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id xg9so12937231igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 05:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7alzawkOc51HKvXbW96obLXOhkw8iaJtIIt8TX/A6J0=;
	b=VFR7tU+Ng+G9aTDVWhciqJ/NRFJgZah9NEcK/w5OD7VRuy3tPZQIw+2wUisDdryfg0
	kZZ5W6PCvEIxcNdHd5dwXoclS+t2Evp/wAze8ZDpnfV3Xf6uqe/dgPvu0y+Gb63g7fWM
	Ctmq+WgmM5acX8+XRyrpj4Fj2g3xxBvqK3djGOlG95IMMBx1ROySMMjCm+1ryT+BKC8H
	jzerMf1mhCzpF77DPvzxq0sNn/H6LxUDQXUET1OznT7FuNLtk3NrKDMCzN8vFUArOtJl
	gSMmTxg7AHPkGiXhdm1IbZx+Nl05CXitQBMTbVlXTMTEi3u1fF9bXpqzzpkx+6/+DyNQ
	assw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7alzawkOc51HKvXbW96obLXOhkw8iaJtIIt8TX/A6J0=;
	b=gzIaiRSn6A5IQJnSQeBiwtc4KzV9X3Xl3J5GEC3rmXwLrMzKWq9x0yFaKVKC1chErC
	P2hzgN0V/PVkHfas/XiEw2kWZ+SmLy1WR2tHpBG/l0mBJUswks9PJVt3RsZMyM7WI8z+
	ZwtXRfn0vnde0X4A5UUoTmisna0JHbyoFMZkeyPV+5mqRpAuKwYVLZlsvARzF+mf9qRu
	QD3TKp19Mf+tfZ26fHTzRNFLzYc0iqqk0K4/CweyAW4PMShfHdSPxzXe9JbpnuE/CbgX
	poku9+R7i69UO1Iy5hIUnj5rXUao4svNK04HT8+I7H4s+sTxxToZa2HgiGg1aI1Yk5bB
	X/oQ==
X-Gm-Message-State: AG10YOSumSa+QXJBi6oM8soODDrXFP21MPDlQEdfv8ZJYXF78YVXHzo+3nPn2naj6Hm+qZ+Jx9xdWKnJWdxzd632
X-Received: by 10.50.160.7 with SMTP id xg7mr2875923igb.64.1456407253741; Thu,
	25 Feb 2016 05:34:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 25 Feb 2016 05:33:54 -0800 (PST)
In-Reply-To: <ae976c56455701eb7b7f0d9a95f80baaa388b705.1456327117.git.mariano.lopez@linux.intel.com>
References: <cover.1456327117.git.mariano.lopez@linux.intel.com>
	<ae976c56455701eb7b7f0d9a95f80baaa388b705.1456327117.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Feb 2016 13:33:54 +0000
Message-ID: <CAJTo0LZLmox=jXp9Js62qXYEm=H3PRtN8pDmYKri8_U75rijcg@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] cve-check-tool patch to allow select dir for the db
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
X-List-Received-Date: Thu, 25 Feb 2016 13:34:16 -0000
Content-Type: multipart/alternative; boundary=001a11339de802243a052c983d82

--001a11339de802243a052c983d82
Content-Type: text/plain; charset=UTF-8

On 24 February 2016 at 15:27, <mariano.lopez@linux.intel.com> wrote:

> This patch allows to select the directory for the
> database used by cve-check-tool.
>

Squash this into 1/3.

Ross

--001a11339de802243a052c983d82
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2016 at 15:27,  <span dir=3D"ltr">&lt;<a href=3D"mailto:mari=
ano.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":dv8" cl=
ass=3D"a3s" style=3D"overflow:hidden">This patch allows to select the direc=
tory for the<br>
database used by cve-check-tool.</div></blockquote></div><br>Squash this in=
to 1/3.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra=
">Ross</div></div>

--001a11339de802243a052c983d82--
