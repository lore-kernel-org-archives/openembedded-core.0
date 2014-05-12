Return-Path: <drew@moseleynet.net>
Received: from mail-pa0-f44.google.com (unknown [209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F86E61F16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 22:31:42 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id ld10so9361083pab.31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 15:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=moseleynet.net; s=google;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=q4uQNqdKqMue8LAvJgfgmZNGnPwr/5IkZyxmaEJytbI=;
	b=PZrG7bQUpceNjkxeoDjp6XR/jkD1R/OuxJDixtCSxItOaniP/CQs/j9D2Bj0h+rYxK
	cFzBrxcB6OAoOJF9gL4khY2xOICMoyeW5cdymWU94yAv8xWh8rlv3ahdjSgalDsCEPIc
	top8J0vGRoNxc014CqZ3RKLFsrJyRR2kgVq3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=q4uQNqdKqMue8LAvJgfgmZNGnPwr/5IkZyxmaEJytbI=;
	b=c81KUeEwgO41EArGZHT0j7Te5W3FJtxZ3IcKZLx5hSOjiLRL1H4/XkAUtiaBGgDC7J
	FJ86dFYpypqMNuEr3X9gbR1vmRf4IrAD4aN/B05wh+mbi1hi9KVaaSEjpzkb/wf+X14a
	0UptsAEEttbEU74fCOTSybj/6TzsKihKSOBJKe2Hut+Gmr3JD5d6ieTBCIhBkhMvaurD
	FnzgLunAkcSgqBfaWeUWcgojJfh7Q1H5Am5022Wo4yY+OR57DEum1Fp6sbAWt0XeWdTQ
	XrHFIFH34YkkUFjT3FX3ge6g1DNXAd+Z0QufCgUfhoFDDnAvLJ/kvqYHVhLDqg6hwwjY
	TRbA==
X-Gm-Message-State: ALoCoQnf35pomfikrWt3QOqF6v95W7NA04hcO1tcAhqi+IuX31ub2bmEXAQ4XFuccY6UAF5ztk+k
X-Received: by 10.66.162.74 with SMTP id xy10mr60132958pab.4.1399933593372;
	Mon, 12 May 2014 15:26:33 -0700 (PDT)
Received: from [192.168.1.33] (cpe-174-096-222-251.carolina.res.rr.com.
	[174.96.222.251]) by mx.google.com with ESMTPSA id
	cj1sm53257364pac.40.2014.05.12.15.26.32 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 May 2014 15:26:32 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Drew Moseley <drew@moseleynet.net>
In-Reply-To: <1399930965.31891.143.camel@ted>
Date: Mon, 12 May 2014 18:26:29 -0400
Message-Id: <E9FBD9C7-053A-4320-B910-F606E78C1C74@moseleynet.net>
References: <537110BF.3000109@linux.intel.com>
	<1399925446-28631-1-git-send-email-drew@moseleynet.net>
	<1399930965.31891.143.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa-demos: Specify the lib dir properly.
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
X-List-Received-Date: Mon, 12 May 2014 22:31:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On May 12, 2014, at 5:42 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2014-05-12 at 16:10 -0400, \Drew Moseley wrote:
>> From: Drew Moseley <drew_moseley@mentor.com>
>>=20
>> Use STAGING_EXECPREFIXDIR to specify the location of glut
>> header files and libs rather than STAGING_LIBDIR.
>>=20
>> Also revert the previous unneeded change to glut.patch.
>>=20
>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>> ---
>> meta/recipes-graphics/mesa/mesa-demos/glut.patch |    2 +-
>> meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb   |    2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> Is this change multilib safe?
>=20
> It looks to me like this hardcodes "lib" and things like "lib64" or
> "lib32" would be an issue since it wouldn't honour $libdir?
>=20
> Cheers,
>=20
> Richard

Sort of.  This is essentially putting the code back to what it was =
yesterday
which was hardcoded to /lib.  It doesn't affect Yocto builds since the
"--sysroot" option makes the directories specified here redundant.  I =
have
verified the libraries are properly located even when installed in =
usr/lib64.

Ultimately this should probably be cleaned up in the upstream mesa-demos
by adding a "--with-glut-includes" and "--with-glut-libs" or some such =
but
this is at least less broken than it was before   Previously setting =
"glut"
in the packageconfig would pass "--with-glut" to configure resulting in
the build failure:

> ../../x86_64-mel-linux-libtool: line 6012: cd: yes/lib: No such file =
or directory
> x86_64-mel-linux-libtool: link: cannot determine absolute directory =
name of `yes/lib'
> make[2]: *** [libutil.la] Error 1

Drew


