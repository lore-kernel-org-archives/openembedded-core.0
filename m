Return-Path: <freesilicon@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3E576AC00
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 11:37:56 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so4360358wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2017 03:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gt46EgeHAbm46dHnQ8jR/As0eC1T74tJ6HZDOBdjCjI=;
	b=rcd2SLnC9or/ljLfiA9VSqoYXB2ktgQ+5g1iNXxOMulrekcVvXHNfUNQUk5fTi4QgM
	gLPyNdSym1VKCr3VXK4NHzktuJqDQBBWZ0SlM8ZUe0nmal3zge/KBIrUbIORu+Uyovng
	l0qBaS3SIbP8nyf9AQc4OeBCXbKgYTccbfyrOeFR/s4Wqp+KBHCTHnJaD81cW7SZmHLI
	OPo+s8WBBvkzEjY+ry11XiXGNTS6sbR+zNlIEZRHbrOnFuiSCQSOfsZusKwDldLNWhoV
	5aOtjHLmf2EQAyT+jA3sCSfFj0v6JeygfVuDS9SizPLSpZn6gldmYozsl2jCoMstYI8B
	tSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gt46EgeHAbm46dHnQ8jR/As0eC1T74tJ6HZDOBdjCjI=;
	b=U0aUFQWDxgsw4cuuw4YkDlB6bIuvp5yRWVD5/7lRhtKsdL1jzSk282f983WRY/qpno
	WPfHoAQ6OhxZpz/sjSRAjJxbsZu5aF47sHNUYtlKPEVsx1W5K2JcWcv4QaMr+0hJ3cHA
	RP3fe/ts9YpgwmQgyUC2q2b4kL5kiOmREwqYwdLCd4JVwJUCy6nH05+rS5B7/u74CLR7
	3J3xiqb55K0D7w0rjHFeSROtvscbnGo/rXy+8/0X1oIitgSxpBt9izmT52OsUVwyjkgy
	LiEfUjiqBxxgFeGrKDe6TXitMlhp/Dt7+FJJB6OcBGAv3T2Tar4+mBDpN4t7ggzAn23R
	q/OQ==
X-Gm-Message-State: AIkVDXLb8dXjUKmhJ0qM7wqTVdsYO6yesUU5ehVg3NrxIrgmEEXa1tzQOYaJyV7xy/GVhw==
X-Received: by 10.28.18.194 with SMTP id 185mr3117923wms.124.1483702676203;
	Fri, 06 Jan 2017 03:37:56 -0800 (PST)
Received: from crde-port-20.cahors.local ([185.47.80.46])
	by smtp.gmail.com with ESMTPSA id yy7sm3006344wjc.3.2017.01.06.03.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jan 2017 03:37:55 -0800 (PST)
From: David Vincent <freesilicon@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 06 Jan 2017 12:37:52 +0100
Message-ID: <1783266.JR8gGWXSdn@crde-port-20.cahors.local>
In-Reply-To: <5460018.mmGskV4KOr@crde-port-20.cahors.local>
References: <20161220095122.11831-1-freesilicon@gmail.com>
	<CAJTo0LY5hHkOfQuzSO-W6TjDFPXY5N=J0x5DKoCT1Rn2ZU+4TA@mail.gmail.com>
	<5460018.mmGskV4KOr@crde-port-20.cahors.local>
MIME-Version: 1.0
Cc: "Plascencia, Daniela" <daniela.plascencia@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] rootfs: Modify RPM installation
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
X-List-Received-Date: Fri, 06 Jan 2017 11:37:57 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On jeudi 22 d=C3=A9cembre 2016 15:45:34 CET David Vincent wrote:
> On jeudi 22 d=C3=A9cembre 2016 14:09:32 CET Burton, Ross wrote:
> > Small problem: we always build rpm-native as we need it for some tools,
> > but
> > rpmlibdir is only defined in package_rpm.bbclass which doesn't have to =
be
> > inherited.
>=20
> I didn't know that rpm-native was built in any case, rpm being selected as
> package manager or not.
>=20
> > This leads to just --with-path-database=3D being passed to configure.=20
> > What's
> > the behaviour of RPM when this happens? What does it default to?  If it=
's
> > going to be safe (ie a sane default is used), please update the commit
> > message to explain this.
>=20
> Indeed, this can lead to undefined behavior. I can propose some solutions
> but which one would you find better :
> 	- Setting a weak assignment for rpmlibdir inside rpm recipe
> 	- Setting a default assignment for rpmlibdir_class-native inside rpm=20
recipe
> - Another option I didn't think of

Any news on that ?

>=20
> > Ross
>=20

David

