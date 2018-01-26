Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 28E156FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 09:57:28 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id q194so13448992lfe.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2018 01:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xbK4sOMEfwNd7oOJ9rV2PMfHXXSHM7/x7hOC0g+RKNA=;
	b=miDp/GgfjrQDXUkuz475wQztFe/dE9f4GpDUNoOxm4W37e7IW3tOKTELOCxH196tzl
	9hwh2xe/aFvc8KRyBzJfckup1KrMazUPHv5F35DZzLZ5BKw0Y8hcq9BsJw1kEfMKw5Kd
	CnZ39iNeKp1knyhwHvc+jR+z52wYeDGNunr5amBGf4fOMGsrn1AJNERy9xbfAVOfzmla
	tlSIYa4Rc7iJ/RhOmVrl62q+tgIjjRU1IPPgNzc1Zz6j0mNqecK41B7SHd3n6BWVJc74
	KxKiFefNqqC/7xXH9AbpzkE8m5jqhRLMR0teecWW9Y8MQbY7KZmBZgTpdfIyHcYI16x0
	U/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xbK4sOMEfwNd7oOJ9rV2PMfHXXSHM7/x7hOC0g+RKNA=;
	b=YSnKARvqL3M4FNXtpa0budj94JrSnex8kPJZvCHNo+gbzC7TIGan37LOoK/NdGWOKt
	C0jaw9Y/9lQvy5lgh1fpmraoBEBjVFQ/IObbcON0/qC4RWkAMqBvgM3tMglJf2fZMql6
	R4UZ8AJ5EDbbC9ox/FBVl3oSXkjBo1hVe92QqzGu1q+opIZ+FknQC0GAkNkOP3Q9Hzii
	3pUWnjpROBGuDPinibEKktm6nz4tT45X7AJ6MWuo7kDjspijcI7rOeG63LIJWVlxYyZ1
	VECJok6Jxis85rRpstNSxTroyS6+DfDCEXU9/fP83ZYgemb8svX3WSEhGdFf45OpeJh5
	xV0Q==
X-Gm-Message-State: AKwxyteL2V/vXbxj8xTY3zks0CQKxtdieU2pdiNtXbmAOh1hVD/j4MZp
	wWWael4Vc2VSOGmVYQA1gEUYVcS+YHo=
X-Google-Smtp-Source: AH8x224uhT73tyyQG5pTpco9hpnGWsEe5KJApjZ8eUAYM9zRAhBAsUFnt6L1ekB/SBaXAONh/pYSjA==
X-Received: by 10.25.148.75 with SMTP id w72mr5246586lfd.54.1516960649006;
	Fri, 26 Jan 2018 01:57:29 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	u72sm1385298lfi.64.2018.01.26.01.57.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 01:57:28 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin.hundeboll@prevas.dk>
Date: Fri, 26 Jan 2018 10:56:50 +0100
Message-Id: <1516960611-24652-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <28aa69fb-383c-642f-c12c-66c8350029af@prevas.dk>
References: <28aa69fb-383c-642f-c12c-66c8350029af@prevas.dk>
MIME-Version: 1.0
Subject: Re: [PATCH v7] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Fri, 26 Jan 2018 09:57:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 25/01/18 11:58, Martin Hundebøll wrote:
> Hi Kristian,
> 
> Thanks for your work on this!
> 
> On 2018-01-25 11:33, Kristian Amlie wrote:
>> This is a direct followup from the earlier 6602392db3d39 commit in
>> wic. It works more or less the same way: The variable specifies a list
>> of directories relative to the root of the rootfs, and these
>> directories will be excluded from the resulting rootfs image. If an
>> entry ends with a slash, only the contents are omitted, not the
>> directory itself.
>>
>> Since the intended use of the variable is to exclude certain
>> directories from the rootfs, and then include said directories in
>> other partitions, it is not natural for this variable to be respected
>> for image creators that create multi partition images. These can turn
>> the feature off locally by defining:
>>
>>    do_image_myfs[respect_exclude_path] = "0"
>>
>> Specifically, "wic" and "multiubi" come with the feature disabled.
>>
>> Signed-off-by: Kristian Amlie <kristian.amlie@northern.tech>
>> ---
>>   meta/classes/image.bbclass           | 84
>> +++++++++++++++++++++++++++++++++++-
>>   meta/classes/image_types.bbclass     |  1 +
>>   meta/classes/image_types_wic.bbclass |  1 +
>>   3 files changed, 84 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
>> index 4531aa2..849a19c 100644
>> --- a/meta/classes/image.bbclass
>> +++ b/meta/classes/image.bbclass
>> @@ -117,7 +117,8 @@ def rootfs_variables(d):
>>                   
>> 'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS',
>>
>>                   
>> 'MULTILIBRE_ALLOW_REP','MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS',
>>
>>                   
>> 'PACKAGE_ARCHS','PACKAGE_CLASSES','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
>>
>> -                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS',
>> 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY',
>> 'REPRODUCIBLE_TIMESTAMP_ROOTFS']
>> +                 'CONVERSIONTYPES', 'IMAGE_GEN_DEBUGFS',
>> 'ROOTFS_RO_UNNEEDED', 'IMGDEPLOYDIR', 'PACKAGE_EXCLUDE_COMPLEMENTARY',
>> 'REPRODUCIBLE_TIMESTAMP_ROOTFS',
>> +                 'IMAGE_ROOTFS_EXCLUDE_PATH']
>>       variables.extend(rootfs_command_variables(d))
>>       variables.extend(variable_depends(d))
>>       return " ".join(variables)
>> @@ -508,8 +509,9 @@ python () {
>>           d.setVarFlag(task, 'func', '1')
>>           d.setVarFlag(task, 'fakeroot', '1')
>>   -        d.appendVarFlag(task, 'prefuncs', ' ' + debug + '
>> set_image_size')
>> +        d.appendVarFlag(task, 'prefuncs', ' ' + debug + '
>> set_image_size prepare_excluded_directories')
>>           d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
>> +        d.appendVarFlag(task, 'postfuncs', '
>> cleanup_excluded_directories')
>>           d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
>>           d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
>>           d.appendVarFlag(task, 'vardepsexclude', 'DATETIME DATE ' + '
>> '.join(vardepsexclude))
>> @@ -518,6 +520,84 @@ python () {
>>           bb.build.addtask(task, 'do_image_complete', after, d)
>>   }
>>   +python prepare_excluded_directories() {
>> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
>> +    if not exclude_var:
>> +        return
>> +
>> +    taskname = d.getVar("BB_CURRENTTASK")
>> +
>> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
>> +        bb.debug(1, "'IMAGE_ROOTFS_EXCLUDE_PATH' is set but
>> 'respect_exclude_path' variable flag is 0 for this image type, so
>> ignoring it")
>> +        return
> 
> If I understand this correctly, paths like "/data" aren't allowed in
> "IMAGE_ROOTFS_EXCLUDE_PATH". That seems counter-intuitive to me, as I
> would expect this feature to take absolute paths inside the target image
> to be excluded.

My initial idea was absolute paths, but other maintainers disagreed
[1]. I don't think it makes sense to change this now, because it has
already been included in wic for a long time, and this patch is just
mirroring wic's behavior.

[1] http://lists.openembedded.org/pipermail/openembedded-core/2016-November/129301.html

> If the check is there to avoid "os.path.join()" returning the RHS only
> instead of the joined path, then please use "oe.path.join()" instead.

Oh, well spotted, I didn't know about oe.path.join(). Strictly speaking
it is not necessary since we require a relative path, but it is an extra
layer of safety, so yeah, I'll change it to use oe.path.join().

I also noticed there was an unneeded os.path.join() at the rmtree (it
joined one single string only), so I removed that one.

Rebased patch included with the changes.

>> +    import shutil
>> +    from oe.path import copyhardlinktree
>> +
>> +    exclude_list = exclude_var.split()
>> +
>> +    rootfs_orig = d.getVar('IMAGE_ROOTFS')
>> +    # We need a new rootfs directory we can delete files from. Copy to
>> +    # workdir.
>> +    new_rootfs = os.path.realpath(os.path.join(d.getVar("WORKDIR"),
>> "rootfs.%s" % taskname))
>> +
>> +    if os.path.lexists(new_rootfs):
>> +        shutil.rmtree(os.path.join(new_rootfs))
> 
> Wouldn't it be sufficient to add "new_rootfs" to "do_image[cleandirs]" ?

The directory depends on the task name, so this would be tricky I
think. You'd have to know the name upfront, which we don't, since image
types can be created by downstream layers.

>> ...>> +python cleanup_excluded_directories() {
>> +    exclude_var = d.getVar('IMAGE_ROOTFS_EXCLUDE_PATH')
>> +    if not exclude_var:
>> +        return
>> +
>> +    taskname = d.getVar("BB_CURRENTTASK")
>> +
>> +    if d.getVarFlag('do_%s' % taskname, 'respect_exclude_path') == '0':
>> +        return
>> +
>> +    import shutil
>> +
>> +    rootfs_dirs_excluded = d.getVar('IMAGE_ROOTFS')
>> +    rootfs_orig = d.getVar('IMAGE_ROOTFS_ORIG')
>> +    # This should never happen, since we should have set it to a
>> different
>> +    # directory in the prepare function.
>> +    assert rootfs_dirs_excluded != rootfs_orig
>> +
>> +    shutil.rmtree(rootfs_dirs_excluded)
>> +    d.setVar('IMAGE_ROOTFS', rootfs_orig)
>> +}
> 
> Are we sure the cleanup is needed? I can image cases where I would like
> to have a look in "rootfs_dirs_excluded" to see what how it differs from
> "rootfs_orig".

I suppose we could. Not sure what weighs heavier, cleaning up or being
able to debug. I think personally I vote for cleaning up, since it would
be easy to comment this out in a debugging situation. But I can change
it if you insist.

-- 
Kristian

