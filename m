Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6367C364
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 11:30:17 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t27so14800010wra.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2019 03:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=XVk6vgLfgcCQB0rpAlIcqnnl8xJQSRJ3hFHuONCxoYw=;
	b=JU3TepPD1d7omexfsbu79RjYnZ0+3OSVHCT1RIofyDxtWqAilS6XUk2DuJAsKANW8T
	nPyCx6faVHtCwh4UzwAZFz6ws/28LK1k/b1WoXU3GX5a8a8ANLuImMQfiNR+07GkfED0
	rISex1Vm27YWcwBC6NaN+qzpFf2pbsvokq84U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XVk6vgLfgcCQB0rpAlIcqnnl8xJQSRJ3hFHuONCxoYw=;
	b=oBFUJUaYVFH9uSy+WhlGqwY15qtEVozHGYAgUuIVRKlfzA/oEZgd6NoYy+7463BDqS
	aEabtY65ZfA0BrmuvnlVkt/ZcsyxPqRCbeqNdxYof9LkLKr5JpqeSrzzi3iFKjOZcPMm
	vSefUp2OYAQa7z60OmCh5cIBUrjdsLKHi/XtOQpAaiMSqUBSht50YzEXRJZp6fdGq55L
	WLXzRm37r0nnzyprhwY/iIGbTV+alf5QSVDSqE+pNaWnj38G1VrJFo/hTfWvlAhHgSUL
	ukgpD1Bo0QioSF3t59W8NsuJoTrLCVL0gm8LdH25F1M49h1pZWr8+AEjJuMQpBaLOmZN
	3tmw==
X-Gm-Message-State: AJcUukdOqkid91kfxPs0RQqN1jVH4ylyfvT6JWF1ZIN1Y1CL+SeS7q/F
	MoNDyHmpOrUus1xSMCXvZysuSQ==
X-Google-Smtp-Source: ALg8bN44klZuci4Ps2n14q1TQzZxxWAqlLzsbW/+/UjLrzGSLAM3Anp6ZYbgomTzro81grehiLYing==
X-Received: by 2002:adf:ef0d:: with SMTP id e13mr17701962wro.29.1548588618225; 
	Sun, 27 Jan 2019 03:30:18 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y34sm293888268wrd.68.2019.01.27.03.30.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 27 Jan 2019 03:30:17 -0800 (PST)
Message-ID: <36f7ba4804dc111d4ffa90d8b6b75c6bf354d3ba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2019 11:30:15 +0000
In-Reply-To: <CAJkqNs0KdJaZxOxvLE08n3HA3KrgtwQar26wibu1PtC0cVC6iA@mail.gmail.com>
References: <CAJkqNs0KdJaZxOxvLE08n3HA3KrgtwQar26wibu1PtC0cVC6iA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] gcc-shared-source: Fix devtool missing patch/unpack tasks
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
X-List-Received-Date: Sun, 27 Jan 2019 11:30:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2019-01-27 at 00:26 +0100, Tomasz Dziendzielski wrote:
> Devtool needs to execute these tasks so we cannot disable them
> but if SRC_URI is empty we don't need to disable them anymore.
> 
> Setting EXTERNALSRC so devshell can find the shared gcc sources.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13036
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-shared-source.inc | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> index aac4b49313..bc49e95a3a 100644
> --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> @@ -1,11 +1,6 @@
> -do_fetch() {
> -   :
> -}
> -do_fetch[noexec] = "1"
> -deltask do_unpack
> -deltask do_patch
> -
>  SRC_URI = ""
> 
>  do_configure[depends] += "gcc-source-${PV}:do_preconfigure"
>  do_populate_lic[depends] += "gcc-source-${PV}:do_unpack"
> +
> +EXTERNALSRC_pn-${PN} = "${S}"

You emailed me offlist and asked why we did this. I tried to explain
why and that we really do want to delete those tasks.

Let me try again.

gcc shared source is valuable because its large and we really don't
want to create many different copies of it (there are a ton of gcc
derived recipes which share this).

The presence of a task means it has a task checksum. Getting the
checksums of these tasks to match is hard as it has to match between
native, cross, crosssdk, target and multilib variants.

We used to do something similar to the above where we had the tasks and
just tried to make them "always match". It was basically a nightmare
and we switched to the standalone source recipe model.

Back in time, the simplest way to make this work and be very sure
nothing would break it was for the tasks simply not to exist. If I
remember rightly there are patches from a few years ago dealing with
horrible races around the patch tasks where they'd still try and
"unapply" patches from ${S} at the start of the patch task since there
were no patches in SRC_URI. We would have removed the fetch task as
well however there are(were?) assumptions about that existing which we
couldn't avoid. I suspect that could be deleted as well now.

If you want devtool to work with the gcc recipes, we'll need to teach
it to handle this kind of case. We are not hacking it by doing this and
adding a misleading/incorrect EXTERNALSRC entry. Breaking the gcc
recipes to fix devtool is not the way to resolve this. The above *will*
break gcc in subtle ways such as "random" patch removal in rebuilds )or
cleaning out ${S} at the start of do_unpack.

Cheers,

Richard


