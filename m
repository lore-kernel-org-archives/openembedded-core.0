Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 80D0C70034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 16:08:55 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l132so276901891wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2016 09:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=BJclNQarh9TQ6M3tEGYWYVSp1WzixoTmhGh6tF58ETg=;
	b=OaufQGHsufOoLKrror46w/q1NXRyTwGw4J9gZ43hu7v1tktAdSCsQXE976rhTPuS+H
	x9O6cEUHYH1N6sOy/kC2Kqyt8aiqIuUoPcZJCD6BNczXHxtEYhrnBzNyBGYkDRjO/HUU
	rpqJTaVtvggUfwf9A6zjAvvgQ/YbKKLfxzV4Z69CkqsDTFQkAY7wTn4rMcw9i5RKiDJ+
	HUsEYqtzT/IwOf5cJ5p5ERMdfJoITC2MTxzu9AeN4G2RCBRym+b4zOAL0JACPiafRjEp
	6uThDQThJbgYxA/vNHxSbPQaI5nzjMHPRskZUH5C42Q0x6HR4qc69GSMXX2ZsDMgmb67
	RV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=BJclNQarh9TQ6M3tEGYWYVSp1WzixoTmhGh6tF58ETg=;
	b=ExV6dNFEp7YcI3NWc819U5EdbE1B8R4t2yKjCQ8xFuNNUoFxdQ2ojJygBGMpSk7EXY
	h6U/3Dmr1V64RITIq8BvenCEmhABXqLS/ZjTBqYgNUbmno/c8yEcYyT8e2K+OiiYR83/
	f4X7WJ3/nN3C0vR6XHlt+Osd5Qgpsma8Lped/66QyUXTbB6YkFBmpM9rrRWIJXzLSeS1
	yxD+5WZ//6+ON5sME49+0YsIfDwEZAMsWi6pK7pITdoRHezAMpgMEs4+dC4vnZmft+w5
	jOw9uuV0QuLHVNKbP4AqsBbXRHDb5B7QjLThVSa69uK5xaoIpfdXTiEakXTqrstSKbuT
	f3sA==
X-Gm-Message-State: AE9vXwN7tDXyujZc58MZ76DzGw3DtbStqFTCmQCEnRDIZT5NC8tNKAehp28ELFttc1QcXQ==
X-Received: by 10.28.140.5 with SMTP id o5mr4209146wmd.13.1474474136209;
	Wed, 21 Sep 2016 09:08:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	r2sm26614670wmf.14.2016.09.21.09.08.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Sep 2016 09:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Sep 2016 18:08:54 +0200
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20160921160854.GB2633@jama>
References: <1474472342.16834.96.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1474472342.16834.96.camel@intel.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: rm_work + pybootchart enhancements
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
X-List-Received-Date: Wed, 21 Sep 2016 16:08:56 -0000
X-Groupsio-MsgNum: 87367
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p4qYPpj5QlsIQJ0K"
Content-Disposition: inline

--p4qYPpj5QlsIQJ0K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 21, 2016 at 05:39:02PM +0200, Patrick Ohly wrote:
> Hello!
>=20
> rm_work.bbclass currently isn't good enough for use in really tightly
> constrained environments. For example, building core-image-sato with
> 20GB of free disk space should work (final disk usage with rm_work
> active: <13GB). But in practice, that disk space gets exhausted in the
> middle of a build because do_rm_work doesn't run often and/or soon
> enough.

I agree that it could use some improvements, but I'm using simple work
around for this - building whole image in couple steps which forces
rm_work being executed often enough to fit WORKDIR in e.g. 14G tmpfs

something like:
bitbake gcc && bitbake console-image && bitbake webkit && bitbake bigger-im=
age

> Test script attached. I only ran this once, so I can't vouch that the
> numbers are stable. I remember reading about a benchmark wrapper which
> can run such a test script multiple times and then will automatically
> merge the output of all runs together, adding min/max/average/deviation,
> but couldn't find the tool again. Does anyone know which tool does that?

it's in oe-core:
=2E/scripts/contrib/bb-perf/bb-matrix-plot.sh
=2E/scripts/contrib/bb-perf/bb-matrix.sh

=2E..

--p4qYPpj5QlsIQJ0K
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlfisJUACgkQN1Ujt2V2gBxTzQCgk3BXbFtPWQGuv+Znt/lc72Tu
NmUAoILTEiLV+P04Pq+YFM6ashYQa2Sg
=q1OT
-----END PGP SIGNATURE-----

--p4qYPpj5QlsIQJ0K--
