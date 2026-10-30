Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16590.1793380303399908573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 10:11:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=rLs4OkSD;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=gnvtNhlS;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4F367140019A
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 13:11:42 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 13:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793380302;
	 x=1793466702; bh=nWNeZqwxGSqXwahkDzs9x1rVKgb1HaZ+DWrx2wNZDuE=; b=
	rLs4OkSDGEENOMkCCdpBY6oY6kYP2mgJbsP0OD0/0E1RABkfAWlLYlfiQpv4scrk
	4+h+UgOfzKWoA1TaLqH9+9EpV5qtT1+LRoteU1RgXwAADgrzf5iKsrTwT87tmqQ/
	p0Iwj4xvPdC1zGoVGgHz2vL+XSVJYzQGmDGhctPGixt6pNfECv83vV9pBsO4Epet
	6c0CIA29g+0r3L5KG/ODraRN4pAQtFDfQCEksDWWQ/ltLeWmIONCLWIcppQSO3MR
	9YMwdGJVIvQbuSZxjGhuuuowbCMH8vY3xXcvYewiZ/Yv7NloDYBtkxjyed20CUUD
	jeNatgpnkPBpPvD8MRHjag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1793380302; x=1793466702; bh=n
	WNeZqwxGSqXwahkDzs9x1rVKgb1HaZ+DWrx2wNZDuE=; b=gnvtNhlSbZkRmqtf4
	TJJ7Er6HF1zU0Tm7pt8gEuFTO0XQ7y7gXOHii7AsT7rHDjHKe+diwhfM9nzhHoiz
	dxxsdYvFpVcaP7excS/w67cbUnbvwjSOdPOy1SHP8D/lVvBCVCedZznVHu4tFEay
	oLGfTdiri62AmBwWak9k63Il3UBlo70/zJP7NKs26oXkHcc6wbT7Mw+b6bK/MVWg
	xxy1Y4x8JVjcZ9jW1YFWOR0xD8454eaglhiy5ZV9Y1RIfj82JFVZZ2XVo6Po7v/D
	7221LW7rQwVgT6jHvnlcC8+rzFuFfvtUvX82j5ta7ZxVw27fKN1sB3kDVmzExIyO
	uxObA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793380302; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:oUj1a3753isiHTewOb5nQsnP5/9Bj+A7rN0vS9Dn8N1vYUn
	JI8njrAzAwVqCoHJ5hbJ/pTS1/K38cknZhNPHT/I7xNpSK8aZc8lVXxr/SYWu82Q
	TTIPZEQEsKfi8XpjipXlTHA7IqZuoFIZWUQG5Y+g0j/8GBx4NW4pXNjDUeH0tvWU
	pinopknaE5M/9schpNVjkFMNdgKMsH4FSA+MjK6xSC5/VGPEX1eEQRgzmDS2pUvS
	0NEbluaWVtMP/y4kUv8bLhim1EC4H5ZzSSUX2FmVZf3D2vyEXBf5ygyIL2+PEfv4
	Vt+50UGweKqYezJqrILeoOSeG2dxASB1gq0lrZg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:v81bSNuD3mFUshcMS71pOuZcMp5KRk2k/aRN1s85SvM=:FpsrultT37mr6/deWnp9+5ruOPMSuqqB0d3SlFXipcs=;
X-ME-Sender: <xms:zs_katysn_PrH7hnHGOxzjJFjiIlLoFbiJod2sZlAFWzXqnyR1zklw>
    <xme:zs_kajThrSvXuV2BnnKVlRcQLYDkahPuAlp8KAwBNDaahYxnEc8xcmJkuusoi8M8o
    4BIiQOK6AHKjrO4zFwZbpmaf-BHysACv_1_f7o5iz_mPUG5IhSgXRo>
X-ME-Received: <xmr:zs_kak-Rlrlp0bTh689fBLcDH2sIl6UbL-QhBl-_CuLRG84HN5DsqlABUOKru_jjjvRk4TxxFTtXDNlBu7DKjnkyjjmhuSBTrPORmE8>
X-ME-Proxy-Cause: dmFkZTFCnRStSmilOi5B4Dp2oWTdROrOQyrfmfI5VRgYZq+WXEhb/uIBq2H0QhUWXRuA9A
    VcYbk2GgcV6QBLkes2DYQ4iF63rdwvjR8Le0yM0HGaDbsi26u68mMxfTMuqMFUr2ESfRcD
    FVNEuSVClFEdT7bTmgySW1T4H/egUL95DCNUzBvbymwPWJ0UynAm2/taYIawJamNJpR22v
    gK4u7cU6644BAGqhHEQzOBkF4oI3B+LpDJyrmtDRQGCMByQuju03yyPtnmXXiR+PhENJv3
    dKPSHuyhujEki2dH0naJBGNzlbBl/vTv3pBKHY2M9T26Q9Wt94iGnR5SXLu8EWgbv6bqEu
    K+ztwNHMT0HqNfPU71AbXCw4QJgo+HAZUJL7RYV/JcabgFu8J0dgmK/OXtMouWS+xutVJ/
    KlUREfIPTXNvUQ2di0cJealVkgyll3HQ6nsTShRNstHw+ouXIj6THYeu9cdOoumUA4SyC6
    llPuMGxxkDnZCb9iRylfecOknNTpKrN8JgZXhllElCCce2Lb6RnWlIrIU1UuZB0XAaPieL
    Y6KeI5N2dyRO9imc4nCEgoQ9KxoObCNi0j8AZRpZLy2im1VZ8Bksae3Tl5r30uda0E+uc9
    F8WCikvhgRNOM4LBR8hNYbwugxTvJv2IQwN6yh0SupxJyTnSlL/7+CXZqsTw
X-ME-Proxy: <xmx:zs_kaqohV-rlb1h_6yc8Nn7ByMXxzZI8USG4VeRzpnySfrznpoXRHg>
    <xmx:zs_kahmP1m0XB55oMrjcgJagfPMDsLbGJTe0f0EEGcXe6xJ7LO6yyg>
    <xmx:zs_kahJPj7_wx2iU1_4kJR0NRJVn1h6NVbmBPwjTA_tplAfrFiccxQ>
    <xmx:zs_kamyJO61pODqri--NiYr6yEhaH4CW6Xn9yp14ihWOCLwXbiwrRQ>
    <xmx:zs_kamK0AOlqloZ7-LxUBLGX8XRq3qUY6cJV9k1zidYRAWbAgPgN420y>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 13:11:41 -0400 (EDT)
Message-ID: <18f3e13e04aa08dc9b1d00b26a4c052b27878579.camel@pbarker.dev>
Subject: Re: [PATCH] archiver.bbclass: archive shallow git sources which
 have no clone
From: Paul Barker <paul@pbarker.dev>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Fri, 30 Oct 2026 17:11:40 +0000
In-Reply-To: <20261030132219.2280397-1-ecordonnier@snap.com>
References: <20261030132219.2280397-1-ecordonnier@snap.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249056

On Fri, 2026-10-30 at 14:22 +0100, ecordonnier@snap.com wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> In the original mode, do_ar_original archives a source if the fetcher's
> localpath is a file, or a directory (which is unpacked and tarred). For g=
it,
> localpath is the clone in DL_DIR/git2. A shallow fetch (BB_GIT_SHALLOW) c=
an
> use the gitshallow tarball (ud.fullshallow) without creating the clone: s=
ince
> bitbake commit 457288b2f ("fetch2/git: Add support for fast initial shall=
ow
> fetch") this is what a shallow fetch does by default, and it also happens=
 when
> the shallow tarball is fetched from a mirror. In this case, the source wa=
s
> silently skipped and not archived at all.
>=20
> Treat this case like a directory source: unpack() can unpack the shallow
> tarball. Use the same check as unpack() (clonedir_need_update()), so that=
 the
> case of an out of date clone, where unpack() also uses the shallow tarbal=
l, is
> handled as well.
>=20
> The shallow tarball only contains the repository, so the unpacked tree ha=
s a
> .git with all the (compressed) objects, which would double the size of th=
e
> archive. Drop it. The .git of a clone has no objects either (clone -s onl=
y
> references them via objects/info/alternates), so neither archive contains=
 a
> usable repository.

Hi Etienne,

I think there are two changes here, which should be separate commits:

1) If the localpath doesn't exist yet because the fetch used a shallow
   mirror tarball, treat it as a directory as fetch.unpack() will
   populate the directory.

2) Remove the .git directory to save space and give a clean archive
   tarball. Should this also be done for non-shallow git clones? If the
   .git directory doesn't contain objects anyway then it's just
   confusing and still wastes a little space.

We should still catch the case where both isfile() and isdir() return
false and raise a fatal error in that case. So I'd like to see a v2 for
your other patch as well. It's better to send them as a combined v2
series.

Best regards,

--=20
Paul Barker

