Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3532278399
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 18:11:39 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id z3so8947939plh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 10:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=jc0kuEedCIxlNWsvAw5JqgmkSQtTaOlKg58ae5nLDAk=;
	b=VwZ5GfxHo+YMewKQEZc8WCNs4OAaZc1VVweHAfHuaya7v+7BO2kLUSXPb463HiG/eR
	y8mVo4KB0a9O1Rl9oM8EOYVx+hM7ADjkv2LLnZLhsZSd9tVz2QZG566jPd1loGrLRhUQ
	MKbETpK0KYYOtWZZ05edm7SEX/MkTRHY7LQyQyvHHMlHzie2VPQWS2kgfmjClXmhzu9o
	oFYUdd9/4JfzQACONxnL9PmGWLMp+CkYjDBoWmv4OFM7gATWANAl7nz4FvJXIos2y+gy
	hANxlBFcumBW52WFkA81ZslPXhkfOEcs0GxK0W9L+osdSEz9WRLQzqP6RzKTWGcb36eW
	VMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jc0kuEedCIxlNWsvAw5JqgmkSQtTaOlKg58ae5nLDAk=;
	b=tOcZ+yAv70F/b3mz1Oukpb+0+sqq/bK9Scs68emxDs4fQD1GhMFkcP2DKY3B0kpr6n
	k4bEG19fJZ3o7J1w+APRjzeN782w3l8+xr5+oxN5uR4Vb6+Oa60tFKii/cm2SPJt7bp9
	rag+qdRO0o+eRDZQgxFU8Jn6+p6+d1PEB9uKxBxxkQA1Ld5LkkRrLNcldkWC+Pa06Ltb
	ikNxPYcAzlCZXe4J8iaIp9C1l1lDXugZcaXKT6PVy8aMxfuRTEY6dAolc5Vnuq+JxHRs
	cEmXJmkIphDjgKE5/VOEazwtB7LOJ6bX4onKtbpiFLvSG4qsTqxuPbckG2mzPZRAHcN7
	Zavw==
X-Gm-Message-State: AJaThX75rIg97Cm0/LbKENg8YTc09ohGgzYdJFi0f8mEnztXTEQAK2Eb
	IhtjjbxZMIsvJxjRhHLH9mEAtOAi
X-Google-Smtp-Source: AGs4zMYT/lFoCsHAeBWLFCgGZ/n3+ZIrppHVICQYzuuWuT2XKJxp9zL1xVH0f61vBHvZzpdjKod2xg==
X-Received: by 10.84.143.162 with SMTP id 31mr38966818plz.254.1511806300995;
	Mon, 27 Nov 2017 10:11:40 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:f197:f068:b85:adc4])
	by smtp.gmail.com with ESMTPSA id
	u90sm49572063pfg.106.2017.11.27.10.11.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Nov 2017 10:11:40 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
Date: Mon, 27 Nov 2017 10:11:39 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:56.0)
	Gecko/20100101 Thunderbird/56.0
MIME-Version: 1.0
In-Reply-To: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH] devtool: add license checksum change handling to 'devtool upgrade'
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
X-List-Received-Date: Mon, 27 Nov 2017 18:11:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/27/17 6:54 AM, Alexander Kanavin wrote:
> Specifically, 'devtool upgrade' will now do these things:
> 
> 1) determine if any of the license checksums need updating; if so,
> write the new checksums into the LIC_FILES_CHKSUM value in the recipe
> that is written to the workspace;
> 
> 2) print a notice to the standard output:
> 
> NOTE: New recipe is /home/ak/development/poky/build/workspace/recipes/puzzles/puzzles_git.bb
> NOTE: License checksums have been updated in the new recipe; please refer to it for the difference between the old and the new license texts.
> 
> 3) and the cool part: devtool will create a diff of the old and new licenses,
> and write the diff into the workspace recipe as a comment, like this:
> 

adding a comment in recipe itself might start folks sending patches with 
this text in the recipe changes. It should just be in commit message.

> ======
>   FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
>   The following is the difference between the old and the new license text.
>   Please update the LICENSE value if needed, and summarize the changes in
>   the commit message via 'License-checksum-change:' tag.
>   (example: 'License-checksum-change: copyright years updated.')
> 
>   The changes:
> 
>   --- LICENCE
>   +++ LICENCE
>   @@ -1,8 +1,9 @@
>    This software is copyright (c) 2004-2014 Simon Tatham.
> 
>    Portions copyright Richard Boulton, James Harvey, Mike Pinna, Jonas
>   -Klker, Dariusz Olszewski, Michael Schierl, Lambros Lambrou, Bernd
>   -Schmidt, Steffen Bauer, Lennard Sprong and Rogier Goossens.
>   +Kölker, Dariusz Olszewski, Michael Schierl, Lambros Lambrou, Bernd
>   +Schmidt, Steffen Bauer, Lennard Sprong, Rogier Goossens and Michael
>   +Quevillon.
> 
>    Permission is hereby granted, free of charge, to any person
>    obtaining a copy of this software and associated documentation files
> 
> ======
> 
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>   scripts/lib/devtool/upgrade.py | 75 ++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 73 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> index 28fbdaee357..e153d0c2edf 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -291,7 +291,26 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
>   
>       return (rev, md5, sha256, srcbranch, srcsubdir_rel)
>   
> -def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd):
> +def _add_license_diff_to_recipe(path, diff):
> +    notice_text = """# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
> +# The following is the difference between the old and the new license text.
> +# Please update the LICENSE value if needed, and summarize the changes in
> +# the commit message via 'License-checksum-change:' tag.
> +# (example: 'License-checksum-change: copyright years updated.')
> +#
> +# The changes:
> +#
> +"""
> +    commented_diff = "\n".join(["# {}".format(l) for l in diff.split('\n')])
> +    with open(path, 'rb') as f:
> +        orig_content = f.read()
> +    with open(path, 'wb') as f:
> +        f.write(notice_text.encode())
> +        f.write(commented_diff.encode())
> +        f.write("\n#\n".encode())
> +        f.write(orig_content)
> +
> +def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, srcsubdir_new, workspace, tinfoil, rd, license_diff, new_licenses):
>       """Creates the new recipe under workspace"""
>   
>       bpn = rd.getVar('BPN')
> @@ -400,6 +419,11 @@ def _create_new_recipe(newpv, md5, sha256, srcrev, srcbranch, srcsubdir_old, src
>               else:
>                   logger.info('Source subdirectory has changed, updating S value')
>   
> +    if license_diff:
> +        newlicchksum = " ".join(["file://{};md5={}".format(l["path"], l["actual_md5"]) + (";beginline={}".format(l["beginline"]) if l["beginline"] else "") + (";endline={}".format(l["endline"]) if l["endline"] else "") for l in new_licenses])
> +        newvalues["LIC_FILES_CHKSUM"] = newlicchksum
> +        _add_license_diff_to_recipe(fullpath, license_diff)
> +
>       rd = tinfoil.parse_recipe_file(fullpath, False)
>       oe.recipeutils.patch_recipe(rd, fullpath, newvalues)
>   
> @@ -427,6 +451,47 @@ def _check_git_config():
>       if configerr:
>           raise DevtoolError('Your git configuration is incomplete which will prevent rebases from working:\n' + '\n'.join(configerr))
>   
> +def _extract_licenses(srcpath, recipe_licenses):
> +    licenses = []
> +    for url in recipe_licenses.split():
> +        license = {}
> +        (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
> +        license['path'] = path
> +        license['md5'] = parm.get('md5', '')
> +        license['beginline'], license['endline'] = 0, 0
> +        if 'beginline' in parm:
> +            license['beginline'] = int(parm['beginline'])
> +        if 'endline' in parm:
> +            license['endline'] = int(parm['endline'])
> +        license['text'] = []
> +        with open(os.path.join(srcpath, path), 'rb') as f:
> +            import hashlib
> +            actual_md5 = hashlib.md5()
> +            lineno = 0
> +            for line in f:
> +                lineno += 1
> +                if (lineno >= license['beginline']) and ((lineno <= license['endline']) or not license['endline']):
> +                    license['text'].append(line.decode(errors='ignore'))
> +                    actual_md5.update(line)
> +        license['actual_md5'] = actual_md5.hexdigest()
> +        licenses.append(license)
> +    return licenses
> +
> +def _generate_license_diff(old_licenses, new_licenses):
> +    need_diff = False
> +    for l in new_licenses:
> +        if l['md5'] != l['actual_md5']:
> +            need_diff = True
> +            break
> +    if need_diff == False:
> +        return None
> +
> +    import difflib
> +    diff = ''
> +    for old, new in zip(old_licenses, new_licenses):
> +        for line in difflib.unified_diff(old['text'], new['text'], old['path'], new['path']):
> +            diff = diff + line
> +    return diff
>   
>   def upgrade(args, config, basepath, workspace):
>       """Entry point for the devtool 'upgrade' subcommand"""
> @@ -480,14 +545,18 @@ def upgrade(args, config, basepath, workspace):
>               check_prerelease_version(args.version, 'devtool upgrade')
>   
>           rf = None
> +        license_diff = None
>           try:
>               logger.info('Extracting current version source...')
>               rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
> +            old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
>               logger.info('Extracting upgraded version source...')
>               rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
>                                                       args.srcrev, args.srcbranch, args.branch, args.keep_temp,
>                                                       tinfoil, rd)
> -            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd)
> +            new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
> +            license_diff = _generate_license_diff(old_licenses, new_licenses)
> +            rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses)
>           except bb.process.CmdError as e:
>               _upgrade_error(e, rf, srctree)
>           except DevtoolError as e:
> @@ -502,6 +571,8 @@ def upgrade(args, config, basepath, workspace):
>   
>           logger.info('Upgraded source extracted to %s' % srctree)
>           logger.info('New recipe is %s' % rf)
> +        if license_diff:
> +            logger.info('License checksums have been updated in the new recipe; please refer to it for the difference between the old and the new license texts.')
>       finally:
>           tinfoil.shutdown()
>       return 0
> 

