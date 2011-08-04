Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Qp6qd-0007SX-FE
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 00:57:03 +0200
Received: by iyf13 with SMTP id 13so3729724iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=DRfIcYwPCsI6MZpPoEPgPaCQAh4iw9HwDqy9xsXX4l0=;
	b=FrU63y/IJNzRzqasqEfRCo0Gr+MORDI8tmt4IG7Oox48Uou6Dr7/vpomdR9DJKZmB8
	N8oPBk7B/LI6wsgCndGXsfdloPnE7rMjLbh6gTLLQ6Jw7daAmh9zsZy5zhP0G9erTPa6
	78d7vd8HjD+im5Gn2TEhkl68goz+7ekbdBqeQ=
MIME-Version: 1.0
Received: by 10.42.83.194 with SMTP id i2mr1195588icl.305.1312498358804; Thu,
	04 Aug 2011 15:52:38 -0700 (PDT)
Received: by 10.42.228.73 with HTTP; Thu, 4 Aug 2011 15:52:38 -0700 (PDT)
In-Reply-To: <aa5a0621a4d7110828517949f4c07221e62b068c.1312469790.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
	<e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<aa5a0621a4d7110828517949f4c07221e62b068c.1312469790.git.nitin.a.kamble@intel.com>
Date: Thu, 4 Aug 2011 15:52:38 -0700
Message-ID: <CA+M6bXnGxvjb7y23xss2epiaMXW3CWAK5Hq2ixPqM8iyATXuCA@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] local.conf.sample: make BBMASK assignment weak
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
X-List-Received-Date: Thu, 04 Aug 2011 22:57:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 4, 2011 at 8:01 AM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> So that it can be overridden by layers if needed.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =A0meta-yocto/conf/local.conf.sample | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local.co=
nf.sample
> index 3e71b0a..4acec37 100644
> --- a/meta-yocto/conf/local.conf.sample
> +++ b/meta-yocto/conf/local.conf.sample
> @@ -39,7 +39,7 @@ DISTRO ?=3D "poky"
>
> =A0# BBMASK is a regular expression that can be used to tell BitBake to i=
gnore
> =A0# certain recipes.
> -BBMASK =3D ""
> +BBMASK ?=3D ""
>
> =A0# EXTRA_IMAGE_FEATURES allows extra packages to be added to the genera=
ted images
> =A0# (Some of these are automatically added to certain image types)

In oe.dev we just dropped this from local.conf iirc since a real
assignmnet was overriding a useful setting we provided.  IMHO, we
should do the same here (or at least comment it out).

--=20
Tom


