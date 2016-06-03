Return-Path: <krussell7711@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id AD1CD77482
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 03:04:49 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id f62so11453895vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Jun 2016 20:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=FcekU8MEXVo1HSbpmk86OKMP4YM21Zp9OPF6QCSTRh4=;
	b=tLQkGkxkLVX7VcXIeoLGj7DTmW2wvR4EXg/mUNJbp+wcepO8LWTwIQIzAHMR1cDAkV
	zTd4K2fSoR0PsFLhsRYdX3Zj2H1k6+ZpXdYTDWN41QZGfIz8CwsNYwtzz7nrdRzU+4R3
	vcyzIcIRrQ1/K/4/6P+puwni4cnpTH0jXeu3vQ/pw0JxQ0t0db1EZbs4oO2Z67Th0fmV
	pxoVtKZNwdf/8KrBnNHGe5/DPT0A+ivUYFT+Cj8I9ol+zaNvTclLTCJrfXb5NgtA4NL2
	5mKncABZRrEZFoH1eo1RV4bsl3dIctMKOsBIc2kkRz+lUmaSGHB/pYkoWuYlhu4SUNMs
	zTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=FcekU8MEXVo1HSbpmk86OKMP4YM21Zp9OPF6QCSTRh4=;
	b=YkFAiKn7VAE0ZFWIEhPxJYRbM2hc3QVR02p86nCxzMf59lgxyaY2QVzH4lTIkfwmfN
	RzbDfj+dwjzIYOOxAeoQileNcF1UhopJ6G0JFFTXCrYIkqsbMQRLMpODRI6dUJWPXJtN
	xxXHQNj/RcS/oUH1DBZBK6w3T8MD5nSgDzR/4eCAvCrSBELGkUktNo6GAzD/Y2IzB8L3
	eAG+p0B8h1ojn2bRSTRASUg7CBTe6m5ACGM5mH5alt/bm/GVdlpGEm4MmmsLP4C5eRYQ
	EvEqTZBKZ6xV+drmDA2ONMHh5GCzk1u8q3+7wErWRTZ4KZDPIzULjAzAQoo3WWAbpXX2
	KH6A==
X-Gm-Message-State: ALyK8tI8o8BWJjDwzphat78zp7ofJ14ZQ2weu70KSccLiJtkeZuiGjx3NjjRhcbT5IvFujLQGv2IBLETKlivLg==
X-Received: by 10.176.64.198 with SMTP id i64mr642060uad.121.1464923089395;
	Thu, 02 Jun 2016 20:04:49 -0700 (PDT)
MIME-Version: 1.0
Sender: krussell7711@gmail.com
Received: by 10.31.219.68 with HTTP; Thu, 2 Jun 2016 20:04:30 -0700 (PDT)
In-Reply-To: <6f7ebb4b-d925-388e-40d2-2bbf71428fdd@windriver.com>
References: <1435902151-4217-1-git-send-email-rongqing.li@windriver.com>
	<CAFrQVPPFygTrvh12uxDqUmcc+Brz=chU3geE6KfyLr+-C4QLYQ@mail.gmail.com>
	<6f7ebb4b-d925-388e-40d2-2bbf71428fdd@windriver.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Thu, 2 Jun 2016 23:04:30 -0400
X-Google-Sender-Auth: OskX4JDRtSN5mGhrkpAdbRseGOE
Message-ID: <CAFrQVPNvQ92wk2aiktNwWBxraEicb1CpHGUovCC=vQ7DKb-GKA@mail.gmail.com>
To: Yuanjie Huang <yuanjie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mklibs-native: two fixes
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
X-List-Received-Date: Fri, 03 Jun 2016 03:04:49 -0000
Content-Type: multipart/alternative; boundary=94eb2c047c585de7cd053456fc77

--94eb2c047c585de7cd053456fc77
Content-Type: text/plain; charset=UTF-8

Thanks, Yuanjie.  I see how your patch changes multiarch() to return
quickly and thus avoid dpkg if the user provides a sysroot or libdir, but
it also comments out some checking to verify that the dynamic linker is in
the correct location and executable.  (I'm referring to the following hunk
from your patch.)  It looks like your changes disable this verification by
commenting some of it out.

+@@ -661,16 +669,16 @@ ld_path_name = os.path.dirname(ldlib)
+ ld_full_path = "../" + ldlib
+ ld_file = find_lib(ld_file_name)
+
+-if ld_path_name != "/lib":
+-    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
+-        os.remove(dest_path + "/" + ld_file_name)
++#if ld_path_name != "/lib":
++#    if os.access(dest_path + "/" + ld_file_name, os.F_OK):
++#        os.remove(dest_path + "/" + ld_file_name)
+
+-if not os.path.exists(dest_path + "/../" + ld_path_name):
+-    os.mkdir(dest_path + "/../" + ld_path_name)
++#if not os.path.exists(dest_path + "/../" + ld_path_name):
++#    os.mkdir(dest_path + "/../" + ld_path_name)
+
+-if not os.access(dest_path + "/" + ld_full_path, os.F_OK):
+-    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
ld_full_path)
++if not os.access(dest_path + "/" + ld_file_name, os.F_OK):
++    debug(DEBUG_NORMAL, "I: stripping and copying dynamic linker to " +
ld_file_name)
+     command(target + "objcopy", "--strip-unneeded -R .note -R .comment",
+-            ld_file, dest_path + "/" + ld_full_path)
++            ld_file, dest_path + "/" + ld_file_name)
+
+-os.chmod(dest_path + "/" + ld_full_path, 0755)
++os.chmod(dest_path + "/" + ld_file_name, 0755)

Looking at the change you submitted upstream (
https://lists.debian.org/debian-boot/2015/07/msg00018.html), it looks like
there was an additional hunk that got missed in the poky commit.  Is the
above hunk dependent on the missing one below?

@@ -441,6 +447,8 @@ if not ldlib:
 if not ldlib:
     sys.exit("E: Dynamic linker not found, aborting.")

+ldlib = sysroot + ldlib
+
 debug(DEBUG_NORMAL, "I: Using", ldlib, "as dynamic linker.")

 # Check for rpaths

Reverting the last hunk in your poky commit fixes the mklibs error we
encounter in our multilib setup containing /lib and /lib64 symlinks to the
linker.

On Sun, May 15, 2016 at 11:02 PM, Yuanjie Huang <yuanjie.huang@windriver.com
> wrote:

> Hi Kyle,
>
> The fix_cross_compile.patch is related when we pass the sysroot or libdir
> to mklibs, in such case it is wrong to call dpkg-architecture as info on
> build machine instead of target will be returned.
>
> Thanks,
> Yuanjie
>
>
> On 05/12/2016 04:00 AM, Kyle Russell wrote:
>
>> ++    if sysroot != "" or libdir != "":
>> ++        return paths
>> +     devnull = open('/dev/null', 'w')
>> +     dpkg_architecture = subprocess.Popen(
>> +         ['dpkg-architecture', '-qDEB_HOST_MULTIARCH'],
>>
>
>

--94eb2c047c585de7cd053456fc77
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, Yuanjie.=C2=A0 I see how your patch changes multia=
rch() to return quickly and thus avoid dpkg if the user provides a sysroot =
or libdir, but it also comments out some checking to verify that the dynami=
c linker is in the correct location and executable. =C2=A0(I&#39;m referrin=
g to the following hunk from your patch.) =C2=A0It looks like your changes =
disable this verification by commenting some of it out.<div><br></div><div>=
<span style=3D"font-size:12.8px">+@@ -661,16 +669,16 @@ ld_path_name =3D os=
.path.dirname(ldlib)</span><br style=3D"font-size:12.8px"><span style=3D"fo=
nt-size:12.8px">+ ld_full_path =3D &quot;../&quot; + ldlib</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+ ld_file =3D find_l=
ib(ld_file_name)</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">+</span><br style=3D"font-size:12.8px"><span style=3D"font-size=
:12.8px">+-if ld_path_name !=3D &quot;/lib&quot;:</span><br style=3D"font-s=
ize:12.8px"><span style=3D"font-size:12.8px">+-=C2=A0 =C2=A0 if os.access(d=
est_path + &quot;/&quot; + ld_file_name, os.F_OK):</span><br style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">+-=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 os.remove(dest_path + &quot;/&quot; + ld_file_name)</span><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">++#if ld_path_name !=3D &qu=
ot;/lib&quot;:</span><br style=3D"font-size:12.8px"><span style=3D"font-siz=
e:12.8px">++#=C2=A0 =C2=A0 if os.access(dest_path + &quot;/&quot; + ld_file=
_name, os.F_OK):</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">++#=C2=A0 =C2=A0 =C2=A0 =C2=A0 os.remove(dest_path + &quot;/&qu=
ot; + ld_file_name)</span><br style=3D"font-size:12.8px"><span style=3D"fon=
t-size:12.8px">+</span><br style=3D"font-size:12.8px"><span style=3D"font-s=
ize:12.8px">+-if not os.path.exists(dest_path + &quot;/../&quot; + ld_path_=
name):</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px=
">+-=C2=A0 =C2=A0 os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)</sp=
an><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">++#if no=
t os.path.exists(dest_path + &quot;/../&quot; + ld_path_name):</span><br st=
yle=3D"font-size:12.8px"><span style=3D"font-size:12.8px">++#=C2=A0 =C2=A0 =
os.mkdir(dest_path + &quot;/../&quot; + ld_path_name)</span><br style=3D"fo=
nt-size:12.8px"><span style=3D"font-size:12.8px">+</span><br style=3D"font-=
size:12.8px"><span style=3D"font-size:12.8px">+-if not os.access(dest_path =
+ &quot;/&quot; + ld_full_path, os.F_OK):</span><br style=3D"font-size:12.8=
px"><span style=3D"font-size:12.8px">+-=C2=A0 =C2=A0 debug(DEBUG_NORMAL, &q=
uot;I: stripping and copying dynamic linker to &quot; + ld_full_path)</span=
><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">++if not o=
s.access(dest_path + &quot;/&quot; + ld_file_name, os.F_OK):</span><br styl=
e=3D"font-size:12.8px"><span style=3D"font-size:12.8px">++=C2=A0 =C2=A0 deb=
ug(DEBUG_NORMAL, &quot;I: stripping and copying dynamic linker to &quot; + =
ld_file_name)</span><br style=3D"font-size:12.8px"><span style=3D"font-size=
:12.8px">+=C2=A0 =C2=A0 =C2=A0command(target + &quot;objcopy&quot;, &quot;-=
-strip-unneeded -R .note -R .comment&quot;,</span><br style=3D"font-size:12=
.8px"><span style=3D"font-size:12.8px">+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ld_file, dest_path + &quot;/&quot; + ld_full_path)</span><br style=
=3D"font-size:12.8px"><span style=3D"font-size:12.8px">++=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ld_file, dest_path + &quot;/&quot; + ld_file_name)=
</span><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+</s=
pan><br style=3D"font-size:12.8px"><span style=3D"font-size:12.8px">+-os.ch=
mod(dest_path + &quot;/&quot; + ld_full_path, 0755)</span><br style=3D"font=
-size:12.8px"><span style=3D"font-size:12.8px">++os.chmod(dest_path + &quot=
;/&quot; + ld_file_name, 0755)</span><br></div><div><span style=3D"font-siz=
e:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">Looking at=
 the change you submitted upstream (<a href=3D"https://lists.debian.org/deb=
ian-boot/2015/07/msg00018.html">https://lists.debian.org/debian-boot/2015/0=
7/msg00018.html</a>), it looks like there was an additional hunk that got m=
issed in the poky commit.=C2=A0 Is the above hunk dependent on the missing =
one below?</span></div><div><pre style=3D"color:rgb(0,0,0)"><font face=3D"a=
rial, helvetica, sans-serif">@@ -441,6 +447,8 @@ if not ldlib:
 if not ldlib:
     sys.exit(&quot;E: Dynamic linker not found, aborting.&quot;)
=20
+ldlib =3D sysroot + ldlib
+
 debug(DEBUG_NORMAL, &quot;I: Using&quot;, ldlib, &quot;as dynamic linker.&=
quot;)
=20
 # Check for rpaths</font></pre>Reverting the last hunk in your poky commit=
 fixes the mklibs error we encounter in our multilib setup containing /lib =
and /lib64 symlinks to the linker.</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sun, May 15, 2016 at 11:02 PM, Yuanjie Huan=
g <span dir=3D"ltr">&lt;<a href=3D"mailto:yuanjie.huang@windriver.com" targ=
et=3D"_blank">yuanjie.huang@windriver.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">Hi Kyle,<br>
<br>
The fix_cross_compile.patch is related when we pass the sysroot or libdir t=
o mklibs, in such case it is wrong to call dpkg-architecture as info on bui=
ld machine instead of target will be returned.<br>
<br>
Thanks,<br>
Yuanjie<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On 05/12/2016 04:00 AM, Kyle Russell wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
++=C2=A0 =C2=A0 if sysroot !=3D &quot;&quot; or libdir !=3D &quot;&quot;:<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return paths<br>
+=C2=A0 =C2=A0 =C2=A0devnull =3D open(&#39;/dev/null&#39;, &#39;w&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0dpkg_architecture =3D subprocess.Popen(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;dpkg-architecture&#39;, &#39;-qDEB=
_HOST_MULTIARCH&#39;],<br>
</blockquote>
<br>
</div></div></blockquote></div><br></div>

--94eb2c047c585de7cd053456fc77--
