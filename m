Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1D48060745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 22:36:02 +0000 (UTC)
Received: by ioae126 with SMTP id e126so60810813ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=srqvWt1YFKMwSTMKlTkiGese28DNYyDn7Oiq8+8o9nU=;
	b=lck6DqYZz5Cgym3OAEBp92XT/rbYl8s1EbYEU0mXwHFmK1Z9KsRL1m1A8sX52Eddm+
	Ma3W8ca8+1k1ORmz3WawF9CEqhWk+T/e46rQA1iZAtxGFvZsBKL5SXrGg+VAAzIvEeWd
	P59wkR0wU9FARpPmFjTJV4AX3IE5dP5iB5kJA7H7vn6XX9mptMn0cdm2azwnN6PMdqNl
	Ms/+9V3fwUdMdHZbPgnJl/xKBf6VF9oN1LMIJ43+9l1oWb9qk4D4uERhXipSguLx5y64
	Zieis5TLST2UHaXVB0espO21XRNC8nhRgfq0SAKUPA1NEZslK5JK9PXbPsuTV69oGOpx
	mAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=srqvWt1YFKMwSTMKlTkiGese28DNYyDn7Oiq8+8o9nU=;
	b=M2lpNQ7iBrQ/ig4tmH+e2bUmlFuXQ6WEYkeovnegjwM4RgB4DMWg2iHNm9QpUXFSgM
	N1lUVHFinouvNW1gfrE5q/owcLuQf4VAignClr5gK2XTLA5R5lNA6/7jeOEHIy3mkB1K
	OYZcJt4TxJrIN661T8vWjnBhas/Ecy6ZH6TdpuhNcaTMB/LlUkrrpP4FV4DBNdQdOiOl
	VMFZthoLzoD1DV/P9HZLyT4bEvjyoL86UXET3AqojMxs15pXA9v0XKnVP35eCvauMHHd
	+IlQ3IxMT5lHeK4Ic5wvNYWnjnPYDwVUKTggwygievjEWnkJ2HF7d/z/f0M0I5Dt8+XQ
	RJ3A==
X-Gm-Message-State: ALoCoQmc3Z8bonAtS68wU8LF5VFymHIcBlh9a64s/4xWSkxSU7f1Dh3M3SuuzZcttdTqtThSREBvc8SYPeYxdZEXgkqzeyMUWkVA6HT1FxcBSCCO1uYGpeM=
X-Received: by 10.107.130.155 with SMTP id m27mr35900371ioi.133.1450132563375; 
	Mon, 14 Dec 2015 14:36:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Mon, 14 Dec 2015 14:35:43 -0800 (PST)
In-Reply-To: <75361fe58bb48cbda4dd21063e55af80dfeee838.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
	<75361fe58bb48cbda4dd21063e55af80dfeee838.1450104283.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Dec 2015 22:35:43 +0000
Message-ID: <CAJTo0La_gCF36J-3taAp4j2sAf67vi4Bv+ocNLk_tg=tu6dn2A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/20] flex: update to 2.6.0
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
X-List-Received-Date: Mon, 14 Dec 2015 22:36:05 -0000
Content-Type: multipart/alternative; boundary=001a113ecd945154500526e34c2a

--001a113ecd945154500526e34c2a
Content-Type: text/plain; charset=UTF-8

On 14 December 2015 at 15:05, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Drop backported
> 0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
>
> Test cases have been completely rearranged upstream, so ptest support
> is fully rewritten.
>

Fails to build for me:

| Making all in tests
| make[1]: Entering directory
'/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/build/tests'
| /bin/bash
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/build-aux/ylwrap
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_nr_parser.y
y.tab.c bison_nr_parser.c y.tab.h `echo bison_nr_parser.c | sed -e
s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output
bison_nr_parser.output -- bison -y -d -p test
| ../src/flex -o bison_nr_scanner.c
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_nr_scanner.l
| /bin/bash
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/build-aux/ylwrap
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_yylloc_parser.y
y.tab.c bison_yylloc_parser.c y.tab.h `echo bison_yylloc_parser.c | sed -e
s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output
bison_yylloc_parser.output -- bison -y -d -p test
| ../src/flex -o bison_yylloc_scanner.c
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_yylloc_scanner.l
| /bin/bash
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/build-aux/ylwrap
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_yylval_parser.y
y.tab.c bison_yylval_parser.c y.tab.h `echo bison_yylval_parser.c | sed -e
s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output
bison_yylval_parser.output -- bison -y -d -p test
| ../src/flex -o bison_yylval_scanner.c
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_yylval_scanner.l
| /bin/bash: ../src/flex: No such file or directory
| Makefile:2868: recipe for target 'bison_nr_scanner.c' failed
| make[1]: *** [bison_nr_scanner.c] Error 127
| make[1]: *** Waiting for unfinished jobs....
| /bin/bash: ../src/flex: No such file or directory
| Makefile:2868: recipe for target 'bison_yylloc_scanner.c' failed
| make[1]: *** [bison_yylloc_scanner.c] Error 127
| /bin/bash: ../src/flex: No such file or directory
| Makefile:2868: recipe for target 'bison_yylval_scanner.c' failed
| make[1]: *** [bison_yylval_scanner.c] Error 127
|
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/bison_nr_parser.y:57.1-12:
warning: deprecated directive, use '%pure-parser' [-Wdeprecated]
|  %pure_parser
|  ^^^^^^^^^^^^
| updating bison_nr_parser.h
| updating bison_yylloc_parser.h
| updating bison_yylval_parser.h
| make[1]: Leaving directory
'/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/build/tests'
| Makefile:523: recipe for target 'all-recursive' failed
| make: *** [all-recursive] Error 1

A race in the test build?

Ross

--001a113ecd945154500526e34c2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 December 2015 at 15:05, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div id=
=3D":401" class=3D"" style=3D"overflow:hidden">Drop backported 0001-bison-t=
est-fixes-Do-not-use-obsolete-bison-construct.patch<br>
<br>
Test cases have been completely rearranged upstream, so ptest support<br>
is fully rewritten.</div></blockquote></div><br>Fails to build for me:</div=
><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=
=3D"gmail_extra">| Making all in tests</div><div class=3D"gmail_extra">| ma=
ke[1]: Entering directory &#39;/data/poky-master/tmp/work/corei7-64-poky-li=
nux/flex/2.6.0-r0/build/tests&#39;</div><div class=3D"gmail_extra">| /bin/b=
ash /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.=
0/build-aux/ylwrap /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6=
.0-r0/flex-2.6.0/tests/bison_nr_parser.y y.tab.c bison_nr_parser.c y.tab.h =
`echo bison_nr_parser.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e=
 s/c++$/h++/ -e s/c$/h/` y.output bison_nr_parser.output -- bison -y -d -p =
test</div><div class=3D"gmail_extra">| ../src/flex -o bison_nr_scanner.c /d=
ata/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/test=
s/bison_nr_scanner.l</div><div class=3D"gmail_extra">| /bin/bash /data/poky=
-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/build-aux/yl=
wrap /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6=
.0/tests/bison_yylloc_parser.y y.tab.c bison_yylloc_parser.c y.tab.h `echo =
bison_yylloc_parser.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s=
/c++$/h++/ -e s/c$/h/` y.output bison_yylloc_parser.output -- bison -y -d -=
p test</div><div class=3D"gmail_extra">| ../src/flex -o bison_yylloc_scanne=
r.c /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.=
0/tests/bison_yylloc_scanner.l</div><div class=3D"gmail_extra">| /bin/bash =
/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/bu=
ild-aux/ylwrap /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r=
0/flex-2.6.0/tests/bison_yylval_parser.y y.tab.c bison_yylval_parser.c y.ta=
b.h `echo bison_yylval_parser.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$=
/hxx/ -e s/c++$/h++/ -e s/c$/h/` y.output bison_yylval_parser.output -- bis=
on -y -d -p test</div><div class=3D"gmail_extra">| ../src/flex -o bison_yyl=
val_scanner.c /data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0=
/flex-2.6.0/tests/bison_yylval_scanner.l</div><div class=3D"gmail_extra">| =
/bin/bash: ../src/flex: No such file or directory</div><div class=3D"gmail_=
extra">| Makefile:2868: recipe for target &#39;bison_nr_scanner.c&#39; fail=
ed</div><div class=3D"gmail_extra">| make[1]: *** [bison_nr_scanner.c] Erro=
r 127</div><div class=3D"gmail_extra">| make[1]: *** Waiting for unfinished=
 jobs....</div><div class=3D"gmail_extra">| /bin/bash: ../src/flex: No such=
 file or directory</div><div class=3D"gmail_extra">| Makefile:2868: recipe =
for target &#39;bison_yylloc_scanner.c&#39; failed</div><div class=3D"gmail=
_extra">| make[1]: *** [bison_yylloc_scanner.c] Error 127</div><div class=
=3D"gmail_extra">| /bin/bash: ../src/flex: No such file or directory</div><=
div class=3D"gmail_extra">| Makefile:2868: recipe for target &#39;bison_yyl=
val_scanner.c&#39; failed</div><div class=3D"gmail_extra">| make[1]: *** [b=
ison_yylval_scanner.c] Error 127</div><div class=3D"gmail_extra">| /data/po=
ky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/flex-2.6.0/tests/biso=
n_nr_parser.y:57.1-12: warning: deprecated directive, use &#39;%pure-parser=
&#39; [-Wdeprecated]</div><div class=3D"gmail_extra">| =C2=A0%pure_parser</=
div><div class=3D"gmail_extra">| =C2=A0^^^^^^^^^^^^</div><div class=3D"gmai=
l_extra">| updating bison_nr_parser.h</div><div class=3D"gmail_extra">| upd=
ating bison_yylloc_parser.h</div><div class=3D"gmail_extra">| updating biso=
n_yylval_parser.h</div><div class=3D"gmail_extra">| make[1]: Leaving direct=
ory &#39;/data/poky-master/tmp/work/corei7-64-poky-linux/flex/2.6.0-r0/buil=
d/tests&#39;</div><div class=3D"gmail_extra">| Makefile:523: recipe for tar=
get &#39;all-recursive&#39; failed</div><div class=3D"gmail_extra">| make: =
*** [all-recursive] Error 1</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra">A race in the test build?</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--001a113ecd945154500526e34c2a--
