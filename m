Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QILXQ-0000hi-Ap
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 15:57:48 +0200
Received: by fxm19 with SMTP id 19so2660590fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 06:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=4+TuNbmtGclolpX++RHpL7TcZAdSPno9b9j5op7BGTk=;
	b=JEF0gZibCd/x6yH9ssx4QPJDSFHqJkPxHm+zzSufX9ROniKE3YKRBTCNIjVgWX1fyz
	1iE2OWiCYygRLMCUF9i57OqK79NCIPMM4gNS5pWUg9jKSWceYD1ACX+XyVDOtRM1ktxQ
	zoc+Yg8HrVAykx+wp8YORK6DP3cgSFP8nMlbk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Mg79TQAQUFMaIvBFIs1ccLZANZDs5l1AyFC6NLw17IGJngG39iX2NbU17KS0kyrfis
	1V/NAzUYptZmOul3oiQwMI6X2FRR/ex916TOtt3vic7M3FQD9B2gX2NMD4QVd4mAQgoF
	lOfcFn6wLsz07nv57th5WTbuFTdLZr57NCr+M=
Received: by 10.223.24.213 with SMTP id w21mr405055fab.113.1304690106415;
	Fri, 06 May 2011 06:55:06 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id o17sm1098406fal.1.2011.05.06.06.55.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 06:55:05 -0700 (PDT)
Date: Fri, 6 May 2011 15:54:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110506135458.GA17773@jama.jama.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<BANLkTimvbbU4yx_aWhaKp0DvYgV1mH-9pg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTimvbbU4yx_aWhaKp0DvYgV1mH-9pg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Fri, 06 May 2011 13:57:48 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline

--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2011 at 06:51:58AM -0700, Chris Larson wrote:
> On Fri, May 6, 2011 at 6:39 AM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
> > And related to this: how do I get the "installed but not packaged" outp=
ut back? The bitbake logging changes are hiding it now, which is counterpro=
ductive.
>=20
> Could change those messages from info to warnings, then they'd show up.

Agreed, please change it. I'm using -v since those were not shown, but -v=
=20
brings much more noise then I need.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PNTmBPCT7hxwcZjr--
