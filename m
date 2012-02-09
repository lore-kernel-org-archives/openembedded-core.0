Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvbX3-0002wo-AL
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Feb 2012 22:27:57 +0100
Received: by lahc1 with SMTP id c1so1952812lah.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2012 13:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=KVOpO/iRSD7We/9eotXoyvLkDZP6xmtBLxGwfp8vqzQ=;
	b=VPEyQGiGWxR4iwfHteexj68cPe+m4bYgSpeVoBII35B33gzCPY3IRbXhW/80dI6VEA
	ADWWSuet9hvyUeCiYIA0/RA21k63lIstHx0IEGKWegbNDIhWJ8qh4RRbkhgyYqqL8qKK
	ztVdAmrIjV/1dNyvZ6Rvfo6AnrBgNZI8u0KCY=
Received: by 10.112.28.169 with SMTP id c9mr1166275lbh.42.1328822392278; Thu,
	09 Feb 2012 13:19:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Thu, 9 Feb 2012 13:19:22 -0800 (PST)
In-Reply-To: <6dd3f664169b2ffd249da4e86f5f16b8c4316c99.1328809777.git.paul.eggleton@linux.intel.com>
References: <cover.1328809777.git.paul.eggleton@linux.intel.com>
	<6dd3f664169b2ffd249da4e86f5f16b8c4316c99.1328809777.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 Feb 2012 13:19:22 -0800
Message-ID: <CAMKF1spuyaA4ZJTe1pH8qyRA0nXQfJ67hAKjs5daf_Lmxy=8Tg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Thu, 09 Feb 2012 21:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 9, 2012 at 9:57 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> +Fix the following error during compiling with gcc 4.6:
> +
> +./wtf/NullPtr.h:48:1: error: identifier 'nullptr' will become a keyword =
in C++0x [-Werror=3Dc++0x-compat]
> +
> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +
> +Upstream-Status: Pending
> +
> +--- qt-everywhere-opensource-src-4.8.0.orig/src/3rdparty/webkit/Source/W=
ebKit.pri
> ++++ qt-everywhere-opensource-src-4.8.0/src/3rdparty/webkit/Source/WebKit=
.pri
> +@@ -102,8 +102,6 @@ CONFIG -=3D warn_on
> +
> + # Treat warnings as errors on x86/Linux/GCC
> + linux-g++* {
> +- =C2=A0 =C2=A0isEqual(QT_ARCH,x86_64)|isEqual(QT_ARCH,i386): QMAKE_CXXF=
LAGS +=3D -Werror
> +-

since there is a namespace conflict that should be fixed IMO removing
Wrror is not quite the right
thing to do here IMO. Its a workaround but probably upstream wont
accept it. So change
nullptr here to something like qt_nullptr in source tree


