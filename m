Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8343A6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 17:22:32 +0000 (UTC)
Received: by wgiu9 with SMTP id u9so27737525wgi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 10:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=OnoSIb1g0Y2bOLZN3TwxJPl9tB/GwX5Qf9FtHQ/W9cU=;
	b=kbKIN2s+tzFx2Gf7QeTcmPV4UuRC4eFz4vap3HtdCWg8LrFCHB/fKGQUJ0/9LVIJCQ
	uN2a3S8vtUuREROhJAJnSAy7AmjSzzmLi3L6xe6NFSjHeQXYX+xt5q3CHAoxa6ZuMw3c
	9l2aCdWZoCQTjohs9AkDFPQJ2KILKrkyiEIUkR7g0f4bGsUQ7+vSilPbWjxVrLt525zK
	3+T/wWXEdT69canzRDXMgzmoyutMfAopnyx4It8uDASEk5NozEw3q8fW5OphMlJU5Nif
	J2yr6XaMvo1EvI7VPY2VVhQayzJIn/W/vIwaDtwhFy1J2ESnsLSKrwhuaQw3o8juptdq
	2Izg==
X-Received: by 10.180.81.104 with SMTP id z8mr6034379wix.5.1430846553685;
	Tue, 05 May 2015 10:22:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	xb3sm26532805wjc.38.2015.05.05.10.22.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 10:22:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 May 2015 19:22:37 +0200
To: Andrea Di Chiara <andrea.dichiara79@gmail.com>
Message-ID: <20150505172237.GF2378@jama>
References: <5548F63F.6090800@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5548F63F.6090800@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: upstart init manager
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
X-List-Received-Date: Tue, 05 May 2015 17:22:35 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2015 at 06:56:31PM +0200, Andrea Di Chiara wrote:
> Hi,
> I'm building my own distribution using Yocto Project and I'm trying to=20
> setup Upstart as init manager. In my local.conf I have added these lines:
>=20
> DISTRO_FEATURES_append =3D =E2=80=9C upstart=E2=80=9D
> VIRTUAL-RUNTIME_init_manager =3D =E2=80=9Cupstart=E2=80=9D
>=20
> but no recipe seems to exist. Am I wrong? I have searched through=20
> openembedded layers but I found only a recipe for WebOS distribution. Is=
=20
> it possible to use it with Yocto Dora or Yocto Daisy? There is another=20
> recipe?

meta-webos is compatible only with Dylan release, but you should be able
to copy upstart + libnih from there to your layer and use them.

You can also check couple bbappends in meta-webos which add upstart init
scripts to various components (to replace sysvinit scripts).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

