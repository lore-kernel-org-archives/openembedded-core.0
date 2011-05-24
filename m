Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QOvXH-0005i5-LE
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 19:36:51 +0200
Received: by fxm19 with SMTP id 19so5489377fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KhEtnLjRf7WHSxIPf50W4ROR/sKFLIqR0JlcXxeJ92s=;
	b=DKy16KB2lSYj+pHgNDcB/NxbgdkOCYZPQkr9CXKrL7rAtpJpGEHBFM5iz2PyCf//2/
	5Iu84TjP95sgiVt1HtZjwg8qc8hGM8mIWNIV+UoY0RWhQDVQ8caLOzOfpIVg3SpkekGD
	edJIUDvONKfm6Nz/Y5IHeYg7F5+SUepdYzf+o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=c9UWl/yakAb2qLlw7gwhELcZWW6K2nLEnrcfTs9SBRggsOfLQ0H16EaBFiO3aK4Soc
	oePNDOZJb0SEvcU1qjZuocY3ERIoTlWYjyloz5WUvwR7zfdvy92PEIfa+qiIB9W5S2bv
	JkIQfrvlSglg8HTNoP+nKyRFU/8PdgsWl0J+U=
Received: by 10.223.6.9 with SMTP id 9mr3666637fax.68.1306258430068;
	Tue, 24 May 2011 10:33:50 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id e20sm2397786fai.11.2011.05.24.10.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 10:33:49 -0700 (PDT)
Date: Tue, 24 May 2011 19:33:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110524173347.GC3222@jama.jama.net>
References: <4DDBDE9D.5000709@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4DDBDE9D.5000709@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Tue, 24 May 2011 17:36:51 -0000
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ABTtc+pdwF7KHXCz"
Content-Disposition: inline

--ABTtc+pdwF7KHXCz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2011 at 09:36:45AM -0700, Darren Hart wrote:
> I've started pulling in the 15 or so patches to u-boot from meta-ti. In
> doing so I've come across some questions I'd like you thoughts on.
> Specifically, where to put these changes. Some points of context:
>=20
> 1) oe-core is intended to support emulated machines only
> 2) oe-core has a "virgin" u-boot recipe (no patches)
> 3) meta-yocto does not have a u-boot recipe (no bbappend either)
> 4) meta-ti has it's own u-boot recipe with per-machine patches
>=20
> A stated goal was to bring the Yocto Project's u-boot support for the
> Beagleboard in line with that in meta-ti. There are several ways I can
> go about this.
>=20
> a) create a bbappend in meta-yocto and duplicate the meta-ti
>    modifications in bbappend form.
> b) Modify the oe-core recipe directly

=46rom my understanding what BSP layers are for:
c) use meta-ti BSP in meta-yocto

and if something in meta-ti is not good enough for meta-yocto, then
alter it with .bbappend or work with meta-ti folks to improve it in
meta-ti directly.

> While a) is the most direct approach to accomplish our goal, it requires
> continual maintenance and duplicates effort. I don't care for this
> approach. b) has the potential to consolidate all beagleboard u-boot
> recipe work into a single place. It could simplify the meta-ti and
> eliminate the need for a bbappend in the meta-yocto layer.
>=20
> The question of whether bootloaders have a place in oe-core should
> probably be addressed. While they aren't needed for the emulated
> machines, they are a highly reusable component for real systems, and
> that seems justify keeping them in oe-core. Does anyone disagree with
> this assessment?
>=20
> I propose pulling the necessary changes to u-boot from meta-ti into
> oe-core. My initial scan suggested the beagleboard patches are mostly
> contained to beagle specific source files. I would prefer to pull in all
> the patches for all machines into the SRC_URI, rather than divide them
> up by machine. This reduces complexity considerably. For the couple of
> patches that collide, we would keep those as machine specific.
>=20
> As a final part of the work, I would include my beagleboard patch status
> audit in the included patches and continue to work on reducing the
> patches in the recipe for the beagleboard.
>=20
> Thoughts?
>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ABTtc+pdwF7KHXCz--
