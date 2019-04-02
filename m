Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id C1B1F7C124
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 19:47:42 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id d26so12739308ede.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 12:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wnMlLiYzhrO/v6s1Kd5DBEd9sOGJdbdpUwwQup8/45c=;
	b=giL4tD+yM6scRN3upFTOGwxFKju8+L6cc3eBcVJ8Z8MbuO5YuznFECXcaTsWtSgFNr
	fk9sYrDfu020Ipnc+HZEHodnH/cBMLmX7R1Nq/ysQ1RMUgBJzhih68fKbE7t17Hs4Hms
	PEq23LCFgViH6LkPvcqsB8W7Wuqgere5vaNvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wnMlLiYzhrO/v6s1Kd5DBEd9sOGJdbdpUwwQup8/45c=;
	b=a48Xf3rr8tDw5wxILixQ/CAbEUWX5ASnUgzIHThAYEgkfiG2x9qOAxE6pWFe7ghJ6W
	lTmGyu+LT82qkfVEw/7gnVYL2yL3rIp7mqQ384/FzZMDkn44QDdBV4J+ZaVVXj5Z16Hm
	u4Uqk8A9OOh6NzimxvsPT6MiXUT8JfZe0EmxBS8mPDAKg6ZI3qoKHpcS8jLT6kKIrIXz
	b2x6Kb8ka8vEJc5wFk/fyCnFX8gJ7jHViqpmoDTHNRw4BrcT5Z7kGVWb50gteyebvO/Y
	+5lI348lJgNbS9SBqNxG1C2JggOC0I5Jyeb6yuA4OsC7jME/adPwRJQxsw06+6+C5rmO
	pidg==
X-Gm-Message-State: APjAAAUnqeE6RJtbqSYIdBJzn8748XN6DlneI9pPp9+SIiA9Js4MwI03
	cn4u+lHfPuJ6okgi4h22EF758Q==
X-Google-Smtp-Source: APXvYqzQsbDBOdnGYZIsFGfvTqlwupZgV4IxD05aZGG+2t/VqBKzFdqlPd8upmrtHn/9UtqypeP+wg==
X-Received: by 2002:a17:906:46d1:: with SMTP id
	k17mr40325140ejs.104.1554234463427; 
	Tue, 02 Apr 2019 12:47:43 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-134-105.ec.res.rr.com.
	[65.184.134.105]) by smtp.gmail.com with ESMTPSA id
	u18sm2635770eja.25.2019.04.02.12.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 12:47:42 -0700 (PDT)
Date: Tue, 2 Apr 2019 15:47:38 -0400
From: Tom Rini <trini@konsulko.com>
To: Jon Mason <jdmason@kudzu.us>
Message-ID: <20190402194738.GZ4664@bill-the-cat>
References: <854544cb-aab1-1a9d-9e98-0f39663ca621@gmail.com>
	<b08083fc2f63f6324a652706f8343a0b8defe209.camel@linuxfoundation.org>
	<a1416fe3-04fb-1d37-eaef-05b9a838254e@gmail.com>
	<6068e963-94c1-7225-2c60-9ae027c74639@windriver.com>
	<CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPoiz9yat-4XRgSFikh5PxrsgVpRAWNi2dx1O0+_iHyVR529Ag@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Git commit process question.
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
X-List-Received-Date: Tue, 02 Apr 2019 19:47:43 -0000
X-Groupsio-MsgNum: 122955
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ix2jQZQ3wXOip0b1"
Content-Disposition: inline

--Ix2jQZQ3wXOip0b1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 02, 2019 at 04:45:16AM +0000, Jon Mason wrote:
> On Tue, Apr 2, 2019 at 6:41 AM Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> >
> > On 4/1/19 6:20 PM, akuster808 wrote:
> > >
> > >
> > > On 4/1/19 4:02 PM, Richard Purdie wrote:
> > >> On Mon, 2019-04-01 at 15:33 -0700, akuster808 wrote:
> > >>> Hello,
> > >>>
> > >>> I have noticed a large number of git commits with no header
> > >>> information being accepted.
> > >> Can you be more specific about what "no header information" means? Y=
ou
> > >> mean a shortlog and no full log message?
> > > Commits with just a "subject" and signoff. No additional information
> >
> > If you can convey the reason for the change in just the subject, that is
> > acceptable.. but there is -always- supposed to be a signed-off-by line =
according
> > to our guidelines.
> >
> > So if you see this, I think we need to step back and figure out where a=
nd why
> > it's happening and get it resolved in the future.
> >
> > (Places I've seen in the past were one-off mistakes and clearly that --=
 so it
> > wasn't anything that we needed to work on a correction.)
> >
> > --Mark
> >
> > > We tend to reference back to how the kernel does things.
> > >
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > > These two sections in particular.
> > >
> > >
> > >     2) Describe your changes
> > >
> > > Describe your problem. Whether your patch is a one-line bug fix or 50=
00 lines of
> > > a new feature, there must be an underlying problem that motivated you=
 to do this
> > > work. Convince the reviewer that there is a problem worth fixing and =
that it
> > > makes sense for them to read past the first paragraph.
> > >
> > >
> > > along with this section.
> > >
> > >
> > >     14) The canonical patch format
> > >
> > > This section describes how the patch itself should be formatted. Note=
 that, if
> > > you have your patches stored in a |git| repository, proper patch form=
atting can
> > > be had with |git format-patch|. The tools cannot create the necessary=
 text,
> > > though, so read the instructions below anyway.
> > >
> > > The canonical patch subject line is:
> > >
> > > Subject: [PATCH 001/123] subsystem: summary phrase
> > >
> > > The canonical patch message body contains the following:
> > >
> > >       * A |from| line specifying the patch author, followed by an emp=
ty line
> > >         (only needed if the person sending the patch is not the autho=
r).
> > >       * The body of the explanation, line wrapped at 75 columns, whic=
h will be
> > >         copied to the permanent changelog to describe this patch.
> > >       * An empty line.
> > >       * The |Signed-off-by:| lines, described above, which will also =
go in the
> > >         changelog.
> > >       * A marker line containing simply |---|.
> > >       * Any additional comments not suitable for the changelog.
> > >       * The actual patch (|diff| output).
> > >
> > >
> > >     - Armin
>=20
> There are existing git hooks that can be used to detect and fail to
> merge patches like this.  For Linux, I have the following in
> .git/hooks/pre-commit
> #!/bin/sh
> exec git diff --cached | scripts/checkpatch.pl -

FWIW, over in U-Boot land I do:
=2E/scripts/checkpatch.pl -q --git origin/master..
as part of checking things prior to pushing to master.

--=20
Tom

--Ix2jQZQ3wXOip0b1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJco7xaAAoJEIf59jXTHXZSnlgP/1bjf/CVvYtJxrwbFO39SHFG
ojcNfiofqDLXn2mc18B/FpII3qoFcy8T3UyNmLnOPW2mo6L9pEs8R7i0Dd+y111x
oceNiMVQWximgGrVarOKE0hCa0Ub7lNmpNXyKWkvLnC/3MQWZ6JbAzIkIsBZ3+v5
zJyvuTZh44N5WccsSCLM8GebI5RDN2RlZNgnSNyTTfwdk++dBlTulTdpkbVLwxkU
U9NOx2d+3sukMAVXPF8s3FdclwdezBhkOMHqmrMpoEdeMGytX2Yu1Y012vQq/kaJ
MY7a0Zy0CltBe6B67M5CB/kDpRdq1rGmcT79Fj93VsTH/S9ri8oh6Di4NIpH3Hfw
Ny2l1CoMsapbJNWgNUrU7Z6j+1V4k9GBHowF0B5SrXysJo07Eey8LkFRZCFMD1RZ
bOOxxFKCYjtaotkQxDhgv1oov0PqGt7lN5QTw7YX9nONfynoc0AvGj4YoFKh2Zeb
hhoiAkDfXfaUsrEwZmBm9euc540867r7CfjJOS0PLX6pLSO3uSrCVPFUThFtxhmT
QnRdZPLCFhJ03IAV0VQCi0o6X7q9JxKt0/eAC1/BtEEw9uZ1kn1ufsHnfPYOA/Jr
mp6rDnIIMou5At7BOLAo1HbuTdRw2YmH8Uz5tTpRhqjOwhk+mWQ/oHFfs1KlvlX9
PQaV5w9JCJ1sicwIP88I
=R9vR
-----END PGP SIGNATURE-----

--Ix2jQZQ3wXOip0b1--
