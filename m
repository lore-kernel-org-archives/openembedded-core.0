Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC6971633
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:08:03 +0000 (UTC)
Received: by pablf10 with SMTP id lf10so36955338pab.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 08:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=+McQMzq8mmj1IS1PgBtKNWGHn5BPNh5KKTOd6IN/sY4=;
	b=dCsQwJ9jmZR4w+TkltlLlJUQZVJ3iTAg9hK67/GT8ZZ+JN5V6Db3gWBtwMuDjtWcgf
	7oejOEdylwYloCScEQoP6HfK62wSJpePd0pnFN5x/5CURS86DAscEEzysBmUNH0HF3J5
	qvP/rnKSNvRbJ1Ffp9M6UrsTYAxUM9BQ2zMmb95/MzUDv1zPHAYau/BE6+aUIJ5uKUPN
	dONMJj5lSZT9pTTQ0ZxbE3u+PMWFL2Sx31vhOH5NOfPtSjiaH4L9/5NcGtj/4fj9nTiD
	R/sQ1sx8q+A34028amXFTbpZv3AqLQox5ArNEr3btzJxprB9q8gyBSoPqnL1kzzAI53Z
	J+dQ==
X-Received: by 10.66.255.98 with SMTP id ap2mr4128843pad.134.1424794084911;
	Tue, 24 Feb 2015 08:08:04 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:dce0:85c5:10b5:32ac?
	([2601:9:3580:84c:dce0:85c5:10b5:32ac])
	by mx.google.com with ESMTPSA id
	nd5sm38541720pbc.64.2015.02.24.08.08.03
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Feb 2015 08:08:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LY3ALEB1EXTEjWLLtansnm-zSb8oaUh_=AAOzxM+AKJBQ@mail.gmail.com>
Date: Tue, 24 Feb 2015 08:08:02 -0800
Message-Id: <422CC003-849A-4630-AB3F-B2337EA0C02B@gmail.com>
References: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY3ALEB1EXTEjWLLtansnm-zSb8oaUh_=AAOzxM+AKJBQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2070.6)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Tue, 24 Feb 2015 16:08:05 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E3DDCBD1-F7D9-43F0-AB56-33F7DC300B78"

--Apple-Mail=_E3DDCBD1-F7D9-43F0-AB56-33F7DC300B78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 24, 2015, at 4:11 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 24 February 2015 at 06:39, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>  .../glibc/glibc/eglibc-use-option-groups.patch     | 47 =
++++++++++++++++++----
>=20
> Is this chunk related?  The commit log only talks about disabling =
-Werror.
>=20

yes it is. it fixed some of the obvious errors. but thats not enough. =
There is a lot more cleanup needed


> Ross


--Apple-Mail=_E3DDCBD1-F7D9-43F0-AB56-33F7DC300B78
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 24, 2015, at 4:11 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 24 February 2015 at 06:39, Khem Raj <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:raj.khem@gmail.com" =
target=3D"_blank" class=3D"">raj.khem@gmail.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":gx" =
class=3D"a3s" =
style=3D"overflow:hidden">&nbsp;.../glibc/glibc/eglibc-use-option-groups.p=
atch&nbsp; &nbsp; &nbsp;| 47 ++++++++++++++++++----<br =
class=3D""></div></blockquote></div><br class=3D"">Is this chunk =
related?&nbsp; The commit log only talks about disabling =
-Werror.</div><div class=3D"gmail_extra"><br =
class=3D""></div></div></div></blockquote><div><br =
class=3D""></div><div>yes it is. it fixed some of the obvious errors. =
but thats not enough. There is a lot more cleanup needed</div><div><br =
class=3D""></div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra">Ross</div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_E3DDCBD1-F7D9-43F0-AB56-33F7DC300B78--
