Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id CBA48736C1;
	Mon, 30 Mar 2015 16:47:06 +0000 (UTC)
Received: by patj18 with SMTP id j18so16180281pat.2;
	Mon, 30 Mar 2015 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=mPr7xB3T3yfQ26IL+4l5SPMjW+z9cdyH7yrnojwwu+Y=;
	b=hGpiFt7HV1rcWMmUZFvy1roBzE4LEjyGN02ZSicz71GuZCcRpx99PnxQCDjMvp/5Yj
	/5vfiL69dN9CnSDU6Rh+9jdj2J69cznXhtBY8a/dTRe2dFaoIj/zwPdxKQJwaMz+1muS
	F1iQj2sMcVqCEJWt0FCIidorVrluglkxbF5Pv3CD3SF4KRKHpzvg7sadCPp9GOqqz1kc
	GQyIkBkawfiKpJhqdcpZ2zRgM2Dl7BloEULQ7YAUJhNXLn1dpIPx0T09BhvxapSZ4NXy
	TyR5fRGEYbJKSdVxVhXwk8ao+DT6VfGKHKHOYRkhga10Fhyxpsrjm+vYmwSfhp61kxb1
	zczg==
X-Received: by 10.66.184.106 with SMTP id et10mr61655035pac.138.1427734028431; 
	Mon, 30 Mar 2015 09:47:08 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:44fe:a294:7c9f:1f53?
	([2601:9:3580:84c:44fe:a294:7c9f:1f53])
	by mx.google.com with ESMTPSA id ol5sm7687687pdb.23.2015.03.30.09.47.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Mar 2015 09:47:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LY_v=R0Xv-QcYyEvm-fBun2JZG+xL80R_yMcBU-B2ASqg@mail.gmail.com>
Date: Mon, 30 Mar 2015 09:47:06 -0700
Message-Id: <F26ACF0A-7BEC-49C0-8DAA-32B92BD2A172@gmail.com>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
	<1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
	<CAJTo0LY_v=R0Xv-QcYyEvm-fBun2JZG+xL80R_yMcBU-B2ASqg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] Jonathan Liu : fontcache.bbclass: prepend to PACKAGEFUNCS instead of appending
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
X-List-Received-Date: Mon, 30 Mar 2015 16:47:09 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_EEDCFD50-5F1B-4E0D-A8FD-27B3315EA935"

--Apple-Mail=_EEDCFD50-5F1B-4E0D-A8FD-27B3315EA935
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2015, at 9:43 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 30 March 2015 at 17:41, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> aren=E2=80=99t they variable data files ? where else should it go =
otherwise=20
>=20
> They're directory-wide caches, and caches tend to go into /var/cache.
>=20

yes /var/cache is what I was expecting too

> Ross=20


--Apple-Mail=_EEDCFD50-5F1B-4E0D-A8FD-27B3315EA935
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 30, 2015, at 9:43 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 30 March 2015 at 17:41, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"">aren=E2=80=
=99t they variable data files ? where else should it go =
otherwise&nbsp;</div></blockquote><div class=3D""><br =
class=3D""></div><div class=3D"">They're directory-wide caches, and =
caches tend to go into /var/cache.</div><div class=3D""><br =
class=3D""></div></div></div></div></div></blockquote><div><br =
class=3D""></div><div>yes /var/cache is what I was expecting =
too</div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><div class=3D"">Ross&nbsp;</div></div></div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_EEDCFD50-5F1B-4E0D-A8FD-27B3315EA935--
