Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RphC1-0007M0-3c
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 15:17:49 +0100
Received: by lags15 with SMTP id s15so2313760lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 06:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qWSmNCRYCkDXcqKrE9cTAcmGUfCU0JMvsB1GgpurF0I=;
	b=ZamiabMqci8OZOu7qkFZYTx519RDPccXFhVEB30zrkXDdnQCL71EquoiRtKzLTCJoi
	S5BQD4Ni5lSAk5Vo96AscoBaObmyJzg8pWnhKpd8jEBssFi9OHqdL4TWZfN8klrDag4/
	8zgq0fXMBIkryeZMseOdYheYS0TnskPDunJfE=
MIME-Version: 1.0
Received: by 10.152.132.104 with SMTP id ot8mr2364930lab.17.1327414203657;
	Tue, 24 Jan 2012 06:10:03 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Tue, 24 Jan 2012 06:10:03 -0800 (PST)
In-Reply-To: <CALbNGRQuiOEWTZ5P5K-fHUYWBB61MVwkDnivCjZ9YzVaybnp8w@mail.gmail.com>
References: <20120124122907.DB5D710332@opal>
	<CALbNGRSdeB2GR0m=Jc_5qOpJBsU5Dbw_JwVb52gHr_wz9r74ug@mail.gmail.com>
	<CALbNGRQuiOEWTZ5P5K-fHUYWBB61MVwkDnivCjZ9YzVaybnp8w@mail.gmail.com>
Date: Tue, 24 Jan 2012 15:10:03 +0100
Message-ID: <CALbNGRRf7qoHY58maY=UxN4+ezuvuAKfv0jgjohC7nCvNyowSQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gcc-common.inc: Ensure WORKDIR doesn' t adversly affect sstate checksums
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
X-List-Received-Date: Tue, 24 Jan 2012 14:17:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 1:29 PM, <git@git.openembedded.org> wrote:
>
> Module: openembedded-core.git
> Branch: master
> Commit: 0de85d2ca3bc9674323302a35995dfddb6044a71
> URL: =A0 =A0http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D0de85d2ca3bc9674323302a35995dfddb6044a71
>
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date: =A0 Tue Jan 24 12:14:19 2012 +0000
>
> gcc-common.inc: Ensure WORKDIR doesn't adversly affect sstate checksums
>
> Changes in WORKDIR were changing the do_patch stamps between gcc-crosssdk
> and gcc-cross. This excludes the variable since in this case, we don't
> need want those changes to affect the signatures.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> ---
>
> =A0meta/recipes-devtools/gcc/gcc-common.inc | =A0 =A04 ++++
> =A01 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index ed41b0f..5ba68a0 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -105,3 +105,7 @@ do_headerfix () {
> =A0addtask headerfix after do_unpack before do_patch
>
> =A0do_headerfix[vardepvalue] =3D "PATH"
> +
> +# We need to ensure that for the shared work directory, the do_patch sin=
gatures match
> +The real WORKDIR location isn't a dependency for the shared workdir.
Oops^^
> +src_patches[vardepsexclude] =3D "WORKDIR"

Aargh: sent to wrong list again :(

Andreas


