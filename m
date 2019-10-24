Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EBCE37F990
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 13:38:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9ODboJe018059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Oct 2019 06:37:50 -0700 (PDT)
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Thu, 24 Oct 2019 06:37:50 -0700
To: Trevor Woerner <twoerner@gmail.com>, Zang Ruochen
	<zangrc.fnst@cn.fujitsu.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
Date: Thu, 24 Oct 2019 09:37:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191024130641.GA30191@linux-uys3>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Thu, 24 Oct 2019 13:38:04 -0000
Content-Type: multipart/alternative;
	boundary="------------6CB6376F823988C91D58BCBB"
Content-Language: en-US

--------------6CB6376F823988C91D58BCBB
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/24/19 9:06 AM, Trevor Woerner wrote:

> This upgrade caused my build to fail :-(
> Is anyone else seeing this?
>
> 	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat =
-Wundef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/bui=
ld/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-=
native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/=
z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/=
libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link =
-Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-l=
inux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,=
/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux=
/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,=
/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux=
/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/ne=
tcap netcap.o proc-llist.o  -L/z/jenkins-workspace/nightly/cubietruck/bui=
ld/tmp-glibc/work/x86_64-linux/libcap-ng-na
>   tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/n=
ightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.=
10-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cub=
ietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/buil=
d/src/.libs/libcap-ng.so
> 	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-=
linux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/wor=
k/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: u=
ndefined reference to `pthread_atfork'
> 	22:47:40 | collect2: error: ld returned 1 exit status
> 	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
> 	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cu=
bietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/bui=
ld/utils'
> 	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
> 	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cu=
bietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/bui=
ld'
> 	22:47:40 | make: *** [Makefile:377: all] Error 2
> 	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-=
glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12=
127:1 exit 1 from 'exit 1'
> 	22:47:40 |
> 	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Fai=
led

I see it too, when trying to build binutils:

|||| x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wundef=20
-D_GNU_SOURCE=20
-isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/lib=
cap-ng-native/0.7.10-r0/re[6/1973]||
||root-native/usr/include -O2 -pipe -Wl,--enable-new-dtags=20
-Wl,-rpath-link=20
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/recipe-sysroot-native/us||
||r/lib -Wl,-rpath-link=20
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/recipe-sysroot-native/lib=20
-Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/||
||tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-n=
ative/usr/lib=20
-Wl,-rpath=20
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/r||
||ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.o =

-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/recipe-sysroot-native/usr/l||
||ib=20
-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/recipe-sysroot-native/lib=20
-L../src /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux||
||/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so||
|||=20
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
undefined reference to `pthread_atfork'||
||| collect2: error: ld returned 1 exit status||
||| Makefile:483: recipe for target 'pscap' failed||
||| make[2]: *** [pscap] Error 1||
||| make[2]: *** Waiting for unfinished jobs....||
|||=20
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
undefined reference to `pthread_atfork'||
||| collect2: error: ld returned 1 exit status||
||| Makefile:471: recipe for target 'captest' failed||
||| make[2]: *** [captest] Error 1||
|||=20
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
undefined reference to `pthread_atfork'||
||| collect2: error: ld returned 1 exit status||
|||=20
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
undefined reference to `pthread_atfork'||
||| collect2: error: ld returned 1 exit status||
||| Makefile:475: recipe for target 'filecap' failed||
||| make[2]: *** [filecap] Error 1||
||| Makefile:479: recipe for target 'netcap' failed||
||| make[2]: *** [netcap] Error 1||
||| make[2]: Leaving directory=20
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build/utils'||
||| Makefile:445: recipe for target 'all-recursive' failed||
||| make[1]: *** [all-recursive] Error 1||
||| make[1]: Leaving directory=20
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build'||
||| Makefile:377: recipe for target 'all' failed||
||| make: *** [all] Error 2|


--------------6CB6376F823988C91D58BCBB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 10/24/19 9:06 AM, Trevor Woerner wrote:<br>
    </p>
    <blockquote type="cite" cite="mid:20191024130641.GA30191@linux-uys3">
      <pre class="moz-quote-pre" wrap="">This upgrade caused my build to fail :-(
Is anyone else seeing this?

	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wundef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.o  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-na
 tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so
	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-linux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pthread_atfork'
	22:47:40 | collect2: error: ld returned 1 exit status
	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/utils'
	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
	22:47:40 | make: *** [Makefile:377: all] Error 2
	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12127:1 exit 1 from 'exit 1'
	22:47:40 |
	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Failed
</pre>
    </blockquote>
    <p>I see it too, when trying to build binutils:</p>
    <p><code></code><code>| x86_64-linux-libtool: link: gcc -W -Wall
        -Wshadow -Wformat -Wundef -D_GNU_SOURCE
-isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/re[6/1973]</code><code><br>
      </code><code>root-native/usr/include -O2 -pipe
        -Wl,--enable-new-dtags -Wl,-rpath-link
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/us</code><code><br>
      </code><code>r/lib -Wl,-rpath-link
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib
        -Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/</code><code><br>
      </code><code>tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/lib
        -Wl,-rpath
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/r</code><code><br>
      </code><code>ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap
        netcap.o proc-llist.o 
-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/usr/l</code><code><br>
      </code><code>ib
-L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib
        -L../src
        /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux</code><code><br>
      </code><code>/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so</code><code><br>
      </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
        undefined reference to `pthread_atfork'</code><code><br>
      </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
      </code><code>| Makefile:483: recipe for target 'pscap' failed</code><code><br>
      </code><code>| make[2]: *** [pscap] Error 1</code><code><br>
      </code><code>| make[2]: *** Waiting for unfinished jobs....</code><code><br>
      </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
        undefined reference to `pthread_atfork'</code><code><br>
      </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
      </code><code>| Makefile:471: recipe for target 'captest' failed</code><code><br>
      </code><code>| make[2]: *** [captest] Error 1</code><code><br>
      </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
        undefined reference to `pthread_atfork'</code><code><br>
      </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
      </code><code>|
/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so:
        undefined reference to `pthread_atfork'</code><code><br>
      </code><code>| collect2: error: ld returned 1 exit status</code><code><br>
      </code><code>| Makefile:475: recipe for target 'filecap' failed</code><code><br>
      </code><code>| make[2]: *** [filecap] Error 1</code><code><br>
      </code><code>| Makefile:479: recipe for target 'netcap' failed</code><code><br>
      </code><code>| make[2]: *** [netcap] Error 1</code><code><br>
      </code><code>| make[2]: Leaving directory
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/utils'</code><code><br>
      </code><code>| Makefile:445: recipe for target 'all-recursive'
        failed</code><code><br>
      </code><code>| make[1]: *** [all-recursive] Error 1</code><code><br>
      </code><code>| make[1]: Leaving directory
'/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'</code><code><br>
      </code><code>| Makefile:377: recipe for target 'all' failed</code><code><br>
      </code><code>| make: *** [all] Error 2</code><br>
    </p>
  </body>
</html>

--------------6CB6376F823988C91D58BCBB--
