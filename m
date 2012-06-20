Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1ShMfJ-00010C-8N
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 17:17:53 +0200
Received: by eekd49 with SMTP id d49so2528436eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=WlbdiVIw6//On4OGQ/ATIk+PmLs28Qi2yyzfbP2ib78=;
	b=Y4fkaNQfW9FL9fMv6ALLJ5TkjHpt3/Yzza30ZnmNcO9ap8vQGW7/z6PIS6Ldi2DWMj
	ITSqpzl4Z6IXGvkSs6wibETXPtFZi/aS7784FvezqLDpu/PGlFIUgqJ8ZIHQ0fHm7YzG
	30q0CcC56xxxi4/zGlBmguiZKhrxIBxH/ou7+vCVxM67t8KvcHlbjFd5ACU2GHIhEKvd
	6ZQF2IvNUlnkVeEjwi7YNdlFBsW6dUG/vzK4jKD1V3e1GbnYvLlKGaiD6xCMc4jbumvq
	5G77P6q0gIhx643wPvGKCdD8nFFdkZ0XmYoq4iloup/WOG/Zn+84yFyNBpN4NnyLtAK5
	TTPw==
Received: by 10.14.95.138 with SMTP id p10mr5350184eef.110.1340204828407; Wed,
	20 Jun 2012 08:07:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Wed, 20 Jun 2012 08:06:38 -0700 (PDT)
In-Reply-To: <4FE1BE46.4080507@linaro.org>
References: <4FE0684D.2000906@linaro.org> <4FE0714A.1060603@linaro.org>
	<CAMKF1spK-ezqmFr+rh7J5dcbVvPbpDFGHxW02HvX9uaWdqTohQ@mail.gmail.com>
	<4FE0A7DF.7030909@linaro.org>
	<CAMKF1so50NhTxaeeghsH8ogD=HUgmGDjR8rnh4yPbYv0JaU5tA@mail.gmail.com>
	<4FE1BE46.4080507@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Jun 2012 08:06:38 -0700
Message-ID: <CAMKF1soz9pS0bGxh3i2Z03XsXnP0Fy1Vma9C7=8E25t1zEQX1A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Is target toolchain supposed to be working?
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
X-List-Received-Date: Wed, 20 Jun 2012 15:17:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 5:12 AM, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>>
>> can you try the fixes from my branch
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/misc=
-updates
>>
>> =C2=A0this should fix both gcc and binutils on target
>
> I am still building one image from scratch but my build with gcc-linaro
> and your fix-g++-sysroot.patch applied works perfectly:

thx


