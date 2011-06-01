Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QReUG-0003Yh-GA
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:01:00 +0200
Received: by pwj9 with SMTP id 9so2547709pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 22:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:reply-to:user-agent
	:mime-version:to:subject:references:in-reply-to:x-enigmail-version
	:content-type:content-transfer-encoding;
	bh=mtVjTgfFsI4q5U4mRv6nqyymPE+ytpjkzj/xIWBHx1Q=;
	b=W5mLd5IYp6ZcoQmMa2TxbIb9obr9CEADygS1KNAfYTIjwfjA5aoYkuz5u3kA5O7Lvc
	Mvlj2AtoI1N/fKUPYmKe7kBRUBi9cZw34xfULYXdXPdahDc0mOfBswsbFl61+QtXGTm1
	w/5B8Eny6qeyfckHxWbTdLZDWaZSulD9EeEPU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:user-agent:mime-version:to:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	b=PjSSmOLVHeluzXy7zIRNnzs5F+tHBiWmkG9KNk3yKrfPRNdGDAERRpYyowjsiaMl8n
	hce8W+5qTheDTzA3gU/JsbBtdunCBpH5w2aYASVqTZTmdN5SIQIaSWPf3dm93saANIUn
	4X4YYxCjxcS9SA52SBqvEPIwg7tfFMEtn7oHg=
Received: by 10.142.210.4 with SMTP id i4mr801723wfg.250.1306907869362;
	Tue, 31 May 2011 22:57:49 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d15sm461701wfl.6.2011.05.31.22.57.47
	(version=SSLv3 cipher=OTHER); Tue, 31 May 2011 22:57:48 -0700 (PDT)
Message-ID: <4DE5D4DA.5000300@gmail.com>
Date: Tue, 31 May 2011 22:57:46 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4DE5CDED.3050405@linux.intel.com>
In-Reply-To: <4DE5CDED.3050405@linux.intel.com>
X-Enigmail-Version: 1.1.1
Subject: Re: [PATCH(fixed bugid)] tcmode-default: disable ARMv7 Optimization for	qt4-x11-free
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: raj.khem@gmail.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 01 Jun 2011 06:01:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/31/2011 10:28 PM, Saul Wold wrote:
> [YOCTO #1130]
> 
> This diables the ARMv7 optimizations that cause the compiler to fail
> with the following error
> 
> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h: In function
> 'void qt_removeObject(QObject*)':
> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
> error: output number 1 not directly addressable
> 

same

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 6eb34ef..6393ffd 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -29,6 +29,7 @@ PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?=
> "2009.08"
>  # Temporary workaround for gcc 4.6.0 ICE with beagleboard
>  # gcc bug: http://gcc.gnu.org/bugzilla/show_bug.cgi?id=47719
>  TARGET_CC_ARCH_arm_pn-mesa-xlib :=
> "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
> +TARGET_CC_ARCH_arm_pn-qt4-x11-free :=
> "${@'${TARGET_CC_ARCH}'.replace('armv7-a','armv5')}"
> 
>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk3l1NkACgkQuwUzVZGdMxSjpACfQvM/qIFqLl2qRxyIK4OPnYQc
mRYAn17JIHnJE6Y8O07I4ftjLaY9W+kv
=qzqA
-----END PGP SIGNATURE-----


