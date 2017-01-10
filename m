Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 56AA760806
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2017 07:29:52 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id x2so81963558itf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 23:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=X5i70e3PSe23DIGjqGiq/3SqEamBj8g+9UDHFua56pk=;
	b=XlO/eo4Jp7mEeuqEpnLUqzF8xrcmzH66++7DnolfcVvxq+IpAbFahHNg12+XnXfNWj
	p2n46/a7FXmEm8D763gJgVXeaZD4F60Gnz5ejf2CVN//56/kRC5761zZHP81eUtT0iOU
	niAh6RKLHKo2CWbEwIhvTn+TlO67WsGjtqBDDe8DBWAUt24+eS1DhJVl4PLzXI8LqWMU
	MD/xVmDtUZ/bKs8tDsha3dAjJCp1nQkiS8/VIAtRyteW7zS7twnzs6ABON/2FanEo3iF
	R3nlr7nyFgAXxQwFEj0+pn+C+Hjx2ijoFM43hZl004JKFW155R34F+5NPJIH4eA3Mngc
	zPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=X5i70e3PSe23DIGjqGiq/3SqEamBj8g+9UDHFua56pk=;
	b=SEyFQTxN4fFMSqU05P2PfZTkhE3i5irlg52SHbhO72nT8aRORMImfo/3C43M+arjao
	e0lmtsnS7i9LnnD++mG1urOYNVG5GhAck1Hal1BCo1nONURd/6FFHz2kgjyItmsmOX5m
	JIz/T0U+2CAGyqT5E/2mcFnPAwbJelC8gucgqDZ9yKZh035i01aA1aGsXUBqjME+0UgI
	m97dt2HS2QTekfKGLyL+Bz9x8YPiUwwQYA4C/9JpA4R//bryGg8BsLvsoXswBXaCFx+C
	0ITqDtuuzvjjBmt03M/LFE8zWT5Q4AqSBn12kAuOR2o9oZYrxPrxFHq7GwSAA1IEYkhx
	HczQ==
X-Gm-Message-State: AIkVDXJSGo8Y6XQ85x9zJZvh1DE+Nw2FU1NnQRR+2euRxLtBw7G/F0JTE5Ba5KY9o2M7ou7h
X-Received: by 10.36.227.198 with SMTP id d189mr12404052ith.36.1484033393147; 
	Mon, 09 Jan 2017 23:29:53 -0800 (PST)
Received: from pohly-mobl1 (p57A56084.dip0.t-ipconnect.de. [87.165.96.132])
	by smtp.gmail.com with ESMTPSA id e24sm5024005itd.6.2017.01.09.23.29.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Jan 2017 23:29:51 -0800 (PST)
Message-ID: <1484033387.2137.106.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Tue, 10 Jan 2017 08:29:47 +0100
In-Reply-To: <1484020237.65791.26.camel@ranerica-desktop>
References: <cover.1482324587.git.patrick.ohly@intel.com>
	<66377b2510edebf997b04812ff93c9ef0bb3c47f.1482324587.git.patrick.ohly@intel.com>
	<1482968017.106950.76.camel@ranerica-desktop>
	<1483523017.28169.27.camel@intel.com>
	<1484020237.65791.26.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Tue, 10 Jan 2017 07:29:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-01-09 at 19:50 -0800, Ricardo Neri wrote:
> On Wed, 2017-01-04 at 10:43 +0100, Patrick Ohly wrote:
> > To
> > test that supporting separate code and variables also works, I've
> > implemented that locally so that ovmf.fd ovmf_secboot.fd, ovmf_code.fd,
> > ovmf_secboot_code.fd and ovmf_vars.fd get deployed and runqemu supports
> > more than one "ovmf" parameter - this worked nicely. Full change below.
> 
> ... Now that you have took the time to prototype the solution, we could
> put it to use.
> 
> > 
> > Now that I've implemented it, I wonder whether it would be worth
> > submitting that as part of rev2 of this patch series. Any opinions?
> > 
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> > index ef61b16..391274b 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -125,6 +125,8 @@ do_compile_class-target() {
> >      rm -rf ${S}/Build/Ovmf$OVMF_DIR_SUFFIX
> >      ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER}
> >      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.fd
> > +    ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/OVMF.code.fd
> > +    ln ${build_dir}/FV/OVMF_VARS.fd ${WORKDIR}/ovmf/OVMF.vars.fd
> >  
> >      # See CryptoPkg/Library/OpensslLib/Patch-HOWTO.txt and
> >      # https://src.fedoraproject.org/cgit/rpms/edk2.git/tree/ for
> > @@ -137,6 +139,7 @@ do_compile_class-target() {
> >      ( cd ${S}/CryptoPkg/Library/OpensslLib/ && ./Install.sh )
> >      ${S}/OvmfPkg/build.sh $PARALLEL_JOBS -a $OVMF_ARCH -b RELEASE -t ${FIXED_GCCVER} ${OVMF_SECURE_BOOT_FLAGS}
> >      ln ${build_dir}/FV/OVMF.fd ${WORKDIR}/ovmf/OVMF.secboot.fd
> > +    ln ${build_dir}/FV/OVMF_CODE.fd ${WORKDIR}/ovmf/OVMF.code.secboot.fd
> >      for i in Shell.efi EnrollDefaultKeys.efi; do
> >          ln ${build_dir}/${OVMF_ARCH}/$i ${WORKDIR}/ovmf/$i
> >      done
> > @@ -170,8 +173,9 @@ do_deploy() {
> >  }
> >  do_deploy_class-target() {
> >      # For use with "runqemu ovmf".
> > -    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.fd ${DEPLOYDIR}/ovmf.qcow2
> > -    qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/OVMF.secboot.fd ${DEPLOYDIR}/ovmf.secboot.qcow2
> > +    for i in OVMF OVMF.secboot OVMF.code OVMF.vars OVMF.code.secboot; do
> > +        qemu-img convert -f raw -O qcow2 ${WORKDIR}/ovmf/$i.fd ${DEPLOYDIR}/`echo $i | tr A-Z a-z`.qcow2
> 
> Will this preserve any previous OVMF_vars.fd that might exist in the
> directory.

No, it will overwrite ovmf.vars.qcow2 and any variables stored in that
get lost. That is consistent with rebuilding the disk image: a user who
wants to have a "persistent" virtual machine must copy the relevant file
and then use the full file paths. In this case, that means invoking
runqemu with the file path to the copy of ovmf.vars.qcow2 instead of
just "ovmf.vars".

> >          if self.ovmf_bios:
> > -            print('OVMF: [%s]' % self.ovmf_bios)
> > +            print('OVMF: %s' % self.ovmf_bios)
> 
> Is there a reason to remove the brackets here?

self.ovmf_bios is a list, so formatting it as string will add the
brackets. I found that more readable than the (from a semantic point of
view more correct) double brackets: [['.../ovmf.code.qcow2',
'.../ovmf.vars.qcow2']]

> > +        for ovmf in self.ovmf_bios:
> > +            format = ovmf.rsplit('.', 1)[-1]
> > +            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, ovmf)
> >          if self.ovmf_bios:
> > -            format = self.ovmf_bios.rsplit('.', 1)[-1]
> > -            self.qemu_opt += ' -drive if=pflash,format=%s,file=%s' % (format, self.ovmf_bios)
> >              # OVMF only supports normal VGA, i.e. we need to override a -vga vmware
> >              # that gets added for example for normal qemux86.
> >              self.qemu_opt += ' -vga std'
> > 
> > 
> I think this solution looks good as having separate file does not pose
> an extra hassle in the user: the recipe builds all that is needed and
> runqemu takes all that it needs.

But not automatically. "runqemu ovmf" would expand "ovmf" to
tmp/deploy/images/.../ovmf.qcow2 and thus use the combined file while
"runqemu ovmf.code ovmf.vars" tells runqemu that it is supposed to use
two flash drives, one with the code and one with the variables.


>  If in the future people shows an
> interest in having unified images, maybe that can be added as another
> PACKAGECONFIG?

As the unified code+vars is slightly easier to use, I'd prefer to keep
it around and just offer both. That's not such a big deal in terms of
performance and disk usage.


-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




