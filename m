Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Se6nP-0004HP-2u
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:44:47 +0200
Received: by pbbrq2 with SMTP id rq2so5478812pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=YO2B1WWPuHts4djq8Kl5FKwNZeKhR86ZXLx2djcVtrQ=;
	b=etwkcAZQix5FSGnZ++c1afS7DUQi9keqp6Z2vnLfF6UPnXmrpgjFIo1LIMjhaMFrAO
	0cU2TdK/iZvRDgrd8899K7jJmLyScQ/WsSHywXnvHi8qdRKNxJCQjXd8aVtAW5yQWPFe
	FXwIHYVq5BIbQbVoXFSe9bA+6xYncAl2L8r3WIwQWSHrCr3TWAzDe/F7WUp/khEZ3I6y
	zSgu2d0Y+h6kLgyMQwuJ3jCRy4VhcZUz3PLA+1xG5elGvzUJzVQ/5kcvq0k+w8q46WUo
	tstZWkpfuzMkj1yi4kMpllkx///wqBxp8uPtRjgBlcymS939cubgvsyo7e9gHwh+blQ2
	dJqg==
MIME-Version: 1.0
Received: by 10.68.132.166 with SMTP id ov6mr28504549pbb.24.1339428852611;
	Mon, 11 Jun 2012 08:34:12 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Mon, 11 Jun 2012 08:34:12 -0700 (PDT)
In-Reply-To: <4FD60D68.4040809@linux.intel.com>
References: <4FD60D68.4040809@linux.intel.com>
Date: Mon, 11 Jun 2012 11:34:12 -0400
Message-ID: <CADkTA4PpQYeDwSMs1iss4JoiF1R_szZU4ByMKPwHb=kNrnv=Pw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Missing Patch Headers
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
X-List-Received-Date: Mon, 11 Jun 2012 15:44:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2012 at 11:23 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Folks,
>
> We recently had a spat of new patches added without patch headers, ie no
> patch comment, Signed-off-by or Upstream-Status.
>
> Please review this list and update the patch and submit a new commit.
>
> Zhai Edwin -
> meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
> Laurentiu Palcu -
> meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux=
-config.h.patch
> Cristian Iorga -
> meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
> Xiaofeng Yan - meta/recipes-extended/lsb/lsbinitscripts/functions.patch
> Mark Hatle - meta/recipes-devtools/binutils/binutils/binutils-armv5e.patc=
h
> Mark Hatle - meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
> Andreas M=FCller -
> meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-supp=
ort-without-nss-for.patch
> Bruce Ashfield -
> meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_comp=
at_task-from-redefiniti.patch

Your script is wrong here. That patch has everything you'd expect,
since it follows kernel
patch conventions. Subject, shortlog, log log and sign-off.

So don't expect any resubmission from me on this one, since I won't be
putting an upstream
status directly in the patch.

Bruce

>
>
> Thanks
> --
> =A0 =A0Sau!
>
> Saul Wold
> Yocto Component Wrangler @ Intel
> Yocto Project / Poky Build System
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


