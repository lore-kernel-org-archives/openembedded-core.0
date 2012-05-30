Received: from mail-gh0-f178.google.com ([209.85.160.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <aalonso00@gmail.com>) id 1SZkAj-0005ee-Bk
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:46:49 +0200
Received: by ghbf1 with SMTP id f1so2995194ghb.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 07:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=C/R6pBdYzRN05DMYTsRy1hZmxJqmd5YIkb5G5QVCw+M=;
	b=JZWwAGPOCyxl70CTWHJyA2xn7veMg3NSklojXvzS/Yilummfof8I6zyzoYZTm6+8/J
	SMENMtqzUXjs3fbX/3/F1KflC0aniCr157rER+8mse9T5nRmaBVVKAvpEl0zYNmqVGvD
	I+GuYaLcHzBk3o+h3mp6Nkgf5G6xDAIOedWlJaTfOuM8UD4uD9ADEXeEmE7ee0NVNcQf
	zqKMJz5U1t/dTToHhOcU1DoYTjIiLbdR62weBfvrjlTnJS8qUnrpDelKhcMNvc5LW3d3
	OP5mwVRW8bxgA7IkfO5eE5oJF0/PkfyysrTQQbKnNugab8vZ8ve6LOn3OpaBUDBuPn8f
	SsDw==
MIME-Version: 1.0
Received: by 10.50.222.170 with SMTP id qn10mr11096534igc.45.1338388588808;
	Wed, 30 May 2012 07:36:28 -0700 (PDT)
Received: by 10.64.0.77 with HTTP; Wed, 30 May 2012 07:36:28 -0700 (PDT)
In-Reply-To: <CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
References: <E071AE73-05A7-4D16-9442-952E65ECA96C@gmail.com>
	<4FC51727.6020205@windriver.com>
	<2A530553-23DF-4CB1-A957-0E2C3D468BDA@gmail.com>
	<CAMKF1sq_G6k_o+o=OZrhuz2iNq6EEhTYT67dA1cssU3LFS5cYQ@mail.gmail.com>
Date: Wed, 30 May 2012 09:36:28 -0500
Message-ID: <CAAB-1yxXDY4O-JV_gpW8eBmfXU=-Jcp4yc0oqZe1WVr6T-rn_w@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-xilinx: ERROR: Failure expanding variable TUNE_PKGARCH ppc440
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
X-List-Received-Date: Wed, 30 May 2012 14:46:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Push fixes for this error.

Regards

On Tue, May 29, 2012 at 9:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 29, 2012 at 12:46 PM, Elvis Dowson <elvis.dowson@gmail.com> w=
rote:
>> PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D "${PACKAGE_EXTRA_ARCHS_tune-powerpc}
>> ppc440"
>
> may be this should be be
>
> =A0PACKAGE_EXTRA_ARCHS_tune-ppc440 =3D
> "${PACKAGE_EXTRA_ARCHS_tune-powerpc-nf} ppc440"
>
> other pieces look good
>
> -Khem
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Saludos
Adrian Alonso
http://aalonso.wordpress.com


