Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 671A060402
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 22:22:58 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id m144-v6so14314159vke.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 15:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=PJLKWzhW1dp98hsxg4vyiOeu8gaLRfQDo8roHt3tMC4=;
	b=iygDq6jDZCTITvVaanL7ZmCiE3qjANV9HGgnnfXlFDrd04t9wZEqpwKWyYvCsKMXGO
	iELs6E3amQ+70gLOZlDvmFwIk3N7x8kFgcFJ+AHZv4BJj/ESaJoc3NQfTzoBGHK1EW0p
	LQDNKjCn2v4RbDIDfBLChUqHhS+ZmNp4WjX4O3G5ntUpKWw9fqb6Wlwm8yv+V9MTsTf+
	Ais6DRhBTP+1zlBwx8UvLSpwtY2HamavdSkOHKdqrZ65zUCWBxbDHPtty1+RxlMzpMqT
	ZG4JvIz0tWufQQ7ZzyTPu8HC+breD6dMCTGifWon8EwpbMlnkLar/ie19Rk+JKK0CNKz
	YRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=PJLKWzhW1dp98hsxg4vyiOeu8gaLRfQDo8roHt3tMC4=;
	b=LTwxvc+YbRwuxO2+b+zOOfB+nBjN+LOIgoZzVBz4x0WCmIgzUSJkrs+ihuzkgGw4Ob
	L54auL2MXEb9NQ4C54vfPmrDZhrch9ec/QSefOasbZjhWKU+gCbzLMpjMSCXE0YXkiw6
	PYmRqVXK0oqK0JpyZRXv/XhSQQgFc4+UFHVDJRi4dMN0A/qzGdcZoK/WTZ15YAcpZhmO
	LNC3xc1zUJpHz7f6iqJOPoEVVEthTAq+ZCpUa1siuBVARyb98GFLAP2LfpLJ2ZZJzy+W
	ArBElbwH0rN+sJZUVvNyHHKeilFrRoX9SUJPFkZgdkQwMTekfpyOlMgJCltx2XfJJCmM
	s/yg==
X-Gm-Message-State: ALKqPwc8pO/gm/0byUlnuEshaw0w71NEhHUoHO6M2L7st3zrwu7BtCb/
	As1xznQOIdrKLjwDTganj9tc/Swmh9V9y4IIuX0=
X-Google-Smtp-Source: ADUXVKLSDKTzrayWSFYb2cdo0qynqFx2gohee/PG9ZtKtVQ1dRqEUkoKx9jc3SCCRa5uvLPP1cdJsVT/3/LY/Wx7KJ4=
X-Received: by 2002:a1f:a7c7:: with SMTP id
	q190-v6mr5224679vke.5.1527805379060; 
	Thu, 31 May 2018 15:22:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Thu, 31 May 2018 15:22:58 -0700 (PDT)
In-Reply-To: <20180531200659.28877-1-twoerner@gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 31 May 2018 15:22:58 -0700
Message-ID: <CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Thu, 31 May 2018 22:22:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 31, 2018 at 1:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Instead of installing an entire recipe's build output (i.e. ${D}), allow =
the
> user to optionally specify a package from said recipe to be installed
> exclusively (i.e. ${PKGDEST}/<package>).

I'm not a big devtool user myself, but I'm curious about the
situations where you might need this?

Are the going to be problems if users want to deploy more than one
package (or switch between a full deploy and a package) and don't
deploy and undeploy in the right order?

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/lib/devtool/deploy.py | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.p=
y
> index 52e261d560..c022757519 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -169,11 +169,20 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -        recipe_outdir =3D rd.getVar('D')
> +        if args.package:
> +            recipe_outdir =3D os.path.join(rd.getVar('PKGDEST'), args.pa=
ckage)
> +        else:
> +            recipe_outdir =3D rd.getVar('D')
>          if not os.path.exists(recipe_outdir) or not os.listdir(recipe_ou=
tdir):
> -            raise DevtoolError('No files to deploy - have you built the =
%s '
> -                            'recipe? If so, the install step has not ins=
talled '
> -                            'any files.' % args.recipename)
> +            if args.package:
> +                raise DevtoolError('No files to deploy - have you built =
the %s '
> +                                'package of the %s recipe? If so, the in=
stall '
> +                                'step has not installed any files.'
> +                                % (args.package, args.recipename))
> +            else:
> +                raise DevtoolError('No files to deploy - have you built =
the %s '
> +                                'recipe? If so, the install step has not=
 installed '
> +                                'any files.' % args.recipename)
>
>          if args.strip and not args.dry_run:
>              # Fakeroot copy to new destination
> @@ -314,8 +323,8 @@ def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
>
>      parser_deploy =3D subparsers.add_parser('deploy-target',
> -                                          help=3D'Deploy recipe output f=
iles to live target machine',
> -                                          description=3D'Deploys a recip=
e\'s build output (i.e. the output of the do_install task) to a live target=
 machine over ssh. By default, any existing files will be preserved instead=
 of being overwritten and will be restored if you run devtool undeploy-targ=
et. Note: this only deploys the recipe itself and not any runtime dependenc=
ies, so it is assumed that those have been installed on the target beforeha=
nd.',
> +                                          help=3D'Deploy build output to=
 a live target machine',
> +                                          description=3D'Deploys either =
the full recipe\'s build output (i.e. the output of the do_install task) or=
 a package of a recipe to a live target machine over ssh. By default, any e=
xisting files will be preserved instead of being overwritten and will be re=
stored if you run devtool undeploy-target. Note: this only deploys the spec=
ified item itself and not any runtime dependencies, so it is assumed that t=
hose have been installed on the target beforehand.',
>                                            group=3D'testbuild')
>      parser_deploy.add_argument('recipename', help=3D'Recipe to deploy')
>      parser_deploy.add_argument('target', help=3D'Live target machine run=
ning an ssh server: user@hostname[:destdir]')
> @@ -325,6 +334,7 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-p', '--no-preserve', help=3D'Do not pre=
serve existing files', action=3D'store_true')
>      parser_deploy.add_argument('--no-check-space', help=3D'Do not check =
for available space before deploying', action=3D'store_true')
>      parser_deploy.add_argument('-P', '--port', help=3D'Specify port to u=
se for connection to the target')
> +    parser_deploy.add_argument('--package', help=3D'Specify a recipe\'s =
package to deploy', dest=3D'package')
>
>      strip_opts =3D parser_deploy.add_mutually_exclusive_group(required=
=3DFalse)
>      strip_opts.add_argument('-S', '--strip',
> @@ -337,8 +347,8 @@ def register_commands(subparsers, context):
>      parser_deploy.set_defaults(func=3Ddeploy)
>
>      parser_undeploy =3D subparsers.add_parser('undeploy-target',
> -                                            help=3D'Undeploy recipe outp=
ut files in live target machine',
> -                                            description=3D'Un-deploys re=
cipe output files previously deployed to a live target machine by devtool d=
eploy-target.',
> +                                            help=3D'Undeploy output file=
s from a live target machine',
> +                                            description=3D'Un-deploys ou=
tput files previously deployed to a live target machine by devtool deploy-t=
arget.',
>                                              group=3D'testbuild')
>      parser_undeploy.add_argument('recipename', help=3D'Recipe to undeplo=
y (if not using -a/--all)', nargs=3D'?')
>      parser_undeploy.add_argument('target', help=3D'Live target machine r=
unning an ssh server: user@hostname')
> --
> 2.17.0.582.gccdcbd54c
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

