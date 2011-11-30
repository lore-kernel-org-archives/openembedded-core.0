Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVlqc-0004je-As; Wed, 30 Nov 2011 16:13:22 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUF6fAt000648;
	Wed, 30 Nov 2011 15:06:41 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32633-03; Wed, 30 Nov 2011 15:06:36 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAUF6X8c000642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 Nov 2011 15:06:34 GMT
Message-ID: <1322665602.12609.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 15:06:42 +0000
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 00/26] Various Package Updates
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
X-List-Received-Date: Wed, 30 Nov 2011 15:13:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-29 at 15:00 -0800, Saul Wold wrote:
> Saul Wold (26):
>   wget: Update to 1.13.4
>   json-glib: Update to 0.14.2
>   libdrm: Update to 2.4.27
>   mkfontscale: Update to 1.0.9
>   xdpyinfo: Update to 1.3.0
>   xinit: Update to 1.3.1
>   xkbcomp: Update to 1.2.3
>   xprop: Update to 1.2.1
>   xrandr: Update to 1.3.5
>   xset: Update to 1.2.2
>   xwininfo: Update to 1.1.2
>   xf86-input-mouse: Update to 1.7.1
>   xf86-input-synaptics: Update to 1.5.0
>   xf86-video-intel: Update to 2.17.0
>   lame: Update to 3.99.3
>   gdbm: Update to 1.10
>   libtasn1: Update to 2.11
>   ocf-linux: Add ocf-linux to support openssl 1.0
>   openssl-0.9.8: move parallel-make fix to 0.9.8
>   openssl: Add openssl 1.0
>   PR Bump for OpenSSL 1.0
>   Distro Tracking: Update Ownership and Update Dates

I've taken these including openssl 1.0.

>   xserver-xorg*: Update to 1.11.2

Checksum removal.

>   gnutls: Update to 2.12.14

Looks like a patch might be missing?

>   libiconv: Update to 1.14

Checksum removal.

>   coreutils: build and install hostname

I saw some comments about not taking this?

Cheers,

Richard



