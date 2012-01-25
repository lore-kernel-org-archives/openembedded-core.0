Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqCp1-0004gt-Fn
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 01:04:11 +0100
Received: by lags15 with SMTP id s15so3151lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 15:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=OtJYNcX46mh+drmT2nYK/PrFM1QI4ahJK+S8smTKfhI=;
	b=OonlkPZCuDV2i7m9DbmsZODkCXNpV8BDY1MUL8MKh9zjARld8p3Z2ulKjqn7tyEExJ
	LZ1hs/UJhQYQMja3eWVLtsxWYIMd4Zr19pIHc+hrgYEQG6rM7EKE28QFuNTW8eHSdsxe
	zrUrCsHLSXHfd7++ltKsVaCm46fIhKlQRohS0=
Received: by 10.112.101.34 with SMTP id fd2mr4844758lbb.16.1327535784298; Wed,
	25 Jan 2012 15:56:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 15:55:53 -0800 (PST)
In-Reply-To: <f00a625276ad52a6a80e9b23e4cefa382c83f306.1327532550.git.josh@linux.intel.com>
References: <cover.1327532550.git.josh@linux.intel.com>
	<f00a625276ad52a6a80e9b23e4cefa382c83f306.1327532550.git.josh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 15:55:53 -0800
Message-ID: <CAMKF1sropDJF5Su71dHZ=NGsQMOmcU=iXezwXYuJA=NX_6=c1g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Thu, 26 Jan 2012 00:04:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 3:05 PM, Joshua Lock <josh@linux.intel.com> wrote:
> -PERFDEPENDS_libc-uclibc =3D ""
> =C2=A0PERFRDEPENDS =3D "python perl elfutils"
> -PERFRDEPENDS_libc-uclibc =3D ""

now how will PERFDEPENDS be cleared for uclibc ?


