Return-Path: <raj.khem@gmail.com>
X-Greylist: delayed 2666 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 May 2014 16:59:04 UTC
Received: from mail-ie0-f174.google.com (unknown [209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7F33E6028A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 16:59:04 +0000 (UTC)
Received: by mail-ie0-f174.google.com with SMTP id at1so1901489iec.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=ZgzU59VrUsxTfK2slLhXE4qcXTNBJjLVMlOlATWDGIY=;
	b=XU203TN830ZuN0Yv/1OB9zkrSBU7VQET3zDrlG1LCGJaiJTOjNb0hDMwXCJYXKx7uS
	GHiJ9PMzKZa8xUCxvtrHRSlCPoEusWdfsZIwegHslxAA7y7h5K5aWONhDU1q8OdJNjK7
	T7mRS9VVIlUi4wbPncaqSXpJZMUQurrfFQyifNaIcyf6Q0rWJyyKPHgTd+QKe4VpkCDu
	tIWZnSN7bDoUW1pc/fc815LDYtfXnleshdKBQpG9Rny1J8iOV6KxzOWox/UPs6ISqmp5
	OcMAFC0/eLGXv/ws99nlOIx2TGLpn+iVr+YNQBDNbsVtxkCwJzejyXM9+npMK7JXQb2g
	qSLA==
X-Received: by 10.50.20.8 with SMTP id j8mr7468759ige.17.1399741145874; Sat,
	10 May 2014 09:59:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sat, 10 May 2014 09:58:35 -0700 (PDT)
In-Reply-To: <a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
References: <cover.1399671290.git.petter@technux.se>
	<a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2014 09:58:35 -0700
Message-ID: <CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>
To: =?UTF-8?Q?Petter_Mab=C3=A4cker?= <petter@technux.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Sat, 10 May 2014 16:59:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, May 10, 2014 at 1:05 AM, Petter Mab=C3=A4cker <petter@technux.se> w=
rote:
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/systemtap:"

would something like

FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemtap:"

avoid the prepend and immediate evaluation

