Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 841C66EF94
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 22:14:13 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id jt11so13740882pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 14:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=dl+fIpR9VciC3Y6w483YGqywPjqb9IKA7D+PvsP5TZY=;
	b=aZXEkS7bAp6wBIrKtIfuFtrr8dAWvciV6km1yXXPZOIJ+GisLS0JCCTIwLkiNyU7UA
	1XRNNvvnf79qq73xKPZ3ZrutpkjbtF6lkYGIvLEu/QxNxhdHgwmlCRkjDQfx26Bcc831
	LJymNJZUgdlWKgr/13JOOL5xlJPcXX1cv5bzEKnXumz8aXUnTZq96tXQ5RjnZR8GLynR
	6IywvRSStOci+eLVcgvWk1D4ep7OwW6orvMGLTfUCwlfVf1c3P1ks7XY4mFgrtu3Y6mj
	Bq7CTlEmci/BQgIferL8iN2spP8YjhAeJkm10hUEKY+P/KkDyPkJS6+QyoDx3LaS6lSD
	6Ujg==
X-Received: by 10.66.141.231 with SMTP id rr7mr17088574pab.41.1392502454499;
	Sat, 15 Feb 2014 14:14:14 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	id1sm30432507pbc.11.2014.02.15.14.14.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 14:14:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
Date: Sat, 15 Feb 2014 14:14:11 -0800
Message-Id: <A0921DE9-1EB3-4D7D-9D96-9092A7579041@gmail.com>
References: <CANP1U1xG6AkomoUcvm=chpQ=G7HY7ruFQRgYA5We6UsoFxvBLQ@mail.gmail.com>
To: Jay Cady <jcady92@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with libicudata.so in OE master
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
X-List-Received-Date: Sat, 15 Feb 2014 22:14:14 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D86B49CA-9D22-4548-BFF1-86E7CCF89D12"

--Apple-Mail=_D86B49CA-9D22-4548-BFF1-86E7CCF89D12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Hi

can you try this patch

=
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu=
&id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63

and report back

-Khem



On Feb 15, 2014, at 9:57 AM, Jay Cady <jcady92@gmail.com> wrote:

> I'm having the exact same problem.
>=20
> Latest master branch of Yocto 1.5 2/13/14.  Built with the master =
branch of meta-qt5.  Wandboard-dual.
>=20
> When running the Qt5_CinematicExperience app, I'm getting this error:
>=20
> shared libraries: /usr/lib/libicudata.so.51: internal error
>=20
> Any ideas how to fix this?
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D86B49CA-9D22-4548-BFF1-86E7CCF89D12
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Diso-8859-1"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;">Hi<div><br></div><div>can you try this =
patch</div><div><br></div><div><a =
href=3D"http://git.openembedded.org/openembedded-core-contrib/commit/?h=3D=
kraj/icu&amp;id=3D07ff1b539a62053c6d41cd2814e8d0bca1991a63">http://git.ope=
nembedded.org/openembedded-core-contrib/commit/?h=3Dkraj/icu&amp;id=3D07ff=
1b539a62053c6d41cd2814e8d0bca1991a63</a></div><div><br></div><div>and =
report =
back</div><div><br></div><div>-Khem</div><div><br></div><div><br></div><di=
v><br><div><div>On Feb 15, 2014, at 9:57 AM, Jay Cady &lt;<a =
href=3D"mailto:jcady92@gmail.com">jcady92@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div dir=3D"ltr">I'm having the exact same =
problem.<div><br></div><div>Latest master branch of Yocto 1.5 2/13/14. =
&nbsp;Built with the master branch of meta-qt5. =
&nbsp;Wandboard-dual.</div><div><br></div><div>When running the =
Qt5_CinematicExperience app, I'm getting this error:</div>

<div><br></div><div>shared libraries: /usr/lib/libicudata.so.51: =
internal error</div><div><br></div><div>Any ideas how to fix =
this?</div></div>
_______________________________________________<br>Openembedded-core =
mailing list<br><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br>http://lists.openembedded.org/mailman/listi=
nfo/openembedded-core<br></blockquote></div><br></div></body></html>=

--Apple-Mail=_D86B49CA-9D22-4548-BFF1-86E7CCF89D12--
