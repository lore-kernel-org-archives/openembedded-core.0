Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 36E597393E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 23:44:34 +0000 (UTC)
Received: by qcbkw5 with SMTP id kw5so80993204qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 16:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=UhE3/3eIVaG6yWoVm8z7yQ/rtNLitdQ3r5XQHEHa0Cg=;
	b=OTLyJjsfy724T4FPLmWs8wGK9hovKGWM+Afw8QlnO8Exh0oRNJaOHzUDpEqudjEpqm
	m7rghrw+vPLZTaVoUDY1ZlHtXDz0ZRiCRfZ0htWiSj7wNYIMtKNuXZWnqEbVyziQf4Xh
	OVOd1AYGVHqkFHDFRXzCCL6UCA+34WRw9+THEV9Y+faSdOXMIILjp7ymGARuAUYimEHJ
	0thkDqAHBMRING4LRDIEIFiDN20K2Q0NZNUon9GzYRFB7AP9ucO0mZQUkO2gwWUJ5ZwQ
	nt6nXCbBtoJKgqvSeLQDsWmx0OtcLc9XIy9Elb3Ld45m0kKasfmV3kQbQXVUDLoPblWa
	uB3g==
X-Received: by 10.140.232.65 with SMTP id d62mr3363665qhc.82.1426808676178;
	Thu, 19 Mar 2015 16:44:36 -0700 (PDT)
Received: from 10.25.255.72-ra01.westchester.pa.bo.comcast.net ([68.87.42.115])
	by mx.google.com with ESMTPSA id v76sm1898897qge.18.2015.03.19.16.44.34
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Mar 2015 16:44:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZDFj=TXUyj9XAkK8yciQOXvhrU-eYDyVu96hv+xQg1Fg@mail.gmail.com>
Date: Thu, 19 Mar 2015 16:44:40 -0700
Message-Id: <166EFF25-177B-4897-8346-F6C0BB68D49A@gmail.com>
References: <1426681293-30112-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAMKF1spV93W=+jfSvC_7JsuC8xokm5V=4PB3y4TUEO03iCow-g@mail.gmail.com>
	<CAJTo0LZDFj=TXUyj9XAkK8yciQOXvhrU-eYDyVu96hv+xQg1Fg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: Khemraj Sharma <khem.raj@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: avoid configure stall by feeding prompt
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
X-List-Received-Date: Thu, 19 Mar 2015 23:44:37 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8A2F3101-B593-4C1E-8748-A8117B3DB75E"

--Apple-Mail=_8A2F3101-B593-4C1E-8748-A8117B3DB75E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Mar 19, 2015, at 7:21 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
> Hi Khem,
>=20
> On 18 March 2015 at 22:29, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> That's ok
>=20
>=20
> Does this complement, replace, or is obsoleted by the patch from you =
that does the same yes| trick but at a different stage?
>=20

it replaces mine and is a better fix.

> Ross


--Apple-Mail=_8A2F3101-B593-4C1E-8748-A8117B3DB75E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 19, 2015, at 7:21 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra">Hi Khem,</div><div =
class=3D"gmail_extra"><br class=3D""><div class=3D"gmail_quote">On 18 =
March 2015 at 22:29, Khem Raj <span dir=3D"ltr" class=3D"">&lt;<a =
href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" =
class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr" =
class=3D"">That's ok</p><div class=3D"HOEnZb"></div></blockquote></div><br=
 class=3D"">Does this complement, replace, or is obsoleted by the patch =
from you that does the same yes| trick but at a different =
stage?</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>it replaces mine and is a better fix.</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
dir=3D"ltr" class=3D""><div class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_8A2F3101-B593-4C1E-8748-A8117B3DB75E--
