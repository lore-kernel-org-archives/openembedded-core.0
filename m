Return-Path: <harisokn@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 41AB27317D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:51:28 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id oj9so19212486obc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:reply-to:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=1GoulqAXvLJBr12tGhucIjaBsU82RG3AAjPhbs+nXCc=;
	b=SfMt+h2RpKUTx7rGxwe1FAk6xSXENIKoV3QNiEnyNYYy5owH0DzB9ZkfsK/CCUaqcr
	9EZHwOUknwB1TfqfWlKUJ/gZQiJCTYiicreP80uEOCcC76ZUJeLG+Re2Hnm4ckJUy5Yk
	hDe8+g7Can7L1UB2xYlyu1FWzPFwKZgvjPN7rjOpyV11C9L+VCX+NI0nCFp5EUifcxqM
	+4QkkyBL8m5Ii5e4JHITL3xynl/z+hhvq7Q3VPb7eA8Jp9YRZTcJsEvVnH0OckJ9tiYZ
	6LM0bq6WpFTKPTBbenkNNBq1PuLrfKeJogLPSHCqfxcP0JbmO4wC7NY2DR1WSKkwI2t1
	wdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:reply-to:from
	:message-id:date:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=1GoulqAXvLJBr12tGhucIjaBsU82RG3AAjPhbs+nXCc=;
	b=QFPPvrcwrJS6ptZOqW3bpl0DSNxrlF6n45jHCReBDFLJsUhXE+Hh08H8O+K2n5TYEn
	DSDYsszY1thrfJm90yG9Ukt7BAS9jx2t2Va+XNjuIRFgCHYDmmibrksq0hm1menFoNiG
	NzqeDXDP8nCaij3guixbZv40X6AG5O0ZUMDtWeWVbgpCPk259eAHK7OjQsznmLdmUtuB
	ShfHl3vXArM5rFFgJlnG04EqNAGdDteKBVNAbo9hkxcgQQe+NpeKxdLEAzSCbEr1Gv0s
	68VYOSW00zopVGyPxd4wEg50Gct4abxditQ00n+IiEQFKa6PpDxJ+AzfYOJfq0L2RZSm
	cUWg==
X-Gm-Message-State: ALoCoQnpjQV9TsnrXwkeL1iGpPHPQm/UvSbODLbOJfv2i8iUM9vEIg5I5OjPz/bIZCBv04/fnLjlpadd2ohqwm6BAaJmP6GVtw==
X-Received: by 10.182.103.167 with SMTP id fx7mr25202501obb.36.1453240289279; 
	Tue, 19 Jan 2016 13:51:29 -0800 (PST)
Received: from [192.168.1.100] (cpe-72-182-40-142.austin.res.rr.com.
	[72.182.40.142])
	by smtp.gmail.com with ESMTPSA id u8sm16294887obf.5.2016.01.19.13.51.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 13:51:28 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1449608008-25611-1-git-send-email-haris.okanovic@ni.com>
	<1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
Reply-To: Haris Okanovic <haris.okanovic@ni.com>
From: Haris Okanovic <harisokn@gmail.com>
Message-ID: <569EAFE0.6050207@gmail.com>
Date: Tue, 19 Jan 2016 15:51:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <1450139152-19802-1-git-send-email-haris.okanovic@ni.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH 1/2] package.bbclass/package.py: Add do_install_source() task
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
X-List-Received-Date: Tue, 19 Jan 2016 21:51:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Are there any other issues with this change?

Andre raised a few several weeks ago, when this was still an RFC*. Those 
were all addressed in the initial patch.

* http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660

-- Haris


On 12/14/2015 06:25 PM, Haris Okanovic wrote:
> Add do_install_source() task to stage a recipe's SRC_URI files under
> SRC_D.
>
> Dependencies:
>   After do_fetch() to ensure SRC_URI files are downloaded
>   After do_install() because it resets ${D} that's also used by this task
>   Before do_package() to stage files before writing installers
>
> No-ops unless ENABLE_SRC_INSTALL_${PN} = 1, which needs to be set in
> distro config or recipes wanting to use this facility.
>
> This is change is part of a series which add source packages to OE.
> See the following thread for more information:
> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/72660
>
> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> ---
>   meta/classes/package.bbclass |  5 +++
>   meta/conf/documentation.conf |  1 +
>   meta/lib/oe/package.py       | 96 ++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 102 insertions(+)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index d731757..98f01e5 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -2079,3 +2079,8 @@ def mapping_rename_hook(d):
>       runtime_mapping_rename("RRECOMMENDS", pkg, d)
>       runtime_mapping_rename("RSUGGESTS", pkg, d)
>
> +addtask do_install_source after do_fetch after do_install before do_package
> +
> +python do_install_source () {
> +    oe.package.do_install_source(d)
> +}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 845559a..0df8a2f 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -26,6 +26,7 @@ do_fetchall[doc] = "Fetches all remote sources required to build a target"
>   do_generate_qt_config_file[doc] = "Writes a qt.conf file for building a Qt-based application"
>   do_install[doc] = "Copies files from the compilation directory to a holding area"
>   do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
> +do_install_source[doc] = "Stages source code for packaging"
>   do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
>   do_kernel_configcheck[doc] = "Validates the kernel configuration for a linux-yocto style kernel"
>   do_kernel_configme[doc] = "Assembles the kernel configuration for a linux-yocto style kernel"
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index ea6feaa..c85aa22 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -123,3 +123,99 @@ def read_shlib_providers(d):
>                           shlib_provider[s[0]] = {}
>                       shlib_provider[s[0]][s[1]] = (dep_pkg, s[2])
>       return shlib_provider
> +
> +def archive_dir(dirPath, archivePath):
> +    ''' Create tar.bz2 archive at archivePath from dirPath '''
> +    import os, oe, bb
> +
> +    arDir = os.path.dirname(dirPath)
> +    arName = os.path.basename(dirPath)
> +
> +    cmd = 'tar -c -I pbzip2 -f \"%s\" -C \"%s\" -p \"%s\"' % (archivePath, arDir, arName)
> +    (retval, output) = oe.utils.getstatusoutput(cmd)
> +    if retval:
> +        bb.fatal('Failed to archive %s --> %s: %s %s' % (dirPath, archivePath, cmd, output))
> +
> +def do_install_source(d):
> +    ''' Stage recipe's source for packaging '''
> +    import os, oe, bb
> +
> +    pn = d.getVar("PN", True)
> +
> +    if d.getVar("ENABLE_SRC_INSTALL_%s" % pn, True) != "1":
> +        return
> +
> +    packages = (d.getVar("PACKAGES", True) or "").split()
> +    if ("%s-src" % pn) not in packages:
> +        # Some recipes redefine PACKAGES without ${PN}-src. Don't stage
> +        # anything in this case to avoid installed-vs-shipped warning.
> +        return
> +
> +    urls = (d.getVar('SRC_URI', True) or "").split()
> +    if len(urls) == 0:
> +        return
> +
> +    workdir = d.getVar('WORKDIR', True)
> +
> +    # TODO rm_work() should clean this up
> +    unpackTempDir = os.path.join(workdir, 'install-source-unpack-temp')
> +    if os.path.exists(unpackTempDir):
> +        bb.utils.remove(unpackTempDir, recurse=True)
> +    os.makedirs(unpackTempDir, 0755)
> +
> +    src_d = d.getVar("SRC_D", True)
> +    if os.path.exists(src_d):
> +        bb.warn("SRC_D already exist. Removing.")
> +        bb.utils.remove(src_d, recurse=True)
> +    os.makedirs(src_d, 0755)
> +
> +    fetcher = bb.fetch2.Fetch(urls, d)
> +
> +    fileManif = []
> +    for url in urls:
> +        urlScheme = bb.fetch2.decodeurl(url)[0]
> +        srcPath = fetcher.localpath(url)
> +        srcName = os.path.basename(srcPath)
> +
> +        dstName = srcName
> +        if os.path.isdir(srcPath):
> +            dstName += '.tar.bz2'
> +
> +        dstPath = os.path.join(src_d, dstName)
> +
> +        # fetch() doesn't retrieve any actual files from git:// URLs,
> +        # so we do an additional unpack() step to get something useful
> +        # for these.
> +        # TODO: May need to pre-process other revision control schemes
> +        if urlScheme == 'git':
> +            unpackPath = os.path.join(unpackTempDir, srcName)
> +            if os.path.exists(unpackPath):
> +                bb.utils.remove(unpackPath, recurse=True)
> +            os.makedirs(unpackPath, 0755)
> +
> +            fetcher.unpack(unpackPath, [url])
> +
> +            # unpack() puts actual source in a 'git' subdir
> +            srcPath = os.path.join(unpackPath, 'git')
> +
> +        if os.path.exists(dstPath):
> +            bb.warn('Duplicate file %s in SRC_URI. Overwriting.' % dstName)
> +            bb.utils.remove(dstPath, recurse=True)
> +
> +        if not dstName in fileManif:
> +            fileManif.append(dstName)
> +
> +        if os.path.isdir(srcPath):
> +            archive_dir(srcPath, dstPath)
> +        else:
> +            bb.utils.copyfile(srcPath, dstPath)
> +
> +    manifFilePath = os.path.join(src_d, 'manifest')
> +    if os.path.exists(manifFilePath):
> +        bb.warn('manifest file found in SRC_URI. Overwriting.')
> +        bb.utils.remove(manifFilePath, recurse=True)
> +
> +    with open(manifFilePath, 'wb') as manif:
> +        for fname in fileManif:
> +            manif.write(fname)
> +            manif.write('\n')
>

