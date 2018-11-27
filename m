Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCD46D13A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Nov 2018 11:43:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wARBhVnd029257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 27 Nov 2018 11:43:32 GMT
Message-ID: <3aef1480074f667847b90b4bc009f9ec74beeb8b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 27 Nov 2018 11:43:31 +0000
In-Reply-To: <20181119172726.23571-1-raj.khem@gmail.com>
References: <20181119172726.23571-1-raj.khem@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] musl: Update to latest trunk
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
X-List-Received-Date: Tue, 27 Nov 2018 11:43:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 09:27 -0800, Khem Raj wrote:
> Complete changelogs are here
> 
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..79f653c6bc2881dd6855299c908a442f56cb7c2b
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-
> core/musl/musl_git.bb
> index 0d8f8eb2a4..f2b6361446 100644
> --- a/meta/recipes-core/musl/musl_git.bb
> +++ b/meta/recipes-core/musl/musl_git.bb
> @@ -4,7 +4,7 @@
>  require musl.inc
>  inherit linuxloader
>  
> -SRCREV = "c50985d5c8e316c5c464f352e79eeebfed1121a9"
> +SRCREV = "79f653c6bc2881dd6855299c908a442f56cb7c2b"
>  
>  PV = "1.1.20+git${SRCPV}"

As requested, I reran this and it failed again for both qemux86 and
qemux86-64 on the debian9 and centos7 workers (which makes me think its
not host related):

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/25
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/25

I didn't get to the -64 artefacts before they were overwritten but I
did save the qemux86 ones:

https://autobuilder.yocto.io/pub/non-release/20181126-6/musl-qemux86/

Cheers,

Richard


