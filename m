Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QpBn3-0005DH-1Y
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 06:13:41 +0200
Received: by gxk3 with SMTP id 3so599610gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 21:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=56B9KUQ2sZkdEsWYowjjDz7hRL3FIn3cjTJ+e8alknU=;
	b=wE6/ntRLXe4L8ueSPO+J4c/SNQB12pUJNAIRX8NFCgyPvV7Yb2t+laQqfW2blTfYbu
	RaEfgKToSqDgM56oc4KliVhlNIgKj5jEITmAv2SnfAaekgQlZGiARN60Mh6KPrMkkqxI
	fb80AKkUXrqlYf705zhCboWW2jWcZb4FZq51k=
MIME-Version: 1.0
Received: by 10.100.244.3 with SMTP id r3mr1475760anh.118.1312517356318; Thu,
	04 Aug 2011 21:09:16 -0700 (PDT)
Received: by 10.101.86.1 with HTTP; Thu, 4 Aug 2011 21:09:16 -0700 (PDT)
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
Date: Fri, 5 Aug 2011 00:09:16 -0400
Message-ID: <CADkTA4PDcxHw-4TVExHAgAvqUpYnfLergDx7mdTpPZCs2UqkEA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/10] kern-tools: extend arbitrary repository support
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
X-List-Received-Date: Fri, 05 Aug 2011 04:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 11:01 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>
> Updating the kern-tools SRCREV to pickup better support for
> non-yocto repository support.
>
> =A059859ca createme: use branch name when creating meta data
> =A091b4275 configme: determine meta branch based on directories, not bran=
ch naming
> =A0f5a915c kgit-meta: make branch creation and renaming more robust

This one still needs a bit more testing. I'll be sending a pull request whe=
n
I'm happy with it on Friday. So let's wait a just a bit longer for this.

Bruce

>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 1fbb1f7..7ede52a 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://git/tools/kgit;beginline=3D5=
;endline=3D9;md5=3De2bf4415f3d8
>
> =A0DEPENDS =3D "git-native guilt-native"
>
> -SRCREV =3D "f5a915c277a37ba5949b4c0778356189e7dd9ec0"
> +SRCREV =3D "cdcb97cfea5f98003b2e0fb1a77b6d0d016a69e7"
> =A0PR =3D r10
> =A0PV =3D "0.1+git${SRCPV}"
>
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


