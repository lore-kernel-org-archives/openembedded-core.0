Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id C2AEC6F834
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 06:18:56 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w61so11038840wes.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 23:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=0YuN9kDSRvn7mjbmoNZYqlOWdmEAB4AWCj6E2CGfxkA=;
	b=d22XCwURc/fsq5tdZowo8yEhBrj+3f4BeujDVv3Fkyq+VKAU1jhykMBTIQFN1SuHZD
	eds2FUX+9HjcL3345up9RVPvdl4+ti7R4faTEQAiLvqzuAwnE90THKuKa424wxHkjFdr
	9Z3VaNUccX5Lz93PtDUcbFk8U/2hyfZv91HLnEbwJMMgKn2qrGB0CGx9WOGVll52ZNo6
	PR1WDEzjwG/GKPajeiWKVgR3XIJflPOnYbTUxXONjcBKMCosSS5HIOWsYcC44zUp8W99
	Q7EYB4yw+PQbmcIFs0nPy36ky+7J+hIFhQdSzQvuE/4xSF+nawCfSIY5eN4VrxP5hSta
	qhcg==
X-Gm-Message-State: ALoCoQlmnmZKQayJULxud34iRWwlTrqA/hfcJnGH40SIF2jx6W6rXT/hHAjAjytDhyu/rEz5T0/D
X-Received: by 10.180.205.239 with SMTP id lj15mr6220397wic.22.1394605136301; 
	Tue, 11 Mar 2014 23:18:56 -0700 (PDT)
Received: from ?IPv6:2001:610:612::ad9a:36f4:e2d4:2973?
	([2001:610:612:0:ad9a:36f4:e2d4:2973])
	by mx.google.com with ESMTPSA id
	qg3sm13003349wic.10.2014.03.11.23.18.54 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Mar 2014 23:18:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CF44C1BC.76A1B%dvhart@linux.intel.com>
Date: Wed, 12 Mar 2014 07:18:50 +0100
Message-Id: <C1E5DA11-A6F0-4527-A2A2-492A3418CC5E@dominion.thruhere.net>
References: <cover.1394128875.git.stefanx.stanacar@intel.com>
	<23d446488f4304516b483a2293bd34c86a23bdff.1394128875.git.stefanx.stanacar@intel.com>
	<CF3E3767.74FE9%dvhart@linux.intel.com>
	<1394186245.29948.5.camel@firebird.rb.intel.com>
	<CF44C1BC.76A1B%dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1874)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] classes: Add gummiboot class
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
X-List-Received-Date: Wed, 12 Mar 2014 06:18:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 mrt. 2014, om 22:38 heeft Darren Hart <dvhart@linux.intel.com> het =
volgende geschreven:

> On 3/7/14, 1:57, "Stanacar, StefanX" <stefanx.stanacar@intel.com> =
wrote:
>=20
>>=20
>>=20
>>=20
>> On Thu, 2014-03-06 at 14:36 -0800, Darren Hart wrote:
>>> On 3/6/14, 10:15, "Stefan Stanacar" <stefanx.stanacar@intel.com> =
wrote:
>>>=20
>>>> Adds a gummiboot class similar to grub-efi class and makes the
>>> necessary
>>>> changes so it can be used for live/hddimg images as well.
>>>>=20
>>>> One can set EFI_PROVIDER =3D "gummiboot" in local.conf to use =
gummiboot
>>>> instead of grub-efi.
>>>> Gummiboot requires some kernel options that are not enabled by =
default,
>>>> so one has to build
>>>> with KERNEL_FEATURES_append =3D " cfg/efi-ext".
>>>=20
>>> cfg/efi is insufficient?
>>>=20
>>=20
>> cfg/efi doesn't have CONFIG_EFI_STUB=3Dy which is required by =
gummiboot.
>> cfg/efi-ext adds more than that, it's true.
>=20
> Weird... Although the STUB should probably be in efi rather than =
efi-ext.
> I'm surprised gummiboot requires STUB... Since STUB is there to allow =
the
> kernel to be booted directly, no bootloader required. I guess =
gummiboot is
> slightly less than a boot loader :-)

The gummiboot docs still claim to support both 'linux' and 'efi', so =
it's supposed to work.

regards,

Koen

>=20
> I'd Ack a patch to move STUB from efi-ext to efi.
>=20
>=20
>>=20
>> It's also a good idea to enable CONFIG_EFIVARS_FS, which is the
>> newer/better interface than CONFIG_EFI_VARS that cfg/efi-ext enables.
>=20
>=20
> Hrm... OK, perhaps time to revisit those fragments and update them for
> current usage.
>=20
>=20
> --
> Darren
>=20
>>>>=20
>>>> The install scripts have been updated too, keeping the old =
behaviour
>>>> around,
>>>> but accounting for the new boot loader config files (if they =
exist).
>>>> It can be argued that the installer and bootimg are a bit wierd and =
not
>>>> necessarily correct,
>>>> but I wanted to have the exact same behviour with gummiboot.
>>>> With the default EFI_PROVIDER =3D "grub-efi" nothing changes, =
everthing
>>>> should be just as before.
>>>>=20
>>>> I've tested live boot, install and normal boot on:
>>>>   - FRI2
>>>>   - genericx86-64 on NUC
>>>> with:
>>>> EFI_PROVIDER =3D "gummiboot"
>>>> KERNEL_FEATURES_append =3D " cfg/efi-ext"
>>>> in local.conf.
>>>>=20
>>>> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
>>>=20
>>>=20
>>> Generally looks good. My only reservation is the same as for 2/3, =
should
>>> we define an EFI interface rather than having to construct function
>>> names
>>> in the consumers of this class?
>>=20
>> I don't have a strong opinion here, it just seemed the simplest way =
atm,
>> then adding another interface.
>>=20
>> Cheers,
>> Stefan
>>=20
>>>=20
>>> --
>>> Darren
>>>=20
>>>> ---
>>>> meta/classes/gummiboot.bbclass                     | 112
>>>> +++++++++++++++++++++
>>>> .../initrdscripts/files/init-install-efi.sh        |  51 +++++++---
>>>> 2 files changed, 147 insertions(+), 16 deletions(-)
>>>> create mode 100644 meta/classes/gummiboot.bbclass
>>>>=20
>>>> diff --git a/meta/classes/gummiboot.bbclass
>>>> b/meta/classes/gummiboot.bbclass
>>>> new file mode 100644
>>>> index 0000000..5c11286
>>>> --- /dev/null
>>>> +++ b/meta/classes/gummiboot.bbclass
>>>> @@ -0,0 +1,112 @@
>>>> +EFICLASS_FUNC_PREFIX =3D "gummiboot"
>>>> +
>>>> +do_bootimg[depends] +=3D "gummiboot:do_deploy"
>>>> +do_bootdirectdisk[depends] +=3D "gummiboot:do_deploy"
>>>> +
>>>> +EFIDIR =3D "/EFI/BOOT"
>>>> +
>>>> +GUMMIBOOT_CFG ?=3D "${S}/loader.conf"
>>>> +GUMMIBOOT_ENTRIES ?=3D ""
>>>> +GUMMIBOOT_TIMEOUT ?=3D "10"
>>>> +
>>>> +gummiboot_populate() {
>>>> +        DEST=3D$1
>>>> +
>>>> +        EFI_IMAGE=3D"gummibootia32.efi"
>>>> +        DEST_EFI_IMAGE=3D"bootia32.efi"
>>>> +        if [ "${TARGET_ARCH}" =3D "x86_64" ]; then
>>>> +            EFI_IMAGE=3D"gummibootx64.efi"
>>>> +            DEST_EFI_IMAGE=3D"bootx64.efi"
>>>> +        fi
>>>> +
>>>> +        install -d ${DEST}${EFIDIR}
>>>> +        # gummiboot requires these paths for configuration files
>>>> +        # they are not customizable so no point in new vars
>>>> +        install -d ${DEST}/loader
>>>> +        install -d ${DEST}/loader/entries
>>>> +        install -m 0644 ${DEPLOY_DIR_IMAGE}/${EFI_IMAGE}
>>>> ${DEST}${EFIDIR}/${DEST_EFI_IMAGE}
>>>> +        install -m 0644 ${GUMMIBOOT_CFG} =
${DEST}/loader/loader.conf
>>>> +        for i in ${GUMMIBOOT_ENTRIES}; do
>>>> +            install -m 0644 ${i} ${DEST}/loader/entries
>>>> +        done
>>>> +}
>>>> +
>>>> +gummiboot_iso_populate() {
>>>> +        iso_dir=3D$1
>>>> +        gummiboot_populate $iso_dir
>>>> +        mkdir -p ${EFIIMGDIR}/${EFIDIR}
>>>> +        cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
>>>> +        cp $iso_dir/vmlinuz ${EFIIMGDIR}
>>>> +        echo "${DEST_EFI_IMAGE}" > ${EFIIMGDIR}/startup.nsh
>>>> +        if [ -f "$iso_dir/initrd" ] ; then
>>>> +            cp $iso_dir/initrd ${EFIIMGDIR}
>>>> +        fi
>>>> +}
>>>> +
>>>> +gummiboot_hddimg_populate() {
>>>> +        gummiboot_populate $1
>>>> +}
>>>> +
>>>> +python build_gummiboot_cfg() {
>>>> +    s =3D d.getVar("S", True)
>>>> +    labels =3D d.getVar('LABELS', True)
>>>> +    if not labels:
>>>> +        bb.debug(1, "LABELS not defined, nothing to do")
>>>> +        return
>>>> +
>>>> +    if labels =3D=3D []:
>>>> +        bb.debug(1, "No labels, nothing to do")
>>>> +        return
>>>> +
>>>> +    cfile =3D d.getVar('GUMMIBOOT_CFG', True)
>>>> +    try:
>>>> +         cfgfile =3D open(cfile, 'w')
>>>> +    except OSError:
>>>> +        raise bb.build.funcFailed('Unable to open %s' % (cfile))
>>>> +
>>>> +    cfgfile.write('# Automatically created by OE\n')
>>>> +    cfgfile.write('default %s\n' % (labels.split()[0]))
>>>> +    timeout =3D d.getVar('GUMMIBOOT_TIMEOUT', True)
>>>> +    if timeout:
>>>> +        cfgfile.write('timeout %s\n' % timeout)
>>>> +    else:
>>>> +        cfgfile.write('timeout 10\n')
>>>> +    cfgfile.close()
>>>> +
>>>> +    for label in labels.split():
>>>> +        localdata =3D d.createCopy()
>>>> +
>>>> +        overrides =3D localdata.getVar('OVERRIDES', True)
>>>> +        if not overrides:
>>>> +            raise bb.build.FuncFailed('OVERRIDES not defined')
>>>> +
>>>> +        entryfile =3D "%s/%s.conf" % (s, label)
>>>> +        d.appendVar("GUMMIBOOT_ENTRIES", " " + entryfile)
>>>> +        try:
>>>> +            entrycfg =3D open(entryfile, "w")
>>>> +        except OSError:
>>>> +            raise bb.build.funcFailed('Unable to open %s' %
>>> (entryfile))
>>>> +        localdata.setVar('OVERRIDES', label + ':' + overrides)
>>>> +        bb.data.update_data(localdata)
>>>> +
>>>> +        entrycfg.write('title %s\n' % label)
>>>> +        entrycfg.write('linux /vmlinuz\n')
>>>> +
>>>> +        append =3D localdata.getVar('APPEND', True)
>>>> +        initrd =3D localdata.getVar('INITRD', True)
>>>> +
>>>> +        if initrd:
>>>> +            entrycfg.write('initrd /initrd\n')
>>>> +        lb =3D label
>>>> +        if label =3D=3D "install":
>>>> +            lb =3D "install-efi"
>>>> +        entrycfg.write('options LABEL=3D%s ' % lb)
>>>> +        if append:
>>>> +            entrycfg.write('%s' % append)
>>>> +        entrycfg.write('\n')
>>>> +        entrycfg.close()
>>>> +}
>>>> +
>>>> +python build_efi_cfg() {
>>>> +    bb.build.exec_func("build_gummiboot_cfg", d)
>>>> +}
>>>> diff --git =
a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>>> b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>>> index 9846637..ed3221b 100644
>>>> --- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>>> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
>>>> @@ -104,6 +104,7 @@ parted /dev/${device} mklabel gpt
>>>>=20
>>>> echo "Creating boot partition on $bootfs"
>>>> parted /dev/${device} mkpart primary 0% $boot_size
>>>> +parted /dev/${device} set 1 boot on
>>>>=20
>>>> echo "Creating rootfs partition on $rootfs"
>>>> parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
>>>> @@ -149,23 +150,41 @@ mount $bootfs /ssd
>>>>=20
>>>> EFIDIR=3D"/ssd/EFI/BOOT"
>>>> mkdir -p $EFIDIR
>>>> -GRUBCFG=3D"$EFIDIR/grub.cfg"
>>>> -
>>>> cp /media/$1/vmlinuz /ssd
>>>> -# Copy the efi loader and config (booti*.efi and grub.cfg)
>>>> -cp /media/$1/EFI/BOOT/* $EFIDIR
>>>> -
>>>> -# Update grub config for the installed image
>>>> -# Delete the install entry
>>>> -sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
>>>> -# Delete the initrd lines
>>>> -sed -i "/initrd /d" $GRUBCFG
>>>> -# Delete any LABEL=3D strings
>>>> -sed -i "s/ LABEL=3D[^ ]*/ /" $GRUBCFG
>>>> -# Delete any root=3D strings
>>>> -sed -i "s/ root=3D[^ ]*/ /" $GRUBCFG
>>>> -# Add the root=3D and other standard boot options
>>>> -sed -i "s@linux /vmlinuz *@linux /vmlinuz root=3D$rootfs rw =
$rootwait
>>>> quiet @" $GRUBCFG
>>>> +# Copy the efi loader
>>>> +cp /media/$1/EFI/BOOT/*.efi $EFIDIR
>>>> +
>>>> +if [ -f /media/$1/EFI/BOOT/grub.cfg ]; then
>>>> +    GRUBCFG=3D"$EFIDIR/grub.cfg"
>>>> +    cp /media/$1/EFI/BOOT/grub.cfg $GRUBCFG
>>>> +    # Update grub config for the installed image
>>>> +    # Delete the install entry
>>>> +    sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
>>>> +    # Delete the initrd lines
>>>> +    sed -i "/initrd /d" $GRUBCFG
>>>> +    # Delete any LABEL=3D strings
>>>> +    sed -i "s/ LABEL=3D[^ ]*/ /" $GRUBCFG
>>>> +    # Delete any root=3D strings
>>>> +    sed -i "s/ root=3D[^ ]*/ /" $GRUBCFG
>>>> +    # Add the root=3D and other standard boot options
>>>> +    sed -i "s@linux /vmlinuz *@linux /vmlinuz root=3D$rootfs rw
>>> $rootwait
>>>> quiet @" $GRUBCFG
>>>> +fi
>>>> +
>>>> +if [ -d /media/$1/loader ]; then
>>>> +    GUMMIBOOT_CFGS=3D"/ssd/loader/entries/*.conf"
>>>> +    # copy config files for gummiboot
>>>> +    cp -dr /media/$1/loader /ssd
>>>> +    # delete the install entry
>>>> +    rm -f /ssd/loader/entries/install.conf
>>>> +    # delete the initrd lines
>>>> +    sed -i "/initrd /d" $GUMMIBOOT_CFGS
>>>> +    # delete any LABEL=3D strings
>>>> +    sed -i "s/ LABEL=3D[^ ]*/ /" $GUMMIBOOT_CFGS
>>>> +    # delete any root=3D strings
>>>> +    sed -i "s/ root=3D[^ ]*/ /" $GUMMIBOOT_CFGS
>>>> +    # add the root=3D and other standard boot options
>>>> +    sed -i "s@options *@options root=3D$rootfs rw $rootwait quiet =
@"
>>>> $GUMMIBOOT_CFGS
>>>> +fi
>>>>=20
>>>> umount /ssd
>>>> sync
>>>> --=20
>>>> 1.8.5.3
>>>>=20
>>>>=20
>>>=20
>>>=20
>>=20
>>=20
>=20
>=20
> --=20
> Darren Hart
> Yocto Project - Linux Kernel
> Intel Open Source Technology Center


