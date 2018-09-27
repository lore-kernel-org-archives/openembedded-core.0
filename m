Return-Path: <erik.boto@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 02DE2745F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 06:59:17 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id b129-v6so1176478pga.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2018 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=HuInMlLmNyzoaCBKUZljDBTgEzPWiS6pm6CFD5kyFf4=;
	b=bBBU22MwEkSBExhlpDbrZGgfOxem7mH9vsj+h+m1OFauyquNKLVAMhvA28EqXLeOII
	om63TAk9Oy+RZ1RFZFuluVaw4c4qx5yufA88wPmUlfyWsMM0PGhuZdwhHYjmkYqQDm00
	XLd+gbxsXA9Rbv4YFKy1iojkzABw3ILdLhamn6Ey1GkJYZHd3p8JN+zVqOhkHBVnsxdq
	yFokfMIBRT0u1p0Qii/IfCb4gGVh8g4R8D5RPavPmW6mue+7Nh1VmyqF1E5csiLjwDhH
	nzqlA3MHTmLNALGZgqNwLXzFxllkHTltCNhgezKmmlmoW0Wm8tsWs8HddiEZFng5pzkA
	JdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=HuInMlLmNyzoaCBKUZljDBTgEzPWiS6pm6CFD5kyFf4=;
	b=LfVFvO/wEZnMdZ5pSE7u5lDJtqn6MC4ush+Rf0V+6Q+vyWXW0XBZ9dByHFP0/o/VH5
	/5wudWZMf1eVhCEwxsCTqWrrHHdnz0idyWcBTrJfC0xc0TIMKDr4caZQ1XAm3FFRKkKy
	erI8Tp4QRnClxzwsPhjPGHnRNCKvEOC8iuYRbyhUch4FGGw6/3qRG+2XN1LKktE+RXtv
	11rcLFZ2H3wCI//6ntobGZhaPYseQ1a2PgyJNMKeQjxtfNTxSL6MuHPpzHQ5dWVmrpvv
	bXUyC4vgJqO+Evu6OPae6J3yDJ/v5+DvSlStevZpkJwce77Qj/hLiQyqX0w4cr2PUnFN
	qv8Q==
X-Gm-Message-State: ABuFfogGhtrJ9/tVWoZKXPcx/uPW9/TcGXRfn5X0GrbnU7TKub29WM3Z
	OKqMN7j88OMd+PWyXIhj+B4bQiLK3g5d8V4jsuSScg==
X-Google-Smtp-Source: ACcGV63OhCOcQ/3N7FZw9YIC/XiJO79w4ib0taYTrG/sqU5t9Tvtr4Vp0VNQknA+3s5wF0abjlDUc7GXcgXvxXV7byY=
X-Received: by 2002:a17:902:722:: with SMTP id
	31-v6mr9363186pli.207.1538031558639; 
	Wed, 26 Sep 2018 23:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20180918093630.16280-1-erik.boto@gmail.com>
In-Reply-To: <20180918093630.16280-1-erik.boto@gmail.com>
From: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@gmail.com>
Date: Thu, 27 Sep 2018 08:59:07 +0200
Message-ID: <CALNvYWOMXFkGCjMisJqdDgb=7Lrgc1mVi-A5MT93Lc0KaZ0Cyw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2] testexport: Add support for testcase utils
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
X-List-Received-Date: Thu, 27 Sep 2018 06:59:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bumping this thread in hope to get some feedback.

Cheers,
Erik

On Tue, Sep 18, 2018 at 11:36 AM Erik Bot=C3=B6 <erik.boto@gmail.com> wrote=
:
>
> Add the possibility to ship a lib/oeqa/runtime/cases/utils directory
> that will be included in the generated testexport tarball.
>
> This makes it easier to split common functionality from test suites
> into modules that can be imported from multiple test suites.
>
> Signed-off-by: Erik Bot=C3=B6 <erik.boto@gmail.com>
> ---
>  meta/classes/testexport.bbclass | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bb=
class
> index d070f07afa..790ca3aff0 100644
> --- a/meta/classes/testexport.bbclass
> +++ b/meta/classes/testexport.bbclass
> @@ -74,6 +74,21 @@ def testexport_main(d):
>
>      copy_needed_files(d, tc)
>
> +def get_runtime_cases_utils_paths(d):
> +    """
> +    Returns a list of paths where testcase utils must reside. Utils can =
be e.g.
> +    common functionality used by multiple test cases.
> +
> +    Testcase utils are expected in <LAYER_DIR>/lib/oeqa/runtime/cases/ut=
ils/
> +    """
> +    paths =3D []
> +
> +    for layer in d.getVar('BBLAYERS').split():
> +        path =3D os.path.join(layer, 'lib/oeqa/runtime/cases/utils')
> +        if os.path.isdir(path):
> +            paths.append(path)
> +    return paths
> +
>  def copy_needed_files(d, tc):
>      import shutil
>      import oe.path
> @@ -121,6 +136,14 @@ def copy_needed_files(d, tc):
>          if json_file:
>              shutil.copy2(json_file, cases_path)
>
> +    # Copy cases/utils provided by layers
> +    utils_dest_path =3D os.path.join(export_path, 'lib', 'oeqa', 'runtim=
e', 'cases', 'utils')
> +    utils_source_paths =3D get_runtime_cases_utils_paths(d)
> +
> +    for f in utils_source_paths:
> +        if os.path.isdir(f):
> +            oe.path.copytree(f, utils_dest_path)
> +
>      # Copy test data
>      image_name =3D ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
>                              d.getVar('IMAGE_LINK_NAME')))
> --
> 2.19.0.rc1
>

