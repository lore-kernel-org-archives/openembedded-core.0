Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UKm8T-0000XE-Vk
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 09:55:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2R8c8uF012933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 01:38:08 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 27 Mar 2013 01:38:08 -0700
Message-ID: <5152B05C.5030405@windriver.com>
Date: Wed, 27 Mar 2013 16:39:56 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1362550241.git.kai.kang@windriver.com>
	<43b5f9785b001759b6280bf50015a5505fcb0b2b.1362550241.git.kai.kang@windriver.com>
In-Reply-To: <43b5f9785b001759b6280bf50015a5505fcb0b2b.1362550241.git.kai.kang@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r2R8c8uF012933
Subject: Re: [PATCH 1/1] sysvinit-inittab: change default runlevel for lsb
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
X-List-Received-Date: Wed, 27 Mar 2013 08:55:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B403=E6=9C=8806=E6=97=A5 14:16, Kang Kai wrote:
> LSB images are used to run LSB test suite and there is no test case to
> check GUI so X/GUI is not included into LSB images. And in LSB
> specification, runlevel 5 is to boot with GUI, so change the default
> runlevel from 5 to 3 for LSB images.
Any comment?

--Kai

>
> [YOCTO #3927]
>
> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/m=
eta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> index b289853..87c701b 100644
> --- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> @@ -73,6 +73,10 @@ else
>   fi
>   }
>
> +do_install_append_linuxstdbase() {
> +	sed -i 's/^id:5:initdefault/id:3:initdefault/' ${D}${sysconfdir}/init=
tab
> +}
> +
>   # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .con=
f.
>   # Set PACKAGE_ARCH appropriately.
>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"



