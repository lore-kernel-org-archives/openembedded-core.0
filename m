Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3557473243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:22:45 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so46110204pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=aXCyM/op3ELtybM39NGSMH/lb8LzG1jcAUNWpyc6XIk=;
	b=CirgMppBlhkqNYim28q/w7aWh5qr/R24KpxYmLC+gfm6uUd14S3KV1k8bYqB4+LVZz
	WHrHvYO52VqcuAXeFEgvw9RjRWi0Mk5VRBNmX63ESY7l0GUilnSXgZakc7mE1OHSgqAQ
	umqQXQt/B5c/bhWu17jm9ve0D5ViaAHNXgtCwUT2r7UlxKSoh/YDVJBTMDyoHljTORg9
	1DOgpz79i5/iLPvwyusyoOC5FQGVNJKmO6EWsi5WOIPXQv3gHKcg3658eDdIJQTTnF0A
	aam24JuHWT5IiqiBtUoZHXk/1DpRUjkkvbAAqqXtWlU4MAjoYBp6qHY27FvrgHbAHeGn
	xDzg==
X-Received: by 10.66.121.74 with SMTP id li10mr74322855pab.73.1441898565921;
	Thu, 10 Sep 2015 08:22:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:2419:d270:de82:90db?
	([2601:646:8601:4580:2419:d270:de82:90db])
	by smtp.gmail.com with ESMTPSA id
	lq10sm12693096pab.18.2015.09.10.08.22.41
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Sep 2015 08:22:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
Date: Thu, 10 Sep 2015 08:22:41 -0700
Message-Id: <F0FA75E8-F6E8-496C-8757-68144FDCD0CA@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
	<0b794c84466fef2ece1269e01820503b4bce0b52.1441753511.git.raj.khem@gmail.com>
	<63981.10.252.58.194.1441792979.squirrel@linux.intel.com>
	<64065.10.252.58.194.1441794205.squirrel@linux.intel.com>
	<32176B14-814F-40D7-A452-86D835E38FCB@gmail.com>
	<55F1679C.5090508@linux.intel.com> <55F16E82.1070708@gmail.com>
	<55F172C9.3030601@linux.intel.com> <55F173AC.7010808@mlbassoc.com>
	<CAJTo0LYWxFtoYNseSup-zXAvJMigP_y1c4wdSrFXwk6SP_C-=A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3094)
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Policy for 'Pending' patches (was Re: [PATCH 02/16] slang: Fix namespace conflict vis-a-vis posix_close)
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
X-List-Received-Date: Thu, 10 Sep 2015 15:22:46 -0000
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_AA3D7BF6-FF20-4F67-ACB8-E3BCBA6CD1CE"

--Apple-Mail=_AA3D7BF6-FF20-4F67-ACB8-E3BCBA6CD1CE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 10, 2015, at 5:12 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 10 September 2015 at 13:12, Gary Thomas <gary@mlbassoc.com =
<mailto:gary@mlbassoc.com>> wrote:
> What would you do to the poor sod that sends a patch upstream
> (i.e. Pending) that is not being moved on by the upstream holders?
> Punish him by making his patch (and potentially all others he
> has created) invalid?  Seems a bit harsh...
>=20
> Send upstream is Upstream-Status: Submitted.
>=20
> Pending means "I wrote a patch but cannot be bothered to send it =
upstream=E2=80=9D.

Or more politely, I am working on upstreaming it on my own schedule.

>=20
> Ross=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_AA3D7BF6-FF20-4F67-ACB8-E3BCBA6CD1CE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Sep 10, 2015, at 5:12 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 10 September 2015 at 13:12, Gary Thomas <span =
dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:gary@mlbassoc.com" =
target=3D"_blank" class=3D"">gary@mlbassoc.com</a>&gt;</span> wrote:<br =
class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":ub" =
class=3D"a3s" style=3D"overflow:hidden">What would you do to the poor =
sod that sends a patch upstream<br class=3D"">
(i.e. Pending) that is not being moved on by the upstream holders?<br =
class=3D"">
Punish him by making his patch (and potentially all others he<br =
class=3D"">
has created) invalid?&nbsp; Seems a bit harsh...</div></blockquote><div =
class=3D""><br class=3D""></div><div class=3D"">Send upstream is =
Upstream-Status: Submitted.</div><div class=3D""><br class=3D""></div><div=
 class=3D"">Pending means "I wrote a patch but cannot be bothered to =
send it upstream=E2=80=9D.</div></div></div></div></div></blockquote><div>=
<br class=3D""></div><div>Or more politely, I am working on upstreaming =
it on my own schedule.</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><div class=3D"gmail_quote"><div class=3D""><br =
class=3D""></div><div class=3D"">Ross&nbsp;</div></div></div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_AA3D7BF6-FF20-4F67-ACB8-E3BCBA6CD1CE--
