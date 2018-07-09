Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 17CC471B69
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 21:53:56 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w69LrubH015636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 9 Jul 2018 22:53:57 +0100
Message-ID: <bc957faf592d60dd8589df23d7807181d06d7fba.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 09 Jul 2018 22:53:56 +0100
In-Reply-To: <20180709125657.13192-2-andrej.valek@siemens.com>
References: <20180709125657.13192-1-andrej.valek@siemens.com>
	<20180709125657.13192-2-andrej.valek@siemens.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH resend 1/3] openssl-1.1: fix c_rehash perl errors
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
X-List-Received-Date: Mon, 09 Jul 2018 21:53:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-09 at 14:56 +0200, Andrej Valek wrote:
> Patch original c_rehash script with Debian patch instead
> of overriding it with own version.
> 
> Error output from c_reshah without patching:
>   Unknown regexp modifier "/b" at ./c_rehash line 15, at end of line
>   Unknown regexp modifier "/W" at ./c_rehash line 28, at end of line
>   Unknown regexp modifier "/3" at ./c_rehash line 28, at end of line
>   Unknown regexp modifier "/2" at ./c_rehash line 28, at end of line
>   No such class installdir at ./c_rehash line 63, near "Prefix our
>   installdir"
>     (Might be a runaway multi-line // string starting on line 28)
>   syntax error at ./c_rehash line 63, near "Prefix our installdir"
>   Can't redeclare "my" in "my" at ./c_rehash line 68, near ""
>   Execution of ./c_rehash aborted due to compilation errors.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Marko Peter <peter.marko@siemens.com>
> ---
>  ...le.pl-only-quote-stuff-that-actually-need.patch | 29
> ++++++++++++++++++++++
>  .../recipes-connectivity/openssl/openssl_1.1.0h.bb |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-
> connectivity/openssl/openssl/debian/Revert-util-dofile.pl-only-quote-
> stuff-that-actually-need.patch
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl/debian/Revert-
> util-dofile.pl-only-quote-stuff-that-actually-need.patch
> b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-
> dofile.pl-only-quote-stuff-that-actually-need.patch
> new file mode 100644
> index 0000000000..25d3093e40
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/debian/Revert-util-
> dofile.pl-only-quote-stuff-that-actually-need.patch
> @@ -0,0 +1,29 @@
> +From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +Date: Wed, 28 Mar 2018 14:05:53 +0200
> +Subject: Revert "util/dofile.pl: only quote stuff that actually
> needs
> + quoting"
> +
> +This reverts commit 77ba00bc. We ended up without the quotes.
> +
> +BTS: #894282
> +Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
> +---
> + util/dofile.pl | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +

This patch appears to be missing an Upstream-Status line?

Cheers,

Richard

