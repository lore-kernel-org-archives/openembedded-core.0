Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6A27318D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 16:50:45 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id x72so3520pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=DosBO5y4BJkSLRLMBlNbjdICUT0AchcAIymmvTMv2os=;
	b=hCoNNe21gBp/QJ0UNEzVV1fbB4sMU5WTPRvv+PR+LtTKHVRVziWc4gcptJp3jr/eu+
	rSTXCchqb/qqKKxxKuZX5ChY5A+6+Hi9Luo3jN+JsHHDoq7LmIxh4xN34E8s4fwmnK5R
	/p7/UaGWEK/skdbaW3MFlZ1Y67Ms2VHpCE5xOuJDEfgqgkwhQ94L2atkTOYtlxl238UP
	/EEI407y1JNylt7RyKIKesfz0SyDYO3PTuJmEckvS7n924XY69zoATeF8707k+xR2CAf
	JbeoVv8DTEXpP93aqjHH9UB41QoBDTP0AQCd2Fa68ivT7NFgjKIlQxwMp8kyk8YnQvPc
	ed+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DosBO5y4BJkSLRLMBlNbjdICUT0AchcAIymmvTMv2os=;
	b=DI8xhzJ28CDvgWp2ZiqC9Z26W8+7fazLGtg6g6Gd6e0H4QbGEKIp+U9jOGDKlv6SZp
	PbS/L6wEdEoTl5Iz+sDAwYnaTDhZkZAvbXPSspA1qtHvEsRkp+sgEQvafVDa0KWUnBgI
	TcTSADAwf1yulrD8UKoH4RC6GxTEhmSJHBvOypnRtTcNd6eUFoCn7aCYXnn0n49SbuXk
	doqSOsv5dHiWfPrE28PeuHCruzx0J3ffcf0A64X7DKxWn0R4157dmElIOi3zUn0yusHh
	HNG1MU6jTm3EDbENN8rvw4YBcKevd5kntSEOjK9697o7e/WYz2RUmxBKiW5qv5K8Sxzj
	+3vQ==
X-Gm-Message-State: AEkoousS//jPrRvKbyDcwq/VXWONLKTKFCP+cniysIDw8T1Ap+0fXgzxhK+34ZDbvzG71g==
X-Received: by 10.98.79.27 with SMTP id d27mr5701933pfb.127.1471539046701;
	Thu, 18 Aug 2016 09:50:46 -0700 (PDT)
Received: from [10.0.0.112] ([76.126.209.57])
	by smtp.gmail.com with ESMTPSA id y2sm5040273pan.31.2016.08.18.09.50.45
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 09:50:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYU11Jvqyv+D=qgreP8mGYchLQF1JJbosNmtBo6ONtSeQ@mail.gmail.com>
Date: Thu, 18 Aug 2016 09:50:49 -0700
Message-Id: <2670E9D0-AF83-4FE0-A846-ADC4384298BC@gmail.com>
References: <1471538461-27065-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYU11Jvqyv+D=qgreP8mGYchLQF1JJbosNmtBo6ONtSeQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Specify extra paths
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
X-List-Received-Date: Thu, 18 Aug 2016 16:50:46 -0000
X-Groupsio-MsgNum: 85907
Content-Type: multipart/signed;
	boundary="Apple-Mail=_94E22586-D45F-4236-A8C1-6EF25EB1E575";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_94E22586-D45F-4236-A8C1-6EF25EB1E575
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8E607E7B-FBFD-4D5C-9EA7-3519ED86AD67"

--Apple-Mail=_8E607E7B-FBFD-4D5C-9EA7-3519ED86AD67
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 18, 2016, at 9:47 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 18 August 2016 at 17:41, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> Some layers have gstreamer plugin recipes which include
> the .inc files from OE-Core but they do not get to find
> the patch that is being forced by the .inc file and
> ends up with errors like
>=20
> Bad commit message as you don't specify the module.
>=20
> But should this SRC_URI_append be in the common plugins.inc anyway?  =
Are there out-of-tree modules that don't use gst-common and so the patch =
won't apply?

yes there are see
=
https://github.com/ndechesne/meta-qcom/blob/master/recipes-multimedia/gstr=
eamer/gstreamer1.0-plugins-v4l2.bb =
<https://github.com/ndechesne/meta-qcom/blob/master/recipes-multimedia/gst=
reamer/gstreamer1.0-plugins-v4l2.bb>



>=20
> Ross


--Apple-Mail=_8E607E7B-FBFD-4D5C-9EA7-3519ED86AD67
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 18, 2016, at 9:47 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 18 August 2016 at 17:41, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1w0" class="a3s aXjCH m1569e8858d13a109">Some layers have gstreamer plugin recipes which include<br class="">
the .inc files from OE-Core but they do not get to find<br class="">
the patch that is being forced by the .inc file and<br class="">
ends up with errors like<br class=""></div></blockquote></div><br class="">Bad commit message as you don't specify the module.</div><div class="gmail_extra"><br class=""></div><div class="gmail_extra">But should this SRC_URI_append be in the common plugins.inc anyway?&nbsp; Are there out-of-tree modules that don't use gst-common and so the patch won't apply?</div></div></div></blockquote><div><br class=""></div><div>yes there are see</div><div><a href="https://github.com/ndechesne/meta-qcom/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-v4l2.bb" class="">https://github.com/ndechesne/meta-qcom/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-v4l2.bb</a></div><div><br class=""></div><div><br class=""></div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""></div><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_8E607E7B-FBFD-4D5C-9EA7-3519ED86AD67--

--Apple-Mail=_94E22586-D45F-4236-A8C1-6EF25EB1E575
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle152kACgkQuwUzVZGdMxSVWwCfQ+5OhGXGhkRb+VLAUnCpS9nr
C5AAninH8Imozjf5X5jZQbCN1QLgUBkx
=crZM
-----END PGP SIGNATURE-----

--Apple-Mail=_94E22586-D45F-4236-A8C1-6EF25EB1E575--
