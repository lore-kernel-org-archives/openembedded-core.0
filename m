Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqvd9-0002Nc-TS for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 00:54:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RNl5sH025039
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 23:47:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19527-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 23:46:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RNkvrA025011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 23:46:58 GMT
Message-ID: <1327708020.7307.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 23:47:00 +0000
In-Reply-To: <CAGDS+nnPcnUFG5xGgZzPFHrxQ4Nd75RGVjcuK-ycVQzNEp3aXA@mail.gmail.com>
References: <CAGDS+nnPcnUFG5xGgZzPFHrxQ4Nd75RGVjcuK-ycVQzNEp3aXA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: polkit broken?
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
X-List-Received-Date: Fri, 27 Jan 2012 23:54:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-27 at 11:33 -0800, Steve Sakoman wrote:
> I find that polkit is failing after a pull this morning:
> 
> ERROR: Function failed: BUILDSPEC (see
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
> for further information)
> ERROR: Logfile of failure stored in:
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
> Log data follows:
> | NOTE: Creating RPM package for polkit-dbg
> | NOTE: Creating RPM package for polkit
> | NOTE: Creating RPM package for polkit
> | NOTE: Creating RPM package for polkit-doc
> | NOTE: Creating RPM package for polkit-dev
> | NOTE: Creating RPM package for polkit-staticdev
> | NOTE: Creating RPM package for polkit-locale-da
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | ERROR: Function failed: BUILDSPEC (see
> /media/Work/yocto/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/polkit-0.104-r0/temp/log.do_package_write_rpm.25212
> for further information)
> | error: line 24: Illegal char '-' in EVR: Requires: systemd >= v38-53-ga3f914b
> | error: Package has no %description: polkit-0.104-r0.armv7a
> | Building target platforms: armv7a-vfp-neon-poky-linux-gnueabi
> NOTE: package polkit-0.104-r0: task do_package_write_rpm: Failed
> ERROR: Task 1059
> (/home/sakoman/source/yocto/poky/meta/recipes-extended/polkit/polkit_0.104.bb,
> do_package_write_rpm) failed with exit code '1'
> 
> My image does include systemd from meta-openembedded so I suspect that
> may be a factor.

I suspect so too.

> For those who are building with sysvinti, do you see this issue?

No, this looks like the version string for systemd is upsetting rpm
somehow, probably the inclusion of a "-". The rpm backend is supposed to
remap that character iirc...

Cheers,

Richard



