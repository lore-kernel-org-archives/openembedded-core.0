Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RWO4R-0005Xf-Dy
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 09:02:12 +0100
Received: by dake40 with SMTP id e40so803749dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=hgHw0ExUdFqk3xsxFGYMQQc/ptj15OZOTNTY3MzwbCs=;
	b=AHKwBrgaQkBiDJKKAF5Y6AvfTMbKbKh1Iby4APTSuCXe1zT8Pu1Fsjp/72++0Gj6Xa
	eYpsubZUMwU3iH0on3abnXKy7WSRAel1IfkMP9yxWwWQxs76Yh6BccDW3nv35xsAPkkz
	kNjkPV/nCh5FMa/PwTuVOMHX47CbX2d4lIQKg=
MIME-Version: 1.0
Received: by 10.68.73.98 with SMTP id k2mr12441145pbv.2.1322812527991; Thu, 01
	Dec 2011 23:55:27 -0800 (PST)
Received: by 10.142.121.40 with HTTP; Thu, 1 Dec 2011 23:55:27 -0800 (PST)
In-Reply-To: <1322783543-4287-1-git-send-email-sgw@linux.intel.com>
References: <1322783543-4287-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 2 Dec 2011 02:55:27 -0500
Message-ID: <CADkTA4OHdySvTJ6Ffisa6A1Uv+MEhzK8uEVeXPXfpWN4gkd5eA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 1/3] kernel-yocto: fix extra CR in do_kernel_checkout
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
X-List-Received-Date: Fri, 02 Dec 2011 08:02:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 1, 2011 at 6:52 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =A0meta/classes/kernel-yocto.bbclass | =A0 =A03 +--
> =A01 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yoct=
o.bbclass
> index ad14aac..79f82e3 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -53,8 +53,7 @@ do_patch() {
> =A0}
>
> =A0do_kernel_checkout() {
> - =A0 =A0 =A0 if [ -d $
> -{WORKDIR}/git/.git/refs/remotes/origin ]; then
> + =A0 =A0 =A0 if [ -d ${WORKDIR}/git/.git/refs/remotes/origin ]; then

Ouch. Thanks for the fix. Working in hotels .. is less than ideal.

Bruce

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo "Fixing up git directory for ${LINUX_=
KERNEL_TYPE}/${KMACHINE}"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -rf ${S}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mkdir ${S}
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


