Return-Path: <trini@konsulko.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0BB7CD49
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 12:36:27 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id j89so567255edb.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 04:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=90cckOCNvmQ4ZMQHcb2q0qXxrNpiilQhnz34ZWmYsHU=;
	b=RVpXVO9nW3kpl0lMioYiDgFZE+o5P6NnPjr5KynuuK6ugHaFBb5iYi9zUl1otxurPH
	iBHdo/eMa7PRgYGIE4deYFNnE9FrjrmTxYcoP5CmOunRRfQYKml0nGkJhe3l+JX+NYRl
	eBTmJXPQjAZtAm3jg5s601uy+DV7J3MK3CLAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=90cckOCNvmQ4ZMQHcb2q0qXxrNpiilQhnz34ZWmYsHU=;
	b=m0o5OBlsWuu1+JOf2sOEmKY1PuPx2EnNq0JPrY5G8pUcG+zhhtF0cB+lvbOuygOQj8
	9hvXkeLszbhlSOlhn5L7b2ire+ZZRNJe+9cR5EP8ME6+o33fq82P9N1tMNn7BzftUS4A
	osiBmcy0igdzjaBbCxBs9DiDS3+LutqDMi/LnHqv4VAgJjao+8CvcZq2buXwCT4C7dWw
	4sPxiHadLJTTTSWd0B3ykRPwPiC+YaeCJyCdA9FdFAC4IKA/TUBO1P15H1pvyAC58GXO
	pNXUuRAzgpmDx61GrGbZRlzViIW5WXy4JlbIrbVd/c/kICdi1PpGWf+TImBzsICZ8KWY
	gICg==
X-Gm-Message-State: APjAAAU2UkEb1Jazz9Fsc28ml9sK2NdtzqRSYkjrZ2/aoK3ztNhJVpt2
	pnvFB0SYkgb2/mGtDPqOn/rX6jxJgCs=
X-Google-Smtp-Source: APXvYqxITzq+eTo+07JkIy6T8jhAfSeoMdBxtrazHwxDTH0ocZ21Nhu0h22gXJjVF4fCuxCQEVYM9A==
X-Received: by 2002:a50:b8e2:: with SMTP id l89mr8256507ede.140.1551530187916; 
	Sat, 02 Mar 2019 04:36:27 -0800 (PST)
Received: from bill-the-cat
	(cpe-2606-A000-1401-880D-118E-86C-E9FB-6784.dyn6.twc.com.
	[2606:a000:1401:880d:118e:86c:e9fb:6784])
	by smtp.gmail.com with ESMTPSA id x18sm319334edd.4.2019.03.02.04.36.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 04:36:26 -0800 (PST)
Date: Sat, 2 Mar 2019 07:36:22 -0500
From: Tom Rini <trini@konsulko.com>
To: Adrian Bunk <bunk@stusta.de>
Message-ID: <20190302123622.GD5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<20190302071140.GA2151@localhost>
MIME-Version: 1.0
In-Reply-To: <20190302071140.GA2151@localhost>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Introduce packagegroup-core-base-utils
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
X-List-Received-Date: Sat, 02 Mar 2019 12:36:27 -0000
X-Groupsio-MsgNum: 121825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="g7w8+K/95kPelPD2"
Content-Disposition: inline

--g7w8+K/95kPelPD2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 02, 2019 at 09:11:40AM +0200, Adrian Bunk wrote:
> On Fri, Mar 01, 2019 at 05:26:48PM -0500, Tom Rini wrote:
> >...
> > - busybox provides "nslookup" which at this point in time is an
> >   anachronism. bind stopped shipping "nslookup" prior to oe-core replac=
ing
> >   the old monolithic layer.  We do provide host and dig and such via
> >   bind-utils.
> >...
>=20
> I'd say this is a bug in bind-utils.
>=20
> nslookup was was at some point deprecated by bind upstream,
> but it was undeprecated 15 years ago.

Interesting, OK.  It looks like Fedora puts this into bind-utils (which
is a lot of tools) and Ubuntu/Debian into dnsutils (which is nslookup,
nsupdate and dig).  I'll put it into our bind-utils.  Thanks!

--=20
Tom

--g7w8+K/95kPelPD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJcenjGAAoJEIf59jXTHXZSqlsP/0th7xKdotGR2JH7BmVHJrck
wDjPp1cyXg8tjB/Fd21uPNIKME8xCe1mFDuCwWoPDfGzfDwI6FENv07fLMcQJdGu
jJyNJbgEZMmruMGO/qkI8KY+Y7OS1aC9HeBbCgZxuBfIxk/tggtqGgMQlOTvcNff
rmPaXk5TVbIpy78pSkvSZD+K27UNtFXYzyxIO3bTXfaK1wvSBXGGaIJLLgZp3xlC
8OuDvodcglCJQrgHTVO1v6vqo7Y1LxGPoQljivSTS3dAAnPSUiZJuxMJh4vvEyDq
9V5gkXN3CzMVe840Zolu1gC3l/lkmIqkIOLrGxU7PN+dnh/KHHERxe1l+AHOYi+r
KRdaJGK8SVYhTpdDXxrCIdHu4L0I81ywaio14HcQAn7YkKCBAWOy1P6BaFUwVy2U
QAY2XsBu49lsd8raBdhfu7JkXdF7Xd4TelIETWIwLoP3/OkMUMFMupYIcGfyFzp2
d5Ne1/ZMFdEfwjVQZPCZKuw/bd/CxJe7DGWrnw9auEgD+9u85ZDsJ/WMeOzGABB6
Ep0fy0jdsEps4fXJsPWgBUBh3UVlxXFkGYpTfntaMJZSWiraHZl9sQMviKMQ2mQG
zCxcqC56gBH1ZwS4coetosUN7ARXZwf0TlQEaFusGa1p+IQsQgRC467CklAJS2Wh
eJl1om5GIearclA9p5Xu
=0qvi
-----END PGP SIGNATURE-----

--g7w8+K/95kPelPD2--
