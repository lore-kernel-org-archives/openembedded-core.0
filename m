Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8FE760621
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:09:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2016 03:09:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,322,1470726000"; 
	d="scan'208,217";a="759784448"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Sep 2016 03:09:12 -0700
Message-ID: <1473674951.10544.26.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Sep 2016 13:09:11 +0300
In-Reply-To: <CAJTo0Lb6coAQk0E=DXo2eUkJo4p8TDHXuuTv98i2r61AwgyvQA@mail.gmail.com>
References: <1473400623-20500-1-git-send-email-markus.lehtonen@linux.intel.com>
	<CAJTo0Lb6coAQk0E=DXo2eUkJo4p8TDHXuuTv98i2r61AwgyvQA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-player: include SRCPV in PV
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
X-List-Received-Date: Mon, 12 Sep 2016 10:09:15 -0000
Content-Type: multipart/alternative; boundary="=-quh6XcC2L9XvKI7R793d"

--=-quh6XcC2L9XvKI7R793d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-09 at 11:51 +0100, Burton, Ross wrote:
> 
> On 9 September 2016 at 06:57, Markus Lehtonen <
> markus.lehtonen@linux.intel.com> wrote:
> > +PV = "git${SRCPV}"
> > 
> This breaks packaging for me, throwing interesting python exceptions.
Hmm, strange. I didn't see anything like that. From what I can tell,
changing PV from "git" to "git${SRCPV}" shouldn't cause anything like that.
> gst-player has a version in configure.ac, so this should be
> 0.0.1+git${SRCPV} I guess.
That looks better, I'll send v2 soon.
Thanks,
  Markus

--=-quh6XcC2L9XvKI7R793d
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2016-09-09 at 11:51 +0100, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 9 September 2016 at 06:57, Mark=
us Lehtonen <span dir=3D"ltr">&lt;<a href=3D"mailto:markus.lehtonen@linux.i=
ntel.com" target=3D"_blank">markus.lehtonen@linux.intel.com</a>&gt;</span> =
wrote:<br><blockquote type=3D"cite"><div id=3D":772" class=3D"a3s aXjCH m15=
70d87af1f8f38b">+PV =3D "git${SRCPV}"<br></div><br></blockquote></div><br>T=
his breaks packaging for me, throwing interesting python exceptions.</div><=
/div></blockquote><div><br></div><div>Hmm, strange. I didn't see anything l=
ike that. From what I can tell, changing PV from "git" to "git${SRCPV}" sho=
uldn't cause anything like that.</div><div><br></div><div><br></div><blockq=
uote type=3D"cite"><div dir=3D"ltr"><div>gst-player has a version in <a hre=
f=3D"http://configure.ac">configure.ac</a>, so this should be 0.0.1+git${SR=
CPV} I guess.</div></div></blockquote><div><br></div><div>That looks better=
, I'll send v2 soon.</div><div><br></div><div><br></div><div>Thanks,</div><=
div>&nbsp; Markus</div></body></html>

--=-quh6XcC2L9XvKI7R793d--
