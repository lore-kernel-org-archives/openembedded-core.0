Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id A9EC4787B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 20:25:58 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 9so8128278wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Dec 2017 12:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3nA3e8oWPMk+rYCMnkuJeRX9MHmu3vo4LsLbnL5E4wo=;
	b=XQyuaYjJ7qDuPK3Vr+A/lASWrsJeh9VrYNc18h8PJetXAoE7XSELyQhQihv1pKknNg
	ggZF5yZ4COoq2hZBMMTeoV7ZU7QtQsjKXMYnKOGW93yyKwexI1EvqdhCBSqt7tvDvlLh
	4xux0JPXBQNj7QNvogjMcpLTMba7PgqydiNshTItCawiguFI/ZbCm/94yZ2GYbt02rZn
	SjVNLh8YolER3V+HJI1fOJt2tY3B1EBU9fGsV0JtL/kqYtuTHXr5tiASIzurHXmj9Be7
	MrY8ndZRVz4H+RglPfIbN4yptgzFW4SnT/YJbgGAiYZubUjJJ+Iuus+Z+m1DHHzsCxgm
	LJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3nA3e8oWPMk+rYCMnkuJeRX9MHmu3vo4LsLbnL5E4wo=;
	b=rUvMm7L0StTWRGE/lWgsLqoqUKqFl+2qX4gco0gmcilQm4vaV8sbV7wSCC/QOBKww5
	FuTxBcac0Veid049Kk2oP5YeEtcuSKC3I5pBrsDwhVgkSmabY4h9MpQl5wc0cEbWk4qT
	cDm5yXaBzB+E1tvkFoyVW5jsBTu8N+1bunXIxCA4U0NrZWj0dUTtEQm4myjEwT71kpDN
	ZwxWzlcQIdeuuMWetq65Y9cg4rI3YXUMzLGPGjgDayswdyE9MnM4nsIZgzHpHclqKpDX
	v1d7SUMHp4XLrOe2XfgGLTCipBHvynAzNhhPY/qkFJWQO8e4mEitTXyu0AMo7CRtu/Zv
	D40g==
X-Gm-Message-State: AKGB3mLOE9NT2vTHDC7yYKZ2wFva6bkxZVYOYDO4Tf1Rjw+F6/7BgZNt
	YkY0cFHwlTo0KAG4rEaeca+x1Q==
X-Google-Smtp-Source: AGs4zMbCnSwJKXvtgee9wjMRddAk7JIUdFh8GClfpKCBO6Sib7LwyfOB/pPcsffyaYGPpp1hJmEW2Q==
X-Received: by 10.28.147.84 with SMTP id v81mr4236814wmd.133.1512419159148;
	Mon, 04 Dec 2017 12:25:59 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d73sm8820539wmh.3.2017.12.04.12.25.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Dec 2017 12:25:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 4 Dec 2017 21:26:02 +0100
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <20171204202602.GA4220@jama>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171201220258.2785.92203@do.openembedded.org>
	<CA+chaQcDrNUp_fE2a+JpkBOgAKAzA+e8SMKMqRGMpcD7jrLvGA@mail.gmail.com>
	<20171204092359.0bef0632@lsandov1-mobl2.zpn.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171204092359.0bef0632@lsandov1-mobl2.zpn.intel.com>
User-Agent: Mutt/1.9.1 (2017-09-22)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGluaXRyYW1mcy1mcmFtZXdvcmsgaW5zdGFsbGF0aW9uIGltcHJvdmVtZW50cyAocmV2NCk=?=
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
X-List-Received-Date: Mon, 04 Dec 2017 20:25:58 -0000
X-Groupsio-MsgNum: 105827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2017 at 09:23:59AM -0600, Leonardo Sandoval wrote:
> On Fri, 1 Dec 2017 23:07:48 +0100
> Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > Is it trying to apply whole series (including the 2 patches which were
> > already merged to master and actually introduced the issue I was trying=
 to
> > fix)?
> >=20
> > Does it mean that I cannot send a fix into the e-mail thread where the
> > issue was introduced and discussed?
>=20
> I do not the answer but I can tell you about the fail check: patchtest is=
 pretty dummy in this check, it simply does git apply --check <your series.=
mbox> so you need to base on master's HEAD.

But the patch I've sent is rebased on master's HEAD.

My question is how to send the patch to the thread where it IMHO belongs
without patchtest trying to apply all the patches in the thread (if
that's what it meants by "series".

See:
https://patchwork.openembedded.org/series/9783/
the last patch isn't 3/3 from this series, it's just independent new fix fo=
r changes
introduced in this series (e-mail thread).

so it should apply only this one:
https://patchwork.openembedded.org/patch/146352/

I know this cannot be as clever as e.g. gerrit, but my question still
stands:
Do we need to send fixes for already merged changes as new e-mail
threads (replace In-reply-to: with maybe just a link to ML archive
in the commit message)?

Regards,

> > On Fri, Dec 1, 2017 at 11:02 PM, Patchwork <
> > patchwork@patchwork.openembedded.org> wrote: =20
> >=20
> > > =3D=3D Series Details =3D=3D
> > >
> > > Series: initramfs-framework installation improvements (rev4)
> > > Revision: 4
> > > URL   : https://patchwork.openembedded.org/series/9783/
> > > State : failure
> > >
> > > =3D=3D Summary =3D=3D
> > >
> > >
> > > Thank you for submitting this patch series to OpenEmbedded Core. This=
 is
> > > an automated response. Several tests have been executed on the propos=
ed
> > > series by patchtest resulting in the following failures:
> > >
> > >
> > >
> > > * Issue             Series does not apply on top of target branch
> > > [test_series_merge_on_head]
> > >   Suggested fix    Rebase your series on top of targeted branch
> > >   Targeted branch  master (currently at addf309165)
> > >
> > >
> > >
> > > If you believe any of these test results are incorrect, please reply =
to the
> > > mailing list (openembedded-core@lists.openembedded.org) raising your
> > > concerns.
> > > Otherwise we would appreciate you correcting the issues and submittin=
g a
> > > new
> > > version of the patchset if applicable. Please ensure you add/incremen=
t the
> > > version number when sending the new version (i.e. [PATCH] -> [PATCH v=
2] ->
> > > [PATCH v3] -> ...).
> > >
> > > ---
> > > Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Messag=
e_
> > > Guidelines
> > > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > >
> > > =20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWiWvWQAKCRA3VSO3ZXaA
HH1IAJ93P7PTeIIp9NO5lp/2cL4Xs2jhQQCfUdxSuh/mbWx2WVUBuRyqhe101o0=
=YrKg
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
