Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R8Xze-000677-V5
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 15:46:42 +0200
Received: by wyh5 with SMTP id 5so7634607wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=wYdoUD8xUYqJVRlX/WsNGK3OEvIMTYnRZDh+VZnj8T4=;
	b=HLWAuXtQU48lhLCHtPR7XeukiFz1ULHflQBr0tFbOtzAlvEqcY4YnQBwj3qPKtVVbQ
	6mCt/WLku0/4XIsANfYQx3uXQ45iN4cMIhECjkQjQdpSEGoKBeMTiunNz1uvjgsji/5T
	ISkc/o43yUqzNEyfcVPEh7lUrG2C4fxiXLs3c=
MIME-Version: 1.0
Received: by 10.227.24.82 with SMTP id u18mr2037828wbb.111.1317130877523; Tue,
	27 Sep 2011 06:41:17 -0700 (PDT)
Received: by 10.180.87.197 with HTTP; Tue, 27 Sep 2011 06:41:17 -0700 (PDT)
In-Reply-To: <1316297897-698-5-git-send-email-dbaryshkov@gmail.com>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<1316297897-698-5-git-send-email-dbaryshkov@gmail.com>
Date: Tue, 27 Sep 2011 09:41:17 -0400
Message-ID: <CADkTA4PK3Ar48aa-ja6+yayup_QXKuzes7d-5_Bid4D_ik-u9g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: Re: [PATCH 5/5] kernel.bbclass: remove unshipped files in do_install
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
X-List-Received-Date: Tue, 27 Sep 2011 13:46:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 17, 2011 at 6:18 PM, Dmitry Eremin-Solenikov
<dbaryshkov@gmail.com> wrote:
> Drop two unsed files (modules.order and modules.builtin) in do_install
> to stop the "unshipped files" warning.

One less warning is a good thing!

Looks good to me,  I can add my vote to this one.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> ---
> =A0meta/classes/kernel.bbclass | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 59d3b89..6b2e603 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -108,6 +108,8 @@ kernel_do_install() {
> =A0 =A0 =A0 =A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> =A0 =A0 =A0 =A0if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=
=3D"${D}" modules_install
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -f "${D}/lib/modules/${KERNEL_VERSION}/m=
odules.order"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -f "${D}/lib/modules/${KERNEL_VERSION}/m=
odules.builtin"
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0bbnote "no modules to install"
> =A0 =A0 =A0 =A0fi
> --
> 1.7.2.5
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


