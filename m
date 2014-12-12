Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 396BE72333
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 20:43:11 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tr6so7630194ieb.31
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Dec 2014 12:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=3H0fD4ESpMAViFbDGRoziNwhG7QsLOxSRDM0u6pgOok=;
	b=KBHRePmBvjSu1/p/VXzRwMTDuNWmcH5E0yfoaJDSrzP84y0wEXV2Z070ypJ4AZ3aPy
	fLb1/V2jSRM0vmf4aSZsW5PwcJaTFhaeb5a0L+u4vD32EYVH5dSK7IFed/Ge+Il5+BVF
	8lu4aXkWW913z/mKTQ+oz7S5Ea2ivbpLaq8z3Yr2QbHpW/oxjfrdCzahoz0+bMyy2hX1
	+o2ohimu6rOIR1fCzQuCk0bS/HiVAkWw29YN/9dotk3P606PZX2S67RZx9bdGu6lUy8s
	cOou89MUw8xXvOLXcnSXgG1UpC3thQNDNmkfaf6a3wOliV3jVLLhvI02KWLajC1qxlRR
	4Bbg==
X-Received: by 10.50.43.133 with SMTP id w5mr6691631igl.12.1418416992242;
	Fri, 12 Dec 2014 12:43:12 -0800 (PST)
Received: from 10.168.191.178-ra01.englewood.co.denver.comcast.net
	(fw01.aurora.co.denver.comcast.net. [198.178.8.81])
	by mx.google.com with ESMTPSA id ii3sm1264740igb.1.2014.12.12.12.43.11
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Dec 2014 12:43:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1418417263-10579-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 12 Dec 2014 12:43:10 -0800
Message-Id: <6EF6AD35-74BC-4B3E-AE31-82F3571F0E2D@gmail.com>
References: <1418417263-10579-1-git-send-email-raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [PATCH] kernel.bbclass: Remove bashism
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
X-List-Received-Date: Fri, 12 Dec 2014 20:43:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

this needs back porting to dizzy as well

> On Dec 12, 2014, at 12:47 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> Fixes build on systems using dash for default shell e.g.
>=20
> errors like
>=20
> run.do_strip.25842: [[: not found
> | readelf: Error: Unable to read in 0x37 bytes of section headers
> | readelf: Error: Not an ELF file - it has the wrong magic bytes at =
the start
>=20
> Change-Id: I29cac15be44a02d75a3d6889b6ae9b2e19bf46af
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/classes/kernel.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index f300fa3..4af9d15 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -390,7 +390,7 @@ python split_kernel_packages () {
>=20
> do_strip() {
> 	if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
> -		if [[ "${KERNEL_IMAGETYPE}" !=3D "vmlinux" ]]; then
> +		if [ "${KERNEL_IMAGETYPE}" !=3D "vmlinux" ]; then
> 			bbwarn "image type will not be stripped (not =
supported): ${KERNEL_IMAGETYPE}"
> 			return
> 		fi
> --=20
> 2.1.1
>=20


