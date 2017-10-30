Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D7B8965CBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Oct 2017 01:29:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9U1T0ek007757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 29 Oct 2017 18:29:00 -0700 (PDT)
Received: from [128.224.163.189] (128.224.163.189) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 29 Oct 2017 18:29:00 -0700
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9fb0243b-5fef-e5c3-1175-3af8c3f3db7d@windriver.com>
Date: Mon, 30 Oct 2017 09:30:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8d1c4aacc60173f9db4809d23303d4825cc0090d.1509094533.git.markus.lehtonen@linux.intel.com>
X-Originating-IP: [128.224.163.189]
Subject: Re: [PATCH v5 05/10] bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
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
X-List-Received-Date: Mon, 30 Oct 2017 01:29:01 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2017 06:07 PM, Markus Lehtonen wrote:
> Needed to be able to run images using the runtime test facilities.

Hi Markus,

What do you mean by 'run images using runtime test facilities'?
testimage? ptest?
'scp' and 'ip' are added to HOSTTOOLS if 'testimage' is inherited.
What's the use case that still needs 'scp' and 'ip' unconditionally?

In addition, if we add these two utilities to HOSTTOOLS unconditionally.
Please cc to doc people to also change the QuickStart.

Regards,
Chen Qi

> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>   meta/conf/bitbake.conf | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9696273acc..9075d03998 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -476,15 +476,15 @@ HOSTTOOLS += " \
>       [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp cp cpio \
>       cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
>       fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
> -    head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
> +    head hostname id install ip ld ldd ln ls make makeinfo md5sum mkdir mknod \
>       mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python python2 \
> -    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
> +    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen scp sed sh sha256sum \
>       sleep sort split stat strings strip tail tar tee test touch tr true uname \
>       uniq wc wget which xargs \
>   "
>   
>   # Tools needed to run testimage runtime image testing
> -HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
> +HOSTTOOLS += "${@['', 'ping ps ssh stty'][bb.data.inherits_class('testimage', d)]}"
>   
>   # Link to these if present
>   HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"



