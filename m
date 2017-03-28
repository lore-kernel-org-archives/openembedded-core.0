Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f171.google.com (mail-ot0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id 857D277A8F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 20:52:14 +0000 (UTC)
Received: by mail-ot0-f171.google.com with SMTP id y88so60534998ota.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/9L6YTYl5DqXcjVpm71bkrkdeOlpAkzC+RHn5h06b6M=;
	b=p1ZuraBFKCyhKODIqXcSDJ7SR8Obj7A4+TTGs5goFJNiMiSXJRTTg1ntyioEPpf3aA
	2DsA0DQXYQ6sI+GbzttB9Z8DSYdx0ajhU/wIaRADicZhgdp46Zi6odkAbrkHj5JB4mXb
	ylyq+puMuNE+2MoS/uC7/ZNGWTTBynKe2g2Vp864XEzb4WLUlhKmFOd8Kkug2I6AZu7B
	FYPE04lz/dImz9GMpVbHnqxpjf8BySuBJjTJ6Nwx+GCvLFkypqnl5IDMrlIGZ+8lovjh
	QUa1ezX377tCJmBm+aNQJjw9sZ4pJKBlE+PvjueDLarKJp9Wo1LzDnp3ePbsO5+mh6QL
	/XwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/9L6YTYl5DqXcjVpm71bkrkdeOlpAkzC+RHn5h06b6M=;
	b=T7cJETIsktBbtLLAQ9aANUQWqeQmQHOq84s7xljVn/7/5chyYH7SnfgDOZmXea9J+g
	dkWMSvaGNf9x8CIGp6Q/4yEzzS0uPIr28QPFjK1B0S9dMnYAZPwLSQjLIT0AOuxQZpI8
	YhZSsz4xfZz+8+I89Heglab0ycSn81rabKPqrrVVHuHeI+9z6CyBA++qOqi54+MQWqeP
	zhaMfEDi3UxP56VjFT9xrd7E8777B7alvMUn5JqnhU8E/7Ney0Al0tcl/IYf/FQn0yFQ
	2cswsUEcL1uhCxN/imgUytB5W1zcooN2Nl7ngtSwvjUFW2G4WA0eOuZUXmhNOVOgLute
	dNrw==
X-Gm-Message-State: AFeK/H2ECixbCk6jVxEf/5YCVTi3cELddd9L3pX5G8mtEbITUvjlyOsCIpw+wDB3as+CXQ==
X-Received: by 10.157.19.114 with SMTP id q47mr2421887otq.77.1490734335751;
	Tue, 28 Mar 2017 13:52:15 -0700 (PDT)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com.
	[209.85.218.41]) by smtp.gmail.com with ESMTPSA id
	k37sm2224854otd.14.2017.03.28.13.52.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Mar 2017 13:52:14 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f41.google.com with SMTP id o67so35790444oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 13:52:14 -0700 (PDT)
X-Received: by 10.202.105.16 with SMTP id e16mr8978754oic.178.1490734333647;
	Tue, 28 Mar 2017 13:52:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.79.203 with HTTP; Tue, 28 Mar 2017 13:52:13 -0700 (PDT)
In-Reply-To: <CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
References: <e1eee1aa56e1dc59a55a9cac25a00a1ea2f9375e.1490727568.git.spopovyc@cisco.com>
	<CABcZAN=pYQH82T4Gxi9VneWQtRQYZyeu+Wrr+4V7iWeXW+_RvA@mail.gmail.com>
Date: Tue, 28 Mar 2017 17:52:13 -0300
X-Gmail-Original-Message-ID: <CAP9ODKriYpw7vBBokSQFQSHWnTttYm5n4sKyaFxJeDLPV_DJjQ@mail.gmail.com>
Message-ID: <CAP9ODKriYpw7vBBokSQFQSHWnTttYm5n4sKyaFxJeDLPV_DJjQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] ca-certificates: Fix symlinks to the certificates in nativesdk
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
X-List-Received-Date: Tue, 28 Mar 2017 20:52:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 28, 2017 at 5:12 PM, Christopher Larson <kergoth@gmail.com> wro=
te:
> We actually run a script against the entire sdk sysroot to convert all
> absolute links to relative (see `POPULATE_SDK_POST_TARGET_COMMAND +=3D
> =E2=80=9Crootfs_sysroot_relativelinks;` in image.bbclass and
> rootfs_sysroot_relativelinks in rootfs-postcommands.bbclass), but this
> script had a bug. I recently sent a patch (this morning) to it to fix thi=
s
> exact issue. Of course, it wouldn=E2=80=99t hurt to also change the behav=
ior in the
> recipe, but it=E2=80=99s not necessary with the script fixed.

I prefer to keep it in a single place instead of multiple recipe doing the =
same.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

