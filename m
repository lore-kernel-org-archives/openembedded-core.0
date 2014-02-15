Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC336EF94
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 23:51:33 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so27482861ykq.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 15:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nJtMHLO8JF6y3mhmQsLNUsmmgRKMewcXbqGIpNF8/38=;
	b=F3AR2iLjlkuSRezReg7T1jl19BlsQ2Cz2yy6k1WgwfA7MQ0YEZYNCRqT5igl3g4+Kg
	6K7mYLVFdAdbL9SUQDM5p01IWMqhRNsm5uR3HfRLtzZNjBujkhB6iM4eSpSy2f3YTGTH
	TSDWIWD9Ef3xnYKh/LXfkHiAJWRgEcy78a8MsIuBsJ33FVf26LHnpHa+Z2DSH9TAY4pO
	Dbrsh8t+NC7XG+ZSEOo3kVYKkdy3MmKr050BdGr5w78Vgcx0tMrV/DTnDvicZkm+qKO0
	GEPlOUkGpVT2CtOSBKoo0V4kOupKXLZPI+kCkRg+FkUcNTMlsW0kwlagauE95cS/u/BU
	mvGA==
X-Received: by 10.236.68.37 with SMTP id k25mr555908yhd.130.1392508293604;
	Sat, 15 Feb 2014 15:51:33 -0800 (PST)
Received: from joaohf-desktop ([201.53.197.242])
	by mx.google.com with ESMTPSA id
	a67sm32638646yhj.10.2014.02.15.15.51.32 for <multiple recipients>
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Sat, 15 Feb 2014 15:51:33 -0800 (PST)
Date: Sat, 15 Feb 2014 21:51:28 -0200
From: =?UTF-8?B?Sm/Do28=?= Henrique Ferreira de Freitas <joaohf@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Message-ID: <20140215215128.5be9fa1d@joaohf-desktop>
In-Reply-To: <CF2152C5.6CB8D%dvhart@linux.intel.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
	<CF2152C5.6CB8D%dvhart@linux.intel.com>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.20; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Sat, 15 Feb 2014 23:51:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable


Hi Darren,

> $ bitbake linux-yocto -c diffconfig
>=20
> I like the latter because it is consistent in naming, <action>config,
> with menuconfig.
>=20

Ok.

> >+    try:
> >+        md5newconfig =3D bb.utils.md5_file(configorig)
> >+        md5config =3D bb.utils.md5_file(config)
> >+        isdiff =3D md5newconfig !=3D md5config
> >+    except OSError:
>=20
> We should be doing something to indicate failure here.

Ok.=20

>=20
> >+
> >+        statement =3D 'diff -Nurp ' + configorig + ' ' + config + '|
> >sed -n "s/^\+//p" >' + fragment
> >+        subprocess.call(statement, shell=3DTrue)
> >+
> >+        shutil.copy(configorig, config)
>=20
> We should be printing something to make it easy for the user to find
> the fragment.

I've suppose that the bb.note did it. But  the messages doesn't appear
on console. Only in the log.do_diffconfig log file.

What is the trick here? Should I use bb.warn() or logger.info() ?

Thanks.

--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

