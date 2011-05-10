Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QJtWO-0002pc-U0
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 22:27:14 +0200
Received: by fxm19 with SMTP id 19so5165439fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 13:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PisdvmbNVkmfDh++0bQ8NG2cphxmcv5M63+epw3eNME=;
	b=JTvAV1Tk8NC+YHDZhbNm0t4MtJSQYRmfJzzt77oDofpRHsT11aBVst/oVeA8jlpYEO
	894O3jBGRGXP62muFCxRgc48oiln5dnYMZGSdP/vNsi0LVY/md2fBO3uk6w8lrZp3WES
	iRJWT31u3M7wVBfJbUmo3PbT3x7oTkfbgdSp0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GglxM1DUKN99hyqJGdQdpjiAnOpFBDqBX263853MhrispzulnaC9CVuzPZBMGJXTkW
	sHMkB0sGD5LW8x5QWB79Cbjdz1+mtI6fv1/qpi/2pDvLXk5CbVp7CAunU0GpxXlkM1oc
	bKpOZnCQgCj70H9K7ifDq9ZhSUcxEw26FuovM=
Received: by 10.223.64.80 with SMTP id d16mr351162fai.88.1305059059431;
	Tue, 10 May 2011 13:24:19 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 5sm1123795faz.0.2011.05.10.13.24.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2011 13:24:18 -0700 (PDT)
Date: Tue, 10 May 2011 22:24:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110510202417.GB5171@jama.jama.net>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
	<20110510181314.GF3673@jama.jama.net> <4DC98507.6070103@mentor.com>
	<1305054238.30391.283.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305054238.30391.283.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 20:27:18 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NkBOFFp2J2Af1nK"
Content-Disposition: inline

--/NkBOFFp2J2Af1nK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 08:03:57PM +0100, Richard Purdie wrote:
> Martin/Tom: Serious question - why not use the contrib repo for this?

I have nothing against contrib repo and I'm using oe-core-contrib for
oe-core stuff, but I had gitorious repos for meta-oe before
meta-oe-contrib was created and now I didn't feel the need to change it
and update my modified meta-oe-create-pull-request header :) but I will
if you or koen find it better to pull from *-contrib (I'm pushing shr
branch there already anyways).

> I have nightmares about all the development being spread to all the
> corners of the globe and people not being able to see what is being
> worked on. For short lived branches its not so much of a problem but as
> we take on longer lived feature development it will be a problem. I'd
> therefore like to understand why the dislike of it...
>=20
> Cheers,

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--/NkBOFFp2J2Af1nK--
