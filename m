Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8861D6BC7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 21:35:16 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id l9so54017619qtu.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wq8ydTvVIocXcPUVGixwoZoHucSfttX8VXfYo8H7w+8=;
	b=U82m7jMSnUpt6uRhvLlRIQKC4O0obkhwGpb4k00RN5ayNHZfOCNVIthBjHtPBQgFis
	xBlgCSrxNy1Op0xt/QRzdOKCZ6q5EXfxE8Rj8juSXWOKJMxnS0xUziR5S/iYDmHB/AvW
	ElHohTxLu1niSZy+IiDE3dkeaNDbS9ejfxftLmFK8ocCC4IAF/KeAt5L4mDD/Yn1rWVC
	NMS/fUctKXEnajz0/ezW/Xq2ryQSp4XPD0Auar61KaWOS+kOmjfp1PnMLhr1h1U3AJYP
	kCmA9v2deTx8IpTZIlhDEJiIqc+nXfNUNSKtLBRqJ8JSZFWXvzLU/O25UFC9dbOpchIM
	m76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wq8ydTvVIocXcPUVGixwoZoHucSfttX8VXfYo8H7w+8=;
	b=HpKzJf+oMR7PPWop7E6w8OwqwUiPgRWW5Z5TWm1RwLkSDLk5HVqmu5GlP4ZhK52kz+
	OMzO/EjUtwP5kuY/T0otlBEKsq+k/Ms0hW92tcfVMlyqb9fqj2X3dXcb6ARCLWs1IiNL
	JS9WSOzwjFgLY7PF51MQEaDPKumT1K6sX/sp6wcOeoBU7jTiEnsVOKPuaBJO5lPq0MaB
	e6j+bxyD9nnA8nXmKJ9xfwadDlVaGQOg0CmbZ4Ls0scAjmt8okiz3S6annDDGvOXLljd
	xifJOYYUoOlcA+CKrZWLAhp9IQKzX8WJWjro3dR5THHKoyXafIkuLRbWK1aPG0xCfIzo
	ndcQ==
X-Gm-Message-State: APjAAAVj8nW3owMi3QB81TwD6DMq+FDSWeQGrrJp3sWSj2j+y5t8gyou
	KIQBbzkl3HHzGx54qvwEI6bb5Rgc2m7l9/4WtGA=
X-Google-Smtp-Source: APXvYqxMQ2eyplrDH7af6hAV8UAzPFD2jrpKP36NzClh4gSy3y/dzBAEL713pkcKsJnEJAwAw652t67mnvBr/Py7ZAg=
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr71064732qvh.51.1564176916958; 
	Fri, 26 Jul 2019 14:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190726153927.14245-1-tworaz@tworaz.net>
	<CAJTo0Lbwj-5k4K8UDVY0cD+eXnSL1Cv1QoR_Ddvfboh3KDkANw@mail.gmail.com>
	<aa275fd3-1f67-ae34-86cd-3e761d1c0c8c@tworaz.net>
	<CANNYZj_MRhgSz89mGkEn+RO8bOYe9nT5DnGyXEsWrve13JQbfg@mail.gmail.com>
In-Reply-To: <CANNYZj_MRhgSz89mGkEn+RO8bOYe9nT5DnGyXEsWrve13JQbfg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jul 2019 14:35:01 -0700
Message-ID: <CAMKF1spP76aSwMd9RN3bdjr50tirb8qxn22UoBDrdQpD0Z1qwA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] itstool: Use python3 binary fom PATH instead of /usr/bin/python3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Jul 2019 21:35:16 -0000
Content-Type: text/plain; charset="UTF-8"

and send to oe-devel ml please

On Fri, Jul 26, 2019 at 11:50 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> I think this should be fine, as long as you:
> 1. Modify the commit to fix the original place in the source code via a SRC_URI patch (instead of doing it after the fact with sed - such ad hoc patching is hard to read and understand).
> 2. Write a better description: we need to preserve explanations like this in commit history.
>
> Alex
>
> On Fri, 26 Jul 2019 at 21:31, Piotr Tworek <tworaz@tworaz.net> wrote:
>>
>> Hi Ross,
>>
>> Thanks for looking at my patch. You're right that my explanation behind
>> it is a wrong, I was a bit lazy there. Its not really about python3 not
>> being installed on the host system. My patch does fix a real issue with
>> itstool-native which is currently unusable. The main problem is we can't
>> mix host and OE provided python3 usage in one recipe. The problem I
>> found is that if  the recipe inherits python3native bbclass any use of
>> system provided python3 will fail. This seems to happen because
>> python3native bbclass exports
>> _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata". If I try to invoke host
>> python3 binary with this export it fails to start.complaining it can't
>> find module named _sysconfigdata.
>>
>> You might ask why nobody noticed it before. The explanation is pretty
>> simple. In meta-oe there are two recipes which depend on itstool-native.
>> Those are gnome-desktop3 and gnome-system-monitor. Both recipes inherit
>> meson class which in turn inherit python3native so in theory they should
>> fail. This does not happen because both recipes actually disable
>> document generation steps for which itstool is invoked.
>> Gnome-system-monitor has a patch for it while gnome-desktop3 has
>> desktop_docs=false in EXTRA_OEMESON. I haven't tried it yet, but with my
>> patch the document generation step should probably work fine in both
>> cases. This was the case for some other gnome related recipes which I
>> have in my own custom layer.
>>
>> Is there anything besides the explanation that is wrong with my patch?
>>
>> /ptw
>>
>> On 26/07/2019 17:57, Burton, Ross wrote:
>> > Considering:
>> >
>> > 1) bitbake is written in Python 3
>> > 2) HOSTTOOLS contains python3
>> >
>> > There *really* is a host python 3 binary, and the canonical path to it
>> > is ${HOSTTOOLS_DIR}/python3.
>> >
>> > Ross
>> >
>> > On Fri, 26 Jul 2019 at 16:40, Piotr Tworek <tworaz@tworaz.net> wrote:
>> >> Although /usr/bin/python3 works fine for class-target builds its not
>> >> really what we want for class-native. The host system might not even
>> >> have python3 installed. The native itstool version should use pythn3
>> >> provided in recipe-sysroot-native. To accomplish it modify the default
>> >> shebang to use /usr/bin/env. This works as expected for both native and
>> >> target builds.
>> >>
>> >> Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
>> >> ---
>> >>   meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 2 +-
>> >>   1 file changed, 1 insertion(+), 1 deletion(-)
>> >>
>> >> diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> >> index a0af44a71..f21e7f39b 100644
>> >> --- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> >> +++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
>> >> @@ -13,7 +13,7 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
>> >>
>> >>   do_install_append() {
>> >>       # fix shebang of main script
>> >> -    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
>> >> +    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/env -S ${PYTHON_PN} -s:' ${D}${bindir}/itstool
>> >>   }
>> >>
>> >>   BBCLASSEXTEND = "native"
>> >> --
>> >> 2.21.0
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-core mailing list
>> >> Openembedded-core@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

