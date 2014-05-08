Return-Path: <petter@technux.se>
Received: from vsp-authed-02-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id E1C7765F45
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 14:56:25 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-02-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Thu,  8 May 2014 16:56:25 +0200 (CEST)
Received: from webmail.binero.se (unknown [195.74.38.9])
	(Authenticated sender: petter@technux.se)
	by smtp-03-01.atm.binero.net (Postfix) with ESMTPA id 7EE063A177;
	Thu,  8 May 2014 16:56:19 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 08 May 2014 16:56:19 +0200
From: petter@technux.se
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20140508104606.GM30955@jama>
References: <cover.1399497346.git.petter@technux.se>
	<699098e9da6b5932cce137031ad8dc3604d949a3.1399497346.git.petter@technux.se>
	<20140508104606.GM30955@jama>
Message-ID: <786009d35a2ee5b1ab8b1d220af6ad12@technux.se>
X-Sender: petter@technux.se
User-Agent: Binero Webmail/0.8.4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/13] trace-cmd: remove usage of FILESPATH
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
X-List-Received-Date: Thu, 08 May 2014 14:56:26 -0000
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

2014-05-08 12:46 skrev Martin Jansa:

> On Wed, May 07, 2014 at 11:19:50PM +0200, Petter Mabäcker wrote:
>
>> Fixes [YOCTO #4497] Usage of FILESPATH is discouraged, since it can
>> make recipes harder to bbappend. All current patches in trace-cmd 
>> are
>> shared, move them to files instead, since it's included in base
>> FILESPATH.
>
> FWIW: using "files" is also a bit discouraged, because it's searched
> last, so the lookup takes longer (trying ~30 different directories a 
> lot
> more with more OVERRIDES).
>
> I don't know what's worse.
>
Interesting, never thought about that. Richard also dissuade me from 
using it. I will look into this a little bit more and send up a v2.

>> Signed-off-by: Petter Mabäcker <petter@technux.se> --- 
>> .../{trace-cmd
>> => files}/addldflags.patch | 0 .../blktrace-api-compatibility.patch 
>> | 0
>> .../kernelshark-fix-syntax-error-of-shell.patch | 0 .../{trace-cmd 
>> =>
>> files}/make-docs-optional.patch | 0
>> ...dd-checks-for-invalid-pointers-to-fix-seg.patch | 0
>> ...o-not-call-stop_threads-if-doing-latency-.patch | 0
>> ...etting-plugin-to-nop-clears-data-before-i.patch | 0
>> .../trace-cmd-fix-syntax-error-of-shell.patch | 0
>> meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb | 2 -- 9 files
>> changed, 2 deletions(-) rename 
>> meta/recipes-kernel/trace-cmd/{trace-cmd
>> => files}/addldflags.patch (100%) rename
>> meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/blktrace-api-compatibility.patch (100%) rename
>> meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/kernelshark-fix-syntax-error-of-shell.patch (100%) rename
>> meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/make-docs-optional.patch (100%) rename
>> meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> (100%) rename meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> (100%) rename meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> (100%) rename meta/recipes-kernel/trace-cmd/{trace-cmd =>
>> files}/trace-cmd-fix-syntax-error-of-shell.patch (100%) diff --git
>> a/meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch
>> b/meta/recipes-kernel/trace-cmd/files/addldflags.patch similarity 
>> index
>> 100% rename from
>> meta/recipes-kernel/trace-cmd/trace-cmd/addldflags.patch rename to
>> meta/recipes-kernel/trace-cmd/files/addldflags.patch diff --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
>> 
>> b/meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibility.patch
>> similarity index 100% rename from
>>
> 
> meta/recipes-kernel/trace-cmd/trace-cmd/blktrace-api-compatibility.patch
>> rename to
>> meta/recipes-kernel/trace-cmd/files/blktrace-api-compatibility.patch
>> diff --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>>
>
b/meta/recipes-kernel/trace-cmd/files/kernelshark-fix-syntax-error-of-shell.patch
>> similarity index 100% rename from
>>
>
meta/recipes-kernel/trace-cmd/trace-cmd/kernelshark-fix-syntax-error-of-shell.patch
>> rename to
>>
>
meta/recipes-kernel/trace-cmd/files/kernelshark-fix-syntax-error-of-shell.patch
>> diff --git
>> a/meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch
>> b/meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch
>> similarity index 100% rename from
>> meta/recipes-kernel/trace-cmd/trace-cmd/make-docs-optional.patch 
>> rename
>> to meta/recipes-kernel/trace-cmd/files/make-docs-optional.patch diff
>> --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>>
>
b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> similarity index 100% rename from
>>
>
meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> rename to
>>
>
meta/recipes-kernel/trace-cmd/files/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
>> diff --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>>
>
b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> similarity index 100% rename from
>>
>
meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> rename to
>>
>
meta/recipes-kernel/trace-cmd/files/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
>> diff --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>>
>
b/meta/recipes-kernel/trace-cmd/files/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> similarity index 100% rename from
>>
>
meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> rename to
>>
>
meta/recipes-kernel/trace-cmd/files/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
>> diff --git
>>
>
a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>>
>
b/meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-syntax-error-of-shell.patch
>> similarity index 100% rename from
>>
>
meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
>> rename to
>>
>
meta/recipes-kernel/trace-cmd/files/trace-cmd-fix-syntax-error-of-shell.patch
>> diff --git a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb
>> b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb index
>> d61097d..291c068 100644 ---
>> a/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb +++
>> b/meta/recipes-kernel/trace-cmd/kernelshark_1.2.bb @@ -21,8 +21,6 @@ 
>> S
>> = "${WORKDIR}/git" EXTRA_OEMAKE = "'CC=${CC}' 'AR=${AR}'
>> 'prefix=${prefix}' gui" -FILESPATH = "${FILE_DIRNAME}/trace-cmd" -
>> do_install() { oe_runmake CC="${CC}" AR="${AR}" prefix="${prefix}"
>> DESTDIR="${D}" install_gui rm -rf ${D}${datadir}/trace-cmd -- 
>> 1.7.9.5
>> -- _______________________________________________ Openembedded-core
>> mailing list Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core [1]


Links:
------
[1] http://lists.openembedded.org/mailman/listinfo/openembedded-core

