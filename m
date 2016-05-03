Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id 77B477016E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:45:17 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id o66so36705216ywc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 11:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jlmMY4hcPpbq3ziE7h8ppLQZg9TfrBvjjoJmHhNMNTo=;
	b=QTML2lTCJnD8nLahbvIHovvnKOPNc9cwcTYEmqxGPyS6iMyLhon8OMDLQQM37LLo1b
	gUcPLLOR9OE7AULZkDiF9N5TZ4LKztPx0WcyTAZdGO29DXa70A9lTgcsyzXmH/F8rm8B
	DGynylkksFCKCA+/rLLOzdVc52/hCjJDEZARg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jlmMY4hcPpbq3ziE7h8ppLQZg9TfrBvjjoJmHhNMNTo=;
	b=AY6qObv15FGqbWvakGz/Aod7jDfvk+J2Pm9GDDxudHVWpKUJqh23xB6HZoQyqlI9iO
	dcKOoPHFZh6y5xDjQJqFeRj2CF3WhR36Arpy1fNLM2YdusafLBrpnCJtSjX6n0VJOHWA
	Lk/giVl2+/mv01ZJlwaPGuLegVOTaReGSNPErl6byITArZ3fd4DXUxkNcZreX+ShOxai
	zc9fmcETV80zM7ljhkiYp8CGQRUJZBSjxQDyiVFbSvlE3SYxQcTlseBZAi2Oz08HD8sh
	ccm3eomVSScSKN/d/5vlE2dkRqv19WZX1SVRhQ30oDIX4aL3Thol3U1QQMZGLtrVpO5b
	+9bw==
X-Gm-Message-State: AOPr4FU993I5OSSWQgFW+u3rrLYxMlmpKXBX7GtpMqlQPgss/W3OTZUT9SVNrhxm0fk9tA==
X-Received: by 10.129.166.201 with SMTP id d192mr2293015ywh.49.1462301118020; 
	Tue, 03 May 2016 11:45:18 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:ece4:7ac5:f5a:2015])
	by smtp.gmail.com with ESMTPSA id
	i196sm338439ywg.33.2016.05.03.11.45.16
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 03 May 2016 11:45:17 -0700 (PDT)
Date: Tue, 3 May 2016 14:45:21 -0400
From: Tom Rini <trini@konsulko.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160503184521.GA7884@bill-the-cat>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 18:45:20 -0000
X-Groupsio-MsgNum: 81529
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lFRK9w0o3gensELN"
Content-Disposition: inline

--lFRK9w0o3gensELN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 03, 2016 at 02:27:38PM -0400, Robert P. J. Day wrote:
> On Tue, 3 May 2016, Bruce Ashfield wrote:
>=20
> > On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca=
> wrote:
> >
> >       =A0 oddly, in the current YP kernel dev manual, i don't see the
> >       phrase "is not set" explained anywhere in the entire doc,
> >       which is weird since it seems like it would be important.
> >
> > The manuals don't cover the mechanics of how the mainline kernel is
> > configured. Just the same way the don't cover the configuration
> > language for any number of packages in the system.
>=20
>   assuming i'm understanding your position, that's where i'm going to
> *strongly* disagree. people who work with the mainline kernel in a
> non-OE environment don't use kernel config fragment files. period.
> AFAIK (and correct me if i'm wrong), .cfg kernel config fragment files
> are exclusively an OE/YP thing, so there is no reason for normal
> kernel developers to understand how they work.

Or maybe to be more clear, does the manual spell out that these .cfg
files are Kconfig fragments and follow the normal syntax rules Kconfig
uses?  If not, it really should.  If so, maybe it should also contain a
reference to the external authority on this syntax?

--=20
Tom

--lFRK9w0o3gensELN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXKPHBAAoJEIf59jXTHXZSGX8QAJpU6UinOOZ5rYHpXwgzrj0L
KRmBmWb37ol+nZdJS0fA+1jpDkJb8tH2CmstLEte0si90H6Di6m6VMTXzOj/AMte
7YkfipWiUNQ37YyuhFWBSkbq8cFQ4YMHDFILIW78m10bTiLuRhpgSMnv7Z/Dr+Yz
n514ynOigce5VLqP9pZHntxviCX0jxMdLxydEsEm2kdi9ptDVo7BGICbBPGyIjnU
rll62ZxMX/YXg5EvHhW2ufrBU4V1jO1u/5Z5qq9eIDn2QMSugwG1gb3oFXA5hJzh
1hDmkuOAiddSU6WhRIgDyNuNYyH/lmNUCe8S5mdAwLMTLvw9cFyaJpTHg19wQVf9
yP28vljGOqvTk7aOq0BvvxiBKK9p50bg5amxzjMDd2p+VTXYFfJj3xZPbYegDRUG
ZJY/CSg9YjiSy62Anuu9zwcWKqMZ8PPdDa+pgM6M65FOCG6X1ZLegqsMDB1l7O/1
4mt/U83NiMKEg0IosmxXc66eSbnXIA9lnF9kJMY97qsExLZRPk+6Ue7QpUaFzGwG
sHAwEO8L7J4S9GsAdr0DGjyoaD47LwPquQVsqnJN5uusNSHYqwXBVoXl6vfLimTt
tB/O085QDFAIpGZMi7QiiV0G1i2MqN2FfKoNS/d4KY3ZCE1dP4iY0RtslgVWpyV5
+qBhDW60e47ClkKNLoP/
=x1EQ
-----END PGP SIGNATURE-----

--lFRK9w0o3gensELN--
