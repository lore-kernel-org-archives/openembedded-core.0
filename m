Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 08D7773C0D;
	Mon, 30 Mar 2015 16:41:30 +0000 (UTC)
Received: by pdnc3 with SMTP id c3so181003178pdn.0;
	Mon, 30 Mar 2015 09:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=gSqwliY73OO0JcxZCUBzX0rth4bJkERhQ5owzib69uQ=;
	b=xZpbHkrTpiWZ5SgKy4lfSJTgZp979bQQrdbbvZ8hezp5QhMCjHmjJIUs7nRFdgJkTY
	iIreIjIV4xe4OC1HlM/kAdPoRGOlfMKCSXTXqhLQuVckn1VH2aYGKcn1W/HZYpwddmsf
	5fKGvrk6zQ6495jVeKYdWSaDMudg+ei58OqeX7gT3qRq+ELZikfpVHcGx/ASC1XojTsS
	pChPDOSU/3/FiyQDZy/jb+g06REf7byRhf6cxGfawPtsexMZngMx2MAp/Wkbj14aJ3aY
	x9IGl+fyLTOqx9TRir6FGitCKYFj4++2r55PizPUBzgtONTtBaA/IId1pWRmLQd6WKUv
	nnew==
X-Received: by 10.68.180.195 with SMTP id dq3mr11021446pbc.39.1427733692255;
	Mon, 30 Mar 2015 09:41:32 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:44fe:a294:7c9f:1f53?
	([2601:9:3580:84c:44fe:a294:7c9f:1f53])
	by mx.google.com with ESMTPSA id qc6sm2728717pdb.88.2015.03.30.09.41.31
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Mar 2015 09:41:31 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
Date: Mon, 30 Mar 2015 09:41:30 -0700
Message-Id: <1A4BBFA3-A5F0-4145-A64D-326C186C51C4@gmail.com>
References: <20150316174236.48B8050234@opal.openembedded.org>
	<20150321021120.GF4738@jama>
	<1426930147.29168.104.camel@linuxfoundation.org>
	<20150321145504.GG4738@jama> <20150323222113.GD3904@jama>
	<CAJTo0LbTfKqs_se99op6w1eA0A4_QAM5VX9VVDYJYh6+1pnyzQ@mail.gmail.com>
	<20150325161208.GK3904@jama> <20150329002843.GE2343@jama>
	<CAJTo0LZqbqThJ04OTmbrEhUQx1VaXT-9LGS-S6bosyKBmgGvFg@mail.gmail.com>
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
X-List-Received-Date: Mon, 30 Mar 2015 16:41:33 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B0CD0FC2-9196-46A2-AE3A-AC1D16659A1D"

--Apple-Mail=_B0CD0FC2-9196-46A2-AE3A-AC1D16659A1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2015, at 3:09 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 29 March 2015 at 00:28, Martin Jansa <martin.jansa@gmail.com =
<mailto:martin.jansa@gmail.com>> wrote:
> WEBOS_FONTCONFIG_CACHE =3D "${datadir}/fontconfig/cache"
>=20
> I'm sure there's a good reason why fontconfig caches are going in =
datadir but I'm not sure I want to know it :)
>=20

aren=E2=80=99t they variable data files ? where else should it go =
otherwise=20

> Ross
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_B0CD0FC2-9196-46A2-AE3A-AC1D16659A1D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Mar 30, 2015, at 3:09 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 29 March 2015 at 00:28, Martin Jansa <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank" class=3D"">martin.jansa@gmail.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":50w" =
class=3D"a3s" style=3D"overflow:hidden">WEBOS_FONTCONFIG_CACHE =3D =
"${datadir}/fontconfig/cache"<br class=3D""></div></blockquote></div><br =
class=3D"">I'm sure there's a good reason why fontconfig caches are =
going in datadir but I'm not sure I want to know it :)</div><div =
class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>aren=E2=80=99t they variable data files ? where =
else should it go otherwise&nbsp;</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_B0CD0FC2-9196-46A2-AE3A-AC1D16659A1D--
