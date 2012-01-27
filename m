Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1RqrfX-0005gf-R5
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 20:41:09 +0100
Received: by obbuo9 with SMTP id uo9so2293678obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 11:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kVPGzB99j8mKt9M6kTCUEzBsaHIVHZf8d7N36cV5PeU=;
	b=MxcAwGov1BktRnHiiOmsLPBoGqOdQ2juTqCmuBPPwvnKI+XU9h1q8hRlNpHoxw65Ls
	4Zmk1xGl4Z8sIR6Y89TBi6KQq7NnFpj5+XvNup0TDmqXAe347emukGVL/zBnS+Fg/2SV
	K9WKPaeB5nvYW5HatgXmpBpxKp/hxdn9FeX/4=
MIME-Version: 1.0
Received: by 10.182.11.41 with SMTP id n9mr7722763obb.24.1327692790741; Fri,
	27 Jan 2012 11:33:10 -0800 (PST)
Received: by 10.60.3.228 with HTTP; Fri, 27 Jan 2012 11:33:10 -0800 (PST)
Date: Fri, 27 Jan 2012 11:33:10 -0800
Message-ID: <CAGDS+nnPcnUFG5xGgZzPFHrxQ4Nd75RGVjcuK-ycVQzNEp3aXA@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: polkit broken?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 19:41:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

I find that polkit is failing after a pull this morning:

ERROR: Function failed: BUILDSPEC (see
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
for further information)
ERROR: Logfile of failure stored in:
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
Log data follows:
| NOTE: Creating RPM package for polkit-dbg
| NOTE: Creating RPM package for polkit
| NOTE: Creating RPM package for polkit
| NOTE: Creating RPM package for polkit-doc
| NOTE: Creating RPM package for polkit-dev
| NOTE: Creating RPM package for polkit-staticdev
| NOTE: Creating RPM package for polkit-locale-da
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| ERROR: Function failed: BUILDSPEC (see
/media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
for further information)
| error: line 24: Illegal char '-' in EVR: Requires: systemd >= v38-53-ga3f914b
| error: Package has no %description: polkit-0.104-r0.armv7a
| Building target platforms: armv7a-vfp-neon-poky-linux-gnueabi
NOTE: package polkit-0.104-r0: task do_package_write_rpm: Failed
ERROR: Task 1059
(/home/sakoman/source/yocto/poky/meta/recipes-extended/polkit/polkit_0.104.bb,
do_package_write_rpm) failed with exit code '1'

My image does include systemd from meta-openembedded so I suspect that
may be a factor.

For those who are building with sysvinti, do you see this issue?

Steve


