Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 69A14771F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 17:49:38 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l4so1557372ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KNrIeQgN85yCF0ul+JXpRsFzRnnKiZrXWk1vEnjbRGE=;
	b=R+DkefROGsykvte5C87cMFT3zVcs3yluvuVyaq2xb36+XW4XRIrHUJo1ODOFqTXHqL
	L93F+VewLuQL+le10Kmkvrac9zl6Xi5teSMnvAdn1aWZ27L31KVGg/ffKaJebzq22Ml3
	SlHoUDUILQsn06glCxuRDgGY74DQ80rFeIiIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KNrIeQgN85yCF0ul+JXpRsFzRnnKiZrXWk1vEnjbRGE=;
	b=Gk5gYRyo6NbVuXtyDSUqkVsxNdrpgG/XXLMUtbtQC/DFyTUWWEs9ViuoGonyTbnrEz
	rC8FMD2LdC+Vh/QS40MSa+YIaXnz641lzA0KvxbSY9a56fHO9sHyPCRAeBSYmNM3x0xY
	VAF7E+ma+oU3BUicSkVLJ8finFbZWHHcIoUn6gtrBHMlfRjkQlppMyeQg2pCRjSVglJi
	65RXBY0fVot2WSqBhVWw9U0f1qILPGdf2zdJjSNK8iistZAMh1o5vHJajlnytk/+2yXf
	Fcdkdr6v0tElyslLYBR1r2XOtWG0R+krSgwYZ27A3ox4hF58xlG1Zg6NCuFUbZ+joyh3
	UF6A==
X-Gm-Message-State: AHPjjUiw0FTILsIVYQtwSDGLQiHHfan5ufws1XlKoH3wR4alYRTYppwG
	M8D4GslMWyR9ZvMPvYhQ+Epozw==
X-Google-Smtp-Source: AOwi7QCDQLEbRx0VactDS7UDPPH3PnINqLeEk9pr/OTyP/ZCuhDXldAPyXHIysFnJOgfHclXQi0vDQ==
X-Received: by 10.129.121.143 with SMTP id u137mr4243807ywc.158.1506620979366; 
	Thu, 28 Sep 2017 10:49:39 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:706c:f3a8:eab4:3cc8])
	by smtp.gmail.com with ESMTPSA id
	j144sm796153ywb.43.2017.09.28.10.49.38
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Sep 2017 10:49:38 -0700 (PDT)
Date: Thu, 28 Sep 2017 13:49:42 -0400
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20170928174942.GP3112@bill-the-cat>
References: <1505923407-31734-1-git-send-email-trini@konsulko.com>
	<20170928154707.362zfbhccbydkdox@linux.intel.com>
	<20170928174429.GO3112@bill-the-cat>
	<CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrACBBvDGYSMUW1mv=UxMUUOnwK9k5g7d6rEL=Mdm3wuw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] wic: Generate startup.nsh for EFI cases if none found
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
X-List-Received-Date: Thu, 28 Sep 2017 17:49:38 -0000
X-Groupsio-MsgNum: 103472
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="flDc4cbvG5Y7qIjC"
Content-Disposition: inline

--flDc4cbvG5Y7qIjC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 02:46:23PM -0300, Otavio Salvador wrote:
> Hello Tom,
>=20
> On Thu, Sep 28, 2017 at 2:44 PM, Tom Rini <trini@konsulko.com> wrote:
> > On Thu, Sep 28, 2017 at 06:47:07PM +0300, Ed Bartosh wrote:
> >> On Wed, Sep 20, 2017 at 12:03:27PM -0400, Tom Rini wrote:
> >> > In the case of non-wic images there is logic today to generate a
> >> > startup.nsh file that will be executed by EFI to run the loader that=
 the
> >> > image contains.  In the WIC case is currently depends on that file b=
eing
> >> > generated elsewhere and placed in DEPLOY_DIR_IMAGE and only used if
> >> > present there.
> >>
> >> What's wrong with this approach?
> >
> > No one ever provides a startup.nsh and everyone that wants one creates
> > the same one line trivial example.  The end result is that no WIC images
> > are Just Bootable on UEFI systems unless you first go and spell that out
> > as the desired booting device.  This isn't an awesome workflow which is
> > why the non-WIC cases make the required startup.nsh :)
>=20
> I think it could be done as we did for u-boot-extlinux support.

That's complete overkill for a static one line file.

--=20
Tom

--flDc4cbvG5Y7qIjC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZzTY1AAoJEIf59jXTHXZS/sIP/js1DVvYP454mGsdyPFuxlak
qQmos4D4VHonBcnfYurzUENAN84F+oZGZB/0qW3d/cZlGSHEh7CQiBwEIuLO43eK
aQnaO0sYQb1d8eXR4EqLT08YaMxiKTFweRa2bC+A/gYjr+gDtHkFiQIcvQVk+5WN
cDi+siBKrt6bjXpECjRMh3YhXwE2UGvViHoze8CDpGW4get/3xpae/n34F53pGjU
y/eRDzDZKu8uypoqlH3IQna8ZiIwhM+kehsKYk3FJYtZYGkeyj74vvoz+7hoHhRq
+LoKvouY9KHG8jxYuThLflCAGVa5nvsgjmccYrh1wTyWNImEX7XK56N8uljm/MW6
cX15It/fhN6kYUSmZK1O6jTZCiGIqS/kAkzrMYHkFXj6x3Exvt+Qz5d51Jta/jrI
bvVmC0Uw8fFujMiNRHNp9VPoELO9rXXREaIyvDsSdeCx13iHMYPlQ0LpExA5C/1k
+2S2MbP+jfOcSIXQJIcL6pj5pSq/TxwKJI7YVOXfzFH/u0bYBdT9+rVALTyS65+b
1MqUL1/Zrl1NZBq3S+irpPvamliIeYO9ICI+YHtZCh2lrDBmYQuFOZX9m5GgP9dj
mX3dPc7/F7PQhpYVYxsoCZifrPTug/F2mG4kjtAaJX8CJridSZJTYXaGy9mxG82v
TXXH3D/toM82tUjRYVqr
=zqch
-----END PGP SIGNATURE-----

--flDc4cbvG5Y7qIjC--
