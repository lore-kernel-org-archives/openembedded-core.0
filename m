Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 21FAD61486
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 17:26:03 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id s11so31283139qcv.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 09:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=fSoDQ5P6XGJQIb9tl/oNhweVDEGLKO+C1YRHP3eYrzo=;
	b=MYDOzEPZP2c70u7wMopC52dvatp2HxameP9vxbSghlCsmV6hJzNoDRn2hg2bhV8TBn
	8TTX9IaI4nEZbNhGBBWiywyUXCvy6AZ66+C/vK2SDBSd3HMJL2lU4qWQOv7DPqzJTTbR
	MIP15xOaueNkqSInXyJJJlFYNor+jdHmazQ/O+fNPQDSicnU5/VpBsJ/JyMHJTaPEmFH
	C7MoN0hy3RJ9gxry4wkYs7il5QLXxsi4WLVu2Qi1cddXiRy0Y61cMoOUniZMQ2kF8PW/
	x53uvNEMydq1eXE3fnywDjqPju+H+XtzHQ++NR53U+5TJqtbIaVS3x8UZxBau4kz/fZr
	PylQ==
X-Gm-Message-State: ALoCoQnVtDtjm+yai4Sbrcvxhlc130XEtpd2m/KeJUyb4ZGP1BGx+TN1WRBkMO9oNFYNKJo2qrUq
X-Received: by 10.224.103.129 with SMTP id k1mr43596598qao.93.1422897964838;
	Mon, 02 Feb 2015 09:26:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Mon, 2 Feb 2015 09:25:44 -0800 (PST)
In-Reply-To: <CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Feb 2015 17:25:44 +0000
Message-ID: <CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Mon, 02 Feb 2015 17:26:11 -0000
Content-Type: multipart/alternative; boundary=047d7b66f74bbf11c3050e1e3f8d

--047d7b66f74bbf11c3050e1e3f8d
Content-Type: text/plain; charset=UTF-8

On 2 February 2015 at 10:54, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 2, 2015 at 2:40 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > cross-localdef-native:
> >
> > | In file included from glibc/locale/programs/locarchive.c:696:0:
> > | glibc/locale/programs/../../intl/l10nflist.c: In function
> > '_nl_normalize_codeset':
> > | glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
> binary
> > operator before token "("
> > | glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
> > '_nl_C_locobj_ptr' undeclared (first use in this function)
> > | glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each
> undeclared
> > identifier is reported only once for each function it appears in
>
>
> gcc would work with latest tree but I did not run into this error. So
> wait a while until I get to it.


I can confirm that the current branch builds gcc (and everything else in a
minimal image) apart from cross-localdef-native, with a long set of errors
for me now:

| In file included from glibc/locale/programs/locarchive.c:696:0:
| glibc/locale/programs/../../intl/l10nflist.c: In function
'_nl_normalize_codeset':
| glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing
binary operator before token "("
| glibc/locale/programs/../../intl/l10nflist.c:313:9: error:
'_nl_C_locobj_ptr' undeclared (first use in this function)
| glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undeclared
identifier is reported only once for each function it appears in
| glibc/locale/programs/locarchive.c: In function 'add_locales_to_archive':
| glibc/locale/programs/locarchive.c:1517:7: warning: passing argument 1 of
'__xpg_basename' discards 'const' qualifier from pointer target type
[enabled by default]
| In file included from
/data/poky-master/tmp/work/x86_64-linux/cross-localedef-native/2.21-r0/git/localedef/include/string.h:4:0,
|                  from glibc/locale/programs/locarchive.c:34:
| /usr/include/libgen.h:35:14: note: expected 'char *' but argument is of
type 'const char *'
| glibc/locale/programs/ld-ctype.c: In function 'set_class_defaults':
| glibc/locale/programs/ld-ctype.c:3012:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3012:7: note: use option -std=c99 or
-std=gnu99 to compile your code
| glibc/locale/programs/ld-ctype.c:3016:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3012:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3016:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3034:5: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3038:17: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3034:17: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3038:5: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3250:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3254:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3250:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3254:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3272:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3276:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3272:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3276:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3383:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3389:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:3383:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:3389:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:3401:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c: In function 'allocate_arrays':
| glibc/locale/programs/ld-ctype.c:3887:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:4039:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| glibc/locale/programs/ld-ctype.c:4062:19: error: redefinition of 'cnt'
| glibc/locale/programs/ld-ctype.c:4039:19: note: previous definition of
'cnt' was here
| glibc/locale/programs/ld-ctype.c:4062:7: error: 'for' loop initial
declarations are only allowed in C99 mode
| make: *** [locarchive.o] Error 1

Ross

--047d7b66f74bbf11c3050e1e3f8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 February 2015 at 10:54, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><span class=3D"">On Mon, Feb 2, 2015 at 2:40 AM,=
 Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@inte=
l.com</a>&gt; wrote:<br>
</span><span class=3D"">&gt; cross-localdef-native:<br>
&gt;<br>
&gt; | In file included from glibc/locale/programs/locarchive.c:696:0:<br>
&gt; | glibc/locale/programs/../../intl/l10nflist.c: In function<br>
&gt; &#39;_nl_normalize_codeset&#39;:<br>
&gt; | glibc/locale/programs/../../intl/l10nflist.c:306:12: error: missing =
binary<br>
&gt; operator before token &quot;(&quot;<br>
&gt; | glibc/locale/programs/../../intl/l10nflist.c:313:9: error:<br>
&gt; &#39;_nl_C_locobj_ptr&#39; undeclared (first use in this function)<br>
&gt; | glibc/locale/programs/../../intl/l10nflist.c:313:9: note: each undec=
lared<br>
&gt; identifier is reported only once for each function it appears in<br>
<br>
<br>
</span>gcc would work with latest tree but I did not run into this error. S=
o<br>
wait a while until I get to it.</blockquote></div><br>I can confirm that th=
e current branch builds gcc (and everything else in a minimal image) apart =
from cross-localdef-native, with a long set of errors for me now:</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"g=
mail_extra">| In file included from glibc/locale/programs/locarchive.c:696:=
0:</div><div class=3D"gmail_extra">| glibc/locale/programs/../../intl/l10nf=
list.c: In function &#39;_nl_normalize_codeset&#39;:</div><div class=3D"gma=
il_extra">| glibc/locale/programs/../../intl/l10nflist.c:306:12: error: mis=
sing binary operator before token &quot;(&quot;</div><div class=3D"gmail_ex=
tra">| glibc/locale/programs/../../intl/l10nflist.c:313:9: error: &#39;_nl_=
C_locobj_ptr&#39; undeclared (first use in this function)</div><div class=
=3D"gmail_extra">| glibc/locale/programs/../../intl/l10nflist.c:313:9: note=
: each undeclared identifier is reported only once for each function it app=
ears in</div><div class=3D"gmail_extra">| glibc/locale/programs/locarchive.=
c: In function &#39;add_locales_to_archive&#39;:</div><div class=3D"gmail_e=
xtra">| glibc/locale/programs/locarchive.c:1517:7: warning: passing argumen=
t 1 of &#39;__xpg_basename&#39; discards &#39;const&#39; qualifier from poi=
nter target type [enabled by default]</div><div class=3D"gmail_extra">| In =
file included from /data/poky-master/tmp/work/x86_64-linux/cross-localedef-=
native/2.21-r0/git/localedef/include/string.h:4:0,</div><div class=3D"gmail=
_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fro=
m glibc/locale/programs/locarchive.c:34:</div><div class=3D"gmail_extra">| =
/usr/include/libgen.h:35:14: note: expected &#39;char *&#39; but argument i=
s of type &#39;const char *&#39;</div><div class=3D"gmail_extra">| glibc/lo=
cale/programs/ld-ctype.c: In function &#39;set_class_defaults&#39;:</div><d=
iv class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3012:7: error: =
&#39;for&#39; loop initial declarations are only allowed in C99 mode</div><=
div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3012:7: note: =
use option -std=3Dc99 or -std=3Dgnu99 to compile your code</div><div class=
=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3016:19: error: redefin=
ition of &#39;cnt&#39;</div><div class=3D"gmail_extra">| glibc/locale/progr=
ams/ld-ctype.c:3012:19: note: previous definition of &#39;cnt&#39; was here=
</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3016:7:=
 error: &#39;for&#39; loop initial declarations are only allowed in C99 mod=
e</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3034:5=
: error: &#39;for&#39; loop initial declarations are only allowed in C99 mo=
de</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3038:=
17: error: redefinition of &#39;cnt&#39;</div><div class=3D"gmail_extra">| =
glibc/locale/programs/ld-ctype.c:3034:17: note: previous definition of &#39=
;cnt&#39; was here</div><div class=3D"gmail_extra">| glibc/locale/programs/=
ld-ctype.c:3038:5: error: &#39;for&#39; loop initial declarations are only =
allowed in C99 mode</div><div class=3D"gmail_extra">| glibc/locale/programs=
/ld-ctype.c:3250:7: error: &#39;for&#39; loop initial declarations are only=
 allowed in C99 mode</div><div class=3D"gmail_extra">| glibc/locale/program=
s/ld-ctype.c:3254:19: error: redefinition of &#39;cnt&#39;</div><div class=
=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3250:19: note: previous=
 definition of &#39;cnt&#39; was here</div><div class=3D"gmail_extra">| gli=
bc/locale/programs/ld-ctype.c:3254:7: error: &#39;for&#39; loop initial dec=
larations are only allowed in C99 mode</div><div class=3D"gmail_extra">| gl=
ibc/locale/programs/ld-ctype.c:3272:7: error: &#39;for&#39; loop initial de=
clarations are only allowed in C99 mode</div><div class=3D"gmail_extra">| g=
libc/locale/programs/ld-ctype.c:3276:19: error: redefinition of &#39;cnt&#3=
9;</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3272:=
19: note: previous definition of &#39;cnt&#39; was here</div><div class=3D"=
gmail_extra">| glibc/locale/programs/ld-ctype.c:3276:7: error: &#39;for&#39=
; loop initial declarations are only allowed in C99 mode</div><div class=3D=
"gmail_extra">| glibc/locale/programs/ld-ctype.c:3383:7: error: &#39;for&#3=
9; loop initial declarations are only allowed in C99 mode</div><div class=
=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3389:19: error: redefin=
ition of &#39;cnt&#39;</div><div class=3D"gmail_extra">| glibc/locale/progr=
ams/ld-ctype.c:3383:19: note: previous definition of &#39;cnt&#39; was here=
</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3389:7:=
 error: &#39;for&#39; loop initial declarations are only allowed in C99 mod=
e</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:3401:7=
: error: &#39;for&#39; loop initial declarations are only allowed in C99 mo=
de</div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c: In f=
unction &#39;allocate_arrays&#39;:</div><div class=3D"gmail_extra">| glibc/=
locale/programs/ld-ctype.c:3887:7: error: &#39;for&#39; loop initial declar=
ations are only allowed in C99 mode</div><div class=3D"gmail_extra">| glibc=
/locale/programs/ld-ctype.c:4039:7: error: &#39;for&#39; loop initial decla=
rations are only allowed in C99 mode</div><div class=3D"gmail_extra">| glib=
c/locale/programs/ld-ctype.c:4062:19: error: redefinition of &#39;cnt&#39;<=
/div><div class=3D"gmail_extra">| glibc/locale/programs/ld-ctype.c:4039:19:=
 note: previous definition of &#39;cnt&#39; was here</div><div class=3D"gma=
il_extra">| glibc/locale/programs/ld-ctype.c:4062:7: error: &#39;for&#39; l=
oop initial declarations are only allowed in C99 mode</div><div class=3D"gm=
ail_extra">| make: *** [locarchive.o] Error 1</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--047d7b66f74bbf11c3050e1e3f8d--
