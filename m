Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5DF757A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 17:54:30 +0000 (UTC)
Received: by qkoo18 with SMTP id o18so28014847qko.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=lnbcL9mnhDs6/PG8TZBn6HGicS9HkHEc7A/a4vwdVDA=;
	b=AKxlDoD8paKDVLZ6ae9+Aw6zk9NLImdv/ozkstrRUoSCBdScM1I3/UDS6ZT10W61pl
	3Qqy2f7jOKI3TFdaqodbvPxd6LyIDHWpdzrUWqcH9LMdw6NsgUUXeEtOdP9B3Do8ns0h
	0OW2fthVUazZbvlj09Qw6FBtYVo8KbJa/T4V7WyMih7nlVHWfen3HwsK1qg84tf5oHUV
	1G6C5pvk5fnAUJHu/J787xRTqyuuSP64ituFd4ja9dkKRyK1aTQHhCgWADOATG4+tSB5
	/HwFJ0hZkvaSFi6bNlyCh7An2Ll0H9t7JActcmWCF6Pb1P8ueQq1VeutuEks7n8snHzx
	39Pg==
X-Received: by 10.140.150.209 with SMTP id 200mr46842609qhw.31.1433440471608; 
	Thu, 04 Jun 2015 10:54:31 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:64ea:8623:c8c5:b8b9?
	([2601:c:a700:3ba7:64ea:8623:c8c5:b8b9])
	by mx.google.com with ESMTPSA id e78sm2718653qhc.0.2015.06.04.10.54.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 10:54:30 -0700 (PDT)
Message-ID: <557090D3.4030003@gmail.com>
Date: Thu, 04 Jun 2015 10:54:27 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1433417861-18786-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1433417861-18786-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [dizzy][PATCH] license.bbclass: set dirs for do_populate_lic_setscene
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
X-List-Received-Date: Thu, 04 Jun 2015 17:54:31 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

merged to staging.

- armin

On 06/04/2015 04:37 AM, Martin Jansa wrote:
> From: Robert Yang <liezhi.yang@windriver.com>
>
> Fixed:
> ERROR: Build of do_populate_lic failed
> ERROR: Traceback (most recent call last):
>    File "bitbake/lib/bb/build.py", line 497, in exec_task
>      return _exec_task(fn, task, d, quieterr)
>    File "bitbake/lib/bb/build.py", line 437, in _exec_task
>      exec_func(func, localdata)
>    File "bitbake/lib/bb/build.py", line 212, in exec_func
>      exec_func_python(func, d, runfile, cwd=adir)
>    File "/home/nxadm/nx/ala-blade44.1/builds-2015-03-09-163005/qemuppc_world_oe_bp/bitbake/lib/bb/build.py", line 237, in exec_func_python
>      os.chdir(cwd)
> OSError: [Errno 2] No such file or directory: 'bitbake_build/tmp/work/ppc7400-wrs-linux/taglib/1.9.1-r0/build'
>
> When running setscene, the cwd is $B which maybe removed by
> autotools.bbclass or cmake.bbclass when rebuild.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/license.bbclass | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 14d3107..d03b9eb 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -389,6 +389,8 @@ do_populate_lic[sstate-outputdirs] = "${LICENSE_DIRECTORY}/"
>
>   ROOTFS_POSTPROCESS_COMMAND_prepend = "write_package_manifest; license_create_manifest; "
>
> +do_populate_lic_setscene[dirs] = "${LICSSTATEDIR}/${PN}"
> +do_populate_lic_setscene[cleandirs] = "${LICSSTATEDIR}"
>   python do_populate_lic_setscene () {
>       sstate_setscene(d)
>   }
>

