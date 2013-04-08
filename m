Received: from mail-da0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPFCY-0000G7-0n
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 18:45:52 +0200
Received: by mail-da0-f50.google.com with SMTP id t1so2694834dae.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 09:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=OqJ2wp3b2BYwMPMSP/V6Bd2k9UZP5TYl0RMoIXEwN6E=;
	b=r2aUUZsV+EYCjl45xA8gBrKWhYal+XoDuy7o4XrPNqBqRdoYhMOBSap625hVFsC0+6
	hBLEyTeLN6JP69r2gc3Xj/pghgjX/AWa9kj7VLfUTu4/lyfD1etV7Z73HrHCJOWttpgR
	seRI95qQsd/bE4spcLuiJFjNSz1gcnOrc8yZzw7BeD60gE3VaKirzQ67qImHVDWFL6tF
	7vbd3zeLfdiiqgSVdB+o+NpafgsZRhEZLWv4SpuaHehjlkc44zpL+FLMewDjjYTA0UtP
	AsPNMqwmMjFzw3SHfYiQMf86TGA7mYBgJYJFRO4ow5LyaYsEzb7fIzhTWLdQ3Kr8oORh
	e5cg==
X-Received: by 10.66.48.201 with SMTP id o9mr3265966pan.196.1365438508691;
	Mon, 08 Apr 2013 09:28:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id t1sm40933510pab.12.2013.04.08.09.28.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 09:28:27 -0700 (PDT)
Date: Mon, 8 Apr 2013 18:28:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20130408162817.GB2470@jama>
References: <1365433601-24194-1-git-send-email-laurentiu.palcu@intel.com>
	<1365433601-24194-3-git-send-email-laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1365433601-24194-3-git-send-email-laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] gtk-update-icon-cache-native: create wrapper script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 16:45:53 -0000
X-Groupsio-MsgNum: 37576
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IrhDeMKUP4DT/M7F"
Content-Disposition: inline

--IrhDeMKUP4DT/M7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2013 at 06:06:41PM +0300, Laurentiu Palcu wrote:
> When using the sstate from another build machine, the path to the pixbuf
> loader's cache points to a path on the remote machine. Hence, the update
> of the icon cache fails on host.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |    4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.b=
b b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> index 93c30a7..73b7644 100644
> --- a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> @@ -40,4 +40,8 @@ do_compile() {
>  do_install() {
>  	install -d ${D}${bindir}
>          install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}

^ can you fix indentation in this line, when you're changing this file?

Thanks

JaMa (who proposed to use consistent white-space for shell/python tasks
long time ago)

> +
> +	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
> +		GDK_PIXBUF_MODULE_FILE=3D${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.=
0/loaders.cache
> +
>  }
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IrhDeMKUP4DT/M7F
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFi8CEACgkQN1Ujt2V2gBzIoACfeT8lKo+2dADd6OxOGRa2AlOp
3VkAn2xseL9TNpt8SkVVPjxGgDIQGaXB
=x7bu
-----END PGP SIGNATURE-----

--IrhDeMKUP4DT/M7F--
