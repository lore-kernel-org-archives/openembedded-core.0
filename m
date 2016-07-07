Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 626FB60119
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 00:42:51 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i30so197030qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jul 2016 17:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zC7MO2gQ6NfVf/s4sWqVBIwEEXZSCdnnHU4N9snfjtI=;
	b=t8oYLeX0KpmRFdwIx/Qb+/vPWPMHd1+72Do1brKevLbQQ2no0UnP3Erv1/4bu1GjTX
	AsFeA4kZY/S+GD3kAoibvM/CwsPyTk1SRx16DZzqCUBr+2/ciC2rRgRtU3P4dGcbsF6P
	IAL/uEi/FwJKkPYWdzpzKnkHxTF0wMBevg69GUlYbeepNHk5Q9wHE+KoxQguxeXpLloY
	tk7cFgPOHAHmNVEuzJJSblaShvGNL9rnGpqIY01AzHDHpwDOnICviDd+mQhK+WNoMvd5
	c9x3w9Lrz/wLzeZPlp5pYmwUfTR6CRTt10QuoxBqjGk58PcIVBLxsWnocWpVloRKa8Ks
	TVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zC7MO2gQ6NfVf/s4sWqVBIwEEXZSCdnnHU4N9snfjtI=;
	b=P4kfHvZfJdHh7kmQDedAidk+49ZfPWdLNJybYIs4EfzzjfUYlmQ8vas45SDFYSWmAK
	knJqPnZ5dBwAZfE1d5qPRvNyI0RjN4vSSrqOQYWUK/O+B3akyX3k2i+/wRCqwoB3Xz5w
	sOca0nDyKvANvWNsKXT5NESgr65e6cebry35iTcX9a1bix3CUV+2zpk9kAQidpRTIgzZ
	lp68aGq3K2s+8gk6qrxHoldhoP+E8wTCsWzDMZUSMeHfNdja8N+lTMSuVtuQedII8IYe
	bVhd7dQXWW5pvhQej2Q4xk0SVMjJAhTDoMakt+2EHg5h+3wG3pBRw13cZvQH1cU2265g
	0O1Q==
X-Gm-Message-State: ALyK8tKISgvZsyEw7C1yKtAs4WfYo0khAMj5alNgXa2QrUfiurNUDvCguut7Djk/mWv1lP0xAAXlrBL9QC+afQ==
X-Received: by 10.200.33.172 with SMTP id 41mr40138924qty.26.1467852171846;
	Wed, 06 Jul 2016 17:42:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Wed, 6 Jul 2016 17:42:22 -0700 (PDT)
In-Reply-To: <353972ade9bce1a35f889dd8a9496ea104a1470e.1467849364.git.paul.eggleton@linux.intel.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<353972ade9bce1a35f889dd8a9496ea104a1470e.1467849364.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Jul 2016 17:42:22 -0700
Message-ID: <CAMKF1sp1hg6u2HpdMDy+-6Ek1-rWm7_6HWeHtdrQ+L=_83zFYg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] scripts/contrib/devtool-stress: exclude more recipes by default
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
X-List-Received-Date: Thu, 07 Jul 2016 00:42:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> These recipes can't be used with devtool because they can't be unpacked
> in the normal way.

May be we should have a devtoop blacklist variable that can be added
to the recipe

>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/contrib/devtool-stress.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-=
stress.py
> index ab77a2d..5f396aa 100755
> --- a/scripts/contrib/devtool-stress.py
> +++ b/scripts/contrib/devtool-stress.py
> @@ -210,7 +210,7 @@ def main():
>      parser.add_argument('-d', '--debug', help=3D'Enable debug output', a=
ction=3D'store_true')
>      parser.add_argument('-r', '--resume-from', help=3D'Resume from speci=
fied recipe', metavar=3D'PN')
>      parser.add_argument('-o', '--only', help=3D'Only test specified reci=
pes (comma-separated without spaces, wildcards allowed)', metavar=3D'PNLIST=
')
> -    parser.add_argument('-s', '--skip', help=3D'Skip specified recipes (=
comma-separated without spaces, wildcards allowed)', metavar=3D'PNLIST')
> +    parser.add_argument('-s', '--skip', help=3D'Skip specified recipes (=
comma-separated without spaces, wildcards allowed)', metavar=3D'PNLIST', de=
fault=3D'gcc-source-*,kernel-devsrc,package-index,perf,meta-world-pkgdata,g=
libc-locale,glibc-mtrace,glibc-scripts,os-release')
>      parser.add_argument('-c', '--skip-classes', help=3D'Skip recipes inh=
eriting specified classes (comma-separated) - default %(default)s', metavar=
=3D'CLASSLIST', default=3D'native,nativesdk,cross,cross-canadian,image,popu=
late_sdk,meta,packagegroup')
>      subparsers =3D parser.add_subparsers(title=3D'subcommands', metavar=
=3D'<subcommand>')
>      subparsers.required =3D True
> --
> 2.5.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

