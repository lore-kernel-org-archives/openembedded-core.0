Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QHeCv-0007zt-02
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 17:41:45 +0200
Received: by yxn22 with SMTP id 22so472497yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 May 2011 08:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=OoJEr9DY1KpXggBNgJwXTdd/TErtUyW0YdIM8rW2hCU=;
	b=uxQYuO3M4RbHf7QAgHRVqKSNyCnS/N/kdCjhgZ2YfHaNAaFyvFs1qIJcmL/qHGVQ8G
	LU8oENMvaYBaL6OdoqyfqVlTXZZh8xnZTNTKB0lv4XV3y4g9eNoiS6ApubThzBGFverg
	kLFgZCqdHRBrXSMGAe7GoF4pqvc/BTqh1ZJy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ot9iXQKb2CtB31VTWbD6uwYGFuRy6DX92pYgTngWEMwydRtYjtrpbFe6ohJ1IDEFlt
	EbHd1PGDEOR9t9MHjAOZWbcYSt61kUmERb7d2QeeAlYnks/l+Pkyjon+FVNVsnf2h1Tt
	q22Oe+KQtiZhF1CcnE/HPsh0cCxRDY+vq/Huo=
MIME-Version: 1.0
Received: by 10.91.126.14 with SMTP id d14mr1243922agn.58.1304523545667; Wed,
	04 May 2011 08:39:05 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Wed, 4 May 2011 08:39:05 -0700 (PDT)
In-Reply-To: <cover.1304515719.git.ke.yu@intel.com>
References: <cover.1304515719.git.ke.yu@intel.com>
Date: Wed, 4 May 2011 11:39:05 -0400
Message-ID: <BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 15:41:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, May 4, 2011 at 10:05 AM, Yu Ke <ke.yu@intel.com> wrote:
> From: Yu Ke <ke.yu@intel.com>
>
> move the SRCREV from poky-default-revisions.inc to its corresponding reci=
pe,
> in this case, those non poky distro can also use its SRCREV.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
> =A0Branch: kyu3/srcrev-recipe
> =A0Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dkyu3/s=
rcrev-recipe
>
> Thanks,
> =A0 =A0Yu Ke <ke.yu@intel.com>
> ---
>
>
> Yu Ke (1):
> =A0poky-default-revisions: move the SRCREV to recipe file
>
> =A0meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb | =A0 =A01 +
> =A0.../recipes-graphics/clutter/table_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0meta-demoapps/recipes-graphics/clutter/tidy_git.bb | =A0 =A01 +

<snip>

> =A0meta/recipes-kernel/blktrace/blktrace_git.bb =A0 =A0 =A0 | =A0 =A02 +
> =A0meta/recipes-kernel/dtc/dtc_git.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +
> =A0.../kern-tools/kern-tools-native_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 +
> =A0.../linux-firmware/linux-firmware_git.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0.../linux-libc-headers-yocto_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0.../recipes-kernel/linux/linux-yocto-stable_git.bb | =A0 12 ++
> =A0meta/recipes-kernel/linux/linux-yocto_git.bb =A0 =A0 =A0 | =A0 14 ++\

Would it be possible to get direct cc on changes to the linux-yocto
recipes ? I didn't expect this and it is causing me a bit of pain at
the moment. A direct cc' would have helped, since I would have
preferred to stage the change in with my other items.

Bruce

> =A0meta/recipes-kernel/oprofile/oprofileui_git.bb =A0 =A0 | =A0 =A01 +
> =A0meta/recipes-kernel/sysprof/sysprof_git.bb =A0 =A0 =A0 =A0 | =A0 =A01 =
+

--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


