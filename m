Return-Path: <andani.prashant@gmail.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id CFCBF6069C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 12:25:09 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id z134so9188755lff.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2017 04:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=8xMAXP4aE9B5ExHGcG4e4FMxvoGQpivC5wPiprv54oM=;
	b=VtJXRtP7jxkj4aklvdBUUzSj08Ac6Zq06WLl7cdnrm88PzjtXhqNpNOgPG8Us5wBOg
	srX4ZlI1FF6XkPQHLILBzgjJf+aunygvzYy+wrga06kHKzOhH5xZ5G/ihJMObCjXd3PG
	i8i1YVfQujS0461yLiCNPv0pS26d/cJkQmOPXz7rAcEqNB9S5xPf+oDOHjRZXi+SMicC
	+PQ8UrJ/DHoLSbEtBgbP5s/rb4vv7RCJzx9y3MHM3tpmbhETiPoE56o7ILic2iztejV9
	M/u22gBoySwmSGBqHxl5aaKjhKCRiKkAapTgzN2mAs39L+bVl1NTZnRgHB8D7V5/C5A1
	B6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=8xMAXP4aE9B5ExHGcG4e4FMxvoGQpivC5wPiprv54oM=;
	b=NSdwr5SWsfUl6VI9f00yXgc1TMpM8eP8ccvxH2VxHLfxIIDxhglaQ7ZdVF9OvrTIlA
	Qb6LniiEplbBndvin3j8NtNaUazMJYzTy1VOxorK52U4MSS84aJ411WPLWlyBFU+UPrk
	99JORSM1UYkeonGa8pI8aXs+2gnv6MiEwekswvEaoV6lc+QIqWONlDxvpEoFtfCvwKOx
	lmlFI2brzJ3fBW+DA4g2AuUtDoGwkoG+Q1BEuZkXBQAwgOFoukdi3t9rGF4unHT16AE9
	6SAClYrhW+CfoVHzS3GA0/xIhfi0tb+lIeVCWeL44orWbQfWSZ6c6YvPcpm/ETQtZMdF
	UpSQ==
X-Gm-Message-State: AIkVDXIXtS+QxvIYp3/ppuQIddSfgYvojo34EpV8U7J1F/26lFNWo2QGszMpX0xwQVr7bXVIXAwwJATckfzVYw==
X-Received: by 10.25.79.71 with SMTP id a7mr5361326lfk.67.1486124708902; Fri,
	03 Feb 2017 04:25:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.156.140 with HTTP; Fri, 3 Feb 2017 04:25:08 -0800 (PST)
From: ANDANI PRASHANT <andani.prashant@gmail.com>
Date: Fri, 3 Feb 2017 17:55:08 +0530
Message-ID: <CAACupd1+PapV978TASu3kvsUYxrShh5hXnjM_r0f-hr5TtEhQw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Want to strip rootfs
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
X-List-Received-Date: Fri, 03 Feb 2017 12:25:10 -0000
Content-Type: multipart/alternative; boundary=94eb2c1cd7a25dc1f405479f5f5e

--94eb2c1cd7a25dc1f405479f5f5e
Content-Type: text/plain; charset=UTF-8

Hi,

I build rootfs which size is 100MB+
As i look in to filesystem, there are 14mb libc-2.23.so, 12mb
libstdc++.so.6.0.22,..etc.
Is there any flag or option during build to strip all library and binary to
optimise size of rootfs.

Regards,
Prashant

--94eb2c1cd7a25dc1f405479f5f5e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I build rootfs which size is 100MB+=
</div><div>As i look in to filesystem, there are 14mb <a href=3D"http://lib=
c-2.23.so">libc-2.23.so</a>, 12mb libstdc++.so.6.0.22,..etc.</div><div>Is t=
here any flag or option during build to strip all library and binary to opt=
imise size of rootfs.</div><div><br></div><div>Regards,</div><div>Prashant<=
/div></div>

--94eb2c1cd7a25dc1f405479f5f5e--
