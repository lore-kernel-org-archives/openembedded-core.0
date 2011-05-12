Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1QKcfK-00047z-LH; Thu, 12 May 2011 22:39:22 +0200
Received: by fxm19 with SMTP id 19so1520208fxm.6
	for <multiple recipients>; Thu, 12 May 2011 13:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Wzlzj8Gq6H2se4l1hEl0hd3wzThwc3BzvNjv8eJm9dQ=;
	b=xDQlScW46Vmugt/6zlalmrkOtE6dzZb1T/nGwrryBS3SXQoGBDmiyJ3fw2zs+aPF/q
	up5ERDTO3SMhzikMu8hRZctIDf69owGC8DWx69Go2EjEy2fxTwj0P3GwvlebsMM+qCPn
	eyQcKoUK+UcCRWTDwsCwqhnpUr/x3icT2jwPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=fXS4XLRDmtyc82DHW+Uipfs8cDOciQxp1DIsMnT+HtyITTy2+9K7bFh3kwpJGaJXLr
	nZq/waVYDUJsEwXRGu1RJ7F2JK+V4hH31K/fqZLhKKj0MKwkw9k+7PMtN9EH1Md+bpWt
	r+T4zL5CD9C0nlzWq0LMElAHQG2XIect3KyFA=
Received: by 10.223.20.210 with SMTP id g18mr820243fab.30.1305232594416;
	Thu, 12 May 2011 13:36:34 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id c3sm601205fav.27.2011.05.12.13.36.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2011 13:36:33 -0700 (PDT)
Date: Thu, 12 May 2011 22:36:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110512203626.GB3162@jama.jama.net>
References: <1305013151-17485-1-git-send-email-Martin.Jansa@gmail.com>
	<1305019695.8000.132.camel@phil-desktop>
	<20110510093616.GB3673@jama.jama.net>
	<20110512163919.GD21678@denix.org>
	<20110512182158.GA3162@jama.jama.net>
	<20110512203236.GE21678@denix.org>
MIME-Version: 1.0
In-Reply-To: <20110512203236.GE21678@denix.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH 1/2] recipes: fix LICENSE fields
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
X-List-Received-Date: Thu, 12 May 2011 20:39:22 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2011 at 04:32:36PM -0400, Denys Dmytriyenko wrote:
> Yes, I'm quite aware of Yocto/oe-core handling of licenses and checksum=
=20
> verification mechanism for them, but unfortunately we don't have that in=
=20
> mainline classic OE... We could try backporting it from oe-core to classi=
c OE=20
> or just wait until with switch to oe-core completely. In that case I'd su=
ggest=20
> avoid mangling license fields just to satisfy broken distribute_sources...

OK, those & were breaking my image build because I have
distribute_sources enabled.. but next time I won't push anything
changing LICENSE fields to oe.dev..

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--St7VIuEGZ6dlpu13--
