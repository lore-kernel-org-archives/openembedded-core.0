Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 879CB6102B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 02:54:45 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m13so731953edb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Feb 2020 18:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7g9EvjwDMD3QcA+hPxeHtpxf0j7+6nYGRwaB9N02bf0=;
	b=JagIiNAbuokHFJSNVpn/uIpjIChFTGfsElBob4YInYIS6sxhZ2nhMuNjbBtuSWp2C0
	jTjKGNoHZfz7XLi/edLuJZUlJOIBrumgLDVb3eg1R2C3/MFTr/u1G2BZSc7Surp4JCoy
	UxyerI4RLobfHHwOfnKIIqjV4zVpcjee5AfhIkd4CI1KoqoVL/R7MN5859TQse6hFrmT
	KhSsWBPiAyI816ypr1zIayy2qMWjXzm4dVQ4gC7JzS5NlytQg7yLJegHSShOozPdv+ZV
	kENAQeJrl+dXgHcWTgb7tzkuF9KXZRG4TZpIQ5BDoWtamdwAt9I85FPwVYbBH8SDDT+l
	sJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7g9EvjwDMD3QcA+hPxeHtpxf0j7+6nYGRwaB9N02bf0=;
	b=bT5hDbhZzBHYMuj08pyxwfZjw0XNI3WyNjXbQVIn4KQUdZRoK4cDiRIc4T0dt8pX8r
	bPUaNk4aRkeZ8esFBdNj5oVHDFofqRTi8Tr18Vnp21bjrD4AvR6owJl3/9EXCE1jWScS
	0rbJVuZ+VPlioHnMUBGZfl6M3TieRuLkSL+s0Z/Ry7vh46+MCp0nhim+8t3cjKklVxUU
	AV4jZI/5lzaipql3wFCB8KkCpd26GvZFJSB91ypWSyP8GaSaOXgGyNqA5PsWN60BV1wP
	fA0fUXzeb/AZcafhozezNHp9ABStrFdYm5/z6RYYHAH9jL3ZJiABneYDL/rQV7QKrQk8
	njLQ==
X-Gm-Message-State: APjAAAWeaZ1xOY53gn1ev9ltnWYrQT01OUiESz9Ic36uM6z1MAVmmnnC
	wUPC/wESYYrHDpPff5tD6lkPwGEzJyfCdr6Jn2A=
X-Google-Smtp-Source: APXvYqzX6JPfnXAaksocZrFreK5iB3xK6+7aReUh51VAy8CPU49pzCUZMdIDUojNeX8mY5pqXIhOt3YOJzrtxDMAS40=
X-Received: by 2002:a17:906:4bd1:: with SMTP id
	x17mr28928058ejv.181.1580871286289; 
	Tue, 04 Feb 2020 18:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-4-Martin.Jansa@gmail.com>
In-Reply-To: <20200205024241.27828-4-Martin.Jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Feb 2020 21:54:35 -0500
Message-ID: <CADkTA4P-C8xPVcscM3DfUJ28KR19gcHW7s1X-dbU-5FN68+DaA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 02:54:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index 8053483355..28080e510f 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -11,16 +11,19 @@ PV = "0.2+git${SRCPV}"
>  inherit native
>
>  SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
> -S = "${WORKDIR}"
> +S = "${WORKDIR}/git"

While not common, this was on purpose.  This isn't something that is
typically patched, it is something I queue and bump for release.

So I'm ok with the cleanup, but I'll drop the patch tweaking part when
I queue for test, since I'll have the patch already in the repo.

Bruce

>  UPSTREAM_CHECK_COMMITS = "1"
>
> +do_configure() {
> +       :
> +}
> +
>  do_compile() {
>         :
>  }
>
>  do_install() {
> -       cd ${S}/git
> -       make DESTDIR=${D}${bindir} install
> +       oe_runmake DESTDIR=${D}${bindir} install
>  }
>
> -SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
> +SRC_URI += "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch"
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

