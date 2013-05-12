Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UbZQi-00042h-LB
	for openembedded-core@lists.openembedded.org;
	Sun, 12 May 2013 18:47:28 +0200
Received: by mail-pa0-f45.google.com with SMTP id lj1so4032559pab.18
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2013 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=90WmyDYtXopPIhXppri7n1odbneQ5v15Pgod0K/wk5U=;
	b=qdh4f+nptmiB9mo+9uaq1ICRW7KrdVrnCBxnFRbu9P4h2dLteohZwPoE9yr9mkov1J
	TpisyH8+l9dMhhOUBr99Yl9ct4eDSNrjcD8Y9C+IEPHBcrtk/zAdOpkXQVHDxROqT5AC
	WcM7b0hzpXe80f7DRqGnnoAV0YTUwxzLmZBxBSYjMMeSz70/lErjl0p8QYidWm9dOmIT
	IpS8QT4/uY4lfbU122CC/Lw7IyLhMhYjsuhYPbPrmTjKNj6K6w78n+laOV0fwHpPLuTa
	Hz3QEnYtD69bWeqwSsd2DmnWoeUEPkq3hk67WyZgfyFiCmNFPtWxVWwoB/zJr8FigEhP
	iEDw==
X-Received: by 10.66.138.109 with SMTP id qp13mr25970238pab.127.1368376155465; 
	Sun, 12 May 2013 09:29:15 -0700 (PDT)
Received: from stafford-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id hp1sm11384104pac.3.2013.05.12.09.29.13
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 12 May 2013 09:29:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
Date: Sun, 12 May 2013 09:29:13 -0700
Message-Id: <9E4F6205-6171-4D60-A669-609A49F763C1@gmail.com>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 12 May 2013 16:47:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Saul

There is one serious problem that I ran into was that qemuarm 3.8 kernel =
segfaulted
is it working for you ?

-Khem

On May 12, 2013, at 4:05 AM, Saul Wold <sgw@linux.intel.com> wrote:

> This changes the default GCC to 4.8, it has been tested with OE-Core
> and a number of layers have been testing with it for the last few =
weeks.
>=20
> There are some minor issues outside of OE-Core. These will be =
addressed
> with time.
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Cc: Khem Raj <raj.khem@gmail.com>
>=20
> ---
> meta/conf/distro/include/tcmode-default.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc =
b/meta/conf/distro/include/tcmode-default.inc
> index 88d109b..f3942b5 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -17,7 +17,7 @@ =
PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D =
"${TCLIBC}-initial"
> PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial =3D =
"nativesdk-${TCLIBC}-initial"
> PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>=20
> -GCCVERSION ?=3D "4.7%"
> +GCCVERSION ?=3D "4.8%"
> SDKGCCVERSION ?=3D "${GCCVERSION}"
> BINUVERSION ?=3D "2.23.2"
> EGLIBCVERSION ?=3D "2.17"
> --=20
> 1.8.0.2
>=20



