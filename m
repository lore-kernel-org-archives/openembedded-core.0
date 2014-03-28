Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id DCE486BF88
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:27:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2SDRo3h018866; Fri, 28 Mar 2014 13:27:50 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TcHI1HsutBpC; Fri, 28 Mar 2014 13:27:50 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2SDRkXD018862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 28 Mar 2014 13:27:48 GMT
Message-ID: <1396013261.14790.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Fri, 28 Mar 2014 13:27:41 +0000
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7CDB@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7CDB@post.tritech.se>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [Dora] eglibc 2.18: powerpc: Fix time related syscalls
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
X-List-Received-Date: Fri, 28 Mar 2014 13:28:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2014-03-28 at 12:56 +0000, Mats Kärrman wrote:
> Concatenated fix of PowerPC time related system calls in eglibc 2.18 taken
> from upstream glibc. See credits in patch header.
> 
> The effect is that some time related system calls returns nothing or garbage.
> 
> Tested on PowerPC e300c3.
> 
> Eglibc 2.17 does not have this issue and the patches are already part of 2.19.
> 
> Signed-off-by: Mats Karrman <mats.karrman@tritech.se>
> ---
>  .../ppc-fix-time-related-syscalls.patch            |  225 ++++++++++++++++++++
>  meta/recipes-core/eglibc/eglibc_2.18.bb            |    1 +
>  2 files changed, 226 insertions(+)
>  create mode 100644 meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.patch
> 
> diff --git a/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.patch b/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.patch
> new file mode 100644
> index 0000000..fa1072b
> --- /dev/null
> +++ b/meta/recipes-core/eglibc/eglibc-2.18/ppc-fix-time-related-syscalls.patch
> @@ -0,0 +1,225 @@
> +Concatenated fix of PowerPC time related system calls in eglibc 2.18 taken
> +from upstream glibc. Eglibc 2.17 does not have this issue and the patches are
> +already part of 2.19.
> +This compilation includes the following committs:
> +

This needs an "Upstream-Status: Backport" somewhere in there.

Cheers,

Richard


