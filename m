Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 26EEF6BCD6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 09:06:37 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id m15so7131993qtq.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qosrFE27pyY0G9w1xT/pHSHBrCxYLnWJvkd1W+Xfu7s=;
	b=ig9VqNYFtvDqqkCbvwaGYBx+uAO8la2v54gOpV+ikX/T4qnckzafEyUZzc/A78kufJ
	mDJ35gIDm44l6LsjUOgI93TmqP5kYB4Ligju6NaNOIKzgOpxliYHcHidyHeGg2KXG7bl
	XqNgsBiEJUmJNTonj5Tdl03qevQSflFpAuoQPg6EvMGuvNds3L/h/ZzB8Hg4AGlFWYK4
	0AWP+RsRgcUARxAt/JPFbz9K5EetyKQAaNEK2SsIm8bg5upIDyi5SEpLlgopuc3EjWdT
	H6Lb3OBKljJkjJJzOkDRtFIdNLJZiSGfjlgW+mMjLv0CJS08fwe+N156erR7M6qR/IOb
	GF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qosrFE27pyY0G9w1xT/pHSHBrCxYLnWJvkd1W+Xfu7s=;
	b=g0A30MX/aLsGR1d8kj7hhvpsRth2YKQr/C5ZJ8UTv1Upft4E3y4PY0Sa0Vn7xZ5odC
	w1T7Eyw+pgiUo9nDgUk8u6gOteMovfudM5Ayx132Jf7LRqlBOtA2Yyj19efy9PtfkUvR
	JmJzwxIbMgx1l/K42pI3qNGaK9CZUTpYdCe+yhRxhonJZVpayPiHtJO/smnHMTv0j8bJ
	/OzrFGWIQQoGgYzHVXaW8zx+vomD5ouV5RKenrkqk8UMR/RMIkJdlWkvgcmcsgAgrPlk
	aorxRZmsM/6mltUPel/GNZjBXzHgUe2g35uj6z3FA2wylqYBcavQnECkLr/kfY08gFNQ
	Kk7g==
X-Gm-Message-State: APjAAAX7kbG/tUmwXOIexQZFNzxhHMKasI6fbLYTRdL4VGEcmjTCFU2J
	6BOD74KyDp+62foEJO+1tgTaSHN/4AUVylBE/w2Ic0lc3Kk=
X-Google-Smtp-Source: APXvYqzzmPvTYi3+DnE4wtRw9Fbt0UbpLOGq98UXbx8+5npx8T9A851vAhM+dQ/pPLs0Ug9Tfm/k1I0OuPPrNu5NL30=
X-Received: by 2002:a0c:fd63:: with SMTP id k3mr7600085qvs.185.1572080797715; 
	Sat, 26 Oct 2019 02:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
	<62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
	<62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
In-Reply-To: <62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 10:06:11 +0100
Message-ID: <CAMKF1srmj_bYgCAZKf3qk_WwbAE7cntv0EBn9r9LJKmfJmGB0g@mail.gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 26 Oct 2019 09:06:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2019 at 6:31 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> hello=EF=BC=81
>
> We think this problem has something to do with the host environment. We t=
ried to reproduce the error on ubuntu16.04 and fedora29, but they all compi=
led successfully. Can you tell us which distributions are having this probl=
em?

I am suspecting uninative could be masking it. So if you have it
enabled uninative try a build without it

>
>
> On 10/25/19 8:19 AM, akuster808 wrote:
>
>
>
> On 10/24/19 6:37 AM, Trevor Gamblin wrote:
>
> On 10/24/19 9:06 AM, Trevor Woerner wrote:
>
> This upgrade caused my build to fail :-(
> Is anyone else seeing this?
>
>
> Me too but only on my older ubunto 16.04.
>
> we should bug this. If no one does by Friday night I will.
>
> - armin
>
> 22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wu=
ndef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build/tm=
p-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/=
usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenkins=
-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-n=
ative/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jenkin=
s-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-worksp=
ace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0=
.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspace/=
nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.1=
0-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.=
o  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-li=
nux/libcap-ng-na
>  tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/nigh=
tly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0=
/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cubietruck=
/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.li=
bs/libcap-ng.so
> 22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-lin=
ux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86=
_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefine=
d reference to `pthread_atfork'
> 22:47:40 | collect2: error: ld returned 1 exit status
> 22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
> 22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cubie=
truck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/ut=
ils'
> 22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
> 22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cubie=
truck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
> 22:47:40 | make: *** [Makefile:377: all] Error 2
> 22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-gli=
bc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.12127:1=
 exit 1 from 'exit 1'
> 22:47:40 |
> 22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Failed
>
> I see it too, when trying to build binutils:
>
> | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat -Wundef -D_G=
NU_SOURCE -isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-l=
inux/libcap-ng-native/0.7.10-r0/re[6/1973]
> root-native/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link =
-Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/recipe-sysroot-native/us
> r/lib -Wl,-rpath-link -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/wor=
k/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rp=
ath -Wl,/ala-lpggp21/tgamblin/yocto/build/
> tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-nat=
ive/usr/lib -Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work=
/x86_64-linux/libcap-ng-native/0.7.10-r0/r
> ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-llist.o  -=
L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-na=
tive/0.7.10-r0/recipe-sysroot-native/usr/l
> ib -L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap=
-ng-native/0.7.10-r0/recipe-sysroot-native/lib -L../src /ala-lpggp21/tgambl=
in/yocto/build/tmp-glibc/work/x86_64-linux
> /libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so
> | /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pth=
read_atfork'
> | collect2: error: ld returned 1 exit status
> | Makefile:483: recipe for target 'pscap' failed
> | make[2]: *** [pscap] Error 1
> | make[2]: *** Waiting for unfinished jobs....
> | /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pth=
read_atfork'
> | collect2: error: ld returned 1 exit status
> | Makefile:471: recipe for target 'captest' failed
> | make[2]: *** [captest] Error 1
> | /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pth=
read_atfork'
> | collect2: error: ld returned 1 exit status
> | /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undefined reference to `pth=
read_atfork'
> | collect2: error: ld returned 1 exit status
> | Makefile:475: recipe for target 'filecap' failed
> | make[2]: *** [filecap] Error 1
> | Makefile:479: recipe for target 'netcap' failed
> | make[2]: *** [netcap] Error 1
> | make[2]: Leaving directory '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc=
/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/utils'
> | Makefile:445: recipe for target 'all-recursive' failed
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc=
/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
> | Makefile:377: recipe for target 'all' failed
> | make: *** [all] Error 2
>
>
>

