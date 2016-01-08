Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 10BA073289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:00:53 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id t15so52168953igr.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QFLmbahJ9XxN2mnYSCUBb+V9VJ41YKUeoSZUZM0qBa0=;
	b=k1s2tVyQB0Onq9EbWdfJ9fn4z6BWAz8KjhlnCJYTkRQ17nn9fJzgTZlDHg+id5tZOb
	ExCiA1MRwStovT/Xv2AzQaK+8ObsaLAvdGXUV+4W3bUBT4off3lj8efrfgedDlm8NV5F
	mMnXLYIGAX7W2PXAACzaXqqHqcsbNozQDbheONikku35b2PbVAlNQfJvoKVzqLe+ZAMJ
	Qpu2pPr2nHBiggCtd+ot8GVAEBuUrq6VQOSCfTDVIcm/zZE4v01tNlDBsli3hpNRRY8C
	2voFgHdcxr5nTs/flH/XoDz4CzfjWSYRbQqK29wBTOWDMkRsZhggWaTm1KG+B4ICj/XB
	cPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QFLmbahJ9XxN2mnYSCUBb+V9VJ41YKUeoSZUZM0qBa0=;
	b=DoLUcEbBBDnAykAdwe1pqVcumpdr8nzpEVNcwTabOKm6fX01mqS6YoJbBBm7PdRM6V
	EKYWr78lPr3wYx7vP81cdd0GO1CkvanDILVFmH5hIp6FUbEjC13Y5cUxAqNmkZo3xg+j
	3VGXFHwneDjCoouZnZt/y+gFYKcMIbkKuQxLC3oqo0rap8kELiwxcWEEfRQyL/u5dtMt
	M1YVErqVVRkN1/BJDu9DjQYUWU0wqgeBVq66A+s8dRhqcj0ELIxqf4Io6KdIMGuHTzFE
	emgIGNTprCSigj/kuxE8bP+eAOwVJgZbI9C/b0wtufciDxJebfqxKGstHgJF0mGRZGao
	Qgmw==
X-Gm-Message-State: ALoCoQlqinvo3UARVgXhn1k+r79XfvRwyQE41bS1xE/3XmcHM8Y5b4VQ7VU4yW3IuJhNIVaaF3w/xYNm3/fgLh25MomyzCaH6+qejwcZMarJpfy+J/JMZSY=
X-Received: by 10.50.111.111 with SMTP id ih15mr20152176igb.78.1452261654386; 
	Fri, 08 Jan 2016 06:00:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.226 with HTTP; Fri, 8 Jan 2016 06:00:34 -0800 (PST)
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Jan 2016 14:00:34 +0000
Message-ID: <CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 14:00:55 -0000
Content-Type: multipart/alternative; boundary=089e0149be3408002c0528d3048c

--089e0149be3408002c0528d3048c
Content-Type: text/plain; charset=UTF-8

On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:

> This set of fixes let core-image-full-cmdline build with musl along with
> core-image-sato
> and core-image-weston
>

Hm, for some reason, this doesn't work for me.

Lots and lots of "files installed but not packaged", all locales.  eg
/usr/lib/locale/hu/LC_MESSAGES/glib20.mo in glib-2.0.

systemd fails with this error, over and over:

|
/data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/util.h:96:70:
error: unknown type name 'comparison_fn_t'
|  static inline void qsort_safe(void *base, size_t nmemb, size_t size,
comparison_fn_t compar) {

Also I presume you're not building with debugging tools enabled because
oprofile fails to build:

| make[2]: Entering directory
'/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/build/pe_profiling'
| i586-poky-linux-musl-g++  -m32 -march=i586
--sysroot=/data/poky-master/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I.
-I/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling
-I..  -I
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libutil
-I
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libop
-I
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libutil++
-I
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libperf_events
-I
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libpe_utils
-I/data/poky-master/tmp/sysroots/qemux86/usr/include   -W -Wall -fno-common
-ftemplate-depth-50 -O2 -pipe -g -feliminate-unused-debug-types
-fvisibility-inlines-hidden -c -o operf.o
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp
|
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:
In function 'int __delete_old_previous_sample_data(const char*, const
stat*, int, FTW*)':
|
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:862:10:
error: 'FTW_STOP' was not declared in this scope
|    return FTW_STOP;
|           ^
|
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:864:10:
error: 'FTW_CONTINUE' was not declared in this scope
|    return FTW_CONTINUE;
|           ^
|
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:
In function 'void convert_sample_data()':
|
/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:899:41:
error: 'FTW_ACTIONRETVAL' was not declared in this scope
|                  int flags = FTW_DEPTH | FTW_ACTIONRETVAL;
|                                          ^
| Makefile:451: recipe for target 'operf.o' failed

I presume this is another "link to fts" case.

Ross

--089e0149be3408002c0528d3048c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 January 2016 at 10:19, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-styl=
e:solid;padding-left:1ex"><div id=3D":6fo" class=3D"" style=3D"overflow:hid=
den">This set of fixes let core-image-full-cmdline build with musl along wi=
th core-image-sato<br>
and core-image-weston<br></div></blockquote></div><br>Hm, for some reason, =
this doesn&#39;t work for me.</div><div class=3D"gmail_extra"><br></div><di=
v class=3D"gmail_extra">Lots and lots of &quot;files installed but not pack=
aged&quot;, all locales. =C2=A0eg /usr/lib/locale/hu/LC_MESSAGES/glib20.mo =
in glib-2.0.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">systemd fails with this error, over and over:</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">|=
 /data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+d=
d050decb6-r0/git/src/basic/util.h:96:70: error: unknown type name &#39;comp=
arison_fn_t&#39;</div><div class=3D"gmail_extra">| =C2=A0static inline void=
 qsort_safe(void *base, size_t nmemb, size_t size, comparison_fn_t compar) =
{</div><div class=3D"gmail_extra"><br></div></div><div class=3D"gmail_extra=
">Also I presume you&#39;re not building with debugging tools enabled becau=
se oprofile fails to build:</div><div class=3D"gmail_extra"><br></div><div =
class=3D"gmail_extra"><div class=3D"gmail_extra">| make[2]: Entering direct=
ory &#39;/data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/=
build/pe_profiling&#39;</div><div class=3D"gmail_extra">| i586-poky-linux-m=
usl-g++ =C2=A0-m32 -march=3Di586 --sysroot=3D/data/poky-master/tmp/sysroots=
/qemux86 -DHAVE_CONFIG_H -I. -I/data/poky-master/tmp/work/i586-poky-linux-m=
usl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling -I.. =C2=A0-I /data/poky-=
master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libut=
il -I /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/opr=
ofile-1.1.0/libop -I /data/poky-master/tmp/work/i586-poky-linux-musl/oprofi=
le/1.1.0-r0/oprofile-1.1.0/libutil++ -I /data/poky-master/tmp/work/i586-pok=
y-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libperf_events -I /data/poky-=
master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/libpe=
_utils -I/data/poky-master/tmp/sysroots/qemux86/usr/include =C2=A0 -W -Wall=
 -fno-common -ftemplate-depth-50 -O2 -pipe -g -feliminate-unused-debug-type=
s -fvisibility-inlines-hidden -c -o operf.o /data/poky-master/tmp/work/i586=
-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp</d=
iv><div class=3D"gmail_extra">| /data/poky-master/tmp/work/i586-poky-linux-=
musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp: In function &=
#39;int __delete_old_previous_sample_data(const char*, const stat*, int, FT=
W*)&#39;:</div><div class=3D"gmail_extra">| /data/poky-master/tmp/work/i586=
-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:86=
2:10: error: &#39;FTW_STOP&#39; was not declared in this scope</div><div cl=
ass=3D"gmail_extra">| =C2=A0 =C2=A0return FTW_STOP;</div><div class=3D"gmai=
l_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_ex=
tra">| /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile/1.1.0-r0/op=
rofile-1.1.0/pe_profiling/operf.cpp:864:10: error: &#39;FTW_CONTINUE&#39; w=
as not declared in this scope</div><div class=3D"gmail_extra">| =C2=A0 =C2=
=A0return FTW_CONTINUE;</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra">| /data/poky-master/tmp=
/work/i586-poky-linux-musl/oprofile/1.1.0-r0/oprofile-1.1.0/pe_profiling/op=
erf.cpp: In function &#39;void convert_sample_data()&#39;:</div><div class=
=3D"gmail_extra">| /data/poky-master/tmp/work/i586-poky-linux-musl/oprofile=
/1.1.0-r0/oprofile-1.1.0/pe_profiling/operf.cpp:899:41: error: &#39;FTW_ACT=
IONRETVAL&#39; was not declared in this scope</div><div class=3D"gmail_extr=
a">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int flag=
s =3D FTW_DEPTH | FTW_ACTIONRETVAL;</div><div class=3D"gmail_extra">| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div=
><div class=3D"gmail_extra">| Makefile:451: recipe for target &#39;operf.o&=
#39; failed</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_e=
xtra">I presume this is another &quot;link to fts&quot; case.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></d=
iv>

--089e0149be3408002c0528d3048c--
