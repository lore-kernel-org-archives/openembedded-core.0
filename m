Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id D6CED71C9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 11:09:39 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id l66so179106519ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 03:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=AWnQiALgR3iHQ2dJJp2rKMWDP1ugTz2XzZCq1maBkQs=;
	b=lWJiJZDpCkonf/n3P5IKs1KQYSnyYZQtiowzhyrdoATcE/gxVPX4s1KXJNwSBZ5Npu
	9wZWJ+Kz3uT3ZQCPqJK2N9gai3tkR/LeTjgaJi46bUk3AmHZu0DvKuxCRD3v+xDJORxk
	hDynMbE2sIkUJAxEQjkvStpTrerNEnYWg10aBxyrcFPo7ZF7oOpLou7OxOTB8R+oyUun
	sJPpen9/qOwIBsZb9tlZwF8i/RNlHj/dO313mCSEHcssAsGyp8sH7b53ooh65YgvaEX9
	3dpKhlTPcEPy0UQ9c/WmopHpWISqfR3as25o3QNjELJ1gcDGAqvMZS5sNOBcNcpqluRa
	LKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=AWnQiALgR3iHQ2dJJp2rKMWDP1ugTz2XzZCq1maBkQs=;
	b=Ul9bEaP5/EkAB7WEnBFm4fU6eIy0oRnWF0FIXubd/Msl4cCeTij3MyNwKPmIVdBKIG
	WrRAQ8CnQiQ0SJkOGIVCTb8w8C2qhGy9y+bo7wLzb5MerPPTCyqKXsUPsxn8NikpTqmp
	bFfm8BdeIP7oPhXyVw36LOujZY33Op58dlKgTbfxmMiHr/dPoRrXM4hDoCmkm6ssvYiW
	U3bODc1k66PHSB1CLIvKzpvsaHlUSLmUxV/J79E39Ny4ljupaeoZM/g3MPC9c0r5omWN
	K7QVUjWVg594N+mNtaCpXcQQrVZSVv9HZWOkfUKMQkHMwEKEv/pNU4n67U5sXOk4J6QB
	Rpow==
X-Gm-Message-State: AIkVDXLQ9C+0L8GxZmnw2r6oZ1yiZeyaOdzpXhZrsUPaLwYVta3lkKg4bk8Y6uiiJHS+lSvJ
X-Received: by 10.107.140.193 with SMTP id o184mr5635798iod.17.1486033780348; 
	Thu, 02 Feb 2017 03:09:40 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E270.dip0.t-ipconnect.de. [93.232.226.112])
	by smtp.gmail.com with ESMTPSA id l31sm721796iod.17.2017.02.02.03.09.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 03:09:38 -0800 (PST)
Message-ID: <1486033776.14889.45.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 02 Feb 2017 12:09:36 +0100
In-Reply-To: <d4623190-c52c-36f5-a1d5-a5c4e3214b62@gmail.com>
References: <1485865762.20333.161.camel@intel.com>
	<d4623190-c52c-36f5-a1d5-a5c4e3214b62@gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: potential bashism in guile_2.0.13.bb
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
X-List-Received-Date: Thu, 02 Feb 2017 11:09:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-02-01 at 09:03 -0800, Khem Raj wrote:
> 
> On 1/31/17 4:29 AM, Patrick Ohly wrote:
> > Hello!
> > 
> > verify-bashisms (after some fixing of the script) reports:
> > 
> > /work/iot-ref-kit/openembedded-core/meta/recipes-devtools/guile/guile_2.0.13.bb
> >  possible bashism in guile_cross_config line 94 ($'...' should be "$(printf '...')"):  
> >         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> > 			> ${B}/guile-config.cross
> > 
> > 
> > This is for:
> > 
> > guile_cross_config() {
> > 	# this is only for target recipe
> > 	if [ "${PN}" = "guile" ]
> > 	then
> > 	        # Create guile-config returning target values instead of native values
> > 	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> >         	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
> > 			> ${B}/guile-config.cross
> > 
> > And the resulting guile-config.cross has (when /bin/sh -> /bin/dash):
> > 
> > #!/fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/guile/2.0.13-r0/recipe-sysroot-native/usr/bin/x86_64-linux-guile$ \
> > --no-auto-compile -e main -s
> > !#
> > (define %guile-build-info '(
> > ...
> > 
> > This looks rather strange to me and I've no idea how the Linux kernel
> > will interpret that first shebang line, which literally ends in
> > ...guile$ \
> > 
> > Is the content as intended?
> 
> it should have come out as path to native guile with options, I think if
> this is not happening it might just be installing wrong wrapper when
> used it should complain.

Here's a test script:
vvvvvvvvvvvvvvvvvvvvvvvv
#!/bin/echo \
hello world
^^^^^^^^^^^^^^^^^^^^^^^^

That prints:
\ /tmp/test2

It doesn't look like line continuation in the shebang line works, so the
above guile-config.cross is just wrong. However, both dash and bash do
the same thing, so I guess the file is not used at all?

>  In any case its better to make it shell
> independent.

So the correct content of guile-config.cross would be this?

#!/.../guile/2.0.13-r0/recipe-sysroot-native/usr/bin/x86_64-linux-guile --no-auto-compile -e main -s
!#
(define %guile-build-info '(
...

I have no idea what the script is supposed to do, so I'm a bit reluctant
to change anything.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




