Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8nL-0000PF-WE
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:52:52 +0200
Received: from mail-lpp01m010-f52.google.com ([209.85.215.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:42:17 -0700
Received: by lahj13 with SMTP id j13so2482294lah.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=6BehiBQclii9pJIUmo3OaxN6YvXNOFUN20VjKU0Fqis=;
	b=K3pZ1L9Gd52XxxxryxGNCt4HM0EtZamv7IWIOt9r9FRmHJNnKDKcWswxClL9M6XVNk
	MG8HP2UkbmA6fE0zqWkopWyHw1jxnFN1nuc8YP5BKbp4hqddhiASPYelPMT6c06XFORM
	K+aj9gZnf4djpLnnE5sOaWJW9m4YeNoYD+ofXzlWC0X9IVuAmuICJ2dRQoZ00usFPlb6
	S1lRNP74w/op/O2aiQsahuWRszSTOquIvHny2S00slfUHAC1cd8Q547LzIQ4TaMyFo3+
	gIsGCeRK0+NDFl0cMt7+HDqhgPPohzmMb05s8xWsKSV1MVWLhvSMF7x8hTU1BPUsDJmm
	FGmA==
MIME-Version: 1.0
Received: by 10.152.123.244 with SMTP id md20mr18220974lab.0.1339436535216;
	Mon, 11 Jun 2012 10:42:15 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:42:15 -0700 (PDT)
In-Reply-To: <cover.1338990374.git.tom.zanussi@intel.com>
References: <cover.1338990374.git.tom.zanussi@intel.com>
Date: Mon, 11 Jun 2012 10:42:15 -0700
Message-ID: <CAPhnLPB6GuVv-dnKtv2igK1Ce7pagog0ctUa7gzJDCOJrNLeaA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Zanussi, Tom" <tom.zanussi@intel.com>
X-Gm-Message-State: ALoCoQns6523sp+pRWVtCv+zlwxl50PEWDJW6pIy+zxBXhyZMHOpq8xKOwhkw8znRldoaE/nqX3R
Subject: Re: [PATCH 0/2] gnupg build fixes
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
X-List-Received-Date: Mon, 11 Jun 2012 17:52:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 6:52 AM,  <tom.zanussi@intel.com> wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> The yocto autobuilder was having problems generating rootfs for a bunch
> of machines which this patchset was seen to fix.
>
> The first patch adds a missing dependency that the second removes; the
> patches are staged this way to easily allow the second to be reverted
> if the CCID driver option is wanted, in which case the missing dependency
> will still be there.
>
> The following changes since commit df8f55a919b3cc602ce1f1c51630c7edf6e36b=
55:
> =A0Cristian Iorga (1):
> =A0 =A0 =A0 =A0ltp: Add patch to correct failing build
>
> are available in the git repository at:
>
> =A0git://git.yoctoproject.org/poky-contrib.git tzanussi/poky-master-gnupg=
-dependency-fix.v1
> =A0http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Dtzanus=
si/poky-master-gnupg-dependency-fix.v1
>
> Tom Zanussi (2):
> =A0gnupg: add libusb to DEPENDS
> =A0gnupg: disable CCID driver
>
> =A0meta/recipes-support/gnupg/gnupg_2.0.19.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



Merged into OE-Core

Thanks

-b

--=20
Elizabeth Flanagan
Yocto Project
Build and Release


