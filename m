Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 84BCF71C8F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 00:10:04 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1c2oYd-0006IY-QC; Sat, 05 Nov 2016 01:10:04 +0100
Message-ID: <1478304597.3662.28.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>, Nicolas Dechesne
	<nicolas.dechesne@linaro.org>
Date: Sat, 05 Nov 2016 00:09:57 +0000
In-Reply-To: <CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
References: <1476952202-8842-1-git-send-email-koen.kooi@linaro.org>
	<CAJTo0LaC2t1BN9VpKRx4W7fMT88mDdmCBYhzgBgvsdDJXhNk_w@mail.gmail.com>
	<CAP71Wjyy-qQH+nE34FTKUhqgRqGZocpfQ4CrkmTPh+OOMGK6jg@mail.gmail.com>
	<CAJTo0LZAGq8szm0vL0wyyR_rFVe1LBoMWYcoZh+VBMBcw5kW-Q@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libbsd 0.8.3: BBCLASSEXTEND to native and nativesdk
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
X-List-Received-Date: Sat, 05 Nov 2016 00:10:05 -0000
Content-Type: multipart/alternative; boundary="=-a9zCtRVxEjbtvLkO9e07"

--=-a9zCtRVxEjbtvLkO9e07
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-11-04 at 23:24 +0000, Burton, Ross wrote:
> > No, I checked the files in /usr on the host, as this is a native
build it should be linking against the host libc.
> 
> $ grep -r getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom
> 
> 
> Yes, looks like Debian headers are a bit broken.
> 
> 
> 

That would happen if your glibc was compiled against a newer version of
the kernel headers than you actually have installed (bits/syscall.h is
auto-generated from the kernel headers at build time). If this is a
clean Debian install then it does sound like they have messed up the
packaging somehow.

p.


--=-a9zCtRVxEjbtvLkO9e07
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Fri, 2016-11-04 at 23:24 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra">No, I checked the files in /usr on the host, as this is a native build it should be linking against the host libc.</div><div class="gmail_extra"><br></div><div class="gmail_extra"><div class="gmail_extra">$ grep -r getrandom</div><div class="gmail_extra">x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom</div><div class="gmail_extra">x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom</div><div class="gmail_extra">x86_64-linux-gnu/bits/syscall.h:#define SYS_getrandom __NR_getrandom</div></div><div class="gmail_extra"><div class="gmail_extra"><br></div><div>Yes, looks like Debian headers are a bit broken.</div></div></div>
</blockquote><div><br></div><div>That would happen if your glibc was compiled against a newer version of the kernel headers than you actually have installed (bits/syscall.h is auto-generated from the kernel headers at build time). If this is a clean Debian install then it does sound like they have messed up the packaging somehow.</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-a9zCtRVxEjbtvLkO9e07--
