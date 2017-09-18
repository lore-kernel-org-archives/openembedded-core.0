Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 72D1D78245
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 06:45:20 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b127so6889217lfe.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Sep 2017 23:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=vGb9yQW7zzZNpgEstCa14Y0f5vxN6igUUMYsXXGxecQ=;
	b=Y0XorN0MjJwUfB3aWN6/rN3TB9KP5ssub+xKL4zIPe0DoeeDDlr07QCSShpIQsFgfI
	QNUACq6bxk4GPutupzsOb1BoWqQYkm8v2LI95qenM814S9SWL5Grgvphm4SSJr1cHriB
	VSRf/gF3uzMkHGDXLbWAN8j7aPu4bZcfSLg37rVY6T+rvEiVJMYkJHg2/tu11WYNaOxf
	IeKA6H9UUvOep9gSS10Lv1U6EcWfkf8YK0nSwEABOsxkn1LKr0/ZPCgbnvvyQDwnnx+e
	p077rU10zlKbXUNzX7TSx/YLq3TLVediJaUMqCCWmCHxyAKISTBld2uIfBqvSa/8Cahd
	4Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vGb9yQW7zzZNpgEstCa14Y0f5vxN6igUUMYsXXGxecQ=;
	b=F/44tiLZGGUpN66xI0OhSupdzI94t+YbxrDPWWV8on7oA5+hePHhRjJcNuxQpEq8CY
	LbSkTEuTZP8Ret8HVz8xlQBozQMy4M9BPDw3DYq/A9bPJ1NKU2lXHW+u4afV1caGW4R4
	T5s/gj2N5X8/mBTeirPAL21lF7zPii1N1UJShLfd3wgW8T8L1vJ8R/zofov72ivSRM0X
	92pMPA4vFb11iiEtW2OLypNcBGZ2vMk8F7dViC61ne5tb8Hsi/rRziRumZcO/JgmwK/h
	gC73zrd6Fy3NjvfImoRnkUV5gaKmCNs4nVr1C+CcxeU2LtZbKgkHPq+2u3ARsFNLZkvR
	XwMA==
X-Gm-Message-State: AHPjjUil4Hxia3S8HSlGHboMZzYmG1XHP/K3JgWwBRXRA8i+tBTJvNiP
	gagjv0vQ+yW5qabOkqjqYw==
X-Google-Smtp-Source: ADKCNb6ck19Dfqk/Lj6Ni+v7CxwHOkHcDkeE6+jllSi7+Iw/5hbC4Ojg6PTsmQhWTvq0INVttccHJg==
X-Received: by 10.46.84.74 with SMTP id y10mr11599677ljd.89.1505717120773;
	Sun, 17 Sep 2017 23:45:20 -0700 (PDT)
Received: from [10.20.33.175] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	p204sm1296117lfp.29.2017.09.17.23.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 23:45:19 -0700 (PDT)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
References: <deabfcea-aa87-d925-1380-249127905c57@northern.tech>
	<1503935267-4646-1-git-send-email-kristian.amlie@northern.tech>
Message-ID: <25961b50-eda5-5b7e-1bb0-01ef5c521d2e@northern.tech>
Date: Mon, 18 Sep 2017 08:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503935267-4646-1-git-send-email-kristian.amlie@northern.tech>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Mon, 18 Sep 2017 06:45:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping. Anything missing here?

-- 
Kristian

On 28/08/17 17:47, Kristian Amlie wrote:
> This is a direct followup from the earlier 6602392db3d39 commit in
> wic. It works more or less the same way: The variable specifies a list
> of directories relative to the root of the rootfs, and these
> directories will be excluded from the resulting rootfs image. If an
> entry ends with a slash, only the contents are omitted, not the
> directory itself.
> 
> Since the intended use of the variable is to exclude certain
> directories from the rootfs, and then include said directories in
> other partitions, it is not natural for this variable to be respected
> for image creators that create multi partition images. These can turn
> the feature off locally by defining:
> 
>   do_image_myfs[respect_exclude_path] = "0"
> 
> Specifically, "wic" and "multiubi" come with the feature disabled.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
> ---
>  meta/classes/image.bbclass           | 84 +++++++++++++++++++++++++++++++++++-
>  meta/classes/image_types.bbclass     |  1 +
>  meta/classes/image_types_wic.bbclass |  1 +
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3639aa4..9cefff1 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -117,7 +117,8 @@ def rootfs_variables(d):
>                   'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
>                   'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>                   'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
> -                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
> +                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS', 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY', 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
> +                 'IMAGE_ROOTFS_EXCLUDE_PATH']
>      variables.extend(rootfs_command_variables(d))
>      variables.extend(variable_depends(d))
>      return " ".join(variables)
> @@ -496,8 +497,9 @@ python () {
>          d.setVarFlag(task, 'func', '1')
>          d.setVarFlag(task, 'fakeroot', '1')
>  
> -        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
> +        d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size prepare_excluded_directories')
>          d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
> +        d.appendVarFlag(task, 'postfuncs', ' cleanup_excluded_directories')
>          d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
>          d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
>          d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE')
> @@ -506,6 +508,84 @@ python () {
>          bb.build.addtask(task, 'do_image_complete', after, d)
>  }
>  
> +python prepare_excluded_directories() {
> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
> +    if not exclude_var:
> +        return
> +
> +    taskname = d.getVar("BB_CURRENTTASK")
> +
> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
> +        bb.debug(1, "'IMAGE_ROOTFS_EXCLUDE_PATH' is set but 'respect_exclude_path' variable flag is 0 for this image type, so ignoring it")
> +        return
> +
> +    import shutil
> +    from oe.path import copyhardlinktree
> +
> +    exclude_list = exclude_var.split()
> +
> +    rootfs_orig = d.getVar('IMAGE_ROOTFS')
> +    # We need a new rootfs directory we can delete files from. Copy to
> +    # workdir.
> +    new_rootfs = os.path.realpath(os.path.join(d.getVar("WORKDIR"), "rootfs.%s" % taskname))
> +
> +    if os.path.lexists(new_rootfs):
> +        shutil.rmtree(os.path.join(new_rootfs))
> +
> +    copyhardlinktree(rootfs_orig, new_rootfs)
> +
> +    for orig_path in exclude_list:
> +        path = orig_path
> +        if os.path.isabs(path):
> +            bb.fatal("IMAGE_ROOTFS_EXCLUDE_PATH: Must be relative: %s" % orig_path)
> +
> +        full_path = os.path.realpath(os.path.join(new_rootfs, path))
> +
> +        # Disallow climbing outside of parent directory using '..',
> +        # because doing so could be quite disastrous (we will delete the
> +        # directory).
> +        if not full_path.startswith(new_rootfs):
> +            bb.fatal("'%s' points to a path outside the rootfs" % orig_path)
> +
> +        if path.endswith(os.sep):
> +            # Delete content only.
> +            for entry in os.listdir(full_path):
> +                full_entry = os.path.join(full_path, entry)
> +                if os.path.isdir(full_entry) and not os.path.islink(full_entry):
> +                    shutil.rmtree(full_entry)
> +                else:
> +                    os.remove(full_entry)
> +        else:
> +            # Delete whole directory.
> +            shutil.rmtree(full_path)
> +
> +    # Save old value for cleanup later.
> +    d.setVar('IMAGE_ROOTFS_ORIG', rootfs_orig)
> +    d.setVar('IMAGE_ROOTFS', new_rootfs)
> +}
> +
> +python cleanup_excluded_directories() {
> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
> +    if not exclude_var:
> +        return
> +
> +    taskname = d.getVar("BB_CURRENTTASK")
> +
> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
> +        return
> +
> +    import shutil
> +
> +    rootfs_dirs_excluded = d.getVar('IMAGE_ROOTFS')
> +    rootfs_orig = d.getVar('IMAGE_ROOTFS_ORIG')
> +    # This should never happen, since we should have set it to a different
> +    # directory in the prepare function.
> +    assert rootfs_dirs_excluded != rootfs_orig
> +
> +    shutil.rmtree(rootfs_dirs_excluded)
> +    d.setVar('IMAGE_ROOTFS', rootfs_orig)
> +}
> +
>  #
>  # Compute the rootfs size
>  #
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index e0368c7..3b9250b 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -206,6 +206,7 @@ IMAGE_CMD_multiubi () {
>  		multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
>  	done
>  }
> +do_image_multiubi[respect_exclude_path] = "0"
>  
>  IMAGE_CMD_ubi () {
>  	multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}"
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index b825b47..a34a7c6 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -34,6 +34,7 @@ IMAGE_CMD_wic () {
>  	rm -rf "$out/"
>  }
>  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
> +do_image_wic[respect_exclude_path] = "0"
>  
>  # Rebuild when the wks file or vars in WICVARS change
>  USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
> 


