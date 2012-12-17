Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bjorn.forsman@gmail.com>) id 1Tkh40-0003Ct-Uq
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 21:13:24 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3336661eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 11:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=tFlDdkBxvvnIGs7S+stOt1/qnFgLgJniKlcVC9iGlfY=;
	b=eKA2F8ZYT5QBshdvbxabmIM1fsrtezzx2aqA7FUXml0FWgJn05gFyH3bulmqvq7QWl
	XNW2eU7rdv6ahU7bZ60rxuwcVXvzAtwSO1LbAz9dSGiGabmLpJy8934zy6DkTSWRrCG/
	Ugn5z7X3zj1iTOQxrTHPjawT77EuaD4ir7Uz2r3PPHFxoRvWJ7Tmawd4NXKw9RwWS7yo
	uCg7OTHxNkgKw7ScXYDmZK33W9c5TdiB8vK6rp3guK87EA0Jfu0S4MGEi6fjyV1GYWef
	DilpCYlG7RakuDkqVKkSJH76utCL2TrZzMM6j3OpsO5e+0UgH6kXa0d2nExe9STJZQ89
	Zgeg==
MIME-Version: 1.0
Received: by 10.14.206.197 with SMTP id l45mr43870453eeo.17.1355774324271;
	Mon, 17 Dec 2012 11:58:44 -0800 (PST)
Received: by 10.14.135.145 with HTTP; Mon, 17 Dec 2012 11:58:44 -0800 (PST)
In-Reply-To: <50CF3D03.3040301@windriver.com>
References: <CAEYzJUHZYS8cA3KRRM2L+etHxAOxaU=vBzgaRbUc9hSg8AJODA@mail.gmail.com>
	<50CF3D03.3040301@windriver.com>
Date: Mon, 17 Dec 2012 20:58:44 +0100
Message-ID: <CAEYzJUGVz4DTiqa8V6tOtQCg53C4TQ_zPb5jh6gEWks1+xP4vg@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SDK confusion!
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Dec 2012 20:13:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On 17 December 2012 16:40, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 12/17/12 9:31 AM, Bj=C3=B8rn Forsman wrote:
>> Hi,
>>
>> I'm really confused about how to use/customize the generated SDK in
>> openembedded. I've spent two days messing around with angstrom
>> setup-scripts, poky and yocto and now I really need help.
[...]
> In oe-core with the branch tag 'denzil' or the master, there are two ways=
 of
> generating an SDK.
>
> The first (which is also present in the older oe-core systems) uses a
> specific SDK recipe.  For instance, meta-toolchain.  This recipe simply
> makes the toolchain elements available to you and you need to provide the
> necessary sysroot for your SDK.  An alternative is something like
> meta-toolchain-gmae which provides a specific set of sysroot components f=
or
> the 'gnome mobile applicable environment.'
>
> The advantage of this first way is it allows a product designer to releas=
e a
> targeted SDK for their application developers.  You don't have to put
> everything that will end up on the target image into the SDK, only the
> libraries, headers and interfaces that an app developer are allowed to us=
e.
>
> The second way (which is newer) is the ability to generate an SDK based o=
n
> the contents of the image.  This uses a new task called "populate_sdk" th=
at
> can be run with any image recipe, i.e. "bitbake core-image-minimal -c
> populate_sdk". This will generate an SDK image that includes the software
> from the image, in addition to related -dev and -dbg packages.
>
> The advantage of this second way is that you have an SDK that enables
> developing for the contents of the image, as well as system wide
> cross-debugging with the -dbg packages.
>
> The items below are specific to one packaging system, opkg.  The items ab=
ove
> are generic and are expected to work in any of the supported methods.

Thank you very much!

"bitbake <image-name> -c populate_sdk" is exactly what I want. Brilliant!

Best regards,
Bj=C3=B8rn Forsman


