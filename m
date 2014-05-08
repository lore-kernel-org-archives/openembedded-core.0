Return-Path: <raj.khem@gmail.com>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 May 2014 19:25:50 UTC
Received: from mail-ig0-f175.google.com (unknown [209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id E691E60144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 19:25:50 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id uq10so210995igb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 12:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=40IEngj/06Gy/y2CR0LdY3PLoF16z5gQhCfrInWTlos=;
	b=PgP8sglgUOhAzoWJMNlgp39577V2UvGQlxMZ+i1AV4pHMTJPaZY/Ij4a3knmvNFmyI
	Qu/A/K/S0u+B0QbtikHHBmlpxxee93wNGr9jk8x/SPHsWb6MsEJwcPOEaTwLnr/YJjWd
	sW2cwzwXP/4ydagjhIJxh4m/Zf9nRYlg0ImB4rZ2uSTa2JCAIibmHHX4lQHZuevs6nBg
	Ebdgfqe6zYgp8pWXeD08uF395bVSNtC7I1YAboHEEFhDsWSFRWBJq9euQGT5ZjRq4vAU
	ZqGuHmxJlIFbBWJtvUoSyi3uhaqGoTsLvVkpxL6x0+XrYA5dWUBOBHXg9uwEsg5mNJep
	NTUQ==
X-Received: by 10.50.78.201 with SMTP id d9mr58442881igx.17.1399576654837;
	Thu, 08 May 2014 12:17:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Thu, 8 May 2014 12:17:04 -0700 (PDT)
In-Reply-To: <1399551060.31891.57.camel@ted>
References: <1399551060.31891.57.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 May 2014 12:17:04 -0700
Message-ID: <CAMKF1spg+BBr7fP9pfZi6p9dBEre5TMWVPxpZDoact_ZBHZP-g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix uclibc builds
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
X-List-Received-Date: Thu, 08 May 2014 19:25:51 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 8, 2014 at 5:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> +LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
> +EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"

I think we can drop class-target override. this was needed when libc
override arched into native recipes as well and
we would get attr-native compiled differently for uclibc and glibc but
thats been fixed

