Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R28Ls-0005Bw-J1
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 23:11:08 +0200
Received: by wwe32 with SMTP id 32so1274625wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Sep 2011 14:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=S6YxdLyBHRCgWZRPdxvPBNrQGnfmqDx1mZMn1EEx+gs=;
	b=mIVRZq8L/wEojHY2VMGVbFeNMwOA18KOPgrHqL4TFZvvQKBDMcVVF8mqh75aWbyJS9
	D4pxFdNPZz+hB0sh13r/P+5v1R1kv5JVjSMIaSOUpaTICwRieIommx0QP/7yBwXfIhNL
	154zAp+hLYk181C3VuJe0tabxwpHr9LFtpebo=
Received: by 10.216.132.129 with SMTP id o1mr501190wei.3.1315602363535; Fri,
	09 Sep 2011 14:06:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.93.70 with HTTP; Fri, 9 Sep 2011 14:05:43 -0700 (PDT)
In-Reply-To: <1315602089-4068-1-git-send-email-kergoth@gmail.com>
References: <1315602089-4068-1-git-send-email-kergoth@gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 9 Sep 2011 14:05:43 -0700
Message-ID: <CABcZAN==dnWd9nQdsGmXx0yk7ObjTGADH2EjhqaZxq33DS_aTQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tinylogin: use the upstream git repository
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Sep 2011 21:11:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 9, 2011 at 2:01 PM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> -SRC_URI =3D "http://www.angstrom-distribution.org/unstable/sources/tinyl=
ogin-${PV}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 file://cvs-20040608.patch \
> +SRCREV =3D "cb1af5efe2c07b0e0bae5ddd700c1df2fcd470e9"
> +SRC_URI =3D "git://busybox.net/tinylogin.git \

I should have described the purpose in the commit, but this is so we
are going from an upstream location, rather than using the angstrom
source mirror as upstream, which seemed not ideal :)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


