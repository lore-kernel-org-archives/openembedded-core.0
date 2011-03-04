Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PvWU2-00071y-G2
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 15:59:58 +0100
Received: by fxm8 with SMTP id 8so2214886fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Mar 2011 06:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=EQtY2jhVONW7WNbACI9xMmszmC8mAYaZDTjRY3ttWGU=;
	b=chELtSlBbqtThf5kZ4ZMvaUOX2n1isW12MfIAbKH8OaUBE6AR9s5znwdSLJ/umlC3b
	Cqbq6/qdYlXSkCahtli5e4zxV6PFCZ459bZ2xW8ZeZLt53dliaGLD4l6dXcIw0vVFngQ
	GooKsBYrJlQrNNOxRfK42kGbevU0Yt5pqk7SU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=EKJpA08VcUv4mUiAmEi03IspaetR/ufewGSHUxYv1kyIDeRsla8SqripDtbskOo+uf
	w4KqitCsKzAereQEytSEoSigrCwjXVKQoGR79iyKC2KgxsV2911qS94b44bFWiFoxyhT
	uoSioej7kvlZFwFr/3Jydne331I3p5iTY2cO4=
Received: by 10.223.116.146 with SMTP id m18mr943142faq.9.1299250641231;
	Fri, 04 Mar 2011 06:57:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id e17sm386627fak.10.2011.03.04.06.57.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 06:57:20 -0800 (PST)
Date: Fri, 4 Mar 2011 15:57:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110304145713.GF3312@jama.jama.net>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
	<1299247286.17567.1349.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1299247286.17567.1349.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 14:59:58 -0000
X-Groupsio-MsgNum: 242
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vKFfOv5t3oGVpiF+"
Content-Disposition: inline

--vKFfOv5t3oGVpiF+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 04, 2011 at 02:01:26PM +0000, Richard Purdie wrote:
> On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
> > * sanity check warning user that he still has peristent cache in old lo=
cation
> > * similar patch was sent to OE, to keep PERSISTENT_DIR location consist=
ent
> >   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/03=
0623.html
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/sanity.bbclass |    8 ++++++++
> >  meta/conf/bitbake.conf      |    2 +-
> >  meta/conf/sanity.conf       |    1 +
> >  3 files changed, 10 insertions(+), 1 deletions(-)
>=20
> When I saw this on the OE list, I'd assumed you'd done what Poky had
> done, I've just realised you're moving this file to TOPDIR instead of
> TMPDIR.
>=20
> My big concern here is that we really shouldn't be writing to data to
> the conf directory as its not what the user expects.
>=20
> I say this knowing the raft of usability problems we've had every time
> we take something outside of TMPDIR as users have the expectation that
> deleting tmp wipes out all stored state and rebuilds. Having this file
> hidden in the conf directory breaks that expectation. Note there are
> only two things we place outside of TMPDIR, downloads and sstate data.
> Even things like buildstats which you might want to preserve over
> different builds are still inside TMPDIR.
>=20
> Can we put it in cache as a top level file rather than machine specific?

And one more question from #oe to this topic:
=2E/oe-2011-02-25:14:49 < JaMa> RP: I wonder if bb_codeparser.dat from
bitbake rev 4b7aab109f746ad9be2699c0fb6f4a4e65d65936 should be in shared
PERSISTENT_DIR or machine specific CACHE dir, what do you think?

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vKFfOv5t3oGVpiF+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1w/ckACgkQN1Ujt2V2gBzQhACfVHWdxobZjwIUDoBUM/cJQlmA
UfsAoK6h0uZyHkBqNe9JikP1XlTRM4rs
=I7Xk
-----END PGP SIGNATURE-----

--vKFfOv5t3oGVpiF+--
