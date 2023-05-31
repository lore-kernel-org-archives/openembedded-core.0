Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90892C77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 06:52:10 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.7987.1685515925682066691
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 23:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=cZPHSDtL;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2af1a7d2f6aso59328771fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685515924; x=1688107924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b8YIs+UhInIXiCt/J2pE6yLj3y2d7AAqk87+grX+qUk=;
        b=cZPHSDtLBlfD2LuSYAudT0no+SByArmf79UJBS0/Lw68QM1E3X6xXnV+HAxPGpScUv
         6xdJa8i44I0Ofrd/3G+kGHqTdpJkkl47ADmatqWB9VmDVS8TzEOW5T5ts/eSdhWSGdhH
         dUm2K87w7YEM78mHs/pCs28QuVtZzTyjU+JFvPXzgXTkDi8I+6s38z3x8iOXcH5PF/U1
         oyZ0PbNwrfJC0d3fTOBJzao9cTgVGfXmqSAMiwCNwWGNCTbJhz8i4al8+ywh18TWOfUr
         K1IiQbIagDZHZ3nQpuhd0YskC88sOBGW8CvtvasPBFHYtFD2+drfS3AdZOdTSb+mnCBm
         R4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685515924; x=1688107924;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8YIs+UhInIXiCt/J2pE6yLj3y2d7AAqk87+grX+qUk=;
        b=EJtqbvfCcQWHzNQQC5zL7cmK1ghEnz9Jz7Io1hFKKks0CXBMlOQk3GlAXOYsLHioB4
         kgjiHrl2dlA0e6VVwRRlImneNpdQh8fTu2eEKxcUMPlK6py6P+YjxoFAiid3B9ESSBdA
         6u4CqUyDc6gHGe+TBSBIBNwPQSMrzhhA2g0jxt/a6m4QVEWIB18u0T9BsRqF4vAQO4xU
         0slpgLEOv0gC3sbNs5cG+zfmeIBOFzR+B7TumEMMvARHWWfB5N5sc0K/0hLvX+GGXKQS
         CclpvfWdxFKRxVCsgAVSIrCZd3Ac43UHl5OiGz+gtqhNmyZ/NKzRTPh5w5Z40AZlaORC
         nvPA==
X-Gm-Message-State: AC+VfDwpQhna/3XdBopBs7r+P6YlpINPYrNiaUrBy7py1kNiE0w8cW1Y
	toyfmBGCxcdUv6ANdq0tD5g8gNIF4Xv9kC8OBd8=
X-Google-Smtp-Source: ACHHUZ4CG3tqUH+csLMM8MHDCOye39vPRx5TCAYVvu5+TrCvJG7Iv9DaE28v0sseITNr022gTKkrwe0li7N6ksCeh6o=
X-Received: by 2002:a2e:8895:0:b0:2af:2494:49ae with SMTP id
 k21-20020a2e8895000000b002af249449aemr2094283lji.44.1685515923372; Tue, 30
 May 2023 23:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
In-Reply-To: <20230530222752.42503-1-m.belouarga@technologyandstrategy.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 May 2023 08:51:51 +0200
Message-ID: <CANNYZj-1DyNYzct3DQmihoudLhAnLF5j=r0pyfJ-GN0zuBXuqg@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH 1/6] recipetool: create: npm: Remove
 duplicate function to not have future conflicts
To: belouargamohamed@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	f.lahoudere@technologyandstrategy.com, e.aubineau@technologyandstrategy.com, 
	j.guignard@technologyandstrategy.com, 
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:52:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181996

Thanks for the work on this. We have a couple of selftests that test
npm functionality, unfortunately they do not run in CI because npm is
not in oe-core, but can you confirm that they pass with the changes?

Run:

oe-selftest -r recipetool.RecipetoolCreateTests.test_recipetool_create_npm
oe-selftest -r devtool.DevtoolAddTests.test_devtool_add_npm

Alex

On Wed, 31 May 2023 at 00:28, <belouargamohamed@gmail.com> wrote:
>
> From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
>
> Npm packages do not have yocto friendly names. fore instance we can have names like
> "@example/npmPackage"
>
> npm fetcher has a function that convert these names to yocto friendly names.
> But in recipe tool we have an other function (duplicate).
>
> Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
> ---
>  scripts/lib/recipetool/create_npm.py | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
>
> diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
> index 3394a89970..e667a4d19b 100644
> --- a/scripts/lib/recipetool/create_npm.py
> +++ b/scripts/lib/recipetool/create_npm.py
> @@ -13,6 +13,7 @@ import sys
>  import tempfile
>  import bb
>  from bb.fetch2.npm import NpmEnvironment
> +from bb.fetch2.npm import npm_package
>  from bb.fetch2.npmsw import foreach_dependencies
>  from recipetool.create import RecipeHandler
>  from recipetool.create import get_license_md5sums
> @@ -30,15 +31,6 @@ def tinfoil_init(instance):
>  class NpmRecipeHandler(RecipeHandler):
>      """Class to handle the npm recipe creation"""
>
> -    @staticmethod
> -    def _npm_name(name):
> -        """Generate a Yocto friendly npm name"""
> -        name = re.sub("/", "-", name)
> -        name = name.lower()
> -        name = re.sub(r"[^\-a-z0-9]", "", name)
> -        name = name.strip("-")
> -        return name
> -
>      @staticmethod
>      def _get_registry(lines):
>          """Get the registry value from the 'npm://registry' url"""
> @@ -143,7 +135,7 @@ class NpmRecipeHandler(RecipeHandler):
>
>          # Handle the dependencies
>          def _handle_dependency(name, params, deptree):
> -            suffix = "-".join([self._npm_name(dep) for dep in deptree])
> +            suffix = "-".join([npm_package(dep) for dep in deptree])
>              destdirs = [os.path.join("node_modules", dep) for dep in deptree]
>              destdir = os.path.join(*destdirs)
>              packages["${PN}-" + suffix] = destdir
> @@ -173,7 +165,7 @@ class NpmRecipeHandler(RecipeHandler):
>          if "name" not in data or "version" not in data:
>              return False
>
> -        extravalues["PN"] = self._npm_name(data["name"])
> +        extravalues["PN"] = npm_package(data["name"])
>          extravalues["PV"] = data["version"]
>
>          if "description" in data:
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181961): https://lists.openembedded.org/g/openembedded-core/message/181961
> Mute This Topic: https://lists.openembedded.org/mt/99230551/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

