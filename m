Received: from mail-ia0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TlERK-0007Nh-Sq
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 08:52:03 +0100
Received: by mail-ia0-f171.google.com with SMTP id k27so1464453iad.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 23:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qPTnW1XNEcBU3acOy+Y9YFmIW2UfXez85OmJ0UNSpm4=;
	b=0dAN1otYkfcrT37o7wUUb58DbzckTqkv9JW7KPWlI9DuCCb/8G61LGJ3a/jrDUEAwF
	RN2rtrAazAcTew8HrSHVXAnEYztjicktHE9gkxHwvdEcSo/pvt0r1oDggVdp+stYTtk+
	kSHundexqAu/9FDIgzvwRAFYIZlN5zIpk4arlTe73XY+erCrDHbinIhqyy/cfKk3JCNa
	Z7raIQBETcCwFlTMRf0MClkXMEGh4dZEVfNb6Jvup9bYUBQWgNIbrBcdQz9Sgu5haGpB
	CANIM+W1WXNLsBfSZ0gTFG3qaZ18qZ+9DVeDhLD/lLWfvrmCNXxCce/YmWU/pBtA3MQp
	vl1w==
Received: by 10.43.92.72 with SMTP id bp8mr5071504icc.49.1355902619577; Tue,
	18 Dec 2012 23:36:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Tue, 18 Dec 2012 23:36:29 -0800 (PST)
In-Reply-To: <1355858364-26511-1-git-send-email-mark.hatle@windriver.com>
References: <1355858364-26511-1-git-send-email-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Dec 2012 23:36:29 -0800
Message-ID: <CAMKF1soqJZykXM65S0Rs2Ah-Pda2wqEM=2F=gKpYnkhrO9c3-A@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH resend] gcc-cross-canadian.inc: Add dependency on cross-gcc
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
X-List-Received-Date: Wed, 19 Dec 2012 07:52:04 -0000
Content-Type: text/plain; charset=UTF-8

this is needed on danny as well.

On Tue, Dec 18, 2012 at 11:19 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> gcc-cross-canadian uses cross compiler during libgcc build
> when building from sstate the build failed when building
> gcc-cross-canadian since it did not populate gcc-cross
> therefore add an explicit dependency on virtual/${TARGET_PREFIX}gcc
> to make sure that gcc-cross is available before building
> gcc-cross-canadian
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> index 64cf54e..f1824fa 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -4,5 +4,5 @@ DESCRIPTION = "The cross-canadian GNU cc and gcc C compilers for ${TARGET_ARCH}
>  PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN = "gcc"
>
> -DEPENDS = "virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
> +DEPENDS = "virtual/${TARGET_PREFIX}gcc virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc nativesdk-gettext"
>
> --
> 1.7.3.4
>


