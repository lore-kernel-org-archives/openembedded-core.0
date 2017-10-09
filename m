Return-Path: <andreas.kling@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1446E5FC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 19:00:53 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id q75so7126210vkf.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:cc; 
	bh=cjFgtfu6xu5oQ7sQXBFZuuCw/hHRWrSeJKpqYIeLgZg=;
	b=pib4Gmlza89Ze2vYkNElopktoG1rfmGRHL8JEY9Bvm8hvSKmdvKTdzHJlIyYDVmiZ4
	AVQBnrVq+JdIM4sW8pJKz6NGXGZe8SXBqUrc0Z6elRPnlQMSS0uwoR2/261SzVg5+xsV
	tBGFr4curihPQzyRU5FLl/vecaJkoHxx6cxCphrUvHA7jFHOVER61J+Bb9eiawDK3ytX
	+PRR3n/MNZ6RO/i9h7zIRZEnQMeV6vw2tJKWYyCWKs5FnHRJmWWVWjDsrpTvO9c8THYK
	FmsLdrFkzzivNyjSoYx1AyaGgUULMqNuM0rQTmMmE0ZaiX9A+jM2hpgoclKSOzRvUijK
	tL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:cc;
	bh=cjFgtfu6xu5oQ7sQXBFZuuCw/hHRWrSeJKpqYIeLgZg=;
	b=EILU4b06/i03A7hSgK1ZkpDhJ+vQhyKm5TG1ZrgwLaES6q8WIc/QWjZNOHAz4sKaK6
	SpfoNTZ9YhqpWs9TKjCaymt8x7KpP5lLEJMG6JlbJwolMFyPgC9HQUxsMFmaZnpnNNaO
	criH5mM8HZsVKjxRo9iwpvvHWDOiSb8wrl2p4fL4+hlSa9XwfeoA8M64n1OixFU0tlZz
	y4FMt7ouC5jY3siPCoIonaH757P99DMiLxvCFVh6Fe58j6Eb56N6qLzXdO4YT3F9esBQ
	Vvf1j4C1rVl4U7aa++o1KGgOQM0/88l4RstEZi/fu3hoqQ/LkIfiXXRGWs0nFheVMSGV
	K2yw==
X-Gm-Message-State: AMCzsaXVENFEDLbkOd2dAxuWTqzDUfMvV92Qky6+A9MoQ6+PEZdv8L6U
	eip76bGCvy3V1Eq6ing+OKXIPbkAYbO45CYxfdrbXg==
X-Google-Smtp-Source: AOwi7QAMEPmZMUhzLEJc3TJX8uTBqJ+md9I7dtAzkfu+cC+cI7XdZ7gjE89iQbGCYYVWDXu1wtbsUMAfEklmzarjwrU=
X-Received: by 10.31.12.200 with SMTP id 191mr4939509vkm.73.1507575654271;
	Mon, 09 Oct 2017 12:00:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.147.214 with HTTP; Mon, 9 Oct 2017 12:00:53 -0700 (PDT)
In-Reply-To: <CAE-gg=5Wq6K4JdNpscupPVAHi+cY1Npo8_Ajt17uNMNbA0ZY=g@mail.gmail.com>
References: <20170927094014.2666-1-andreas.kling@gmail.com>
	<20170928163521.21828-1-andreas.kling@gmail.com>
	<CAJTo0LaWULzrFRwq+7Pwnv-_Py5-AHAYuKoc9iT61q1iuMLNFg@mail.gmail.com>
	<CAE-gg=5Wq6K4JdNpscupPVAHi+cY1Npo8_Ajt17uNMNbA0ZY=g@mail.gmail.com>
From: Andy <andreas.kling@gmail.com>
Date: Mon, 9 Oct 2017 21:00:53 +0200
Message-ID: <CAE-gg=4JFemmp8hXEz-+OfftE1MCrX3Snwd+SwDaFfDtRk3-EA@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Oct 2017 19:00:53 -0000
Content-Type: text/plain; charset="UTF-8"

2017-10-02 20:06 GMT+02:00 Andy <andreas.kling@gmail.com>:
> 2017-09-29 18:31 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
>> I wish I knew why git was ignoring the commit message entirely when
>> applying...  It's ignoring everything apart from the SOB:
>>
>> $ git show
>> commit 079754f2681ded614c5ee90e61f4ddbd8407998a
>> Author: andreas.kling@peiker-cee.de <andreas.kling@peiker-cee.de>
>> Date:   Thu Sep 28 18:35:21 2017 +0200
>>
>>     systemd: add runtime dependencies to pam plugins.
>>
>>     Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>
>> Ross
>>
>> On 28 September 2017 at 17:35, <andreas.kling@gmail.com> wrote:
>>>
>>> From: Andy Kling <andreas.kling@peiker-cee.de>
>>>
>>>   This ensures pam plugins required by /etc/pam.d/systemd-user
>>>   to open a user session are installed.
>>>
>>>   systemd[1]: Starting User Manager for UID 994...
>>>   systemd[6493]: PAM unable to dlopen(/lib/security/pam_keyinit.so)
>>>
>>>   Drop package systemd-pam to prevent confusion.
>>>   It is unused for a long time now.
>>>
>>> Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
>>> ---
>>>  v2: improve commit message
>>>  v3: drop systemd-pam
>>>  v4: move version info to annotation
>>>  meta/recipes-core/systemd/systemd_234.bb | 9 +++++++--
>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-core/systemd/systemd_234.bb
>>> b/meta/recipes-core/systemd/systemd_234.bb
>>> index 881896bfb5..acc4c4623b 100644
>>> --- a/meta/recipes-core/systemd/systemd_234.bb
>>> +++ b/meta/recipes-core/systemd/systemd_234.bb
>>> @@ -31,6 +31,12 @@ SRC_URI += " \
>>>             "
>>>  SRC_URI_append_qemuall = "
>>> file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
>>>
>>> +PAM_PLUGINS = " \
>>> +    pam-plugin-unix \
>>> +    pam-plugin-loginuid \
>>> +    pam-plugin-keyinit \
>>> +"
>>> +
>>>  PACKAGECONFIG ??= "xz \
>>>                     ${@bb.utils.filter('DISTRO_FEATURES', 'efi pam selinux
>>> ldconfig usrmerge', d)} \
>>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>>> 'xkbcommon', '', d)} \
>>> @@ -100,7 +106,7 @@ PACKAGECONFIG[importd] =
>>> "--enable-importd,--disable-importd"
>>>  PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
>>>  PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
>>>  PACKAGECONFIG[manpages] =
>>> "--enable-manpages,--disable-manpages,libxslt-native xmlto-native
>>> docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>>> -PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam"
>>> +PACKAGECONFIG[pam] = "--enable-pam,--disable-pam,libpam,${PAM_PLUGINS}"
>>>  # Verify keymaps on locale change
>>>  PACKAGECONFIG[xkbcommon] =
>>> "--enable-xkbcommon,--disable-xkbcommon,libxkbcommon"
>>>  # Update NAT firewall rules
>>> @@ -295,7 +301,6 @@ PACKAGES =+ "\
>>>      ${PN}-kernel-install \
>>>      ${PN}-rpm-macros \
>>>      ${PN}-binfmt \
>>> -    ${PN}-pam \
>>>      ${PN}-zsh-completion \
>>>      ${PN}-xorg-xinitrc \
>>>      ${PN}-container \
>>> --
>>> 2.14.2
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>
> I'm still convinced this somehow must be my fault by editing the patch
> with annotation. But no matter what I try, I can't get it to fail.
> Downloading the original message from gmail, fetching the the patch
> from patchwork. Using git mailinfo directly. Throwing different
> options at it, looking at the mail content in hex, and so on. Even the
> ugly cr/lf downloaded from gmail gets processed just fine.
>
> I'm a little bit lost here. I appreciate any idea what could went
> wrong. I'm also happy with any workaround you may use to make it work
> at you side. Maybe I should just upload the patch again without
> touching the file?
>
> many thanks in advance
>
> Andy

jfyi

this was change in git [1] and landed in v.2.13.0. I won't indent the
body in the future to prevent this.

thx for fixing it up

[1] https://github.com/git/git/commit/fd1062e52e1a7ed3be443a320708ed849958c1bf

