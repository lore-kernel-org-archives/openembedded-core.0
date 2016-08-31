Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C3544731F9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 07:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7mdhb008526; Wed, 31 Aug 2016 08:48:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eWpuEI8bW97P; Wed, 31 Aug 2016 08:48:39 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7V7mYm6008523
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 31 Aug 2016 08:48:35 +0100
Message-ID: <1472629714.29583.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Aug 2016 08:48:34 +0100
In-Reply-To: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
References: <cover.1472221205.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 00/28] Enable gtk-doc
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
X-List-Received-Date: Wed, 31 Aug 2016 07:48:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-26 at 17:28 +0300, Alexander Kanavin wrote:
> This patchset adds gtk-doc support to OE-core. It requires running
> transient binaries during build time, which is achieved via qemu,
> and so there are all the same caveats as with gobject-introspection.
> 
> Gtk-doc generation happens if 'api-documentation' distro feature is
> enabled
> (it is by default), and 'qemu-usermode' is in machine features.
> Disable
> the former if api documentation is not needed in your distro; disable
> the latter
> if qemu does not work correctly for your target machine.
> 
> Gtk-doc support is a part of a broader task to enable API
> documentation
> support in OE-core; later on I will add support for doxygen and
> docbook, enable
> more manpages, and clean up the legacy SGML stack if possible.

There were a lot of similar look failures on the autobuilder:

http://errors.yoctoproject.org/Errors/Details/81392/
http://errors.yoctoproject.org/Errors/Details/81397/
http://errors.yoctoproject.org/Errors/Details/81393/
http://errors.yoctoproject.org/Errors/Details/81390/
http://errors.yoctoproject.org/Errors/Details/81391/
http://errors.yoctoproject.org/Errors/Details/81383/

Cheers,

Richard



