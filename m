Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1F874AD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 19:23:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id i18-v6so9484642qtp.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 12:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yUurr+CfsSv3Mp6k6zvVquclzsjbW/GF0QMeKtYXpo8=;
	b=LpPMEsdDvspGXjGjlE9a9bzGqVqvELaDRdFO913Bd+iSCDoD6SFNG6w44suLp1eHS/
	zYvYhe1REI5Jnp+FDEy/v6tXFzLq+qNswVhjaB401awJ/LCsAwzrnMpC/RmtqATVvvd+
	S+w8bzIkO4W5I1bD4l6LWwj1gWQyyBWCZX0t2CTzaAwzCu/gqbWu1haKIX6Xdp9D9JKf
	qyoEq3Q2XiiiAjVGgjple5B7Wkrt9rAoJhT9GcmI1YW4wvYOZ4fM9EoZSoxGLwUOod2D
	zYUTqAzEpZ5od9V+b9KLow6zaypbrKseiLfathJ4GiwGlUFyBb/i9cNa0kIqFTHz0kH/
	R8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yUurr+CfsSv3Mp6k6zvVquclzsjbW/GF0QMeKtYXpo8=;
	b=ISPCWSG17b5xw3ZG9savwJAvbu3KBbGXoA4J4knxaUI0iIN2Vq3iI3NCbnIdg2o05d
	Qvn6r8fVi6kTP+76Axz1GM52dAX2icGE4XSP9/MAeh/tq2TL4XfeFwa4f11nn/t082hB
	HHWKAsQfs2wWCeKAGRX+PDOqxuQ5ETfJld2CV9SGuuFt9DbnJwpqMGGfXbh/YYFZk/Nt
	mBNWznmIm2NxF8ESR7K/uiWgJp2RgqOeA/F4vwl5BQnfimPdLCCxG245e2XEMFEpOh8h
	3UgPk8WryMceV5Pjr549LgE7EKVAD29b//AfaxFPVnmBLjukLv3vKQWzkOAMBqXY9ZWQ
	cjCg==
X-Gm-Message-State: ALKqPwc8AUgqWqIPuYGBZ/nnyDIonOTdyIVOUXEDgGhPZ4eIDNNbwtz+
	LQuikdjFeB7rW8ReSLceK9rUFfjiu3XML5QkYLc=
X-Google-Smtp-Source: ADUXVKJEXCVuk+o8uUB3Vk5VcRWmicAZcBvM+EvfQa423bKh+BkZA6figzWgnsRZvqQFEBaguSA+Tgul7i/iDVmG9l0=
X-Received: by 2002:ac8:26ea:: with SMTP id
	39-v6mr18208643qtp.128.1527621804898; 
	Tue, 29 May 2018 12:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:9a0f:0:0:0:0:0 with HTTP; Tue, 29 May 2018 12:22:54
	-0700 (PDT)
In-Reply-To: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
References: <1527514686-21442-1-git-send-email-mark.asselstine@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2018 12:22:54 -0700
Message-ID: <CAMKF1sqWVd61gS8eksZ_LB2DK00oSzM0BXjDM_5Pxz53SCzGBA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipe_links.bbclass: introduction
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
X-List-Received-Date: Tue, 29 May 2018 19:23:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 28, 2018 at 6:38 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> This is a new class which can be used (for example via USER_CLASSES in
> local.conf) to make your build more development friendly. When
> included this class will create symlinks to the various bb and
> bbappend files in WORKDIR.
>
> Normally when you are debugging or extending a package's recipe files
> a developer will employ one of a few indirect techniques to determine
> where bb and bbappends files associated with a recipe exist. For
> example they might use bitbake-layers show-recipes or similar, or
> simply rely on their experience to guide them. Even after working with
> openembedded for serveral years now I find these techniques tedious
> and time consuming, and sometimes even hit and miss.
>
> Since the whereabouts of these files are already stored in various
> files at parse time we can create symlinks to simplify the task of
> finding these files, making them available in WORKDIR for easy
> inpsection and in a convenient location if using devshel for instance.
>
> For now this work is completely optional but we could conceivable make
> this the default behavior if folks find it is convenient and the cost
> of performing these operations across all builds is minimal enough.
>
> recipe_links can safely be added to USER_CLASSES for existing builds,
> care has been taken to avoid this action causing anything to be
> rebuilt. After this has been added you can either 'bitbake <recipe> -C
> unpack' or 'bitbake <recipe> -c create_recipe_links' to cause the
> links to be created in the WORKDIR for the specified recipe.
>

I think this is not complementing devtool workflow, even though its
not going to hurt it.
however, devtool workflow is what we should be targeting as primary
workflow for OE
and I do not see a benefit of this in that regard.


> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/classes/recipe_links.bbclass | 79 +++++++++++++++++++++++++++++++++++++++
>  meta/conf/documentation.conf      |  1 +
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta/classes/recipe_links.bbclass
>
> diff --git a/meta/classes/recipe_links.bbclass b/meta/classes/recipe_links.bbclass
> new file mode 100644
> index 0000000..ea97605
> --- /dev/null
> +++ b/meta/classes/recipe_links.bbclass
> @@ -0,0 +1,79 @@
> +# Create symlink in WORKDIR to the various bb and
> +# bbappend files used to define the package ops
> +
> +# Create a symlink given src and dst paths
> +def create_link(d, src, dst):
> +    if os.path.islink(dst):
> +        try:
> +            os.unlink(dst)
> +        except OSError as err:
> +            bb.error("  Failed to cleanup old link %s: %s"
> +                         % (os.path.basename(dst), os.strerror(err.errno)))
> +            return False
> +
> +
> +    try:
> +        os.symlink(src, dst)
> +    except OSError as err:
> +        bb.error("  Failed to create file link for %s: %s"
> +                     % (src, os.strerror(err.errno)))
> +        return False
> +
> +    return True
> +
> +# Ensure the work is scheduled. We do this as a func
> +# to avoid sig changes causing things to be rebuilt
> +# when the class is added/removed after the fact.
> +do_unpack[postfuncs] += "create_recipe_links "
> +do_unpack[vardepsexclude] += "create_recipe_links "
> +python create_recipe_links() {
> +    import re
> +    import glob
> +
> +    workdir = d.getVar('WORKDIR')
> +
> +    # Main recipe file
> +    bb.note("Add main recipe file link:")
> +    bb_path = d.getVar('FILE')
> +    bb_filename = os.path.basename(bb_path)
> +    bb_destname = "%s/%s" % (workdir, bb_filename)
> +    bb.note("  Linking %s" % bb_path)
> +    if not create_link(d, bb_path, bb_destname):
> +        return False
> +
> +    # Cleanup old bbappends links
> +    bb.note("Removing old bbappend links:")
> +    pn = d.getVar('PN')
> +    files = glob.glob('%s/[0-9][0-9]_%s.bbappend' % (workdir,pn))
> +    files += glob.glob('%s/[0-9][0-9]_%s_*.bbappend' % (workdir, pn))
> +    for filename in files:
> +        bb.note("  Removing: %s" % filename)
> +        try:
> +            os.unlink(filename)
> +        except OSError as err:
> +            bb.error("  Failed to cleanup old link %s: %s" %
> +                         (os.path.basename(filename), os.strerror(err.errno)))
> +            return False
> +
> +    # Add bbappends links
> +    bb.note("Adding bbappend links:")
> +    included_files = d.getVar('BBINCLUDED').split()
> +    bbappend_re = re.compile( r".*/%s(_[^/]*)?\.bbappend$" % re.escape(pn))
> +    for filename in included_files:
> +        if bbappend_re.match(filename):
> +            bb.note("  Linking %s" % filename)
> +            destname = "00_%s" % (os.path.basename(filename))
> +            while os.path.exists("%s/%s" % (workdir, destname)):
> +                 destname = str(int(destname[:2]) + 1).zfill(2) + destname[2:]
> +            if not create_link(d, filename, "%s/%s" % (workdir, destname)):
> +                return False
> +
> +    return True
> +}
> +
> +# In addition to the func we want to make things able to be (re)run
> +# easily by the user so ensure it is available as a task.
> +addtask do_create_recipe_links
> +python do_create_recipe_links() {
> +    bb.build.exec_func("create_recipe_links", d)
> +}
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 254f8f1..2f6e686 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -21,6 +21,7 @@ do_devpyshell[doc] = "Starts an interactive Python shell for development/debuggi
>  do_devshell[doc] = "Starts a shell with the environment set up for development/debugging"
>  do_diffconfig[doc] = "Compares the old and new config files after running do_menuconfig for the kernel"
>  do_fetch[doc] = "Fetches the source code"
> +do_create_recipe_links[doc] = "Creates links to bb and bbappend files in a package's WORKDIR"
>  do_install[doc] = "Copies files from the compilation directory to a holding area"
>  do_install_ptest_base[doc] = "Copies the runtime test suite files from the compilation directory to a holding area"
>  do_kernel_checkout[doc] = "Checks out source/meta branches for a linux-yocto style kernel"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

