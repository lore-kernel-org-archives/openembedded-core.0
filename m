Return-Path: <andreas.kling@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78ABA775DA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Oct 2017 18:06:26 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id h191so1841423vke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Oct 2017 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=57jJsAzbYOWZbylrKDTzcTCHmeBE5ql8wf2gOTJu7B4=;
	b=VS6v70JYtvHbMe4qWQdFOexYpM9KwdPZ1Tg6drYAIzKZebX/9/omcjNyzdPRYTY6+b
	/2fchP8hqDCeVkRVvlILNTBegxAGgtxtnS8b2gGjNLDHlBJmin8vNjQw++KlhhtzDQwc
	82adUbZVcRFmXYlIjuGgF9W35jOcttN6AiKp9Mpg1ITR889kDISlPRz7riYbpq4iIQtb
	GQlgsaeKutoNUQBJ1xu+k+E4HePtKZCkvjPcnnvpUNqEuHPJ6JETeKboyPZJaOxQWol0
	DAo9JyPTRt7MP3jkePI2RCvkDBC+cnRhJxwn6k0yPKYBYi9OMkyks3RclauV4qyOJiFI
	VmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=57jJsAzbYOWZbylrKDTzcTCHmeBE5ql8wf2gOTJu7B4=;
	b=NSwJE+GIDp9OAwp2GkYUTOBjV15ENJrXBTX4r2O08SrKrcwlzgL054g1rxx1X6AQKT
	vbQlR1jAiam1gAzEQ90vaiO1l9vPDI2qu1ymUyizm6Q6WVTlUSzyNjetdtGe5sKGmTai
	Xb5hSgjQqeI+6je98TyPQY7hi6JyzG15atubg9Sl8uvOD/E18A2mdIW4DehqpS2ovYTo
	N+Ys3I8BkwbQC4xL+PEcQIAhS6E4RyDE+GIaexxLHFezGMe+VSxoCYdlP3FWbR4HNXon
	aHHxiS7tE+Xc8Y62dcqvH2R0F62n/2ocjACqyqyfFuH1iFeOSpM7FBOOUnFzblTI8KJc
	iSGw==
X-Gm-Message-State: AMCzsaX1kQS2p9t82gKUOQKvVVXZ9ZPdxUfDhvlvNKi3qkZ5X4osa2s7
	rBMMK3fP8/U4DwahiDjpThJ0mkSNA82ftBYD8WA=
X-Google-Smtp-Source: AOwi7QC3lu4Wrcf4N5RGGvItF9X2qOGfhifD+Un6AErgDMUotNh4DoGhxXve+f3/PM5+SI9hpgIxR+0o8FMcvqg2whk=
X-Received: by 10.31.172.78 with SMTP id v75mr5737275vke.75.1506967588163;
	Mon, 02 Oct 2017 11:06:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.147.146 with HTTP; Mon, 2 Oct 2017 11:06:27 -0700 (PDT)
In-Reply-To: <CAJTo0LaWULzrFRwq+7Pwnv-_Py5-AHAYuKoc9iT61q1iuMLNFg@mail.gmail.com>
References: <20170927094014.2666-1-andreas.kling@gmail.com>
	<20170928163521.21828-1-andreas.kling@gmail.com>
	<CAJTo0LaWULzrFRwq+7Pwnv-_Py5-AHAYuKoc9iT61q1iuMLNFg@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Mon, 2 Oct 2017 20:06:27 +0200
Message-ID: <CAE-gg=5Wq6K4JdNpscupPVAHi+cY1Npo8_Ajt17uNMNbA0ZY=g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: add runtime dependencies to pam plugins.
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
X-List-Received-Date: Mon, 02 Oct 2017 18:06:27 -0000
Content-Type: text/plain; charset="UTF-8"

2017-09-29 18:31 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
> I wish I knew why git was ignoring the commit message entirely when
> applying...  It's ignoring everything apart from the SOB:
>
> $ git show
> commit 079754f2681ded614c5ee90e61f4ddbd8407998a
> Author: andreas.kling@peiker-cee.de <andreas.kling@peiker-cee.de>
> Date:   Thu Sep 28 18:35:21 2017 +0200
>
>     systemd: add runtime dependencies to pam plugins.
>
>     Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Ross
>
> On 28 September 2017 at 17:35, <andreas.kling@gmail.com> wrote:
>>
>> From: Andy Kling <andreas.kling@peiker-cee.de>
>>
>>   This ensures pam plugins required by /etc/pam.d/systemd-user
>>   to open a user session are installed.
>>
>>   systemd[1]: Starting User Manager for UID 994...
>>   systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)
>>
>>   Drop package systemd-pam to prevent confusion.
>>   It is unused for a long time now.
>>
>> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>> ---
>>  v2: improve commit message
>>  v3: drop systemd-pam
>>  v4: move version info to annotation
>>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-core/systemd/systemd_234.bb
>> b/meta/recipes-core/systemd/systemd_234.bb
>> index 881896bfb5..acc4c4623b 100644
>> --- a/meta/recipes-core/systemd/systemd_234.bb
>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>> @@ -31,6 +31,12 @@ SRC_URI += " \
>>             "
>>  SRC_URI_append_qemuall = "
>> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>
>> +PAM_PLUGINS = " \
>> +    pam-plugin-unix \
>> +    pam-plugin-loginuid \
>> +    pam-plugin-keyinit \
>> +"
>> +
>>  PACKAGECONFIG ??= "xz \
>>                     ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux
>> ldconfig usrmerge', d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>> 'xkbcommon', '', d)} \
>> @@ -100,7 +106,7 @@ PACKAGECONFIG[importd] =
>> "--enable-importd,--disable-importd"
>>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>>  PACKAGECONFIG[manpages] =
>> "--enable-manpages,--disable-manpages,libxslt-native xmlto-native
>> docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>> -PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
>> +PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
>>  # Verify keymaps on locale change
>>  PACKAGECONFIG[xkbcommon] =
>> "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
>>  # Update NAT firewall rules
>> @@ -295,7 +301,6 @@ PACKAGES =+ "\
>>      ${PN}-kernel-install \
>>      ${PN}-rpm-macros \
>>      ${PN}-binfmt \
>> -    ${PN}-pam \
>>      ${PN}-zsh-completion \
>>      ${PN}-xorg-xinitrc \
>>      ${PN}-container \
>> --
>> 2.14.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

I'm still convinced this somehow must be my fault by editing the patch
with annotation. But no matter what I try, I can't get it to fail.
Downloading the original message from gmail, fetching the the patch
from patchwork. Using git mailinfo directly. Throwing different
options at it, looking at the mail content in hex, and so on. Even the
ugly cr/lf downloaded from gmail gets processed just fine.

I'm a little bit lost here. I appreciate any idea what could went
wrong. I'm also happy with any workaround you may use to make it work
at you side. Maybe I should just upload the patch again without
touching the file?

many thanks in advance

Andy

