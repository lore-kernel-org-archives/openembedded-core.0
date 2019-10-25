Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 144E17F896
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 05:30:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,227,1569254400"; d="scan'208,217";a="77457666"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Oct 2019 13:30:12 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 25D804CE1511;
	Fri, 25 Oct 2019 13:22:18 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.439.0; Fri, 25 Oct 2019 13:30:13 +0800
To: akuster808 <akuster808@gmail.com>, <twoerner@gmail.com>,
	<twoerner@gmail.com>, <raj.khem@gmail.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
	<62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
From: zangrc <zangrc.fnst@cn.fujitsu.com>
Message-ID: <62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
Date: Fri, 25 Oct 2019 13:30:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
X-Originating-IP: [10.167.225.81]
X-yoursite-MailScanner-ID: 25D804CE1511.A43D7
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
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
X-List-Received-Date: Fri, 25 Oct 2019 05:30:14 -0000
Content-Type: multipart/alternative;
	boundary="------------68F5AD33A99E08262F453A4F"
Content-Language: en-US

--------------68F5AD33A99E08262F453A4F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

hello=EF=BC=81

We think this problem has something to do with the host environment. We=20
tried to reproduce the error on ubuntu16.04 and fedora29, but they all=20
compiled successfully. Can you tell us which distributions are having=20
this problem?

On 10/25/19 8:19 AM, akuster808 wrote:
>
>
> On 10/24/19 6:37 AM, Trevor Gamblin wrote:
>>
>> On 10/24/19 9:06 AM, Trevor Woerner wrote:
>>
>>> This upgrade caused my build to fail :-(
>>> Is anyone else seeing this?
>
> Me too but only on my older ubunto 16.04.
>
> we should bug this. If no one does by Friday night I will.
>
> - armin
>>> 	22:47:40 | x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat =
-Wundef -D_GNU_SOURCE -isystem/z/jenkins-workspace/nightly/cubietruck/build=
/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-nati=
ve/usr/include -O2 -pipe -Wl,--enable-new-dtags -Wl,-rpath-link -Wl,/z/jenk=
ins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-n=
g-native/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath-link -Wl,/z/jen=
kins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-=
ng-native/0.7.10-r0/recipe-sysroot-native/lib -Wl,-rpath -Wl,/z/jenkins-wor=
kspace/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-nativ=
e/0.7.10-r0/recipe-sysroot-native/usr/lib -Wl,-rpath -Wl,/z/jenkins-workspa=
ce/nightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.=
7.10-r0/recipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o proc-lli=
st.o  -L/z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/x86_64=
-linux/libcap-ng-na
>>>   tive/0.7.10-r0/recipe-sysroot-native/usr/lib -L/z/jenkins-workspace/n=
ightly/cubietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10=
-r0/recipe-sysroot-native/lib -L../src /z/jenkins-workspace/nightly/cubietr=
uck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/=
.libs/libcap-ng.so
>>> 	22:47:40 | /usr/lib64/gcc/x86_64-suse-linux/8/../../../../x86_64-suse-=
linux/bin/ld: /z/jenkins-workspace/nightly/cubietruck/build/tmp-glibc/work/=
x86_64-linux/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so: undef=
ined reference to `pthread_atfork'
>>> 	22:47:40 | collect2: error: ld returned 1 exit status
>>> 	22:47:40 | make[2]: *** [Makefile:480: netcap] Error 1
>>> 	22:47:40 | make[2]: Leaving directory '/z/jenkins-workspace/nightly/cu=
bietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build=
/utils'
>>> 	22:47:40 | make[1]: *** [Makefile:445: all-recursive] Error 1
>>> 	22:47:40 | make[1]: Leaving directory '/z/jenkins-workspace/nightly/cu=
bietruck/build/tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/build'
>>> 	22:47:40 | make: *** [Makefile:377: all] Error 2
>>> 	22:47:40 | WARNING: /z/jenkins-workspace/nightly/cubietruck/build/tmp-=
glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/temp/run.do_compile.1212=
7:1 exit 1 from 'exit 1'
>>> 	22:47:40 |
>>> 	22:47:40 NOTE: recipe libcap-ng-native-0.7.10-r0: task do_compile: Fai=
led
>>
>> I see it too, when trying to build binutils:
>>
>> |||| x86_64-linux-libtool: link: gcc -W -Wall -Wshadow -Wformat=20
>> -Wundef -D_GNU_SOURCE=20
>> -isystem/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/li=
bcap-ng-native/0.7.10-r0/re[6/1973]||
>> ||root-native/usr/include -O2 -pipe -Wl,--enable-new-dtags=20
>> -Wl,-rpath-link=20
>> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap=
-ng-native/0.7.10-r0/recipe-sysroot-native/us||
>> ||r/lib -Wl,-rpath-link=20
>> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap=
-ng-native/0.7.10-r0/recipe-sysroot-native/lib=20
>> -Wl,-rpath -Wl,/ala-lpggp21/tgamblin/yocto/build/||
>> ||tmp-glibc/work/x86_64-linux/libcap-ng-native/0.7.10-r0/recipe-sysroot-=
native/usr/lib=20
>> -Wl,-rpath=20
>> -Wl,/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap=
-ng-native/0.7.10-r0/r||
>> ||ecipe-sysroot-native/lib -Wl,-O1 -o .libs/netcap netcap.o=20
>> proc-llist.o=20
>> -L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-n=
g-native/0.7.10-r0/recipe-sysroot-native/usr/l||
>> ||ib=20
>> -L/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-n=
g-native/0.7.10-r0/recipe-sysroot-native/lib=20
>> -L../src /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux||
>> ||/libcap-ng-native/0.7.10-r0/build/src/.libs/libcap-ng.so||
>> |||=20
>> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
>> undefined reference to `pthread_atfork'||
>> ||| collect2: error: ld returned 1 exit status||
>> ||| Makefile:483: recipe for target 'pscap' failed||
>> ||| make[2]: *** [pscap] Error 1||
>> ||| make[2]: *** Waiting for unfinished jobs....||
>> |||=20
>> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
>> undefined reference to `pthread_atfork'||
>> ||| collect2: error: ld returned 1 exit status||
>> ||| Makefile:471: recipe for target 'captest' failed||
>> ||| make[2]: *** [captest] Error 1||
>> |||=20
>> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
>> undefined reference to `pthread_atfork'||
>> ||| collect2: error: ld returned 1 exit status||
>> |||=20
>> /ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng-=
native/0.7.10-r0/build/src/.libs/libcap-ng.so:=20
>> undefined reference to `pthread_atfork'||
>> ||| collect2: error: ld returned 1 exit status||
>> ||| Makefile:475: recipe for target 'filecap' failed||
>> ||| make[2]: *** [filecap] Error 1||
>> ||| Makefile:479: recipe for target 'netcap' failed||
>> ||| make[2]: *** [netcap] Error 1||
>> ||| make[2]: Leaving directory=20
>> '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build/utils'||
>> ||| Makefile:445: recipe for target 'all-recursive' failed||
>> ||| make[1]: *** [all-recursive] Error 1||
>> ||| make[1]: Leaving directory=20
>> '/ala-lpggp21/tgamblin/yocto/build/tmp-glibc/work/x86_64-linux/libcap-ng=
-native/0.7.10-r0/build'||
>> ||| Makefile:377: recipe for target 'all' failed||
>> ||| make: *** [all] Error 2|
>>
>>
>



--------------68F5AD33A99E08262F453A4F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+CiAgPGhlYWQ+CiAgICA8bWV0YSBodHRwLWVxdWl2PSJDb250ZW50
LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+CiAg
PC9oZWFkPgogIDxib2R5PgogICAgPHA+aGVsbG/vvIE8YnI+CiAgICA8L3A+
CiAgICA8cD5XZSB0aGluayB0aGlzIHByb2JsZW0gaGFzIHNvbWV0aGluZyB0
byBkbyB3aXRoIHRoZSBob3N0CiAgICAgIGVudmlyb25tZW50LiBXZSB0cmll
ZCB0byByZXByb2R1Y2UgdGhlIGVycm9yIG9uIHVidW50dTE2LjA0IGFuZAog
ICAgICBmZWRvcmEyOSwgYnV0IHRoZXkgYWxsIGNvbXBpbGVkIHN1Y2Nlc3Nm
dWxseS4gQ2FuIHlvdSB0ZWxsIHVzCiAgICAgIHdoaWNoIGRpc3RyaWJ1dGlv
bnMgYXJlIGhhdmluZyB0aGlzIHByb2JsZW0/PGJyPgogICAgICDCoDxicj4K
ICAgIDwvcD4KICAgIDxkaXYgY2xhc3M9Im1vei1jaXRlLXByZWZpeCI+T24g
MTAvMjUvMTkgODoxOSBBTSwgYWt1c3RlcjgwOCB3cm90ZTo8YnI+CiAgICA8
L2Rpdj4KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiCiAgICAgIGNpdGU9
Im1pZDo2MmQ5NjliYS1jZjdmLTg2NTEtNmRkOS1lN2U3MWI0ODljNmVAZ21h
aWwuY29tIj4KICAgICAgPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVudC1UeXBl
IiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgiPgogICAgICA8
YnI+CiAgICAgIDxicj4KICAgICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJl
Zml4Ij5PbiAxMC8yNC8xOSA2OjM3IEFNLCBUcmV2b3IgR2FtYmxpbgogICAg
ICAgIHdyb3RlOjxicj4KICAgICAgPC9kaXY+CiAgICAgIDxibG9ja3F1b3Rl
IHR5cGU9ImNpdGUiCiAgICAgICAgY2l0ZT0ibWlkOjMzNDY4MDUwLTM3ZTYt
YTBlZi1iOTVkLTAzOTgxNGE1MjM0M0B3aW5kcml2ZXIuY29tIj4KICAgICAg
ICA8cD5PbiAxMC8yNC8xOSA5OjA2IEFNLCBUcmV2b3IgV29lcm5lciB3cm90
ZTo8YnI+CiAgICAgICAgPC9wPgogICAgICAgIDxibG9ja3F1b3RlIHR5cGU9
ImNpdGUiCiAgICAgICAgICBjaXRlPSJtaWQ6MjAxOTEwMjQxMzA2NDEuR0Ez
MDE5MUBsaW51eC11eXMzIj4KICAgICAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+VGhpcyB1cGdyYWRlIGNhdXNlZCBteSBidWls
ZCB0byBmYWlsIDotKApJcyBhbnlvbmUgZWxzZSBzZWVpbmcgdGhpcz8KPC9w
cmU+CiAgICAgICAgPC9ibG9ja3F1b3RlPgogICAgICA8L2Jsb2NrcXVvdGU+
CiAgICAgIDxicj4KICAgICAgTWUgdG9vIGJ1dCBvbmx5IG9uIG15IG9sZGVy
IHVidW50byAxNi4wNC48YnI+CiAgICAgIDxicj4KICAgICAgd2Ugc2hvdWxk
IGJ1ZyB0aGlzLiBJZiBubyBvbmUgZG9lcyBieSBGcmlkYXkgbmlnaHQgSSB3
aWxsLjxicj4KICAgICAgPGJyPgogICAgICAtIGFybWluPGJyPgogICAgICA8
YmxvY2txdW90ZSB0eXBlPSJjaXRlIgogICAgICAgIGNpdGU9Im1pZDozMzQ2
ODA1MC0zN2U2LWEwZWYtYjk1ZC0wMzk4MTRhNTIzNDNAd2luZHJpdmVyLmNv
bSI+CiAgICAgICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIKICAgICAgICAg
IGNpdGU9Im1pZDoyMDE5MTAyNDEzMDY0MS5HQTMwMTkxQGxpbnV4LXV5czMi
PgogICAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0i
Ij4JMjI6NDc6NDAgfCB4ODZfNjQtbGludXgtbGlidG9vbDogbGluazogZ2Nj
IC1XIC1XYWxsIC1Xc2hhZG93IC1XZm9ybWF0IC1XdW5kZWYgLURfR05VX1NP
VVJDRSAtaXN5c3RlbS96L2plbmtpbnMtd29ya3NwYWNlL25pZ2h0bHkvY3Vi
aWV0cnVjay9idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvbGli
Y2FwLW5nLW5hdGl2ZS8wLjcuMTAtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
L3Vzci9pbmNsdWRlIC1PMiAtcGlwZSAtV2wsLS1lbmFibGUtbmV3LWR0YWdz
IC1XbCwtcnBhdGgtbGluayAtV2wsL3ovamVua2lucy13b3Jrc3BhY2Uvbmln
aHRseS9jdWJpZXRydWNrL2J1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1s
aW51eC9saWJjYXAtbmctbmF0aXZlLzAuNy4xMC1yMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL2xpYiAtV2wsLXJwYXRoLWxpbmsgLVdsLC96L2plbmtp
bnMtd29ya3NwYWNlL25pZ2h0bHkvY3ViaWV0cnVjay9idWlsZC90bXAtZ2xp
YmMvd29yay94ODZfNjQtbGludXgvbGliY2FwLW5nLW5hdGl2ZS8wLjcuMTAt
cjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xpYiAtV2wsLXJwYXRoIC1XbCwv
ei9qZW5raW5zLXdvcmtzcGFjZS9uaWdodGx5L2N1YmlldHJ1Y2svYnVpbGQv
dG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRpdmUv
MC43LjEwLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliIC1XbCwt
cnBhdGggLVdsLC96L2plbmtpbnMtd29ya3NwYWNlL25pZ2h0bHkvY3ViaWV0
cnVjay9idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvbGliY2Fw
LW5nLW5hdGl2ZS8wLjcuMTAtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2xp
YiAtV2wsLU8xIC1vIC5saWJzL25ldGNhcCBuZXRjYXAubyBwcm9jLWxsaXN0
Lm8gIC1ML3ovamVua2lucy13b3Jrc3BhY2UvbmlnaHRseS9jdWJpZXRydWNr
L2J1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9saWJjYXAtbmct
bmEKIHRpdmUvMC43LjEwLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Iv
bGliIC1ML3ovamVua2lucy13b3Jrc3BhY2UvbmlnaHRseS9jdWJpZXRydWNr
L2J1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9saWJjYXAtbmct
bmF0aXZlLzAuNy4xMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGliIC1M
Li4vc3JjIC96L2plbmtpbnMtd29ya3NwYWNlL25pZ2h0bHkvY3ViaWV0cnVj
ay9idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvbGliY2FwLW5n
LW5hdGl2ZS8wLjcuMTAtcjAvYnVpbGQvc3JjLy5saWJzL2xpYmNhcC1uZy5z
bwoJMjI6NDc6NDAgfCAvdXNyL2xpYjY0L2djYy94ODZfNjQtc3VzZS1saW51
eC84Ly4uLy4uLy4uLy4uL3g4Nl82NC1zdXNlLWxpbnV4L2Jpbi9sZDogL3ov
amVua2lucy13b3Jrc3BhY2UvbmlnaHRseS9jdWJpZXRydWNrL2J1aWxkL3Rt
cC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9saWJjYXAtbmctbmF0aXZlLzAu
Ny4xMC1yMC9idWlsZC9zcmMvLmxpYnMvbGliY2FwLW5nLnNvOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBwdGhyZWFkX2F0Zm9yaycKCTIyOjQ3OjQwIHwg
Y29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCgky
Mjo0Nzo0MCB8IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDgwOiBuZXRjYXBd
IEVycm9yIDEKCTIyOjQ3OjQwIHwgbWFrZVsyXTogTGVhdmluZyBkaXJlY3Rv
cnkgJy96L2plbmtpbnMtd29ya3NwYWNlL25pZ2h0bHkvY3ViaWV0cnVjay9i
dWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvbGliY2FwLW5nLW5h
dGl2ZS8wLjcuMTAtcjAvYnVpbGQvdXRpbHMnCgkyMjo0Nzo0MCB8IG1ha2Vb
MV06ICoqKiBbTWFrZWZpbGU6NDQ1OiBhbGwtcmVjdXJzaXZlXSBFcnJvciAx
CgkyMjo0Nzo0MCB8IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvei9q
ZW5raW5zLXdvcmtzcGFjZS9uaWdodGx5L2N1YmlldHJ1Y2svYnVpbGQvdG1w
LWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRpdmUvMC43
LjEwLXIwL2J1aWxkJwoJMjI6NDc6NDAgfCBtYWtlOiAqKiogW01ha2VmaWxl
OjM3NzogYWxsXSBFcnJvciAyCgkyMjo0Nzo0MCB8IFdBUk5JTkc6IC96L2pl
bmtpbnMtd29ya3NwYWNlL25pZ2h0bHkvY3ViaWV0cnVjay9idWlsZC90bXAt
Z2xpYmMvd29yay94ODZfNjQtbGludXgvbGliY2FwLW5nLW5hdGl2ZS8wLjcu
MTAtcjAvdGVtcC9ydW4uZG9fY29tcGlsZS4xMjEyNzoxIGV4aXQgMSBmcm9t
ICdleGl0IDEnCgkyMjo0Nzo0MCB8CgkyMjo0Nzo0MCBOT1RFOiByZWNpcGUg
bGliY2FwLW5nLW5hdGl2ZS0wLjcuMTAtcjA6IHRhc2sgZG9fY29tcGlsZTog
RmFpbGVkCjwvcHJlPgogICAgICAgIDwvYmxvY2txdW90ZT4KICAgICAgICA8
cD5JIHNlZSBpdCB0b28sIHdoZW4gdHJ5aW5nIHRvIGJ1aWxkIGJpbnV0aWxz
OjwvcD4KICAgICAgICA8cD48Y29kZT48L2NvZGU+PGNvZGU+fCB4ODZfNjQt
bGludXgtbGlidG9vbDogbGluazogZ2NjIC1XIC1XYWxsCiAgICAgICAgICAg
IC1Xc2hhZG93IC1XZm9ybWF0IC1XdW5kZWYgLURfR05VX1NPVVJDRQotaXN5
c3RlbS9hbGEtbHBnZ3AyMS90Z2FtYmxpbi95b2N0by9idWlsZC90bXAtZ2xp
YmMvd29yay94ODZfNjQtbGludXgvbGliY2FwLW5nLW5hdGl2ZS8wLjcuMTAt
cjAvcmVbNi8xOTczXTwvY29kZT48Y29kZT48YnI+CiAgICAgICAgICA8L2Nv
ZGU+PGNvZGU+cm9vdC1uYXRpdmUvdXNyL2luY2x1ZGUgLU8yIC1waXBlCiAg
ICAgICAgICAgIC1XbCwtLWVuYWJsZS1uZXctZHRhZ3MgLVdsLC1ycGF0aC1s
aW5rCi1XbCwvYWxhLWxwZ2dwMjEvdGdhbWJsaW4veW9jdG8vYnVpbGQvdG1w
LWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRpdmUvMC43
LjEwLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91czwvY29kZT48Y29kZT48
YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+ci9saWIgLVdsLC1ycGF0aC1s
aW5rCi1XbCwvYWxhLWxwZ2dwMjEvdGdhbWJsaW4veW9jdG8vYnVpbGQvdG1w
LWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRpdmUvMC43
LjEwLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS9saWIKICAgICAgICAgICAg
LVdsLC1ycGF0aCAtV2wsL2FsYS1scGdncDIxL3RnYW1ibGluL3lvY3RvL2J1
aWxkLzwvY29kZT48Y29kZT48YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+
dG1wLWdsaWJjL3dvcmsveDg2XzY0LWxpbnV4L2xpYmNhcC1uZy1uYXRpdmUv
MC43LjEwLXIwL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliCiAgICAg
ICAgICAgIC1XbCwtcnBhdGgKLVdsLC9hbGEtbHBnZ3AyMS90Z2FtYmxpbi95
b2N0by9idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXgvbGliY2Fw
LW5nLW5hdGl2ZS8wLjcuMTAtcjAvcjwvY29kZT48Y29kZT48YnI+CiAgICAg
ICAgICA8L2NvZGU+PGNvZGU+ZWNpcGUtc3lzcm9vdC1uYXRpdmUvbGliIC1X
bCwtTzEgLW8gLmxpYnMvbmV0Y2FwCiAgICAgICAgICAgIG5ldGNhcC5vIHBy
b2MtbGxpc3Qub8KgCi1ML2FsYS1scGdncDIxL3RnYW1ibGluL3lvY3RvL2J1
aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9saWJjYXAtbmctbmF0
aXZlLzAuNy4xMC1yMC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2w8L2Nv
ZGU+PGNvZGU+PGJyPgogICAgICAgICAgPC9jb2RlPjxjb2RlPmliCi1ML2Fs
YS1scGdncDIxL3RnYW1ibGluL3lvY3RvL2J1aWxkL3RtcC1nbGliYy93b3Jr
L3g4Nl82NC1saW51eC9saWJjYXAtbmctbmF0aXZlLzAuNy4xMC1yMC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvbGliCiAgICAgICAgICAgIC1MLi4vc3JjCiAg
ICAgICAgICAgIC9hbGEtbHBnZ3AyMS90Z2FtYmxpbi95b2N0by9idWlsZC90
bXAtZ2xpYmMvd29yay94ODZfNjQtbGludXg8L2NvZGU+PGNvZGU+PGJyPgog
ICAgICAgICAgPC9jb2RlPjxjb2RlPi9saWJjYXAtbmctbmF0aXZlLzAuNy4x
MC1yMC9idWlsZC9zcmMvLmxpYnMvbGliY2FwLW5nLnNvPC9jb2RlPjxjb2Rl
Pjxicj4KICAgICAgICAgIDwvY29kZT48Y29kZT58Ci9hbGEtbHBnZ3AyMS90
Z2FtYmxpbi95b2N0by9idWlsZC90bXAtZ2xpYmMvd29yay94ODZfNjQtbGlu
dXgvbGliY2FwLW5nLW5hdGl2ZS8wLjcuMTAtcjAvYnVpbGQvc3JjLy5saWJz
L2xpYmNhcC1uZy5zbzoKICAgICAgICAgICAgdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgcHRocmVhZF9hdGZvcmsnPC9jb2RlPjxjb2RlPjxicj4KICAgICAg
ICAgIDwvY29kZT48Y29kZT58IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJu
ZWQgMSBleGl0IHN0YXR1czwvY29kZT48Y29kZT48YnI+CiAgICAgICAgICA8
L2NvZGU+PGNvZGU+fCBNYWtlZmlsZTo0ODM6IHJlY2lwZSBmb3IgdGFyZ2V0
ICdwc2NhcCcgZmFpbGVkPC9jb2RlPjxjb2RlPjxicj4KICAgICAgICAgIDwv
Y29kZT48Y29kZT58IG1ha2VbMl06ICoqKiBbcHNjYXBdIEVycm9yIDE8L2Nv
ZGU+PGNvZGU+PGJyPgogICAgICAgICAgPC9jb2RlPjxjb2RlPnwgbWFrZVsy
XTogKioqIFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi48L2NvZGU+
PGNvZGU+PGJyPgogICAgICAgICAgPC9jb2RlPjxjb2RlPnwKL2FsYS1scGdn
cDIxL3RnYW1ibGluL3lvY3RvL2J1aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82
NC1saW51eC9saWJjYXAtbmctbmF0aXZlLzAuNy4xMC1yMC9idWlsZC9zcmMv
LmxpYnMvbGliY2FwLW5nLnNvOgogICAgICAgICAgICB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBwdGhyZWFkX2F0Zm9yayc8L2NvZGU+PGNvZGU+PGJyPgog
ICAgICAgICAgPC9jb2RlPjxjb2RlPnwgY29sbGVjdDI6IGVycm9yOiBsZCBy
ZXR1cm5lZCAxIGV4aXQgc3RhdHVzPC9jb2RlPjxjb2RlPjxicj4KICAgICAg
ICAgIDwvY29kZT48Y29kZT58IE1ha2VmaWxlOjQ3MTogcmVjaXBlIGZvciB0
YXJnZXQgJ2NhcHRlc3QnCiAgICAgICAgICAgIGZhaWxlZDwvY29kZT48Y29k
ZT48YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+fCBtYWtlWzJdOiAqKiog
W2NhcHRlc3RdIEVycm9yIDE8L2NvZGU+PGNvZGU+PGJyPgogICAgICAgICAg
PC9jb2RlPjxjb2RlPnwKL2FsYS1scGdncDIxL3RnYW1ibGluL3lvY3RvL2J1
aWxkL3RtcC1nbGliYy93b3JrL3g4Nl82NC1saW51eC9saWJjYXAtbmctbmF0
aXZlLzAuNy4xMC1yMC9idWlsZC9zcmMvLmxpYnMvbGliY2FwLW5nLnNvOgog
ICAgICAgICAgICB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBwdGhyZWFkX2F0
Zm9yayc8L2NvZGU+PGNvZGU+PGJyPgogICAgICAgICAgPC9jb2RlPjxjb2Rl
PnwgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVz
PC9jb2RlPjxjb2RlPjxicj4KICAgICAgICAgIDwvY29kZT48Y29kZT58Ci9h
bGEtbHBnZ3AyMS90Z2FtYmxpbi95b2N0by9idWlsZC90bXAtZ2xpYmMvd29y
ay94ODZfNjQtbGludXgvbGliY2FwLW5nLW5hdGl2ZS8wLjcuMTAtcjAvYnVp
bGQvc3JjLy5saWJzL2xpYmNhcC1uZy5zbzoKICAgICAgICAgICAgdW5kZWZp
bmVkIHJlZmVyZW5jZSB0byBgcHRocmVhZF9hdGZvcmsnPC9jb2RlPjxjb2Rl
Pjxicj4KICAgICAgICAgIDwvY29kZT48Y29kZT58IGNvbGxlY3QyOiBlcnJv
cjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1czwvY29kZT48Y29kZT48YnI+
CiAgICAgICAgICA8L2NvZGU+PGNvZGU+fCBNYWtlZmlsZTo0NzU6IHJlY2lw
ZSBmb3IgdGFyZ2V0ICdmaWxlY2FwJwogICAgICAgICAgICBmYWlsZWQ8L2Nv
ZGU+PGNvZGU+PGJyPgogICAgICAgICAgPC9jb2RlPjxjb2RlPnwgbWFrZVsy
XTogKioqIFtmaWxlY2FwXSBFcnJvciAxPC9jb2RlPjxjb2RlPjxicj4KICAg
ICAgICAgIDwvY29kZT48Y29kZT58IE1ha2VmaWxlOjQ3OTogcmVjaXBlIGZv
ciB0YXJnZXQgJ25ldGNhcCcgZmFpbGVkPC9jb2RlPjxjb2RlPjxicj4KICAg
ICAgICAgIDwvY29kZT48Y29kZT58IG1ha2VbMl06ICoqKiBbbmV0Y2FwXSBF
cnJvciAxPC9jb2RlPjxjb2RlPjxicj4KICAgICAgICAgIDwvY29kZT48Y29k
ZT58IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5CicvYWxhLWxwZ2dwMjEv
dGdhbWJsaW4veW9jdG8vYnVpbGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxp
bnV4L2xpYmNhcC1uZy1uYXRpdmUvMC43LjEwLXIwL2J1aWxkL3V0aWxzJzwv
Y29kZT48Y29kZT48YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+fCBNYWtl
ZmlsZTo0NDU6IHJlY2lwZSBmb3IgdGFyZ2V0ICdhbGwtcmVjdXJzaXZlJwog
ICAgICAgICAgICBmYWlsZWQ8L2NvZGU+PGNvZGU+PGJyPgogICAgICAgICAg
PC9jb2RlPjxjb2RlPnwgbWFrZVsxXTogKioqIFthbGwtcmVjdXJzaXZlXSBF
cnJvciAxPC9jb2RlPjxjb2RlPjxicj4KICAgICAgICAgIDwvY29kZT48Y29k
ZT58IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5CicvYWxhLWxwZ2dwMjEv
dGdhbWJsaW4veW9jdG8vYnVpbGQvdG1wLWdsaWJjL3dvcmsveDg2XzY0LWxp
bnV4L2xpYmNhcC1uZy1uYXRpdmUvMC43LjEwLXIwL2J1aWxkJzwvY29kZT48
Y29kZT48YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+fCBNYWtlZmlsZToz
Nzc6IHJlY2lwZSBmb3IgdGFyZ2V0ICdhbGwnIGZhaWxlZDwvY29kZT48Y29k
ZT48YnI+CiAgICAgICAgICA8L2NvZGU+PGNvZGU+fCBtYWtlOiAqKiogW2Fs
bF0gRXJyb3IgMjwvY29kZT48YnI+CiAgICAgICAgPC9wPgogICAgICAgIDxi
cj4KICAgICAgICA8ZmllbGRzZXQgY2xhc3M9Im1pbWVBdHRhY2htZW50SGVh
ZGVyIj48L2ZpZWxkc2V0PgogICAgICA8L2Jsb2NrcXVvdGU+CiAgICAgIDxi
cj4KICAgIDwvYmxvY2txdW90ZT4KICA8L2JvZHk+CjwvaHRtbD4K

--------------68F5AD33A99E08262F453A4F--
