Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07DB6750F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 02:19:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7K2J6Yb027281
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Aug 2018 19:19:06 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 19 Aug 2018 19:19:05 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1534699224.git.raj.khem@gmail.com>
	<74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f64a8311-b32f-3074-96dd-ff7364a43b2d@windriver.com>
Date: Mon, 20 Aug 2018 10:23:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <74b92c8785cfa4377a1738f28e3991d6adee321f.1534699224.git.raj.khem@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 8/9] gdb: Upgrade to 8.1.1
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
X-List-Received-Date: Mon, 20 Aug 2018 02:19:06 -0000
Content-Type: multipart/alternative;
	boundary="------------F3C07E63C1395D1EB916EA79"

--------------F3C07E63C1395D1EB916EA79
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

There's a build failure on autobuilder.

https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/700/steps/BuildImages/logs/stdio

| x86_64-poky-linux-musl-g++ -m64 -march=core2 -mtune=core2 -msse3 
-mfpmath=sse 
--sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/recipe-sysroot 
-shared -fPIC -Wl,--soname=libinproctrace.so -Wl,--no-undefined -O2 
-pipe -g -feliminate-unused-debug-types 
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0=/usr/src/debug/gdb/8.1.1-r0 
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/recipe-sysroot= 
-fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/recipe-sysroot-native= 
-fvisibility-inlines-hidden -I. -I../../../gdb-8.1.1/gdb/gdbserver 
-I../../../gdb-8.1.1/gdb/gdbserver/../common 
-I../../../gdb-8.1.1/gdb/gdbserver/../regformats 
-I../../../gdb-8.1.1/gdb/gdbserver/.. 
-I../../../gdb-8.1.1/gdb/gdbserver/../../include 
-I../../../gdb-8.1.1/gdb/gdbserver/../gnulib/import 
-Ibuild-gnulib-gdbserver/import -Wall -Wpointer-arith -Wno-unused 
-Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts 
-Wempty-body -Wunused-but-set-parameter -Wunused-but-set-variable 
-Wno-sign-compare -Wno-narrowing -Wno-error=maybe-uninitialized 
-DGDBSERVER \ | -static-libstdc++ -static-libgcc -Wl,-O1 
-Wl,--hash-style=gnu -Wl,--as-needed 
-Wl,--dynamic-list=../../../gdb-8.1.1/gdb/gdbserver/proc-service.list -o 
libinproctrace.so ax-ipa.o common-utils-ipa.o errors-ipa.o format-ipa.o 
print-utils-ipa.o regcache-ipa.o remote-utils-ipa.o rsp-low-ipa.o 
tdesc-ipa.o tracepoint-ipa.o utils-ipa.o vec-ipaERROR: Task 
(/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/meta/recipes-devtools/gdb/gdb_8.1.1.bb:do_compile) 
failed with exit code '1' .o linux-amd64-ipa.o linux-x86-tdesc-ipa.o 
arch/amd64-ipa.o -ldl -pthread | 
/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/8.2.0/ld: 
common-utils-ipa.o: in function `is_regular_file(char const*, int*)': | 
/usr/src/debug/gdb/8.1.1-r0/build-x86_64-poky-linux-musl/gdb/gdbserver/../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: 
undefined reference to `rpl_stat' | collect2: error: ld returned 1 exit 
status | make[4]: *** [Makefile:414: libinproctrace.so] Error 1 | 
make[4]: *** Waiting for unfinished jobs.... | make[4]: Leaving 
directory 
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/build-x86_64-poky-linux-musl/gdb/gdbserver' 
| make[3]: *** [Makefile:2027: subdir_do] Error 1 | make[3]: Leaving 
directory 
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/build-x86_64-poky-linux-musl/gdb' 
| make[2]: *** [Makefile:1621: all] Error 2 | make[2]: Leaving directory 
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/build-x86_64-poky-linux-musl/gdb' 
| make[1]: *** [Makefile:8793: all-gdb] Error 2 | make[1]: Leaving 
directory 
'/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl-x86-64/build/build/tmp/work/core2-64-poky-linux-musl/gdb/8.1.1-r0/build-x86_64-poky-linux-musl' 
| make: *** [Makefile:850: all] Error 2 | ERROR: oe_runmake failed


Best Regards,
Chen Qi

On 08/20/2018 01:23 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc}      | 4 ++--
>   ...{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} | 0
>   .../gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb}              | 0
>   meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb}        | 0
>   4 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc} (89%)
>   rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb} (100%)
>   rename meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb} (100%)
>
> diff --git a/meta/recipes-devtools/gdb/gdb-8.1.inc b/meta/recipes-devtools/gdb/gdb-8.1.1.inc
> similarity index 89%
> rename from meta/recipes-devtools/gdb/gdb-8.1.inc
> rename to meta/recipes-devtools/gdb/gdb-8.1.1.inc
> index 4d9faa2d4b..ad80dd3e4d 100644
> --- a/meta/recipes-devtools/gdb/gdb-8.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.1.1.inc
> @@ -18,6 +18,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
>              file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
>              file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
>   "
> -SRC_URI[md5sum] = "f46487561f9a16916a8102316f7fd105"
> -SRC_URI[sha256sum] = "af61a0263858e69c5dce51eab26662ff3d2ad9aa68da9583e8143b5426be4b34"
> +SRC_URI[md5sum] = "372fa63a53adeee1bfbfd581d8da9e34"
> +SRC_URI[sha256sum] = "97dcc3169bd430270fc29adb65145846a58c1b55cdbb73382a4a89307bdad03c"
>   
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross-canadian_8.1.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb-cross_8.1.bb b/meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb-cross_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb-cross_8.1.1.bb
> diff --git a/meta/recipes-devtools/gdb/gdb_8.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/gdb/gdb_8.1.bb
> rename to meta/recipes-devtools/gdb/gdb_8.1.1.bb



--------------F3C07E63C1395D1EB916EA79
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9
d2luZG93cy0xMjUyIgogICAgICBodHRwLWVxdWl2PSJDb250ZW50LVR5cGUiPgogIDwvaGVh
ZD4KICA8Ym9keSBiZ2NvbG9yPSIjRkZGRkZGIiB0ZXh0PSIjMDAwMDAwIj4KICAgIDxkaXYg
Y2xhc3M9Im1vei1jaXRlLXByZWZpeCI+VGhlcmUncyBhIGJ1aWxkIGZhaWx1cmUgb24gYXV0
b2J1aWxkZXIuPGJyPgogICAgICA8YnI+CjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRl
eHQiIGhyZWY9Imh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vYnVpbGRlcnMvbmlnaHRs
eS1tdXNsLXg4Ni02NC9idWlsZHMvNzAwL3N0ZXBzL0J1aWxkSW1hZ2VzL2xvZ3Mvc3RkaW8i
Pmh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG8uaW8vYnVpbGRlcnMvbmlnaHRseS1tdXNsLXg4
Ni02NC9idWlsZHMvNzAwL3N0ZXBzL0J1aWxkSW1hZ2VzL2xvZ3Mvc3RkaW88L2E+PGJyPgog
ICAgICA8YnI+CiAgICAgIDxwcmU+PHNwYW4gY2xhc3M9InN0ZG91dCI+fCB4ODZfNjQtcG9r
eS1saW51eC1tdXNsLWcrKyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5lPWNvcmUyIC1tc3Nl
MyAtbWZwbWF0aD1zc2UgLS1zeXNyb290PS9ob21lL3Bva3lidWlsZC95b2N0by1hdXRvYnVp
bGRlci95b2N0by13b3JrZXIvbmlnaHRseS1tdXNsLXg4Ni02NC9idWlsZC9idWlsZC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4LW11c2wvZ2RiLzguMS4xLXIwL3JlY2lwZS1zeXNy
b290ICAtc2hhcmVkIC1mUElDIC1XbCwtLXNvbmFtZT1saWJpbnByb2N0cmFjZS5zbyAtV2ws
LS1uby11bmRlZmluZWQgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10
eXBlcyAtZmRlYnVnLXByZWZpeC1tYXA9L2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWls
ZGVyL3lvY3RvLXdvcmtlci9uaWdodGx5LW11c2wteDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgtbXVzbC9nZGIvOC4xLjEtcjA9L3Vzci9zcmMvZGVi
dWcvZ2RiLzguMS4xLXIwIC1mZGVidWctcHJlZml4LW1hcD0vaG9tZS9wb2t5YnVpbGQveW9j
dG8tYXV0b2J1aWxkZXIveW9jdG8td29ya2VyL25pZ2h0bHktbXVzbC14ODYtNjQvYnVpbGQv
YnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC1tdXNsL2dkYi84LjEuMS1yMC9y
ZWNpcGUtc3lzcm9vdD0gLWZkZWJ1Zy1wcmVmaXgtbWFwPS9ob21lL3Bva3lidWlsZC95b2N0
by1hdXRvYnVpbGRlci95b2N0by13b3JrZXIvbmlnaHRseS1tdXNsLXg4Ni02NC9idWlsZC9i
dWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4LW11c2wvZ2RiLzguMS4xLXIwL3Jl
Y2lwZS1zeXNyb290LW5hdGl2ZT0gIC1mdmlzaWJpbGl0eS1pbmxpbmVzLWhpZGRlbiAgICAt
SS4gLUkuLi8uLi8uLi9nZGItOC4xLjEvZ2RiL2dkYnNlcnZlciAtSS4uLy4uLy4uL2dkYi04
LjEuMS9nZGIvZ2Ric2VydmVyLy4uL2NvbW1vbiAtSS4uLy4uLy4uL2dkYi04LjEuMS9nZGIv
Z2Ric2VydmVyLy4uL3JlZ2Zvcm1hdHMgLUkuLi8uLi8uLi9nZGItOC4xLjEvZ2RiL2dkYnNl
cnZlci8uLiAtSS4uLy4uLy4uL2dkYi04LjEuMS9nZGIvZ2Ric2VydmVyLy4uLy4uL2luY2x1
ZGUgLUkuLi8uLi8uLi9nZGItOC4xLjEvZ2RiL2dkYnNlcnZlci8uLi9nbnVsaWIvaW1wb3J0
IC1JYnVpbGQtZ251bGliLWdkYnNlcnZlci9pbXBvcnQgIC1XYWxsIC1XcG9pbnRlci1hcml0
aCAtV25vLXVudXNlZCAtV3VudXNlZC12YWx1ZSAtV3VudXNlZC1mdW5jdGlvbiAtV25vLXN3
aXRjaCAtV25vLWNoYXItc3Vic2NyaXB0cyAtV2VtcHR5LWJvZHkgLVd1bnVzZWQtYnV0LXNl
dC1wYXJhbWV0ZXIgLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZSAtV25vLXNpZ24tY29tcGFy
ZSAtV25vLW5hcnJvd2luZyAtV25vLWVycm9yPW1heWJlLXVuaW5pdGlhbGl6ZWQgICAtREdE
QlNFUlZFUiBcCnwgLXN0YXRpYy1saWJzdGRjKysgLXN0YXRpYy1saWJnY2MgLVdsLC1PMSAt
V2wsLS1oYXNoLXN0eWxlPWdudSAtV2wsLS1hcy1uZWVkZWQgLVdsLC0tZHluYW1pYy1saXN0
PS4uLy4uLy4uL2dkYi04LjEuMS9nZGIvZ2Ric2VydmVyL3Byb2Mtc2VydmljZS5saXN0IC1v
IGxpYmlucHJvY3RyYWNlLnNvIGF4LWlwYS5vIGNvbW1vbi11dGlscy1pcGEubyBlcnJvcnMt
aXBhLm8gZm9ybWF0LWlwYS5vIHByaW50LXV0aWxzLWlwYS5vIHJlZ2NhY2hlLWlwYS5vIHJl
bW90ZS11dGlscy1pcGEubyByc3AtbG93LWlwYS5vIHRkZXNjLWlwYS5vIHRyYWNlcG9pbnQt
aXBhLm8gdXRpbHMtaXBhLm8gdmVjLWlwYTwvc3Bhbj48c3BhbiBjbGFzcz0ic3RkZXJyIj5F
UlJPUjogVGFzayAoL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lvY3RvLXdv
cmtlci9uaWdodGx5LW11c2wteDg2LTY0L2J1aWxkL21ldGEvcmVjaXBlcy1kZXZ0b29scy9n
ZGIvZ2RiXzguMS4xLmJiOmRvX2NvbXBpbGUpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScK
PC9zcGFuPjxzcGFuIGNsYXNzPSJzdGRvdXQiPi5vIGxpbnV4LWFtZDY0LWlwYS5vIGxpbnV4
LXg4Ni10ZGVzYy1pcGEubyBhcmNoL2FtZDY0LWlwYS5vIC1sZGwgLXB0aHJlYWQKfCAvaG9t
ZS9wb2t5YnVpbGQveW9jdG8tYXV0b2J1aWxkZXIveW9jdG8td29ya2VyL25pZ2h0bHktbXVz
bC14ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC1tdXNs
L2dkYi84LjEuMS1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi94ODZfNjQtcG9r
eS1saW51eC1tdXNsLy4uLy4uL2xpYmV4ZWMveDg2XzY0LXBva3ktbGludXgtbXVzbC9nY2Mv
eDg2XzY0LXBva3ktbGludXgtbXVzbC84LjIuMC9sZDogY29tbW9uLXV0aWxzLWlwYS5vOiBp
biBmdW5jdGlvbiBgaXNfcmVndWxhcl9maWxlKGNoYXIgY29uc3QqLCBpbnQqKSc6CnwgL3Vz
ci9zcmMvZGVidWcvZ2RiLzguMS4xLXIwL2J1aWxkLXg4Nl82NC1wb2t5LWxpbnV4LW11c2wv
Z2RiL2dkYnNlcnZlci8uLi8uLi8uLi9nZGItOC4xLjEvZ2RiL2dkYnNlcnZlci8uLi9jb21t
b24vY29tbW9uLXV0aWxzLmM6NDE5OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBycGxfc3Rh
dCcKfCBjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKfCBtYWtl
WzRdOiAqKiogW01ha2VmaWxlOjQxNDogbGliaW5wcm9jdHJhY2Uuc29dIEVycm9yIDEKfCBt
YWtlWzRdOiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgp8IG1ha2VbNF06
IExlYXZpbmcgZGlyZWN0b3J5ICcvaG9tZS9wb2t5YnVpbGQveW9jdG8tYXV0b2J1aWxkZXIv
eW9jdG8td29ya2VyL25pZ2h0bHktbXVzbC14ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsv
Y29yZTItNjQtcG9reS1saW51eC1tdXNsL2dkYi84LjEuMS1yMC9idWlsZC14ODZfNjQtcG9r
eS1saW51eC1tdXNsL2dkYi9nZGJzZXJ2ZXInCnwgbWFrZVszXTogKioqIFtNYWtlZmlsZToy
MDI3OiBzdWJkaXJfZG9dIEVycm9yIDEKfCBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lvY3RvLXdvcmtlci9uaWdodGx5
LW11c2wteDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgt
bXVzbC9nZGIvOC4xLjEtcjAvYnVpbGQteDg2XzY0LXBva3ktbGludXgtbXVzbC9nZGInCnwg
bWFrZVsyXTogKioqIFtNYWtlZmlsZToxNjIxOiBhbGxdIEVycm9yIDIKfCBtYWtlWzJdOiBM
ZWF2aW5nIGRpcmVjdG9yeSAnL2hvbWUvcG9reWJ1aWxkL3lvY3RvLWF1dG9idWlsZGVyL3lv
Y3RvLXdvcmtlci9uaWdodGx5LW11c2wteDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgtbXVzbC9nZGIvOC4xLjEtcjAvYnVpbGQteDg2XzY0LXBva3kt
bGludXgtbXVzbC9nZGInCnwgbWFrZVsxXTogKioqIFtNYWtlZmlsZTo4NzkzOiBhbGwtZ2Ri
XSBFcnJvciAyCnwgbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9ob21lL3Bva3lidWls
ZC95b2N0by1hdXRvYnVpbGRlci95b2N0by13b3JrZXIvbmlnaHRseS1tdXNsLXg4Ni02NC9i
dWlsZC9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4LW11c2wvZ2RiLzguMS4x
LXIwL2J1aWxkLXg4Nl82NC1wb2t5LWxpbnV4LW11c2wnCnwgbWFrZTogKioqIFtNYWtlZmls
ZTo4NTA6IGFsbF0gRXJyb3IgMgp8IEVSUk9SOiBvZV9ydW5tYWtlIGZhaWxlZAo8L3NwYW4+
PC9wcmU+CiAgICAgIDxicj4KICAgICAgQmVzdCBSZWdhcmRzLDxicj4KICAgICAgQ2hlbiBR
aTxicj4KICAgICAgPGJyPgogICAgICBPbiAwOC8yMC8yMDE4IDAxOjIzIEFNLCBLaGVtIFJh
aiB3cm90ZTo8YnI+CiAgICA8L2Rpdj4KICAgIDxibG9ja3F1b3RlCmNpdGU9Im1pZDo3NGI5
MmM4Nzg1Y2ZhNDM3N2ExNzM4ZjI4ZTM5OTFkNmFkZWUzMjFmLjE1MzQ2OTkyMjQuZ2l0LnJh
ai5raGVtQGdtYWlsLmNvbSIKICAgICAgdHlwZT0iY2l0ZSI+CiAgICAgIDxwcmUgd3JhcD0i
Ij5TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8YSBjbGFzcz0ibW96LXR4dC1saW5rLXJmYzIz
OTZFIiBocmVmPSJtYWlsdG86cmFqLmtoZW1AZ21haWwuY29tIj4mbHQ7cmFqLmtoZW1AZ21h
aWwuY29tJmd0OzwvYT4KLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL3tnZGItOC4x
LmluYyA9Jmd0OyBnZGItOC4xLjEuaW5jfSAgICAgIHwgNCArKy0tCiAuLi57Z2RiLWNyb3Nz
LWNhbmFkaWFuXzguMS5iYiA9Jmd0OyBnZGItY3Jvc3MtY2FuYWRpYW5fOC4xLjEuYmJ9IHwg
MAogLi4uL2dkYi97Z2RiLWNyb3NzXzguMS5iYiA9Jmd0OyBnZGItY3Jvc3NfOC4xLjEuYmJ9
ICAgICAgICAgICAgICB8IDAKIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIve2dkYl84LjEu
YmIgPSZndDsgZ2RiXzguMS4xLmJifSAgICAgICAgfCAwCiA0IGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvZ2RiL3tnZGItOC4xLmluYyA9Jmd0OyBnZGItOC4xLjEuaW5jfSAoODklKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIve2dkYi1jcm9zcy1jYW5hZGlhbl84LjEu
YmIgPSZndDsgZ2RiLWNyb3NzLWNhbmFkaWFuXzguMS4xLmJifSAoMTAwJSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL3tnZGItY3Jvc3NfOC4xLmJiID0mZ3Q7IGdkYi1j
cm9zc184LjEuMS5iYn0gKDEwMCUpCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dk
Yi97Z2RiXzguMS5iYiA9Jmd0OyBnZGJfOC4xLjEuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLTguMS5pbmMgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvZ2RiL2dkYi04LjEuMS5pbmMKc2ltaWxhcml0eSBpbmRleCA4OSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItOC4xLmluYwpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItOC4xLjEuaW5jCmluZGV4IDRkOWZhYTJk
NGIuLmFkODBkZDNlNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLTguMS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItOC4xLjEu
aW5jCkBAIC0xOCw2ICsxOCw2IEBAIFNSQ19VUkkgPSA8YSBjbGFzcz0ibW96LXR4dC1saW5r
LXJmYzIzOTZFIiBocmVmPSJodHRwOi8vZnRwLmdudS5vcmcvZ251L2dkYi9nZGItJHtQVn0u
dGFyLnh6XGZpbGU6Ly9wYWNrYWdlX2RldmVsX2dkYl9wYXRjaGVzXzEyMC1zaWdwcm9jbWFz
ay1pbnZhbGlkLWNhbGwucGF0Y2hcZmlsZTovL2dkYi1GaXgtaWE2NC1kZWZpbmluZy1UUkFQ
X0hXQktQVC1iZWZvcmUtaW5jbHVkaW5nLWcucGF0Y2hcIj4iaHR0cDovL2Z0cC5nbnUub3Jn
L2dudS9nZGIvZ2RiLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly9wYWNrYWdl
X2RldmVsX2dkYl9wYXRjaGVzXzEyMC1zaWdwcm9jbWFzay1pbnZhbGlkLWNhbGwucGF0Y2gg
XAogICAgICAgICAgICBmaWxlOi8vZ2RiLUZpeC1pYTY0LWRlZmluaW5nLVRSQVBfSFdCS1BU
LWJlZm9yZS1pbmNsdWRpbmctZy5wYXRjaCBcCiAiPC9hPgotU1JDX1VSSVttZDVzdW1dID0g
ImY0NjQ4NzU2MWY5YTE2OTE2YTgxMDIzMTZmN2ZkMTA1IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImFmNjFhMDI2Mzg1OGU2OWM1ZGNlNTFlYWIyNjY2MmZmM2QyYWQ5YWE2OGRhOTU4M2U4
MTQzYjU0MjZiZTRiMzQiCitTUkNfVVJJW21kNXN1bV0gPSAiMzcyZmE2M2E1M2FkZWVlMWJm
YmZkNTgxZDhkYTllMzQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTdkY2MzMTY5YmQ0MzAy
NzBmYzI5YWRiNjUxNDU4NDZhNThjMWI1NWNkYmI3MzM4MmE0YTg5MzA3YmRhZDAzYyIKIApk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MtY2FuYWRp
YW5fOC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MtY2FuYWRp
YW5fOC4xLjEuYmIKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzLWNhbmFkaWFuXzguMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2dkYi9nZGItY3Jvc3MtY2FuYWRpYW5fOC4xLjEuYmIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzXzguMS5i
YiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNyb3NzXzguMS4xLmJiCnNpbWls
YXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Ri
L2dkYi1jcm9zc184LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIv
Z2RiLWNyb3NzXzguMS4xLmJiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2RiL2dkYl84LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYl84LjEuMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2dkYi9nZGJfOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2Ri
L2dkYl84LjEuMS5iYgo8L3ByZT4KICAgIDwvYmxvY2txdW90ZT4KICAgIDxwPjxicj4KICAg
IDwvcD4KICA8L2JvZHk+CjwvaHRtbD4K

--------------F3C07E63C1395D1EB916EA79--
