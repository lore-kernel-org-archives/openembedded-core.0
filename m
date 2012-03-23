Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SB8sH-00022K-Si
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:06:05 +0100
Received: by wibhm17 with SMTP id hm17so1957012wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=M4DketV/Tk9lNUqLj1JdZ7WPQZOFSlqmCHD717UyC6Q=;
	b=IxjchEJNR4m0fhKn2FXmyGTTMJhSF9XloW9lCD4E1meP5gcuoOy0/rR9rftdspa8sV
	RCMbK4olewsiPCuo7ih6FqQEImXHV5DmTI+U1uIKp1oypJdnIvIpI9M3yIeXlkYxw4zD
	ZO7yhvPnT6JvnI9OUUrmunpjYJzhXm3+CCDc9I5zqoO4fNlY4t8OFPELneYyN90QRnJq
	6/s4zgzm/+GtU9llmDTuBEMqv+xPrkXuo8LJjBoe1OF0MkfTR/oettklV47lhvkwh5XJ
	MzKTMym0VJUetc/h3zf/6PIWxInA6mFbWAPSLmhxmSEb8n7zdLxV2aH9AlMrblUG2pbi
	dz3A==
MIME-Version: 1.0
Received: by 10.180.97.41 with SMTP id dx9mr8524593wib.9.1332525429655; Fri,
	23 Mar 2012 10:57:09 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 23 Mar 2012 10:57:09 -0700 (PDT)
In-Reply-To: <01d8d027e7f39cd61467348d17ab94e468164c84.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
	<01d8d027e7f39cd61467348d17ab94e468164c84.1332522200.git.bruce.ashfield@windriver.com>
Date: Fri, 23 Mar 2012 13:57:09 -0400
Message-ID: <CADkTA4PcxbK+Z7HpLj8fWvjBasGBE18MP=m9LBuByDP8bkUJHw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] linux-libc-headers: set default LINUXLIBCVERSION to 3.2
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
X-List-Received-Date: Fri, 23 Mar 2012 18:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 1:07 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Switch the default libc-headers to the 3.2 version.

I spoke to soon. I seeing a problem with iptables in the builds I left runn=
ing.
I know we looked at this just recently, so it may just be a matter of undoi=
ng
that fix.

I'm looking at it now, but waned to follow up right away.

Bruce

>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> =A0meta/conf/distro/include/tcmode-default.inc | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 28c25db..b481163 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ SDKGCCVERSION ?=3D "4.6%"
> =A0BINUVERSION ?=3D "2.22"
> =A0EGLIBCVERSION ?=3D "2.13"
> =A0UCLIBCVERSION ?=3D "0.9.33"
> -LINUXLIBCVERSION ?=3D "3.1"
> +LINUXLIBCVERSION ?=3D "3.2"
>
> =A0PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> =A0PREFERRED_VERSION_gcc-cross ?=3D "${GCCVERSION}"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


