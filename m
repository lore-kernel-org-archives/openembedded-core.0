Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S31Il-0003XZ-MT
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 09:23:51 +0100
Received: by wgbdr12 with SMTP id dr12so218353wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 00:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.52.14 as permitted sender)
	client-ip=10.216.52.14; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.52.14 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.52.14])
	by 10.216.52.14 with SMTP id d14mr2007512wec.35.1330589722483 (num_hops
	= 1); Thu, 01 Mar 2012 00:15:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=GpftZCS4uz6vmvdzIuKbmtQuWfnh0KfHeutMNMpuv9o=;
	b=my5u11aknMi4ngsTdYf5pQ6dmzf1xcX0cC4bANL5oel+CnaYhqT1zD6lNyAzeKsRkd
	/K4mEeaSDzb460FU1Y2Q7Zphk2U1aOXSGwWVtod5S0/arNEbHboph5IyXZyJut1ZGmDH
	4Tg7ECE5N6/a1tUTXaL8skdaIa5e968rjQEjJk1+cEoEK3CeIOE/1200GkAoeWk9rYoQ
	gcSu03fIqchlNgFMFvGCSKI28tN5i3Y2vMm6BxQPPuQahPp33EVj9eqNBTpncxAcMFJz
	gr3J/1zwihT+Xwmz9+w98jDo77u02/1C5RjS3Hv3PnaDFzRtduTLzXLaqOOn3/3xXqQQ
	7HLA==
Received: by 10.216.52.14 with SMTP id d14mr1613411wec.35.1330589722392;
	Thu, 01 Mar 2012 00:15:22 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id k6sm25243667wiy.7.2012.03.01.00.15.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:15:21 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <b9d93f6158d8768c107501f4c2e481caa02fcd9c.1330587785.git.sgw@linux.intel.com>
Date: Thu, 1 Mar 2012 09:15:20 +0100
Message-Id: <EC0E09A0-582C-4880-8F8F-3799B75024B1@dominion.thruhere.net>
References: <cover.1330587785.git.sgw@linux.intel.com>
	<b9d93f6158d8768c107501f4c2e481caa02fcd9c.1330587785.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlBcgNibwr7m/DH8VUuHj45YD/c2n5YBqOSMt+HExTP4Jr3VrVdBT6NMe9arjqVMr7EfGL2
Subject: Re: [PATCH 4/4] self-hosted-image: Create a VMDK image with correct SYSLINUX_* settings
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
X-List-Received-Date: Thu, 01 Mar 2012 08:23:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 1 mrt. 2012, om 08:46 heeft Saul Wold het volgende geschreven:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-core/images/self-hosted-image.bb |   16 ++++++++++++++--
> 1 files changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/images/self-hosted-image.bb =
b/meta/recipes-core/images/self-hosted-image.bb
> index a0a7592..d56c2cb 100644
> --- a/meta/recipes-core/images/self-hosted-image.bb
> +++ b/meta/recipes-core/images/self-hosted-image.bb
> @@ -1,11 +1,23 @@
> IMAGE_INSTALL =3D "task-core-boot task-core-apps-console =
task-core-ssh-openssh task-self-hosted"
>=20
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58 \
> +                    =
file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
"
> +
> +PR =3D "r5"

AFAICT PR in images does nothing, since they are nostamp.

regards,

Koen=


