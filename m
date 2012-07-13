Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SpmtE-0001in-7R
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 22:55:04 +0200
Received: by eeit10 with SMTP id t10so535332eei.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 13:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=8Q3jCruFNuJO9byfpTkWTnispAhehc2sadOskmFPsxU=;
	b=v29UUh/DXSlLi/HSj4QR1IS7HYCWvSP+K3NhKxTUyvE1V6O+sTrb+1GcJQoXJlHzUI
	z1G9GjCDeEy6bWyVFwPxm+oOX4jMpR+/n6fSMCMu4+CfAj6hlKSy1+fpT9rSsoUpgy6C
	PGbyAgheCeRE75+Tkrmc3AONfSa8HbAaZ62lyuXGpT4WCW3+K0C1RSCtRgotB1vny3jv
	lSurS4YZXETcuIAXawhzp1eZsTWqL0n3DcgALnVv/IwFqvRlauxgbQEgdooaqdOkgQaa
	vU9GpVKVv3YQ21nlBU5TNB2mWJY5D4Jqb5KMEc8pbaafEajzpHBJ+mNA9i5WyAyLx5yj
	qJFg==
Received: by 10.14.97.16 with SMTP id s16mr622291eef.117.1342212229418; Fri,
	13 Jul 2012 13:43:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Fri, 13 Jul 2012 13:43:19 -0700 (PDT)
In-Reply-To: <1342210017-26817-1-git-send-email-msm@freescale.com>
References: <1342210017-26817-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Jul 2012 13:43:19 -0700
Message-ID: <CAMKF1sokTHtYziStdSsGvdh4HnhJs3KAYecs-dJ1UXeBGN_sUg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] task-core-tools-testapps.bb: kexec-tools does not work on e5500-64b parts
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
X-List-Received-Date: Fri, 13 Jul 2012 20:55:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 13, 2012 at 1:06 PM, Matthew McClintock <msm@freescale.com> wrote:
> This prevents kexec from building for this part since it does not work
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
>  meta/recipes-core/tasks/task-core-tools-testapps.bb |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/tasks/task-core-tools-testapps.bb b/meta/recipes-core/tasks/task-core-tools-testapps.bb
> index b5847f8..bdd0d05 100644
> --- a/meta/recipes-core/tasks/task-core-tools-testapps.bb
> +++ b/meta/recipes-core/tasks/task-core-tools-testapps.bb
> @@ -22,6 +22,7 @@ KEXECTOOLS ?= "kexec"
>  KEXECTOOLS_mips ?= ""
>  KEXECTOOLS_mipsel ?= ""
>  KEXECTOOLS_powerpc ?= ""
> +KEXECTOOLS_e5500-64b ?= ""

you should use arch override here this is not machine specific recipe probably

KEXECTOOLS_powerpc64 ?= ""

is better

>
>  RDEPENDS_${PN} = "\
>      blktool \
> --
> 1.7.10
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


