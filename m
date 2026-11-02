Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2055.1793654491070653073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2026 13:21:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=WoV+3RQZ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=LyLDnRhO;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4D6907A0013
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Nov 2026 16:21:30 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 02 Nov 2026 16:21:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793654490;
	 x=1793740890; bh=4fvsCUD6BYt1k15u2VHw1ZEJG2S4i/SDpmKWBmhEE48=; b=
	WoV+3RQZa9HcfilrcqMNP+Lf1PnICEQum5kIgbjdEW+fU3UWAPRGCpJk/bzO+90v
	TuCNTxs1Maj4UtjsTkIEKPA+sofMwZWOhCHY/JEMTkWyLThw4km9Wyh0SR22AG+z
	FfzTcBT0QdKuqZR3jmQf87l3VM9yFumICmpGBou3agzMxfYIa+8OrRzlqsZoMNfm
	Lh4tg8R+5aMsEgoEclYDr13jJ/wbGs62kscy1wnUc+kF0lR0HOCIkZL2TrcDEPO1
	MMA13YkN5oGDnDSd5iMOyFvBePX9WAWEfheh7qeJzSQ6wLzMy+pBo0fRyH1jUjOI
	xAYCvfkkfRUQR66OL1UEzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793654490; x=1793740890; bh=4
	fvsCUD6BYt1k15u2VHw1ZEJG2S4i/SDpmKWBmhEE48=; b=LyLDnRhOprUz3AgUS
	pwbjwefbp+8dnQ7Q+WHj9zEfXExWvM47Pdq0Aaj0nBbOJf8xUbzV1+WA3+ndZQ3M
	Q1dE5aI+vK2hVZkVstil2rtFWIZiLtCARsRwmAuPUtAWT7eVysDxjEpp0d/gSX7j
	eBwq6rJeSL9n4VDXPmVYUbV111gNByWBDj2J9lvuPKXe9RrWbJy7dvCICF/APKEF
	pl33v6TiLKQa/Jnq9l7yCd6N30ns1JK0lQMEvSyAk6iOJzY8MT/DsWz33//vZFxW
	8W/qjprywdNul0LQdDiOy9zpO8VcoWmvDd2w3rgrIcyftWGWEvfIB85gVGpDiVak
	QJJDg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793654490; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:PJhiSM6bnp6e4h7+Zgg+O0XQw2VOI7ZAm5s5pFFt/bvxmsL
	twkPmoPA3N+6/5T/2vCfeHbVFqhvNxFX5Xg9a5iVZ1v09YP7ThjYrB4In+8n9m0y
	wUGmJJMWMbeX2EnHOg/NV/NQToopwcGbFCBp6019rS22SSuJf92KRtI6eL7mOxlF
	eGD3sL7cLbOCtMOeLwz32mjBpscUeKLyLxNKRUMjpr4uBLslENpA4x6pURlzOKlQ
	zg8RhC+yW6BEHu32xxNQxLTDqzVjpUDuWwA9myaLsTz0dmONVq+7AAl5nqt3BVYA
	StgQJhjMjNvuTmIcS0rYlgvwBQgjh4aD6Gaws6Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:bGGrihAM5k09e18EWkRb9MdWxx85yBg78Ud71m6n7tQ=:D9/b+zSFk2GTZtIXcKwC/xx0QjBMroWsQn+IzYC2a58=;
X-ME-Sender: <xms:2f7oarl3JGBvkN3on5TZvPR9g77qbbUMu-8mnbuwPTHSHcSup8gF-w>
    <xme:2f7oak3PNlgWKXYpSeAu1yborKR7WTZQzfKZU3HyIvu5q2xx1Kh8H02NyymNN16hL
    DS_uDYEEFWvAjRRO2GmY_bNFZR3XzXOUhmTqfeZasO6TY7cFTF2Kzqt>
X-ME-Received: <xmr:2f7oavRn2uIWjRAfcKGVjF6WTExhL7sF2ws-xpEOEDWfJOw-LXEEvKSz-BJ4Lrgj570oy-Xm6bETj5OoFW0XhQe8NIKMQ3Zr1GWyjX5gh-Id>
X-ME-Proxy-Cause: dmFkZTFBmuuzP3aAt5j0D5PQlBNzs4G9Kcgr/q3ZtyF6y+qMF0p1T23SIjjjbto85ONmIX
    C9ydpyYNNua/2Gi+L5jo5A5BPxaOpiU2t+tib4DZ9QcwCJSOP4w0agbqrOXtC4ctxsmzhe
    4zMRuUhijzsGVegbAMX8D6L7zbPRW0ABZpv5DC3aNSXvprQ8fUcrFnUyjlO6v2vNQ20hb3
    TMPV39JBOPm6VxcX39tYlrBGBqitIokXNj4BaggBZFQl1j7boF+d8yydMdvPZx6xXe6plk
    9Y/+KaKxp8VpgPX/hZSAElzUQMFf50VYcdeQ84muJz6l9dIcwvX5OwXH9hZ5U8VD5c6zrb
    eVKu8eS2GpWES2OzvNeXLF/NYQ9FcRc+zabDkHJv352lV6vaL9fGcyCBZceZCix7OXzWbT
    RAqPXBpXI2sgMerkUmqKJb9kTePdGBJgK706IpCIzdmTZZcZDU4B55A47Gd19suht+yonp
    A+FAEBB/EiueTVxhnri4qmKydE2tlHRXPS2sUSYfNVnYHpC720vKnzMZuu/v9radLPkzTu
    PcY/Od93F38OxFg3SDL/SNUOwgyl0rWwyjsEIAs3fE/5FbI7YESlfxGCY5EzV4Bu7Yg2AF
    towMlcIBQxC/ddJbI/f3JT3WlQsOVxQIyq1oPRyMj1JZWWn7rDfKhDvce/fA
X-ME-Proxy: <xmx:2f7oauvDLWX_e2S12JX48dkMfzJQzltS-xDWBOs27E0KqXkLMn6t8Q>
    <xmx:2f7oasYK7IJ0CBUT2P007VFxvTMvqcxhIyjqHs1tGb1Hd2KyvpkqXw>
    <xmx:2f7oartlThBovve43RYHWPn4UvqK51oJiEEHOlLNRzHluMT4_igXTA>
    <xmx:2f7oamEFwC4crGqO9KYihRvEGHx0I6lBjc1IujMc1cAGo3MnZHj2lA>
    <xmx:2v7oamIC98G5ANd99ZRwtx38n1xHT2l-Grx1rzGDM8mafHE3AN4RHDTs>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 16:21:29 -0500 (EST)
Message-ID: <01e34b7b659856ddc441fef77a655623f718d2bd.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 19/55] python3-urllib3: Fix CVE-2026-97689
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 02 Nov 2026 21:21:25 +0000
In-Reply-To: <DMKQGM0OK34J.11PEY49EZB5M7@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
	 <a24491466f8796015bd1146d874f4be52f10ad42.1793405493.git.yoann.congal@smile.fr>
	 <64d8e8dcb939b38d9a3fb4999000a56138aa4f79.camel@pbarker.dev>
	 <DMKQGM0OK34J.11PEY49EZB5M7@smile.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 21:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249225

On Mon, 2026-11-02 at 13:44 +0100, Yoann Congal wrote:
> On Mon Nov 2, 2026 at 12:02 PM CET, Paul Barker wrote:
> > On Sat, 2026-10-31 at 01:14 +0100, Yoann Congal wrote:
> > > From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > >=20
> > > Backport the upstream fix [1] as mentioned in [2]
> > >=20
> > > [1] https://github.com/urllib3/urllib3/commit/cd770b059b543be29298ea5=
c52afb0b1b090f5ed
> > > [2] https://nvd.nist.gov/vuln/detail/cve-2026-97689
> > >=20
> > > Testing:
> > >   - test_response.py::test_chunk_size_line_too_long - passed
> > >   - test_response.py::test_chunk_trailer_line_length (6 cases) - pass=
ed
> > >   - test_socketlevel.py::test_chunked_size_line_too_long_does_not_buf=
fer - passed
> > >   - Full test_response.py: 161 passed, 45 skipped (no regressions)
> > >=20
> > > Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > > ---
> > >  .../python3-urllib3/CVE-2026-97689.patch      | 251 ++++++++++++++++=
++
> > >  .../python/python3-urllib3_2.2.2.bb           |  14 +-
> > >  2 files changed, 258 insertions(+), 7 deletions(-)
> > >  create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-=
2026-97689.patch
> > >=20
> > > diff --git a/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97=
689.patch b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.pat=
ch
> > > new file mode 100644
> > > index 00000000000..98b007324cf
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/python/python3-urllib3/CVE-2026-97689.pat=
ch
> > > @@ -0,0 +1,251 @@
> > > +From 5d5fac45ff18a8159c5a4aa973ed9fc2f5dd35ad Mon Sep 17 00:00:00 20=
01
> > > +From: Quentin Pradet <quentin.pradet@gmail.com>
> > > +Date: Tue, 15 Sep 2026 22:33:41 +0400
> > > +Subject: [PATCH] Merge commit from fork
> > > +
> > > +* Bound chunk-size line reads to prevent memory exhaustion DoS
> > > +
> > > +The streaming chunked path (HTTPResponse.stream() / read_chunked()) =
read
> > > +each chunk-size line with an unbounded readline(), unlike the plain =
read()
> > > +path which delegates to http.client's _MAXLINE-capped reader. A mali=
cious
> > > +server could advertise Transfer-Encoding: chunked and then send a ve=
ry long
> > > +run of bytes with no newline, forcing the client to buffer the entir=
e run
> > > +before the chunk size could be rejected.
> > > +
> > > +This caps the chunk-size line (and the trailing CRLF line) at _MAXLI=
NE,
> > > +raising ProtocolError when exceeded, matching the behaviour read() a=
lready
> > > +had. Only the size line is bounded; chunk bodies still go through th=
e sized
> > > +_safe_read(), so legitimate large chunks are unaffected.
> > > +
> > > +Verified with a local malicious server streaming a 200 MiB untermina=
ted
> > > +size line: stream() previously grew RSS by ~530 MB, now stays at ~1 =
MB and
> > > +fails fast, matching read(). A 5 MiB chunk body still streams correc=
tly.
> > > +
> > > +* Fix a black formatting issue
> > > +
> > > +* Test chunked response trailer length limits
> > > +
> > > +* Fix number in the changelog entry
> > > +
> > > +---------
> > > +
> > > +Co-authored-by: Illia Volochii <illia.volochii@gmail.com>
> > > +
> > > +CVE: CVE-2026-97689
> > > +Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit=
/cd770b059b543be29298ea5c52afb0b1b090f5ed]
> > > +
> > > +Note:
> > > + - changeLog change is not backported
> > > + - Adjusted commit change as per current version
> >=20
> > Do we need more detail on the adjustments made during backporting?
>=20
> I did not need more infos for this one, changes were obvious enough. And
> the resulting code is the same as upstream's.

Ok, sounds good. Thanks for confirming!

Best regards,

--=20
Paul Barker

