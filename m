Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web12.1016.1594065049701970964
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 12:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JS/ywG2j;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id j7so2390741plk.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 12:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=vQ/Nd7VvWgiPEuP2TBRDm4r+03g+i0I6LpwOLPEH5cY=;
        b=JS/ywG2jtYnQjiUEv8Id+nPfogTmFCPGXjx7ggVHUSegja16iUlftjux92Y1im5Wam
         PWocgVxIZkf+NPmYFE9sAnuG1A/uLKUlUbo6HrMx3nlhtV6gLEZ5WuTkoSoSmff0GJFb
         vVDIJ5T2L8dm3RAX7H/I4jwyFhTpXK5aNk7obq9i1/QcDmF/UcwNFNyytOw71Dg2naw5
         hKBX4qHsutmm7cOl1px82TNb6D9yERMH9G4OPlHrbobZC3zwhX+IOcfTzZvTUFPBISCa
         51cHx2LHF5afbUDXxxNN72iKzTVjuQ3/LVAScClRZTkLAtS4V7wJrfpXcI4rF91bNAN6
         tmIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vQ/Nd7VvWgiPEuP2TBRDm4r+03g+i0I6LpwOLPEH5cY=;
        b=fFBNk1fZEs9wnmZKkLYTv778V1+iQAlD9DNplJir7gcEnFvGr8PC9QqzfJzdZrZ56s
         EDr3K4yOiNYj7AYFK/5clFg2rUtieSCSmxzywxSAv4Tf0JXpKPIu4Erm5A4+WAEi8tjP
         vkUUNpCf5b2T3068yuNJhpVeWyUXbkvZPc+CZ8H2r8ze4YljgE+0pAkY1SkFuT3nXHJt
         Ad+qKkvgQpJpo4cQl0UcBugANEmT0jY8krIU3dq/lwGos4jR8FU4ClkBJIgh7R/hgRdV
         nR6L/X3Jxlht4jBBE178mEGccvl81bfOeuidRFXdzAXFU2gUiEbTiLg0ThKkDdC7NvbP
         QwLw==
X-Gm-Message-State: AOAM531sWBSm0lDLPLSi3wuuFvOm5wOeiBAoHoceOfuNbi05c+E58jOa
	8J8t7LDsBTo65PAtk1dAFV6WEzDVFGM=
X-Google-Smtp-Source: ABdhPJy4meFNtVNwRUBZP9zTK168aTls7C4cRkxO45+9eVg9bspvssAY0rb0DbnFoxcEo/6mdCvcEg==
X-Received: by 2002:a17:90a:c207:: with SMTP id e7mr745707pjt.49.1594065048750;
        Mon, 06 Jul 2020 12:50:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:61e6:5be1:19c9:154e? ([2601:646:9200:4e0:61e6:5be1:19c9:154e])
        by smtp.gmail.com with ESMTPSA id e6sm12338597pfh.176.2020.07.06.12.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2020 12:50:48 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] devtool: default to empty string, if LIC_FILES_CHKSUM is not available
To: Bjarne Michelsen <bjarne_michelsen@hotmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200706194226.4892-1-bjarne_michelsen@hotmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0f90bcd9-199e-df33-00d2-11009898430a@gmail.com>
Date: Mon, 6 Jul 2020 12:50:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706194226.4892-1-bjarne_michelsen@hotmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 7/6/20 12:42 PM, Bjarne Michelsen wrote:
> [Bug 13971] https://bugzilla.yoctoproject.org/show_bug.cgi?id=13971
> 
> A recipe using LICENSE=CLOSED would normally not have LIC_FILES_CHKSUM
> set.
> If LIC_FILES_CHKSUM was not set, it would cause `devtool upgrade` to fail.
> 
> This fixes the issue by defaulting to an empty string if
> LIC_FILES_CHKSUM is not found.
> 

would it do just for recipes which use CLOSED for license ?
since we are synthesizing the checksum, It would be good to remain 
prudent and not empty it out in general when non existent, perhaps
a warning for user to fix it in such cases would be appropriate

> Signed-off-by: Bjarne Michelsen <bjarne_michelsen@hotmail.com>
> ---
>   scripts/lib/devtool/upgrade.py | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> index ebe72282bb..0c1de8cdc7 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -550,12 +550,12 @@ def upgrade(args, config, basepath, workspace):
>           try:
>               logger.info('Extracting current version source...')
>               rev1, srcsubdir1 = standard._extract_source(srctree, False, 'devtool-orig', False, config, basepath, workspace, args.fixed_setup, rd, tinfoil, no_overrides=args.no_overrides)
> -            old_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
> +            old_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
>               logger.info('Extracting upgraded version source...')
>               rev2, md5, sha256, srcbranch, srcsubdir2 = _extract_new_source(args.version, srctree, args.no_patch,
>                                                       args.srcrev, args.srcbranch, args.branch, args.keep_temp,
>                                                       tinfoil, rd)
> -            new_licenses = _extract_licenses(srctree, rd.getVar('LIC_FILES_CHKSUM'))
> +            new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
>               license_diff = _generate_license_diff(old_licenses, new_licenses)
>               rf, copied = _create_new_recipe(args.version, md5, sha256, args.srcrev, srcbranch, srcsubdir1, srcsubdir2, config.workspace_path, tinfoil, rd, license_diff, new_licenses, srctree, args.keep_failure)
>           except bb.process.CmdError as e:
> 
> 
> 
> 
