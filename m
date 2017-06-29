Return-Path: <razvan.heghedus@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id EC0397198D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 08:53:13 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v5T8oiS8026645; Thu, 29 Jun 2017 03:53:13 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2bcbe4bcem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 29 Jun 2017 03:53:13 -0500
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v5T8rCGa025678
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2017 03:53:12 -0500
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 29 Jun 2017 03:53:12 -0500
Received: from [10.113.0.62] (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 29 Jun 2017 03:53:11 -0500
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20170621120003.6440-1-razvan.heghedus@ni.com>
	<CADkTA4PQB7Yi-UXSg6Y+CePfX+bh08Znmh9t-cMgwOLAJy3fZQ@mail.gmail.com>
	<83c5936e-f9b9-93c8-ee14-29c0734d813e@ni.com>
	<CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com>
From: Razvan Heghedus <razvan.heghedus@ni.com>
Message-ID: <a78c41e3-fe8d-72cd-890d-fb4a9002dc8a@ni.com>
Date: Thu, 29 Jun 2017 11:54:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-06-29_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1706290144
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] kernel: add package version in dependencies for kernel packages
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
X-List-Received-Date: Thu, 29 Jun 2017 08:53:14 -0000
Content-Type: multipart/alternative;
	boundary="------------4C89ACA566BAD9509DAF6FB3"
Content-Language: en-US

--------------4C89ACA566BAD9509DAF6FB3
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/28/2017 04:10 AM, Bruce Ashfield wrote:
>
>
> On Tue, Jun 27, 2017 at 4:51 AM, Razvan Heghedus 
> <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>
>
>
>     On 06/26/2017 06:50 PM, Bruce Ashfield wrote:
>>
>>
>>     On Wed, Jun 21, 2017 at 8:00 AM, Heghedus Razvan
>>     <razvan.heghedus@ni.com <mailto:razvan.heghedus@ni.com>> wrote:
>>
>>         Make all dependencies from kernel family packages which depend
>>         on another kernel related package to depend on the same version.
>>         This creates a consistent state where kernel, kernel images and
>>         kernel modules have the same version, making a kernel upgrade
>>         leading to upgrades of the image and modules.
>>
>>         The upgrade works only if the KERNEL_VERSION_PKG_NAME remains
>>         the same for the newer versions.
>>
>>         Signed-off-by: Heghedus Razvan <razvan.heghedus@ni.com
>>         <mailto:razvan.heghedus@ni.com>>
>>         ---
>>          meta/classes/kernel-module-split.bbclass |  7 ++++---
>>          meta/classes/kernel.bbclass  | 15 +++++++++------
>>          meta/recipes-kernel/linux/linux-yocto.inc |  4 ++++
>>          3 files changed, 17 insertions(+), 9 deletions(-)
>>
>>         diff --git a/meta/classes/kernel-module-split.bbclass
>>         b/meta/classes/kernel-module-split.bbclass
>>         index 5e10dcf735..e247e66901 100644
>>         --- a/meta/classes/kernel-module-split.bbclass
>>         +++ b/meta/classes/kernel-module-split.bbclass
>>         @@ -33,7 +33,7 @@ PACKAGESPLITFUNCS_prepend =
>>         "split_kernel_module_packages "
>>          KERNEL_MODULES_META_PACKAGE ?= "kernel-modules"
>>
>>          KERNEL_MODULE_PACKAGE_PREFIX ?= ""
>>         -KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
>>         +KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION_PKG_NAME}"
>>          KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
>>
>>          python split_kernel_module_packages () {
>>         @@ -114,6 +114,7 @@ python split_kernel_module_packages () {
>>                      for dep in vals["depends"].split(","):
>>                          on = legitimize_package_name(dep)
>>                          dependency_pkg = format % on
>>         +                dependency_pkg += '
>>         ${@get_full_package_version(d)}'
>>          modinfo_deps.append(dependency_pkg)
>>                  for dep in modinfo_deps:
>>                      if not dep in rdepends:
>>         @@ -138,10 +139,10 @@ python split_kernel_module_packages () {
>>              postinst = d.getVar('pkg_postinst_modules')
>>              postrm = d.getVar('pkg_postrm_modules')
>>
>>         -    modules = do_split_packages(d,
>>         root='${nonarch_base_libdir}/modules',
>>         file_regex=module_regex, output_pattern=module_pattern,
>>         description='%s kernel module', postinst=postinst,
>>         postrm=postrm, recursive=True, hook=frob_metadata,
>>         extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
>>         +    modules = do_split_packages(d,
>>         root='${nonarch_base_libdir}/modules',
>>         file_regex=module_regex, output_pattern=module_pattern,
>>         description='%s kernel module', postinst=postinst,
>>         postrm=postrm, recursive=True, hook=frob_metadata,
>>         extra_depends='kernel-%s %s' %
>>         (d.getVar("KERNEL_VERSION_PKG_NAME"),
>>         get_full_package_version(d)))
>>              if modules:
>>                  metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
>>         -        d.appendVar('RDEPENDS_' + metapkg, ' '+'
>>         '.join(modules))
>>         +        d.appendVar('RDEPENDS_' + metapkg, ' '+'
>>         '.join(['{0} {1}'.format(module, get_full_package_version(d))
>>         for module in modules]))
>>
>>              # If modules-load.d and modprobe.d are empty at this
>>         point, remove them to
>>              # avoid warnings. removedirs only raises an OSError if
>>         an empty
>>         diff --git a/meta/classes/kernel.bbclass
>>         b/meta/classes/kernel.bbclass
>>         index 7a134d5c29..605c101e62 100644
>>         --- a/meta/classes/kernel.bbclass
>>         +++ b/meta/classes/kernel.bbclass
>>         @@ -55,7 +55,7 @@ python __anonymous () {
>>
>>                  d.setVar('FILES_kernel-image-' + typelower, '/' +
>>         imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
>>
>>         -        d.appendVar('RDEPENDS_kernel-image', ' ' +
>>         'kernel-image-' + typelower)
>>         +        d.appendVar('RDEPENDS_kernel-image', ' ' +
>>         'kernel-image-' + typelower + ' ${@get_full_package_version(d)}')
>>
>>                  d.setVar('PKG_kernel-image-' + typelower,
>>         'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
>>
>>         @@ -493,14 +493,17 @@ FILES_kernel-image = ""
>>          FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers*
>>         /boot/config* ${KERNEL_SRC_PATH}
>>         ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>>          FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>>          FILES_kernel-modules = ""
>>         -RDEPENDS_kernel = "kernel-base"
>>         +RDEPENDS_kernel = "kernel-base ${@get_full_package_version(d)}"
>>
>>
>>     Is that really supposed to be a space, between kernel-base and
>>     the package version
>>     call ? I guess so, since I see the same thing below in the
>>     RDEPENDS_kernel-base
>>     line below .. but it just reads strange to me.  i.e. if that's a
>>     RDEPENDS, where is the
>>     package get_full_package_version(d) created ?
>>
>     Yes, the space is supposed to be there. If it's inconvenient here,
>     it can be moved in the string returned by get_full_package_version()
>>     Are you trying to set a generic versionless RDEPENDS and a
>>     versioned one that doesn't
>>     contain 'kernel-' in the name ?
>     This will create a versioned RDEPENDS. The syntax for a versioned
>     package is: "package_name (= package_version)". This only append
>     the version to the current value.
>
>
> right. I was thinking of package rdepends, but not from the point of 
> view of a
> package manager.
>
> I think it would be better to get it all from the utility function, 
> since that makes it
> clear that it is a constructed value of the form you mentioned.
>
> Also, what if someone doesn't want the versioned depends ? If 
> everything is in a
> routine, they could override to get the behaviour they want.
There isn't a way to disable the versioned depends. Theoretically there 
shouldn't be problems, because this enforce that the modules and the 
kernel are at the same version(I mean the kernel and it's modules needs 
to be at the same version, so I don't see any problem with this). I 
could add a conditionals everywhere, but that involves an another variable.
>
> Out of curiosity .. have you tested this with both rpm and ipk ? I've 
> run into problems
> with versioned depends and ipk in the past, so it would be good to 
> confirm that this
> works consistently.
I tested with all package types(deb, rmp and ipk) and I didn't have any 
problem at all.
>
>
>>          # Allow machines to override this dependency if kernel image
>>         files are
>>          # not wanted in images as standard
>>         -RDEPENDS_kernel-base ?= "kernel-image"
>>         -PKG_kernel-image =
>>         "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>         +RDEPENDS_kernel-base ?= "kernel-image
>>         ${@get_full_package_version(d)}"
>>         +PKG_kernel-image = "kernel-image-${KERNEL_VERSION_PKG_NAME}"
>>          RDEPENDS_kernel-image +=
>>         "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux',
>>         'kernel-vmlinux', '', d)}"
>>         -PKG_kernel-base =
>>         "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>>         -RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>>         +PKG_kernel-base = "kernel-${KERNEL_VERSION_PKG_NAME}"
>>         +RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION_PKG_NAME}"
>>         +PKG_kernel-vmlinux = "kernel-vmlinux-${KERNEL_VERSION_PKG_NAME}"
>>
>>         +PKG_kernel-modules = "kernel-modules-${KERNEL_VERSION_PKG_NAME}"
>>         +PKG_kernel-dev = "kernel-dev-${KERNEL_VERSION_PKG_NAME}"
>>          ALLOW_EMPTY_kernel = "1"
>>          ALLOW_EMPTY_kernel-base = "1"
>>          ALLOW_EMPTY_kernel-image = "1"
>>         diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>>         b/meta/recipes-kernel/linux/linux-yocto.inc
>>         index 637506a2a8..c3d1284ad2 100644
>>         --- a/meta/recipes-kernel/linux/linux-yocto.inc
>>         +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>>         @@ -67,3 +67,7 @@ do_install_append(){
>>          addtask kernel_version_sanity_check after do_kernel_metadata
>>         do_kernel_checkout before do_compile
>>          addtask validate_branches before do_patch after
>>         do_kernel_checkout
>>          addtask kernel_configcheck after do_configure before do_compile
>>         +
>>         +def get_full_package_version(d):
>>         +    return "(= " + d.getVar("PKGV") + "-" + d.getVar("PKGR")
>>         + ")"
>>
>>
>>     This doesn't belong in linux-yocto.inc, since it is called in
>>     kernel.bbclass. It needs to be in the base
>>     class and have a namespace that indicates it is specific to the
>>     kernel.
>>
>     Yeah, you're right, this shouldn't be in linux-yocto.inc. I will
>     move it to the base class, but I need some info about namespace
>     thing, because I don't recall reading about it in documentations.
>
>
> Nothing fancy here, more convention than something technical. If this 
> is only working for
> the kernel, it should be def kernel_get_full_package_version() so the 
> context is clear and
> if another class/package add something similar, we won't collide.
>
> Bruce
>
>
>>     Bruce
>>
>>         +
>>         --
>>         2.13.1
>>
>>         --
>>         _______________________________________________
>>         Openembedded-core mailing list
>>         Openembedded-core@lists.openembedded.org
>>         <mailto:Openembedded-core@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>
>>
>>
>>
>>     -- 
>>     "Thou shalt not follow the NULL pointer, for chaos and madness
>>     await thee at its end"
>
>     -- 
>
>     Razvan
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"

-- 

Razvan


--------------4C89ACA566BAD9509DAF6FB3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 06/28/2017 04:10 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Tue, Jun 27, 2017 at 4:51 AM,
            Razvan Heghedus <span dir="ltr">&lt;<a
                href="mailto:razvan.heghedus@ni.com" target="_blank"
                moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">
                <div>
                  <div class="h5">
                    <p><br>
                    </p>
                    <br>
                    <div class="m_-2468894063971137113moz-cite-prefix">On
                      06/26/2017 06:50 PM, Bruce Ashfield wrote:<br>
                    </div>
                    <blockquote type="cite">
                      <div dir="ltr"><br>
                        <div class="gmail_extra"><br>
                          <div class="gmail_quote">On Wed, Jun 21, 2017
                            at 8:00 AM, Heghedus Razvan <span dir="ltr">&lt;<a
                                href="mailto:razvan.heghedus@ni.com"
                                target="_blank" moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;</span>
                            wrote:<br>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">Make
                              all dependencies from kernel family
                              packages which depend<br>
                              on another kernel related package to
                              depend on the same version.<br>
                              This creates a consistent state where
                              kernel, kernel images and<br>
                              kernel modules have the same version,
                              making a kernel upgrade<br>
                              leading to upgrades of the image and
                              modules.<br>
                              <br>
                              The upgrade works only if the
                              KERNEL_VERSION_PKG_NAME remains<br>
                              the same for the newer versions.<br>
                              <br>
                              Signed-off-by: Heghedus Razvan &lt;<a
                                href="mailto:razvan.heghedus@ni.com"
                                target="_blank" moz-do-not-send="true">razvan.heghedus@ni.com</a>&gt;<br>
                              ---<br>
                               meta/classes/kernel-module-sp<wbr>lit.bbclass 
                              |  7 ++++---<br>
                               meta/classes/kernel.bbclass             
                               | 15 +++++++++------<br>
                               meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc
                              |  4 ++++<br>
                               3 files changed, 17 insertions(+), 9
                              deletions(-)<br>
                              <br>
                              diff --git a/meta/classes/kernel-module-s<wbr>plit.bbclass
                              b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
                              index 5e10dcf735..e247e66901 100644<br>
                              --- a/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
                              +++ b/meta/classes/kernel-module-s<wbr>plit.bbclass<br>
                              @@ -33,7 +33,7 @@
                              PACKAGESPLITFUNCS_prepend =
                              "split_kernel_module_packages "<br>
                               KERNEL_MODULES_META_PACKAGE ?=
                              "kernel-modules"<br>
                              <br>
                               KERNEL_MODULE_PACKAGE_PREFIX ?= ""<br>
                              -KERNEL_MODULE_PACKAGE_SUFFIX ?=
                              "-${KERNEL_VERSION}"<br>
                              +KERNEL_MODULE_PACKAGE_SUFFIX ?=
                              "-${KERNEL_VERSION_PKG_NAME}"<br>
                               KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"<br>
                              <br>
                               python split_kernel_module_packages () {<br>
                              @@ -114,6 +114,7 @@ python
                              split_kernel_module_packages () {<br>
                                           for dep in
                              vals["depends"].split(","):<br>
                                               on =
                              legitimize_package_name(dep)<br>
                                               dependency_pkg = format %
                              on<br>
                              +                dependency_pkg += '
                              ${@get_full_package_version(d)<wbr>}'<br>
                                             
                               modinfo_deps.append(dependenc<wbr>y_pkg)<br>
                                       for dep in modinfo_deps:<br>
                                           if not dep in rdepends:<br>
                              @@ -138,10 +139,10 @@ python
                              split_kernel_module_packages () {<br>
                                   postinst =
                              d.getVar('pkg_postinst_modules<wbr>')<br>
                                   postrm =
                              d.getVar('pkg_postrm_modules')<br>
                              <br>
                              -    modules = do_split_packages(d,
                              root='${nonarch_base_libdir}/m<wbr>odules',
                              file_regex=module_regex,
                              output_pattern=module_pattern,
                              description='%s kernel module',
                              postinst=postinst, postrm=postrm,
                              recursive=True, hook=frob_metadata,
                              extra_depends='kernel-%s' %
                              (d.getVar("KERNEL_VERSION")))<br>
                              +    modules = do_split_packages(d,
                              root='${nonarch_base_libdir}/m<wbr>odules',
                              file_regex=module_regex,
                              output_pattern=module_pattern,
                              description='%s kernel module',
                              postinst=postinst, postrm=postrm,
                              recursive=True, hook=frob_metadata,
                              extra_depends='kernel-%s %s' %
                              (d.getVar("KERNEL_VERSION_PKG_<wbr>NAME"),
                              get_full_package_version(d)))<br>
                                   if modules:<br>
                                       metapkg =
                              d.getVar('KERNEL_MODULES_META_<wbr>PACKAGE')<br>
                              -        d.appendVar('RDEPENDS_' +
                              metapkg, ' '+' '.join(modules))<br>
                              +        d.appendVar('RDEPENDS_' +
                              metapkg, ' '+' '.join(['{0}
                              {1}'.format(module,
                              get_full_package_version(d)) for module in
                              modules]))<br>
                              <br>
                                   # If modules-load.d and modprobe.d
                              are empty at this point, remove them to<br>
                                   # avoid warnings. removedirs only
                              raises an OSError if an empty<br>
                              diff --git a/meta/classes/kernel.bbclass
                              b/meta/classes/kernel.bbclass<br>
                              index 7a134d5c29..605c101e62 100644<br>
                              --- a/meta/classes/kernel.bbclass<br>
                              +++ b/meta/classes/kernel.bbclass<br>
                              @@ -55,7 +55,7 @@ python __anonymous () {<br>
                              <br>
                                       d.setVar('FILES_kernel-image-<wbr>'
                              + typelower, '/' + imagedest + '/' + type
                              + '-${KERNEL_VERSION_NAME}')<br>
                              <br>
                              -        d.appendVar('RDEPENDS_kernel-i<wbr>mage',
                              ' ' + 'kernel-image-' + typelower)<br>
                              +        d.appendVar('RDEPENDS_kernel-i<wbr>mage',
                              ' ' + 'kernel-image-' + typelower + '
                              ${@get_full_package_version(d)<wbr>}')<br>
                              <br>
                                       d.setVar('PKG_kernel-image-' +
                              typelower, 'kernel-image-' + typelower +
                              '-${KERNEL_VERSION_PKG_NAME}')<br>
                              <br>
                              @@ -493,14 +493,17 @@ FILES_kernel-image =
                              ""<br>
                               FILES_kernel-dev = "/boot/System.map*
                              /boot/Module.symvers* /boot/config*
                              ${KERNEL_SRC_PATH}
                              ${nonarch_base_libdir}/modules<wbr>/${KERNEL_VERSION}/build"<br>
                               FILES_kernel-vmlinux =
                              "/boot/vmlinux-${KERNEL_VERSIO<wbr>N_NAME}"<br>
                               FILES_kernel-modules = ""<br>
                              -RDEPENDS_kernel = "kernel-base"<br>
                              +RDEPENDS_kernel = "kernel-base
                              ${@get_full_package_version(d)<wbr>}"<br>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>Is that really supposed to be a space,
                              between kernel-base and the package
                              version<br>
                            </div>
                            <div>call ? I guess so, since I see the same
                              thing below in the RDEPENDS_kernel-base</div>
                            <div>line below .. but it just reads strange
                              to me.  i.e. if that's a RDEPENDS, where
                              is the</div>
                            <div>package get_full_package_version(d)
                              created ?</div>
                            <div><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                Yes, the space is supposed to be there. If it's
                inconvenient here, it can be moved in the string
                returned by get_full_package_version()<span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <div>Are you trying to set a generic
                            versionless RDEPENDS and a versioned one
                            that doesn't</div>
                          <div>contain 'kernel-' in the name ?</div>
                          <div> </div>
                        </div>
                      </div>
                    </div>
                  </blockquote>
                </span> This will create a versioned RDEPENDS. The
                syntax for a versioned package is: "package_name (=
                package_version)". This only append the version to the
                current value.</div>
            </blockquote>
            <div><br>
            </div>
            <div>right. I was thinking of package rdepends, but not from
              the point of view of a</div>
            <div>package manager.</div>
            <div><br>
            </div>
            <div>I think it would be better to get it all from the
              utility function, since that makes it</div>
            <div>clear that it is a constructed value of the form you
              mentioned.</div>
            <div><br>
            </div>
            <div>Also, what if someone doesn't want the versioned
              depends ? If everything is in a</div>
            <div>routine, they could override to get the behaviour they
              want.</div>
          </div>
        </div>
      </div>
    </blockquote>
    There isn't a way to disable the versioned depends. Theoretically
    there shouldn't be problems, because this enforce that the modules
    and the kernel are at the same version(I mean the kernel and it's
    modules needs to be at the same version, so I don't see any problem
    with this). I could add a conditionals everywhere, but that involves
    an another variable.<br>
    <blockquote type="cite"
cite="mid:CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Out of curiosity .. have you tested this with both rpm
              and ipk ? I've run into problems</div>
            <div>with versioned depends and ipk in the past, so it would
              be good to confirm that this</div>
            <div>works consistently.</div>
          </div>
        </div>
      </div>
    </blockquote>
    I tested with all package types(deb, rmp and ipk) and I didn't have
    any problem at all.<br>
    <blockquote type="cite"
cite="mid:CADkTA4P8MjrFk720BzJbSq=_QBqfp8MAFghJXFRzsN4sAeuKAA@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF">
                <div>
                  <div class="h5"><br>
                    <blockquote type="cite">
                      <div dir="ltr">
                        <div class="gmail_extra">
                          <div class="gmail_quote">
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">  #
                              Allow machines to override this dependency
                              if kernel image files are<br>
                               # not wanted in images as standard<br>
                              -RDEPENDS_kernel-base ?= "kernel-image"<br>
                              -PKG_kernel-image =
                              "kernel-image-${@legitimize_pa<wbr>ckage_name('${KERNEL_VERSION}'<wbr>)}"<br>
                              +RDEPENDS_kernel-base ?= "kernel-image
                              ${@get_full_package_version(d)<wbr>}"<br>
                              +PKG_kernel-image =
                              "kernel-image-${KERNEL_VERSION<wbr>_PKG_NAME}"<br>
                               RDEPENDS_kernel-image +=
                              "${@base_conditional('KERNEL_I<wbr>MAGETYPE',
                              'vmlinux', 'kernel-vmlinux', '', d)}"<br>
                              -PKG_kernel-base =
                              "kernel-${@legitimize_package_<wbr>name('${KERNEL_VERSION}')}"<br>
                              -RPROVIDES_kernel-base +=
                              "kernel-${KERNEL_VERSION}"<br>
                              +PKG_kernel-base =
                              "kernel-${KERNEL_VERSION_PKG_N<wbr>AME}"<br>
                              +RPROVIDES_kernel-base +=
                              "kernel-${KERNEL_VERSION_PKG_N<wbr>AME}"<br>
                              +PKG_kernel-vmlinux =
                              "kernel-vmlinux-${KERNEL_VERSI<wbr>ON_PKG_NAME}"<br>
                            </blockquote>
                            <blockquote class="gmail_quote"
                              style="margin:0px 0px 0px
                              0.8ex;border-left:1px solid
                              rgb(204,204,204);padding-left:1ex">+PKG_kernel-modules
                              = "kernel-modules-${KERNEL_VERSI<wbr>ON_PKG_NAME}"<br>
                              +PKG_kernel-dev =
                              "kernel-dev-${KERNEL_VERSION_P<wbr>KG_NAME}"<br>
                               ALLOW_EMPTY_kernel = "1"<br>
                               ALLOW_EMPTY_kernel-base = "1"<br>
                               ALLOW_EMPTY_kernel-image = "1"<br>
                              diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc
                              b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                              index 637506a2a8..c3d1284ad2 100644<br>
                              --- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                              +++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
                              @@ -67,3 +67,7 @@ do_install_append(){<br>
                               addtask kernel_version_sanity_check after
                              do_kernel_metadata do_kernel_checkout
                              before do_compile<br>
                               addtask validate_branches before do_patch
                              after do_kernel_checkout<br>
                               addtask kernel_configcheck after
                              do_configure before do_compile<br>
                              +<br>
                              +def get_full_package_version(d):<br>
                              +    return "(= " + d.getVar("PKGV") + "-"
                              + d.getVar("PKGR") + ")"<br>
                            </blockquote>
                            <div><br>
                            </div>
                            <div>This doesn't belong in linux-yocto.inc,
                              since it is called in kernel.bbclass. It
                              needs to be in the base</div>
                            <div>class and have a namespace that
                              indicates it is specific to the kernel.</div>
                            <div><br>
                            </div>
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
                Yeah, you're right, this shouldn't be in
                linux-yocto.inc. I will move it to the base class, but I
                need some info about namespace thing, because I don't
                recall reading about it in documentations.</div>
            </blockquote>
            <div><br>
            </div>
            <div>Nothing fancy here, more convention than something
              technical. If this is only working for</div>
            <div>the kernel, it should be def
              kernel_get_full_package_version() so the context is clear
              and</div>
            <div>if another class/package add something similar, we
              won't collide.</div>
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div text="#000000" bgcolor="#FFFFFF"><span class=""><br>
                  <blockquote type="cite">
                    <div dir="ltr">
                      <div class="gmail_extra">
                        <div class="gmail_quote">
                          <div>Bruce</div>
                          <div> </div>
                          <blockquote class="gmail_quote"
                            style="margin:0px 0px 0px
                            0.8ex;border-left:1px solid
                            rgb(204,204,204);padding-left:1ex"> +<br>
                            <span
                              class="m_-2468894063971137113gmail-HOEnZb"><font
                                color="#888888">--<br>
                                2.13.1<br>
                                <br>
                                --<br>
                                ______________________________<wbr>_________________<br>
                                Openembedded-core mailing list<br>
                                <a
                                  href="mailto:Openembedded-core@lists.openembedded.org"
                                  target="_blank" moz-do-not-send="true">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
                                <a
                                  href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                  rel="noreferrer" target="_blank"
                                  moz-do-not-send="true">http://lists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
                              </font></span></blockquote>
                        </div>
                        <br>
                        <br clear="all">
                        <div><br>
                        </div>
                        -- <br>
                        <div
                          class="m_-2468894063971137113gmail_signature">"Thou
                          shalt not follow the NULL pointer, for chaos
                          and madness await thee at its end"</div>
                      </div>
                    </div>
                  </blockquote>
                  <br>
                </span><span class="HOEnZb"><font color="#888888">
                    <pre class="m_-2468894063971137113moz-signature" cols="72">-- 

Razvan
</pre>
                  </font></span></div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature" data-smartmail="gmail_signature">"Thou
            shalt not follow the NULL pointer, for chaos and madness
            await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 

Razvan
</pre>
  </body>
</html>

--------------4C89ACA566BAD9509DAF6FB3--
