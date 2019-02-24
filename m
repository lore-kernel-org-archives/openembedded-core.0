Return-Path: <mac@mcrowe.com>
Received: from avasout02.plus.net (avasout02.plus.net [212.159.14.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2367C6BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Feb 2019 21:50:51 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id y1fegps8hx6b6y1ffgSoJQ; Sun, 24 Feb 2019 21:50:52 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=T4GiscCQ c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=8nJEP1OIZ-IA:10 a=CFTnQlWoA9kA:10 a=ag1SF4gXAAAA:8
	a=8RahD6dginXRfnt-E0AA:9
	a=wPNLvfGTeEIA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1gy1fe-0001fh-Nu
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Feb 2019 21:50:50 +0000
Date: Sun, 24 Feb 2019 21:50:50 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20190224215050.7cgi6n2jpmbamkfw@mcrowe.com>
References: <20190224210052.8974-1-mac@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20190224210052.8974-1-mac@mcrowe.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfOB74uvoO6EEvyiHdiF6b+MRkmaxvvqqyKOn/ULdy+knqLryl0BP5v0Lnc4FLto/x/TknppiY2S2g+HYeCB1XVldwm6/XlEOUy+Bn2H92A/X8IfTH6zc
	JRVEzYOkThKwba0TTpmZ5frJnomfk5YFVu0RNjN3QM0v3FD5P8lzrATn
Subject: Re: [PATCH] glibc: Install AArch64 loader link correctly for usrmerge+multilib
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
X-List-Received-Date: Sun, 24 Feb 2019 21:50:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sunday 24 February 2019 at 21:00:52 +0000, Mike Crowe wrote:
> * x86_64 (real loader in /lib as before)[2]
>   MACHINE = "qemux86"

This is not directly related to my patch, but according to
https://refspecs.linuxfoundation.org/elf/x86_64-abi-0.99.pdf §5.2.1 the
definitive location for the x86_64 loader is /lib64/ld-linux-x86-64.so.2
not /lib/ld-linux-x86-64.so.2. Debian:amd64 appears to have a /lib64
directory purely so that provide a symlink to the loader from that
location.

If this is true, then a similar symlink is required for x86_64 too, but
unfortunately this one needs to be in /lib64 so my patch would require some
tweaks to cope with that too.

Mike.

