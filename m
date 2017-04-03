Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 7ABDB77CFA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 13:42:45 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id p22so114185967qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Apr 2017 06:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=M2jC/L/n0zlfHC3jiVLx1lqOqPr23tDmcgVru2PQn0E=;
	b=eWZVs6DDlnU7i8kCjv1I8XVNjepoTjlNIgRFUZCppkoTbZ7epBE7H8fmAVexDZ0M1L
	1W4Nsnp/AbOv760n7SxmEIf3Lc6rcyVGbyqqdYl0RArLl7Z80nKTMUdzN1bZdBy+jdLn
	WMtFEJG7vRfNbH4OEt0zCZldIqxLznWyYhzpvz5V5KR3YApiM0kWAPrr54svmkKIWBj2
	N44P+Z6j6pH6Bt4g1bi2Krf09PDvSSGMVkUgCk6soHLAEBLgcuTjcnkT2kyna26Z7Bvt
	FW3k3p5Nc8MHLrhK2NtKQ/PNLYfPQDuDUiEMe0+3p608N4GqNXl/LGT88dEhwdRbTFC2
	fJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=M2jC/L/n0zlfHC3jiVLx1lqOqPr23tDmcgVru2PQn0E=;
	b=MmIG441iI9d1y9dZ9IMskzdac3yBea5KtFc74jlO+sGIOoOUTQ0JwAddUp/FEDAp+v
	ykmEXtInNnDGHiKrTQzUcPBLJt4OvSxAjYib6l62QLajm51x/LUWLHXa6kX3Wk7qD2CW
	qQ3RDlyB7gkQFaB0N9tvAaEox6mVmN/p/cw5n4K0/DSah5Psbtu9IvgYgpdHVRLCxkaC
	/g+w9Evg2/KvBQVajr8tkRN56Cnq2Puu4J+Ro5q1Um6K9XZxUcCb3trRkvnsCXmHP8Pi
	aMhGMsGD8U6H/NBJlln6Ae6QaQ+eQWkVrIO9vGQZaMSh1hVNkajKW2M6nyPihaVwLf8o
	BSCg==
X-Gm-Message-State: AFeK/H0J5zZIheyU3KvM6WB55rwpI2IdRcr8RnALNiH6AFL7S6dX5xLXvE3eYfl8jypwh+Pdim//OMkwc+JVWS5f
X-Received: by 10.55.78.80 with SMTP id c77mr1203368qkb.221.1491226966135;
	Mon, 03 Apr 2017 06:42:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 3 Apr 2017 06:42:25 -0700 (PDT)
In-Reply-To: <20170403131225.29128-1-dmitry.rozhkov@linux.intel.com>
References: <20170403131225.29128-1-dmitry.rozhkov@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Apr 2017 14:42:25 +0100
Message-ID: <CAJTo0LaBC=-ENw4rbd=m-V_Xa3KROOKr73fDeKVB=RLhvjMaoA@mail.gmail.com>
To: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: make dependencies on python conditional
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
X-List-Received-Date: Mon, 03 Apr 2017 13:42:45 -0000
Content-Type: multipart/alternative; boundary=001a114a896e98ccc3054c435527

--001a114a896e98ccc3054c435527
Content-Type: text/plain; charset=UTF-8

On 3 April 2017 at 14:12, Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
wrote:

> The library libxml2 can provide its own bindings for python2 in addition
> to the third party python-lxml and python3-lxml packages if this
> functionality is enabled in PACKAGECONFIG.
>
> But in case the functionality is disabled there's no need to depend
> on python2.
>
> Make the dependency on python2 enabled only if the python feature
> is added to PACKAGECONFIG. Also don't produce the binary
> package libxml2-python if it's not needed.
>

| ERROR: oe_runmake failed
| cc1: warning: include location "/usr/include/python3.4m" is unsafe for
cross-compilation [-Wpoison-system-directories]
| cc1: warning: include location "/usr/include/python3.4m" is unsafe for
cross-compilation [-Wpoison-system-directories]
| cc1: warning: include location "/usr/include/python3.4m" is unsafe for
cross-compilation [-Wpoison-system-directories]
| In file included from /usr/include/python3.4m/Python.h:8:0,
|                  from ../../libxml2-2.9.4/python/libxml2-py.c:3:
| /usr/include/python3.4m/pyconfig.h:3:52: fatal error:
x86_64-linux-gnu/python3.4m/pyconfig.h: No such file or directory
|  #  include <x86_64-linux-gnu/python3.4m/pyconfig.h>
|                                                     ^
| In file included from /usr/include/python3.4m/Python.h:8:0,
|                  from ../../libxml2-2.9.4/python/libxml_wrap.h:1,
|                  from ../../libxml2-2.9.4/python/types.c:9:
| /usr/include/python3.4m/pyconfig.h:3:52: fatal error:
x86_64-linux-gnu/python3.4m/pyconfig.h: No such file or directory
|  #  include <x86_64-linux-gnu/python3.4m/pyconfig.h>
|                                                     ^
| compilation terminated.
| compilation terminated.
| Makefile:625: recipe for target 'types.lo' failed
| make[4]: *** [types.lo] Error 1
| make[4]: *** Waiting for unfinished jobs....
| Makefile:625: recipe for target 'libxml2-py.lo' failed
| make[4]: *** [libxml2-py.lo] Error 1
| In file included from /usr/include/python3.4m/Python.h:8:0,
|                  from ../../libxml2-2.9.4/python/libxml.c:14:
| /usr/include/python3.4m/pyconfig.h:3:52: fatal error:
x86_64-linux-gnu/python3.4m/pyconfig.h: No such file or directory
|  #  include <x86_64-linux-gnu/python3.4m/pyconfig.h>
|                                                     ^
| compilation terminated.
| Makefile:625: recipe for target 'libxml.lo' failed

Something went wrong...  Promise it built before I applied the patch.  Also
the PACKAGES change shouldn't be required as an empty package won't be
generated.

Ross

--001a114a896e98ccc3054c435527
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 April 2017 at 14:12, Dmitry Rozhkov <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:dmitry.rozhkov@linux.intel.com" target=3D"_blank">dmitry.rozhkov@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid=
;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:22r=
" class=3D"gmail-a3s gmail-aXjCH gmail-m15b3404d66c1afaf">The library libxm=
l2 can provide its own bindings for python2 in addition<br>
to the third party python-lxml and python3-lxml packages if this<br>
functionality is enabled in PACKAGECONFIG.<br>
<br>
But in case the functionality is disabled there&#39;s no need to depend<br>
on python2.<br>
<br>
Make the dependency on python2 enabled only if the python feature<br>
is added to PACKAGECONFIG. Also don&#39;t produce the binary<br>
package libxml2-python if it&#39;s not needed.</div></blockquote></div><br>=
<div class=3D"gmail_extra">| ERROR: oe_runmake failed</div><div class=3D"gm=
ail_extra">| cc1: warning: include location &quot;/usr/include/python3.4m&q=
uot; is unsafe for cross-compilation [-Wpoison-system-directories]</div><di=
v class=3D"gmail_extra">| cc1: warning: include location &quot;/usr/include=
/python3.4m&quot; is unsafe for cross-compilation [-Wpoison-system-director=
ies]</div><div class=3D"gmail_extra">| cc1: warning: include location &quot=
;/usr/include/python3.4m&quot; is unsafe for cross-compilation [-Wpoison-sy=
stem-directories]</div><div class=3D"gmail_extra">| In file included from /=
usr/include/python3.4m/Python.h:8:0,</div><div class=3D"gmail_extra">| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../libxm=
l2-2.9.4/python/libxml2-py.c:3:</div><div class=3D"gmail_extra">| /usr/incl=
ude/python3.4m/pyconfig.h:3:52: fatal error: x86_64-linux-gnu/python3.4m/py=
config.h: No such file or directory</div><div class=3D"gmail_extra">| =C2=
=A0# =C2=A0include &lt;x86_64-linux-gnu/python3.4m/pyconfig.h&gt;</div><div=
 class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div cla=
ss=3D"gmail_extra">| In file included from /usr/include/python3.4m/Python.h=
:8:0,</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../libxml2-2.9.4/python/libxml_wrap.h:1,=
</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from ../../libxml2-2.9.4/python/types.c:9:</div><di=
v class=3D"gmail_extra">| /usr/include/python3.4m/pyconfig.h:3:52: fatal er=
ror: x86_64-linux-gnu/python3.4m/pyconfig.h: No such file or directory</div=
><div class=3D"gmail_extra">| =C2=A0# =C2=A0include &lt;x86_64-linux-gnu/py=
thon3.4m/pyconfig.h&gt;</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra">| compilation terminate=
d.</div><div class=3D"gmail_extra">| compilation terminated.</div><div clas=
s=3D"gmail_extra">| Makefile:625: recipe for target &#39;types.lo&#39; fail=
ed</div><div class=3D"gmail_extra">| make[4]: *** [types.lo] Error 1</div><=
div class=3D"gmail_extra">| make[4]: *** Waiting for unfinished jobs....</d=
iv><div class=3D"gmail_extra">| Makefile:625: recipe for target &#39;libxml=
2-py.lo&#39; failed</div><div class=3D"gmail_extra">| make[4]: *** [libxml2=
-py.lo] Error 1</div><div class=3D"gmail_extra">| In file included from /us=
r/include/python3.4m/Python.h:8:0,</div><div class=3D"gmail_extra">| =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../libxml2-=
2.9.4/python/libxml.c:14:</div><div class=3D"gmail_extra">| /usr/include/py=
thon3.4m/pyconfig.h:3:52: fatal error: x86_64-linux-gnu/python3.4m/pyconfig=
.h: No such file or directory</div><div class=3D"gmail_extra">| =C2=A0# =C2=
=A0include &lt;x86_64-linux-gnu/python3.4m/pyconfig.h&gt;</div><div class=
=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div class=3D"g=
mail_extra">| compilation terminated.</div><div class=3D"gmail_extra">| Mak=
efile:625: recipe for target &#39;libxml.lo&#39; failed</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Something went wrong...=
=C2=A0 Promise it built before I applied the patch.=C2=A0 Also the PACKAGES=
 change shouldn&#39;t be required as an empty package won&#39;t be generate=
d.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ros=
s</div></div></div>

--001a114a896e98ccc3054c435527--
