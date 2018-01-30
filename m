Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f172.google.com (mail-yw0-f172.google.com
	[209.85.161.172])
	by mail.openembedded.org (Postfix) with ESMTP id C5F2F78865
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 22:41:45 +0000 (UTC)
Received: by mail-yw0-f172.google.com with SMTP id v139so6052831ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 14:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AjTdSltD4+Kula/XAuq/xnCRTbc3Va/bTWLzD1E1NXQ=;
	b=ffWqUKkvpZMMP0/LNNGlqo2fvB4Ghgkbw2qotIJgi7O6gnk2thsloi0nbvFTyK/FWi
	PMIy1zzXO0t7MZwz32J4S7Af6kxu0l0nd139EsW/WRiFpqE5sAJWW5tOvd7JJdowrdof
	IiJQti6HJktCQhqNvuNznGHCeboebRgr70bDz9WJEnsLEquuo64WfZKX6/VHZxhEcbe/
	XD6cmtPjCrw7D/3Y7jicUR30R2msWzyjkFDqQyYVfX9P+F4fFfXnNvwYmGLGXe4n/u7c
	GU8ZqWiOgMSWNYIBvDS3WsqwX1gI/psHzJr0a+N3vCMLFYHpeCc20A5kf85nUw6oUJw5
	Y2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AjTdSltD4+Kula/XAuq/xnCRTbc3Va/bTWLzD1E1NXQ=;
	b=B0CT5O5Ti33Ub8ozsMyZLdHUcMnG05bELrBcc4ZR4Nn9w0cMqPRLIGzDG471AhWP6P
	LYgUWstvAeKWQKUdzlEa7aaM3zk+fi59IpoRj4zDno2YYpGum9C1YjPrcekSLLDVdrMz
	+VmuTqVSKyvDVVU6tWU2njpXzXLDzQsqMFY6HkFqer7pXyiiC/OImxm9DZEbUUrVWUkK
	jiIPoPbmdSCz0tfPWLKGV+gJPdbxNoWcxtUdkVqgKIK7lisaLMWHb3JoVkNiyyw6jLXU
	tXy0DJCpI0yNc+6lIoa528A2yCyjacFw8aheiNV2g/j3aEjhE7oZx0HNZeQZVN2fnFxz
	mRpw==
X-Gm-Message-State: AKwxyteaCfzgujfj5KIxVO5O5p2fghCVldPZtae/BgWjtC17V9NPe9Ou
	/7LAi+fTHuhYBF+xkw6emimdc/WcjCk/SQ0t9Wk=
X-Google-Smtp-Source: AH8x2266xH1DsHQv6zU6OEPJsGIKSVcUNkGR7+mb+MdWrygY5qomhljcKN2d10c7z00rVpPtKtX3pjjSm4SsEcvXsMo=
X-Received: by 10.13.255.133 with SMTP id p127mr20155650ywf.360.1517352106821; 
	Tue, 30 Jan 2018 14:41:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.199.133 with HTTP; Tue, 30 Jan 2018 14:41:46 -0800 (PST)
In-Reply-To: <CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 30 Jan 2018 23:41:46 +0100
Message-ID: <CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>
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
X-List-Received-Date: Tue, 30 Jan 2018 22:41:45 -0000
Content-Type: multipart/alternative; boundary="94eb2c08844a538dbe0564061171"

--94eb2c08844a538dbe0564061171
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmail.com> wrote:

> +Andreas who added waf inherit in jack in:
> commit 0f8f1973e229a0799098bc2334416fec8c608b50
> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> Date:   Sat Oct 8 12:03:32 2016 +0200
>
>     jack: swap to jack2
>
As far as I can see is jack2 configured with waf. Don't remember why I
chose waf-samba. Because I am on business trip I cannot take care before
next week.

Andreas

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
>> Why would they do that?  Shouldn't it be a fatal bug if waf isn't found?
>>
>> On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>>
>>> * there are some recipes like jack and other which inherit waf-samba
>>> which inherits waf, but they don't use waf for configure, strange isn't
>>> it?
>>>
>>> * fixes:
>>> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf --version=
,
>>> exit code 127. Assuming waf version without bindir/libdir support.
>>> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version,
>>> exit code 127. Assuming waf version without bindir/libdir support.
>>> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf
>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>> support.
>>> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
>>> execute waf --version, exit code 1. Assuming waf version without
>>> bindir/libdir support.
>>> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>> support.
>>> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf --version=
,
>>> exit code 127. Assuming waf version without bindir/libdir support.
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>  meta/classes/waf.bbclass | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>>> index c3e744e5de..eec4d9496d 100644
>>> --- a/meta/classes/waf.bbclass
>>> +++ b/meta/classes/waf.bbclass
>>> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>>>      from distutils.version import StrictVersion
>>>      srcsubdir =3D d.getVar('S')
>>>      wafbin =3D os.path.join(srcsubdir, 'waf')
>>> +    if not os.path.isfile(wafbin):
>>> +        bb.note("%s doesn't exist, cannot check whether it supports
>>> --bindir/--libdir" % wafbin)
>>> +        return
>>>      status, result =3D oe.utils.getstatusoutput(wafbin + " --version")
>>>      if status !=3D 0:
>>>          bb.warn("Unable to execute waf --version, exit code %d.
>>> Assuming waf version without bindir/libdir support." % status)
>>> --
>>> 2.15.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>
>>
>

--94eb2c08844a538dbe0564061171
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, January 30, 2018, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><div dir=3D"ltr">+Andreas who added waf inherit in jack =
in:<div><div>commit 0f8f1973e229a0799098bc2334416f<wbr>ec8c608b50</div><div=
>Author: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@googlemail=
.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;</div><div>Date=
:=C2=A0 =C2=A0Sat Oct 8 12:03:32 2016 +0200</div><div><br></div><div>=C2=A0=
 =C2=A0 jack: swap to jack2</div></div></div></blockquote><div>As far as I =
can see is jack2 configured with waf. Don&#39;t remember why I chose waf-sa=
mba. Because I am on business trip I cannot take care before next week.</di=
v><div><br></div><div>Andreas</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div><br></div><div>+Bian who added waf samba in:</div><div><div>c=
ommit 962e346df99696a10657a2ea7b2166<wbr>dfaf290289</div><div>Author: Bian =
Naimeng &lt;<a href=3D"mailto:biannm@cn.fujitsu.com" target=3D"_blank">bian=
nm@cn.fujitsu.com</a>&gt;</div><div>Date:=C2=A0 =C2=A0Tue Jun 16 14:18:25 2=
015 +0900</div><div><br></div><div>=C2=A0 =C2=A0 waf-samba: add new class</=
div><div>=C2=A0 =C2=A0=C2=A0</div><div>=C2=A0 =C2=A0 waf-samba is a build s=
ystem used by samba related software</div></div><div><br></div><div>+Joe an=
d Joe and who maintains samba and related recipes + meta-networking</div><d=
iv><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">W=
hy would they do that?=C2=A0 Shouldn&#39;t it be a fatal bug if waf isn&#39=
;t found?</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><d=
iv><div>On 30 January 2018 at 08:30, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br></div></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv><div>* there are some recipes like jack and other which inherit waf-samb=
a<br>
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
</blockquote>

--94eb2c08844a538dbe0564061171--
