Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QQ4Mr-0007OH-W7
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 23:14:50 +0200
Received: by fxm19 with SMTP id 19so1862587fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 14:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=bOP+9epY6oSEJvhbMqtf9MN7q+k0lpX+8Kf1/rFFEsM=;
	b=MuJWuSjV5D2LkC5BhK2nlNAPyh4dvPji77TeZBgGET9nCuYDqWQ6b0xmuHt3pwi5hf
	UcDviD5uuNVRMv/HvV9qMykYLJ+UqYT+LxEM2Vcm4FNt+RcqMhOgfyFXtmVmd8O/7M/r
	z0yd0fflkVKAwd4tzQPvVYBuSyrLeqZI/sk2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=kTEWK62V+r+6n/fuJQMy8pHscFZflxCXhstTPjaVGGJlaRE9m2HmxGAuePYhEuQDUj
	1zcCP9GJEirWf1+3zVHNjdrZmglGDx696Hn6f7qeuT4MEt/g9+LGGMBvZfJAsBNpP9V+
	bHgvc3tvevDjOHCOx7ttPXmlKscP7OUHA0Vtk=
Received: by 10.223.9.137 with SMTP id l9mr2839837fal.25.1306530695783;
	Fri, 27 May 2011 14:11:35 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id g7sm804312fac.39.2011.05.27.14.11.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 14:11:34 -0700 (PDT)
Date: Fri, 27 May 2011 23:11:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110527211128.GQ3222@jama.jama.net>
References: <20110526220829.GO3222@jama.jama.net>
	<1306451615.27470.212.camel@rex>
	<20110527053946.GP3222@jama.jama.net>
	<1306517084.27470.298.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1306517084.27470.298.camel@rex>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Sad story about Shared State
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
X-List-Received-Date: Fri, 27 May 2011 21:14:50 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cYG5ZC/RuVsIq1ir"
Content-Disposition: inline

--cYG5ZC/RuVsIq1ir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 27, 2011 at 06:24:44PM +0100, Richard Purdie wrote:
> I dug into this with Martin on irc and it was found that rm_work.bbclass
> was exposing a bitbake bug with setscene handling. This was fixed with:
>=20
> http://git.openembedded.net/cgit.cgi/bitbake/commit/?id=3D0a4d857aabc86b9=
73170ba9ce32b6b449a4e2165
>=20
> and I think Martin is finding things work better now! :)

Yes, this evening is much happier (no story, sorry :)) and my box=20
is getting colder and colder :)

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cYG5ZC/RuVsIq1ir--
