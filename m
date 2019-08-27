Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 486267E45D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 16:01:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7RG0tDZ027240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 09:01:10 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 09:00:55 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190827155425.105260-1-alex.kanavin@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <9c9a1aec-e57b-cd2c-0538-4e65679f5fac@windriver.com>
Date: Tue, 27 Aug 2019 11:00:54 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827155425.105260-1-alex.kanavin@gmail.com>
Subject: Re: [PATCH] rpm: resolve a host contamination issue for mono packaging
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
X-List-Received-Date: Tue, 27 Aug 2019 16:01:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/27/19 10:54 AM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...es-requires-do-not-use-monodis-from-.patch | 58 +++++++++++++++++++
>  meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |  1 +
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch

Instead of hacking with with different names that (shouldn't or) don't exist..
It would be better to just disable the mono-find-* wouldn't it?

If that is the case..

In the fileattrs/mono.attr directory, just remove mono.attr or comment out all
of the lines.

--Mark

> diff --git a/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> new file mode 100644
> index 00000000000..24aa4c7ffff
> --- /dev/null
> +++ b/meta/recipes-devtools/rpm/files/0001-mono-find-provides-requires-do-not-use-monodis-from-.patch
> @@ -0,0 +1,58 @@
> +From 43fbc3f53302a395463e8450ac81c53f623eec3f Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Tue, 27 Aug 2019 17:42:34 +0200
> +Subject: [PATCH] mono-find-provides/requires: do not use monodis from the host
> +
> +There was a host contamination issue here: if monodis was installed
> +on the host, do_package would use that to resolve dependencies
> +of mono libraries (and often fail in that). Without monodis,
> +no dependencies are resolved, which is seemingly how things
> +are supposed to work.
> +
> +Upstream-Status: Inappropriate [oe-core specific]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + scripts/mono-find-provides | 8 ++++----
> + scripts/mono-find-requires | 8 ++++----
> + 2 files changed, 8 insertions(+), 8 deletions(-)
> +
> +diff --git a/scripts/mono-find-provides b/scripts/mono-find-provides
> +index 9348457d3..b28872ffb 100644
> +--- a/scripts/mono-find-provides
> ++++ b/scripts/mono-find-provides
> +@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
> + build_bindir="$2/usr/bin"
> + build_libdir="$2$3"
> + 
> +-if [ -x $build_bindir/monodis ]; then
> +-    monodis="$build_bindir/monodis"
> ++if [ -x $build_bindir/monodis.bogus ]; then
> ++    monodis="$build_bindir/monodis.bogus"
> +     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> +-elif [ -x /usr/bin/monodis ]; then
> +-    monodis="/usr/bin/monodis"
> ++elif [ -x /usr/bin/monodis.bogus ]; then
> ++    monodis="/usr/bin/monodis.bogus"
> + else
> +     exit 0;
> + fi
> +diff --git a/scripts/mono-find-requires b/scripts/mono-find-requires
> +index ea58cae48..d270169e1 100644
> +--- a/scripts/mono-find-requires
> ++++ b/scripts/mono-find-requires
> +@@ -18,11 +18,11 @@ monolist=($(printf "%s\n" "${filelist[@]}" | grep -E "\\.(exe|dll)\$"))
> + build_bindir="$2/usr/bin"
> + build_libdir="$2$3"
> + 
> +-if [ -x $build_bindir/monodis ]; then
> +-    monodis="$build_bindir/monodis"
> ++if [ -x $build_bindir/monodis.bogus ]; then
> ++    monodis="$build_bindir/monodis.bogus"
> +     export LD_LIBRARY_PATH=$build_libdir${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
> +-elif [ -x /usr/bin/monodis ]; then
> +-    monodis="/usr/bin/monodis"
> ++elif [ -x /usr/bin/monodis.bogus ]; then
> ++    monodis="/usr/bin/monodis.bogus"
> + else
> +     exit 0;
> + fi
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> index 063f4269a57..c37330eb4c6 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.2.1.bb
> @@ -41,6 +41,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.14.x \
>             file://0001-perl-disable-auto-reqs.patch \
>             file://0001-rpm-rpmio.c-restrict-virtual-memory-usage-if-limit-s.patch \
>             file://0016-rpmscript.c-change-logging-level-around-scriptlets-t.patch \
> +           file://0001-mono-find-provides-requires-do-not-use-monodis-from-.patch \
>             "
>  
>  PE = "1"
> 


