Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QpBnv-0005Ev-6w
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 06:14:35 +0200
Received: by yxi19 with SMTP id 19so1531251yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 21:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=zRoltJsEg92hw5PSAiNROqg53iNB7RaAyHRjIo5PdEg=;
	b=E6g9uyIGhR29/AKQIOpmkIXBDNzJvmfdIF6f8xzF0WZVeX7kHg6aERtT2CXPVZ8MAa
	1+PGi/wXbVpCo1tms5Lb3mciJV1O9Oszqds2nzUgFGq4KFBG0Om/QXAUqq5ahPIRhVom
	HRzyPZ/GdfzcoRYC1gs/6N+VEgviF10AJWbGY=
MIME-Version: 1.0
Received: by 10.101.160.22 with SMTP id m22mr649694ano.52.1312517410636; Thu,
	04 Aug 2011 21:10:10 -0700 (PDT)
Received: by 10.101.86.1 with HTTP; Thu, 4 Aug 2011 21:10:10 -0700 (PDT)
In-Reply-To: <6550691dbf59ad6bed0d4db2b5a920edae3286ca.1312469790.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<6550691dbf59ad6bed0d4db2b5a920edae3286ca.1312469790.git.nitin.a.kamble@intel.com>
Date: Fri, 5 Aug 2011 00:10:10 -0400
Message-ID: <CADkTA4PvULmm7SwxSKTs_XytL2zs+i91OG_zgcx6vCC8vtag8w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] linux-yocto: pass KMACHINE to updateme, not MACHINE
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
X-List-Received-Date: Fri, 05 Aug 2011 04:14:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 11:01 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> To support the mapping of any oe/yocto MACHINE to a kernel
> branch that may not share that naming structure we have
> KMACHINE and KBRANCH. To allow the mapping to work, we
> actually have to pass KMACHINE into updateme and not MACHINE.

This has also been rebased. I'll include this in my pull request tomorrow. =
I'm
still doing regression testing on this change.

Bruce

>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/classes/kernel-yocto.bbclass | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index 8df5f31..e242165 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -28,7 +28,7 @@ do_patch() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0addon_features=3D"$addon_f=
eatures --feature $feat"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0done
> =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 updateme --branch ${kbranch} ${addon_features} ${ARCH} ${MA=
CHINE} ${WORKDIR}
> + =A0 =A0 =A0 updateme --branch ${kbranch} ${addon_features} ${ARCH} ${KM=
ACHINE} ${WORKDIR}
> =A0 =A0 =A0 =A0if [ $? -ne 0 ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "ERROR. Could not update ${kbranch}"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0exit 1
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


