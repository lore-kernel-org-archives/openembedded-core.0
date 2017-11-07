Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id F2DB271B99
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 14:55:54 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id i196so3089599ywc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 06:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xbUfXfeuqa0nwDTtwuqoK1bvJP4+F9/Ch96w50bAXQY=;
	b=mPLY0GGkMmD4/5KHsudEtgI+6yzlyl190To/2aivAoo9enjoFChxizO8fM729mbphU
	GyrZxraZwzeIInMFONhwKAKQ9ZTLAGmpFfI4MT/+JARAdAuj9fyHt+evqfedWL8AYD6b
	HbToWWKjwWyjKzYaun5/9Y9dk1Txf2FIVoNX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xbUfXfeuqa0nwDTtwuqoK1bvJP4+F9/Ch96w50bAXQY=;
	b=HP0NgbTj9oAY/oC27l/WyZ7GU7moXnRCzvDsuOZNDa04d+qFXwTXkAhhqAKBxA9gN0
	ctYuRT7ctIaEXoaQd6PcXvGWCwdvM7xN4iJ8pZrVWkSTjLNIQ1UxRv768ubltO3DEFI2
	V6SHlfYg+P3sHC+ipyPRlO5arOr8Eaumwc7L5IkVAAlRCFV+nyDE0jXHHRshDgbmkvVf
	JpQ3S38obUWfesgPfZkkZ4uwVdfUQh8rDE5o74dsie1tueossnXh/3zF26nUTqr9jZpl
	m+tlV0MjQIHjJqaZfOMslCTKSPt3lYL+BGcfpjHvY71So6cYqroZ4i7ENhkseAcc2mjt
	DffQ==
X-Gm-Message-State: AJaThX7uSrMQdgK0T+2mifNIqoI+hK/AGi8mvGXxwECU5rb/oARatFwB
	erMmz5LtGmyUqta9fw4evICrJ63Sse8=
X-Google-Smtp-Source: ABhQp+TqePUjnfYgbeXvIKUw5QQBFv05ti0K+hkb9ZHid9BrOG2zjMHPZHo4nKL2L4NPps7bXuUZdA==
X-Received: by 10.37.55.214 with SMTP id e205mr885233yba.177.1510066555874;
	Tue, 07 Nov 2017 06:55:55 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	y11sm718935ywc.70.2017.11.07.06.55.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 06:55:55 -0800 (PST)
Date: Tue, 7 Nov 2017 09:55:53 -0500
From: Tom Rini <trini@konsulko.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Message-ID: <20171107145553.GK32663@bill-the-cat>
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<20171106124417.GF32663@bill-the-cat>
	<20171107082725.lzsbsnqrypbm525v@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171107082725.lzsbsnqrypbm525v@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Tue, 07 Nov 2017 14:55:55 -0000
X-Groupsio-MsgNum: 104619
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WVhxcSV8VTJlfoH7"
Content-Disposition: inline

--WVhxcSV8VTJlfoH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2017 at 10:27:25AM +0200, Ed Bartosh wrote:
> On Mon, Nov 06, 2017 at 07:44:17AM -0500, Tom Rini wrote:
> > > Can you rebase your patchset on top of current master?
> >=20
> > Yes, OK.
> >=20
> > > It would be also nice to get this functionality covered by tests.
> >=20
> > OK, but what part of oe-selftest, and how exactly?  Can one easily check
> > the resulting fstab?
>=20
> Sorry for not mentioning it. You can look at wic oe-selftest test cases
> in meta/lib/oeqa/selftest/cases/wic.py
>=20
> To check image fstab you can boot image in qemu (see test cases
> starting with 'test_qemu' for the reference). This way you can also
> check if partition uids match fstab entries.
>=20
> P.S. Another idea is to extending 'wic cp' or implement 'wic cat'. All
> ingredients are already in the wic code, so it shouldn't be too hard.

OK, I'll see what I can figure out here, thanks!

--=20
Tom

--WVhxcSV8VTJlfoH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaAcl5AAoJEIf59jXTHXZS5/gP/jn6CwpVm04VBkRMO3JseVQX
J64jzc5UnK5xmTiAL2iZp1I/esBHaRU8ub0NXLMF9en6OpDF3Op9ZLvDrrOhy+U0
Q+Ip7ck+WprsUffILy7bSCULKwFT4b2gViAxlM2PqnjpEG8a3hQqLcJWjbNvYrnP
303zgtXhQ1LxCXvYirzMZLJlevWyu93luHk7b4TNndOuVSH/Olrel57Cvl1E6NBC
hjWxgmhHKupRwNzzuBPCdgX5ZeUjiIwyndDIv0MBu83swMI+HSgb4/cwr57YwG0k
5N/O62lGQofSijMN+aP20KvJy37zq0VMQhflc1+TAGn3g21IDOzo+JVacpvkGYv3
urXXmqass5Rj6E7V1+Wxsmz+YIvMv4FNKZ4YaoPj8Z6KzYdeu1NRuZJylY/STQoH
DoqrJxfyj6iuk/5Wh+xiN5cT+aDN49tACYPGS/a97DvZeuTkZysd5h68j6lKg8Rn
VSGu+B+N5t3IMw58VTnUy2VfsVExpXKiYmziyGjd1ijtaAA/YIKqzu+s+JaPtPlw
ktovuOba3q0R9WUJYxhibZ3aOCgijCcjVdQh4LxSM/ugRCctNkSbJG6l7hS/RSdT
8dewnWm6SDSgIZzU15Ej++SZApxzNHa2s5qTiTQ81NqvLkUsOW/JXtIGpjxSH5Ew
okTIc2cHQ1r7vE8cKC1k
=Qz1N
-----END PGP SIGNATURE-----

--WVhxcSV8VTJlfoH7--
