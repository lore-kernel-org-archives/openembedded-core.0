Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 001C774F37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 17:12:01 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id a14-v6so12808444pfi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 10:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=c0EKLH9GENV7a5b1+yy/g/hw91J0QqNZF3PnrtCt4ko=;
	b=Hnv8lmXYEtrHgY4mM9NY7eu7Wjau+SC6Dejc9FNRZPsDToJdRhEL/V8xvoSMA6sqYx
	HnWvnqdBKJcn5/++gw9U4hjPrih/t+lUp+JPvBfB0zvN1aqFfSohzeZNYmapwGLoTtsm
	ImLrfmNa/n4+5fnUebRGQ/+cczD5CATyD4bWdvMGb3DRHPVyW2+K3DEDhcyh3N5hoPs/
	qs9AgOzXfe0E6fLomUYf1B1+W2evUSctC3haE6MD8S9rL9XeGab5uQcUTMg2H0YlfT6x
	q7s/+AWRxwqalf9S1/nxtGdE35SGcsZ4x2mDEi5wFaRfsKY9R2XBfR1F1ZbSooX+nItN
	f6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=c0EKLH9GENV7a5b1+yy/g/hw91J0QqNZF3PnrtCt4ko=;
	b=mOawZlvhNoJOlDVWVd1QXu4wbFXRGwf3LFaeA3OWosb+ggbe8mJPLKTfQ88jpILQf2
	cvtqVOQZ9HqTcEQ4Q7LnewNbNZ7VxpbJ+Yh1HvyWX3sCibkqlyXSPVciYglrCvgALb9+
	5zc2AL7A91PlI1IzNOnWafqAxf9u+ncBgzomn0IZ+hEYBTJb/nNCRnO4HzFQq0Na9pKU
	mNahRRxamdCY8fhJ5fmN4T1RLSXKqTj/AgDnzL8bdOU6PBhwuyNsM12eOKCjO33RvXla
	mlbsEtwkog+KPJjrPd7vT8ALz7Q0z+gkLyYBVoWrZmZ4hCIh+Ex4ZH5xXKDbiJfF8q5h
	sP5w==
X-Gm-Message-State: ALKqPwd2eSvYgF2D7VgIbUp9NyXTlkxcKf7OkpQK4Mscz1N/pgpWc9Nj
	OWb/kDBTDGZbnRGgj6EVpBw=
X-Google-Smtp-Source: ADUXVKLiwn0FnK8IfAb5wKjW2rMJUQU7KahsTnplNRAOkvuDHqgEBkFjUdBs0o3aBhp9EViUA+tk/Q==
X-Received: by 2002:a63:7b1e:: with SMTP id
	w30-v6mr9574685pgc.249.1527873122875; 
	Fri, 01 Jun 2018 10:12:02 -0700 (PDT)
Received: from ?IPv6:2601:646:877f:9499:2ca8:85c9:c335:d6ec?
	([2601:646:877f:9499:2ca8:85c9:c335:d6ec])
	by smtp.gmail.com with ESMTPSA id
	g80-v6sm889658pfd.21.2018.06.01.10.12.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Jun 2018 10:12:02 -0700 (PDT)
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20180531200659.28877-1-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5e1d741f-e9a9-db4b-4a31-14d8367b3d5b@gmail.com>
Date: Fri, 1 Jun 2018 10:11:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20180531200659.28877-1-twoerner@gmail.com>
Cc: paul.eggleton@linux.intel.com
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
X-List-Received-Date: Fri, 01 Jun 2018 17:12:02 -0000
X-Groupsio-MsgNum: 112029
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="g0bI1WORQsHmsdP8PFSAMmoi0J4VSVzMY"

--g0bI1WORQsHmsdP8PFSAMmoi0J4VSVzMY
Content-Type: multipart/mixed; boundary="7YtBhZsg23rLMaZLJtIKFDHJeKFpozIeE";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: paul.eggleton@linux.intel.com
Message-ID: <5e1d741f-e9a9-db4b-4a31-14d8367b3d5b@gmail.com>
Subject: Re: [OE-core] [devtool][PATCH] devtool deploy-target: optionally
 specify package
References: <20180531200659.28877-1-twoerner@gmail.com>
In-Reply-To: <20180531200659.28877-1-twoerner@gmail.com>

--7YtBhZsg23rLMaZLJtIKFDHJeKFpozIeE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/31/18 1:06 PM, Trevor Woerner wrote:
> Instead of installing an entire recipe's build output (i.e. ${D}), allo=
w the
> user to optionally specify a package from said recipe to be installed
> exclusively (i.e. ${PKGDEST}/<package>).
>=20

Thinking of developer's workflow, it might be needed to be able to
install debug/dev packages to debug the package on device.

although I think we should be able to segment it and may be have an
option to install the dev part separately

> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/lib/devtool/deploy.py | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
>=20
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy=
=2Epy
> index 52e261d560..c022757519 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -169,11 +169,20 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -        recipe_outdir =3D rd.getVar('D')
> +        if args.package:
> +            recipe_outdir =3D os.path.join(rd.getVar('PKGDEST'), args.=
package)
> +        else:
> +            recipe_outdir =3D rd.getVar('D')
>          if not os.path.exists(recipe_outdir) or not os.listdir(recipe_=
outdir):
> -            raise DevtoolError('No files to deploy - have you built th=
e %s '
> -                            'recipe? If so, the install step has not i=
nstalled '
> -                            'any files.' % args.recipename)
> +            if args.package:
> +                raise DevtoolError('No files to deploy - have you buil=
t the %s '
> +                                'package of the %s recipe? If so, the =
install '
> +                                'step has not installed any files.'
> +                                % (args.package, args.recipename))
> +            else:
> +                raise DevtoolError('No files to deploy - have you buil=
t the %s '
> +                                'recipe? If so, the install step has n=
ot installed '
> +                                'any files.' % args.recipename)
> =20
>          if args.strip and not args.dry_run:
>              # Fakeroot copy to new destination
> @@ -314,8 +323,8 @@ def register_commands(subparsers, context):
>      """Register devtool subcommands from the deploy plugin"""
> =20
>      parser_deploy =3D subparsers.add_parser('deploy-target',
> -                                          help=3D'Deploy recipe output=
 files to live target machine',
> -                                          description=3D'Deploys a rec=
ipe\'s build output (i.e. the output of the do_install task) to a live ta=
rget machine over ssh. By default, any existing files will be preserved i=
nstead of being overwritten and will be restored if you run devtool undep=
loy-target. Note: this only deploys the recipe itself and not any runtime=
 dependencies, so it is assumed that those have been installed on the tar=
get beforehand.',
> +                                          help=3D'Deploy build output =
to a live target machine',
> +                                          description=3D'Deploys eithe=
r the full recipe\'s build output (i.e. the output of the do_install task=
) or a package of a recipe to a live target machine over ssh. By default,=
 any existing files will be preserved instead of being overwritten and wi=
ll be restored if you run devtool undeploy-target. Note: this only deploy=
s the specified item itself and not any runtime dependencies, so it is as=
sumed that those have been installed on the target beforehand.',
>                                            group=3D'testbuild')
>      parser_deploy.add_argument('recipename', help=3D'Recipe to deploy'=
)
>      parser_deploy.add_argument('target', help=3D'Live target machine r=
unning an ssh server: user@hostname[:destdir]')
> @@ -325,6 +334,7 @@ def register_commands(subparsers, context):
>      parser_deploy.add_argument('-p', '--no-preserve', help=3D'Do not p=
reserve existing files', action=3D'store_true')
>      parser_deploy.add_argument('--no-check-space', help=3D'Do not chec=
k for available space before deploying', action=3D'store_true')
>      parser_deploy.add_argument('-P', '--port', help=3D'Specify port to=
 use for connection to the target')
> +    parser_deploy.add_argument('--package', help=3D'Specify a recipe\'=
s package to deploy', dest=3D'package')
> =20
>      strip_opts =3D parser_deploy.add_mutually_exclusive_group(required=
=3DFalse)
>      strip_opts.add_argument('-S', '--strip',
> @@ -337,8 +347,8 @@ def register_commands(subparsers, context):
>      parser_deploy.set_defaults(func=3Ddeploy)
> =20
>      parser_undeploy =3D subparsers.add_parser('undeploy-target',
> -                                            help=3D'Undeploy recipe ou=
tput files in live target machine',
> -                                            description=3D'Un-deploys =
recipe output files previously deployed to a live target machine by devto=
ol deploy-target.',
> +                                            help=3D'Undeploy output fi=
les from a live target machine',
> +                                            description=3D'Un-deploys =
output files previously deployed to a live target machine by devtool depl=
oy-target.',
>                                              group=3D'testbuild')
>      parser_undeploy.add_argument('recipename', help=3D'Recipe to undep=
loy (if not using -a/--all)', nargs=3D'?')
>      parser_undeploy.add_argument('target', help=3D'Live target machine=
 running an ssh server: user@hostname')
>=20



--7YtBhZsg23rLMaZLJtIKFDHJeKFpozIeE--

--g0bI1WORQsHmsdP8PFSAMmoi0J4VSVzMY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCWxF+XAAKCRC7BTNVkZ0z
FEeMAKCCv8KHd6l1bFlq9DvDt4flFnOMjQCeL+5Kradf2NYJ7oeuqIrWdo9cKqU=
=bkBU
-----END PGP SIGNATURE-----

--g0bI1WORQsHmsdP8PFSAMmoi0J4VSVzMY--
