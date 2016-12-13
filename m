Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id E660871E48
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:11:08 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id x190so121109494qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jRI6IvIJR7s9SM3afHAGUbVic2Tj5kqOWp8S/aN0wk4=;
	b=GK2YLiUCQzLPPbqcu+bfTpdZM9q5ULFh6JFHN889Z8xINriwky51p002E1chpIZK/K
	FZpYK3gFmQFR5FuZKMnt6VSsrnnX9hoED8HzBUjiKqiLypviZE2zeqZUJXL7V0otYJEy
	i12FWdMmx56moOcUZrhYsBInZ9vxOXRpgHs22ZlWtvwxO9s6JGvb4pcYQfh3DSUQ9H29
	bsFvk1/C/lzSAIaIyd3P7MhKug4XxopQZ2KOLihVCgXpFT/0wMio9EmSqLtQd/VQXV7G
	QxYj5Eua9xnJpGXdNkTIyw7jOKBnHIxjPfnMClTkJh4jn4NukZfEUEdeghfk0dqjwVTe
	PIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jRI6IvIJR7s9SM3afHAGUbVic2Tj5kqOWp8S/aN0wk4=;
	b=KbQNjJJfjX6AGamAcf4K+ktW20Tl1dxEDLlHd1qh1yWXL/OVYEujt3M/OvWTTWb2kb
	cYUsuykCkfHsW/daBU+ZW88lpteTrJDN3ZcaJEAuY0egwh1aQMjGikF37n2ETpCmez0A
	whgc9QyQngYHoYkGXHz4Kxa5lCCHFCLFWWUlo6gSgQscsqiqg4ESeZZ3gJ8B/Ms8Lupi
	0LhQzKSkxoMZehTjVGGktQyRRRuoEPeOlwUzxJv0CcqW1whGambpeA1fjVkLXWpP4L3v
	M9SRx0yuAIPBb73vKgE2SYs3s2NcWva/eT9JopA00OZ3P7k/xqA1yrBvur7LSx7Zm9t2
	Vqgg==
X-Gm-Message-State: AKaTC02EFVM7HkFjCoOw9BFB0zj+BRDzhhkJHI4KrOSvqksarNkpjINOaBgT5axl6l8OKFPJPYD46hBkA3m3IppV
X-Received: by 10.55.8.20 with SMTP id 20mr95167402qki.3.1481645469936; Tue,
	13 Dec 2016 08:11:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 08:10:49 -0800 (PST)
In-Reply-To: <CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
References: <1480983561-11437-1-git-send-email-schnitzeltony@googlemail.com>
	<1480983561-11437-5-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbtMiBd=_rip_Let9C0aAg-moLt2=3V=ghGOUA=yW-m=A@mail.gmail.com>
	<CALbNGRR0CXGDXr6Jj1q5_WQ8U_=kyJmdvUs1hJ_jELBSEYcnDw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 16:10:49 +0000
Message-ID: <CAJTo0LZ-3hpYZcibQQX=D6o-wMRZbVeTGVSs9rkKNpEmOoqoZg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] libsdl2: fix build on wayland(-dev)less hosts
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
X-List-Received-Date: Tue, 13 Dec 2016 16:11:09 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60eb41b205438c773f

--001a114c9d60eb41b205438c773f
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 13 December 2016 at 15:42, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:

> Strange - something must be wrong on your machine :)
>

config.log says:

configure:19371: checking for Wayland support
configure:19382: checking for wayland-scanner
configure:19415: result: no
configure:19425: result: yes

which results in:

WAYLAND_SCANNER =3D

This should be fatal, but you're just missing a dependency on
wayland-native.  I'll squash it into the patch now.

Ross

--001a114c9d60eb41b205438c773f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 December 2016 at 15:42, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a =
href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzelton=
y@googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:=
rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D"gmail=
-:4uv" class=3D"gmail-a3s gmail-aXjCH gmail-m158f8d9503172bd7">Strange - so=
mething must be wrong on your machine :)<br></div></blockquote></div><div c=
lass=3D"gmail_extra"><br></div>config.log says:</div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_extra">configure:19371: checking for Wayland s=
upport</div><div class=3D"gmail_extra">configure:19382: checking for waylan=
d-scanner</div><div class=3D"gmail_extra">configure:19415: result: no</div>=
<div class=3D"gmail_extra">configure:19425: result: yes</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">which results in:</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">WAYLAND_SCANN=
ER =3D<br></div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">This should be fatal, but you&#39;re just missing a dependency on wayl=
and-native.=C2=A0 I&#39;ll squash it into the patch now.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a114c9d60eb41b205438c773f--
