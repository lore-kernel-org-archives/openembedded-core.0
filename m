Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Sej3j-0005aM-QQ
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 10:36:12 +0200
Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Jun 2012 01:24:17 -0700
Received: by vcbfk26 with SMTP id fk26so155168vcb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 01:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=xs5bt70qKfyzAcsc/dvJuVBMdFor3HsuMpD+0pxktSM=;
	b=F059OkpHrmbVbiStUlCn4E1fziD+hXRL3IlcMqb+aVYDvTMLaonUz/bs7VaPEVzkpH
	xlKt78FokqH4KNPrKeoc4jjJPYrTrmJLr2utzvmDaPIcA/xxkAKOHUTST4JttyMdrBEa
	pfru+70V8rIwpes9GrbYUAFa0YbZ9xlSlYYpOQA4I9aCCb350EnGp/IWZxnEVRn/uN6g
	IHbImmi9YQN8S0qwJk7AfZZyja5CySL1Dh3M/DgoGDPpbxL2VaId+kGWXfF/UFF5LsEs
	5T1y9uehOg63L2P2EluSIp/dhGsqhaFQ15WfFFrFizZokTnEVewpEERY3k1zMG/tMw1v
	LrTA==
Received: by 10.220.223.212 with SMTP id il20mr16334091vcb.71.1339575856477;
	Wed, 13 Jun 2012 01:24:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.169.200 with HTTP; Wed, 13 Jun 2012 01:23:56 -0700 (PDT)
In-Reply-To: <1339575610-21995-1-git-send-email-bogdan.a.marinescu@intel.com>
References: <1339575610-21995-1-git-send-email-bogdan.a.marinescu@intel.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 13 Jun 2012 11:23:56 +0300
Message-ID: <CAMZjud2OvTeBGEPvKP5x6-f0R_xQC5a-bS8aKVrnt21D2eVmPQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQk5J/Pr4h2qqd/IAfxWgPYD+90015f6Fhwt2tVhDtd/InEBRt4A3kkaHGoUjEj8KjDkzVdA
Subject: Re: gcc-configure-common: Use build time sysroot for target gcc
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
X-List-Received-Date: Wed, 13 Jun 2012 08:36:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Apologies for the double "From:" line, will resend.

On Wed, Jun 13, 2012 at 11:20 AM, Bogdan Marinescu
<bogdan.a.marinescu@intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> From: Khem Raj <raj.khem@gmail.com>
>
> Otherwise it assumes / as sysroot on build host and starts
> searching for directories in there.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-target.inc
> index 1ee7504..5bca2b7 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
> @@ -1,4 +1,6 @@
> =A0require gcc-configure-common.inc
>
> =A0EXTRA_OECONF_PATHS =3D " \
> + =A0 =A0--with-sysroot \
> + =A0 =A0--with-build-sysroot=3D${STAGING_DIR_TARGET} \
> =A0 =A0 --with-gxx-include-dir=3D${includedir}/c++/"
> --
> cgit v0.9.0.2-39-g756e
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


