Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 025CE602D9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 17:07:29 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f3so447586wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 09:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Gqa3HCx9t7KXR6i2JToWHpOT0X5kNnc6JTgumfyGi8=;
	b=oceeB5oZ5cFsk/F0pbpSaU4Zv/GZRqeWAlrYOsvKIYqv3LSD3A/UEcV9Ecgsz7k8Ae
	CFCczw6xSa5MdI5EzcVRGKAPo5DBC7gt2FpqVxCW6nNDNPnd4rdc7RF6Tv0sIOm6HSAg
	HTsM0Fu04Q8nIZd7yvZrPkc4iilqRL7Na+lgTpw3EXsAZxPHIYGreDzcCEioVXo72apt
	DzEY6Np0opHxVsbbvDynwjbLv//+FHCxPxY0zMgvLwc6ecpuTP+6mAKYz4Fqseh++d30
	Ky+ku8TjuueIqREVncBB/m/0gql4TuhXSWY17yb4Fc9w1xeiv2IOGOOMhcwOxDHYWhUk
	WLaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Gqa3HCx9t7KXR6i2JToWHpOT0X5kNnc6JTgumfyGi8=;
	b=QPIa90TUt2hMkFTVPczvGbJOWnhI4smzP0P1p+k4QMnFsyPduPrIMT2yoJKbOgtmxv
	zSaPSne9vzGiunS2B9MY27mpw6Wgta5FMpQShjtqRr0kKduY6aCV3sY48DXvDR7iN8LW
	S1TikYsrT54kr3w2zYQDowl/92JXI6+0aZWVQl+kvNMbwPWMwmfogNXcmhFxbi2A3l33
	dFYbqQ/lPXtBRLdPUkNCuvnXIhlmNII+5Sr2uH9F3WSjCtyPfpXCd57qUJUrvMjEWtR1
	pJ639DmuXVr90QKZpnY8ec66PiM6pDT5dU7I0/ytuQ1D1y9B+zvlg3+yHVGm49GzDt1R
	bdsA==
X-Gm-Message-State: AKwxyte5YIX6+kj6oC9pa3hAk/0eiycnbUwuAA89cKtUOeYfAlt6eCcm
	PDPRqDMmnW5/4EPTcmNZyjfc3QdoAfwlDgKnSrE=
X-Google-Smtp-Source: AH8x225DDwOUicz70KnbDnVeyXsyKKDw6mcCz9UVlrf9nAmex7X2W0t3ny23pLb3umZgZp8Pt6DS9BjQnkmJYK14s+U=
X-Received: by 10.28.192.24 with SMTP id q24mr25722297wmf.96.1517418450637;
	Wed, 31 Jan 2018 09:07:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Wed, 31 Jan 2018 09:07:30 -0800 (PST)
In-Reply-To: <1517418291.31752.85.camel@gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
	<CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
	<1517418291.31752.85.camel@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 18:07:30 +0100
Message-ID: <CA+chaQcD1Xt04c4A=1J3eNS-vd_1Bw04A0aV=oQ211ONo1ZAuQ@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	Joe Slater <jslater@windriver.com>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: check that waf exists before trying to execute it
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
X-List-Received-Date: Wed, 31 Jan 2018 17:07:30 -0000
Content-Type: multipart/alternative; boundary="089e08314784b9d975056415834d"

--089e08314784b9d975056415834d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What about the recipes which don't have ${S}/waf at all (and might inherit
waf from possibly wrong reasons), like all those waf-samba recipes
mentioned before?

On Wed, Jan 31, 2018 at 6:04 PM, Joshua Watt <jpewhacker@gmail.com> wrote:

> Sorry, I wasn't sure if I should make my patch in-reply-to this thread...=
.
>
> I think I fixed this correctly in http://lists.openembedded.org/
> pipermail/openembedded-core/2018-January/147041.html
>
> Thanks,
> Joshua Watt
>
> On Wed, 2018-01-31 at 00:39 +0100, Martin Jansa wrote:
>
> +Stefan
>
> On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
> Thanks Andreas,
>
> jack is the only one which inherits waf directly not through waf-samba.
>
> More surprisingly it also has ${S}/waf it seems:
> https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b2
> 1981d9c869629299f357/waf
>
> So the WARNING: shown for jack probably had different reason than the res=
t
> of them and that is:
>
> jack/1.9.12-r0 $ jack/1.9.12-r0/git/waf --version
> Error: run waf-light from a folder containing waflib
>
> it doesn't like running waf from outside ${S} and waf_preconfigure is
> executed from ${TOPDIR} before do_configure switches to ${S}
>
> I don't know how common this situation is, if all waf scripts are like
> that, this one (after "cd ../jack/1.9.12-r0/git") says:
> waf 1.8.17 (cd7579a727d1b390bf9cbf111c1b20e811370bc0)
>
> so I'll leave that to original author to figure it out, I don't use waf
> anywhere, so I cannot properly test the use case he was trying to fix.
>
> Regards,
>
>
>
> On Tue, Jan 30, 2018 at 11:41 PM, Andreas M=C3=BCller <schnitzeltony@gmai=
l.com>
> wrote:
>
>
>
> On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
> +Andreas who added waf inherit in jack in:
> commit 0f8f1973e229a0799098bc2334416fec8c608b50
> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Date:   Sat Oct 8 12:03:32 2016 +0200
>
>     jack: swap to jack2
>
> As far as I can see is jack2 configured with waf. Don't remember why I
> chose waf-samba. Because I am on business trip I cannot take care before
> next week.
>
> Andreas
>
>
> +Bian who added waf samba in:
> commit 962e346df99696a10657a2ea7b2166dfaf290289
> Author: Bian Naimeng <biannm@cn.fujitsu.com>
> Date:   Tue Jun 16 14:18:25 2015 +0900
>
>     waf-samba: add new class
>
>     waf-samba is a build system used by samba related software
>
> +Joe and Joe and who maintains samba and related recipes + meta-networkin=
g
>
>
> On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
>
> Why would they do that?  Shouldn't it be a fatal bug if waf isn't found?
>
> On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> * there are some recipes like jack and other which inherit waf-samba
> which inherits waf, but they don't use waf for configure, strange isn't
> it?
>
> * fixes:
> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version=
,
> exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
> execute waf --version, exit code 1. Assuming waf version without
> bindir/libdir support.
> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
> --version, exit code 127. Assuming waf version without bindir/libdir
> support.
> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version,
> exit code 127. Assuming waf version without bindir/libdir support.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/waf.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> index c3e744e5de..eec4d9496d 100644
> --- a/meta/classes/waf.bbclass
> +++ b/meta/classes/waf.bbclass
> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>      from distutils.version import StrictVersion
>      srcsubdir =3D d.getVar('S')
>      wafbin =3D os.path.join(srcsubdir, 'waf')
> +    if not os.path.isfile(wafbin):
> +        bb.note("%s doesn't exist, cannot check whether it supports
> --bindir/--libdir" % wafbin)
> +        return
>      status, result =3D oe.utils.getstatusoutput(wafbin + " --version")
>      if status !=3D 0:
>          bb.warn("Unable to execute waf --version, exit code %d. Assuming
> waf version without bindir/libdir support." % status)
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>
>
>

--089e08314784b9d975056415834d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What about the recipes which don&#39;t have ${S}/waf at al=
l (and might inherit waf from possibly wrong reasons), like all those waf-s=
amba recipes mentioned before?</div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Wed, Jan 31, 2018 at 6:04 PM, Joshua Watt <span dir=
=3D"ltr">&lt;<a href=3D"mailto:jpewhacker@gmail.com" target=3D"_blank">jpew=
hacker@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div>Sorry, I wasn&#39;t sure if I should make my patch in-reply-to this=
 thread....</div><div><br></div><div>I think I fixed this correctly in <a h=
ref=3D"http://lists.openembedded.org/pipermail/openembedded-core/2018-Janua=
ry/147041.html" target=3D"_blank">http://lists.openembedded.org/<wbr>piperm=
ail/openembedded-core/<wbr>2018-January/147041.html</a></div><div><br></div=
><div>Thanks,</div><div>Joshua Watt</div><div><div class=3D"h5"><div><br></=
div><div>On Wed, 2018-01-31 at 00:39 +0100, Martin Jansa wrote:</div><block=
quote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf soli=
d;padding-left:1ex"><div dir=3D"ltr">+Stefan<br></div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Wed, Jan 31, 2018 at 12:38 AM, Mart=
in Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" ta=
rget=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote=
 type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf solid;pad=
ding-left:1ex"><div dir=3D"ltr">Thanks Andreas,<div><br></div><div>jack is =
the only one which inherits waf directly not through waf-samba.</div><div><=
br></div><div>More surprisingly it also has ${S}/waf it seems:</div><div><a=
 href=3D"https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9=
c869629299f357/waf" target=3D"_blank">https://github.com/jackaudio/j<wbr>ac=
k2/blob/c1647819eed6d11f94b2<wbr>1981d9c869629299f357/waf</a><br></div><div=
><br></div><div>So the WARNING: shown for jack probably had different reaso=
n than the rest of them and that is:</div><div><br></div><div><div><span st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">jack/1.9.12-r0 $=C2=A0</span>jack/1.9.12-r0/git/waf --ver=
sion</div><div>Error: run waf-light from a folder containing waflib<br></di=
v></div><div><br></div><div>it doesn&#39;t like running waf from outside ${=
S} and=C2=A0waf_preconfigure is executed from ${TOPDIR} before do_configure=
 switches to ${S}</div><div><br></div><div>I don&#39;t know how common this=
 situation is, if all waf scripts are like that, this one (after &quot;cd .=
./jack/1.9.12-r0/git&quot;) says:</div><div>waf 1.8.17 (cd7579a727d1b390bf9=
cbf111c1b2<wbr>0e811370bc0)<br></div><div><br></div><div>so I&#39;ll leave =
that to original author to figure it out, I don&#39;t use waf anywhere, so =
I cannot properly test the use case he was trying to fix.</div><div><br></d=
iv><div>Regards,</div><div><br></div><div><br></div></div><div class=3D"m_-=
6881681134499472655HOEnZb"><div class=3D"m_-6881681134499472655h5"><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 1=
1:41 PM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a href=3D"mailto:schnit=
zeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-left=
:2px #729fcf solid;padding-left:1ex"><span><br><br>On Tuesday, January 30, =
2018, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"=
_blank">martin.jansa@gmail.com</a>&gt; wrote:<br><blockquote type=3D"cite" =
style=3D"margin:0 0 0 .8ex;border-left:2px #729fcf solid;padding-left:1ex">=
<div dir=3D"ltr">+Andreas who added waf inherit in jack in:<div><div>commit=
 0f8f1973e229a0799098bc2334416f<wbr>ec8c608b50</div><div>Author: Andreas M=
=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@googlemail.com" target=3D"_b=
lank">schnitzeltony@googlemail.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Sat =
Oct 8 12:03:32 2016 +0200</div><div><br></div><div>=C2=A0 =C2=A0 jack: swap=
 to jack2</div></div></div></blockquote></span><div>As far as I can see is =
jack2 configured with waf. Don&#39;t remember why I chose waf-samba. Becaus=
e I am on business trip I cannot take care before next week.</div><span cla=
ss=3D"m_-6881681134499472655m_4846283783382334223HOEnZb"><font color=3D"#88=
8888"><div><br></div><div>Andreas</div></font></span><div class=3D"m_-68816=
81134499472655m_4846283783382334223HOEnZb"><div class=3D"m_-688168113449947=
2655m_4846283783382334223h5"><blockquote type=3D"cite" style=3D"margin:0 0 =
0 .8ex;border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr"><di=
v><br></div><div>+Bian who added waf samba in:</div><div><div>commit 962e34=
6df99696a10657a2ea7b2166<wbr>dfaf290289</div><div>Author: Bian Naimeng &lt;=
<a href=3D"mailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujits=
u.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Tue Jun 16 14:18:25 2015 +0900</d=
iv><div><br></div><div>=C2=A0 =C2=A0 waf-samba: add new class</div><div>=C2=
=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 waf-samba is a build system used b=
y samba related software</div></div><div><br></div><div>+Joe and Joe and wh=
o maintains samba and related recipes + meta-networking</div><div><br></div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Ja=
n 30, 2018 at 1:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto=
:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</sp=
an> wrote:<br><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;border-l=
eft:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">Why would they do =
that?=C2=A0 Shouldn&#39;t it be a fatal bug if waf isn&#39;t found?</div><d=
iv class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div>On 30 Jan=
uary 2018 at 08:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br></div></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex;border-left:2px #729fcf solid;padding-left:1ex"><div><div>* there are so=
me recipes like jack and other which inherit waf-samba<br>
which inherits waf, but they don&#39;t use waf for configure, strange isn&#=
39;t<br>
it?<br>
<br>
* fixes:<br>
WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version, exit=
 code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf --version, =
exit code 127. Assuming waf version without bindir/libdir<br>
support.<br>
WARNING: jack-1.9.10+gitAUTOINC+2d1d323<wbr>505-r0 do_configure: Unable to =
execute waf --version, exit code 1. Assuming waf version without bindir/lib=
dir support.<br>
WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf --version,=
 exit code 127. Assuming waf version without bindir/libdir support.<br>
WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version, ex=
it code 127. Assuming waf version without bindir/libdir support.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 3 +++<br>
=C2=A01 file changed, 3 insertions(+)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index c3e744e5de..eec4d9496d 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -29,6 +29,9 @@ python waf_preconfigure() {<br>
=C2=A0 =C2=A0 =C2=A0from distutils.version import StrictVersion<br>
=C2=A0 =C2=A0 =C2=A0srcsubdir =3D d.getVar(&#39;S&#39;)<br>
=C2=A0 =C2=A0 =C2=A0wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
+=C2=A0 =C2=A0 if not os.path.isfile(wafbin):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.note(&quot;%s doesn&#39;t exist, cannot che=
ck whether it supports --bindir/--libdir&quot; % wafbin)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
=C2=A0 =C2=A0 =C2=A0status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n=
 + &quot; --version&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.warn(&quot;Unable to execute waf --ver=
sion, exit code %d. Assuming waf version without bindir/libdir support.&quo=
t; % status)<br>
</div></div><span><font color=3D"#888888"><span><font color=3D"#888888">--<=
br>
2.15.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>
<br></blockquote>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>
</blockquote></div></div></div></blockquote></div><br></div>

--089e08314784b9d975056415834d--
