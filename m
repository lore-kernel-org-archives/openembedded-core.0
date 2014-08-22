Return-Path: <philip@balister.org>
X-Greylist: delayed 399 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 22 Aug 2014 16:51:15 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 1B93065DB1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 16:51:15 +0000 (UTC)
Received: (qmail 11529 invoked by uid 1003); 22 Aug 2014 16:44:36 -0000
Received: from unknown (HELO ?10.50.10.85?) (philip@opensdr.com@69.7.123.146)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	22 Aug 2014 16:44:36 -0000
Message-ID: <53F77370.2060603@balister.org>
Date: Fri, 22 Aug 2014 10:44:32 -0600
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.7.0
MIME-Version: 1.0
To: Peter Seebach <peter.seebach@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1408649791.git.peter.seebach@windriver.com>
In-Reply-To: <cover.1408649791.git.peter.seebach@windriver.com>
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 16:51:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 08/21/2014 01:54 PM, Peter Seebach wrote:
> The various cortex chips generally support thumb code, so the armv7at
> tunings are a better default for them than the plain armv7a tunings.
> The armv7at tuning allows generation of both arm and thumb code, while
> armv7a only allows arm code, which is typically significantly bigger.
> (It may be faster in some cases, but the tradeoffs aren't totally
> obvious, because smaller code fits in caches better.) Since they
> all had armv7a-neon as default, change them to armv7at-neon.

Can we also move to hard float abi?

Philip


> 
> The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:
> 
>   qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)
> 
> are available in the git repository at:
>   git://git.yoctoproject.org/poky-contrib seebs/armv7at
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/armv7at
> 
> Peter Seebach (1):
>   tune-cortexa*.inc: use armv7at by default
> 
>  meta/conf/machine/include/tune-cortexa15.inc |    2 +-
>  meta/conf/machine/include/tune-cortexa5.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa7.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa8.inc  |    2 +-
>  meta/conf/machine/include/tune-cortexa9.inc  |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 

