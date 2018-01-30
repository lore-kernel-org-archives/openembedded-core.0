Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFFD60557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:39:58 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id 141so4450788wme.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 15:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ArwYorVKvmnZW0GlzSxZrHQXEpucT/nxWYDpUJG4zaw=;
	b=dtxIDROfpjYFgXwiUm/5YnVEBWdR6wT4/t3YJ39upleC4TjtJJHdO1ARmDQJzrMmoV
	g8yhu3iQ5mVkgiE2o7r67XnoVdP8+LdyhX73y5Uh3tnp15eQJM0JrDsMUl0BOJ8EWyDF
	FptAVUQR70i+FlrMpHP0/xY6Bp4io4KYEAQw1hoeEkRBgWVBCshYI201Ug2ePEQEJj3l
	fu77+ByDcOo8YV28EAFyEQfYXYulz4lGpRoIZklTihfhVtXWj8gQmg0pAICJ3Moh+eH5
	sKZ96R4hjTSrgLyhb9ClDXLM5Tw8zkDf3Bwc+1RTZAJ7Q1kVWDIUzlHIVCt9y0SBQrc3
	vE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ArwYorVKvmnZW0GlzSxZrHQXEpucT/nxWYDpUJG4zaw=;
	b=Vp6Qd9fy9dO04KPI9XPnvb4CnQOz5Z2MgNxzzcXvAhR7mN0/qw+Nve4pPfcHlDJg0Q
	o7KqjPq6UdX0+sDSYXJU49BZJDkuNGcUAAwyMG3bvC/lmQvRY8F9K2t9jqqBvlyVcWX8
	Guurjrt4xX8LXFD1QcEEm1Db5heTMR8zHyqrp6REVZWqw4ZG19U11k6iiL8RmOqqQ22h
	2SgQhNviw/wCIw87s6AwGH6DQvaye9CghwhxsZIh2v4KavsNzCaYUkX/uzN4++jbXQZ5
	zVeQbVbDfdoCsH3eBAIbL6D/jv+b+vZnngIbfKYKj9mmerlpQCn7jg9AyJFxYUQ7h+Fp
	9u8w==
X-Gm-Message-State: AKwxytckkEYT557kjD0jiZiaD0GTuNSbbeT7cEFYdh0iPihlwW8ltOeq
	Qr+zpQ0+IZ+wr5Op4ydv3/n2PTgHJPtbko2yrqI=
X-Google-Smtp-Source: AH8x227M3/YMiipbYWsqbH3rZhLyLwWUKmICL3c8PLFmvMMPQGaGyUh+ZNfUomMtM+/ZUsqzR6o6thX5RSyRyDja70E=
X-Received: by 10.28.131.210 with SMTP id f201mr23423616wmd.117.1517355599366; 
	Tue, 30 Jan 2018 15:39:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 15:39:58 -0800 (PST)
In-Reply-To: <CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
	<CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 00:39:58 +0100
Message-ID: <CA+chaQc+r5U7_W=rhKRzxaG16Lk6SYBBD=UBvdqNvbZ2N74Bjw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>, 
	Stefan Agner <stefan.agner@toradex.com>
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
X-List-Received-Date: Tue, 30 Jan 2018 23:39:58 -0000
Content-Type: multipart/alternative; boundary="001a114437ca7f8e01056406e116"

--001a114437ca7f8e01056406e116
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Stefan

On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Thanks Andreas,
>
> jack is the only one which inherits waf directly not through waf-samba.
>
> More surprisingly it also has ${S}/waf it seems:
> https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c869
> 629299f357/waf
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
>>
>>
>> On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> +Andreas who added waf inherit in jack in:
>>> commit 0f8f1973e229a0799098bc2334416fec8c608b50
>>> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>>> Date:   Sat Oct 8 12:03:32 2016 +0200
>>>
>>>     jack: swap to jack2
>>>
>> As far as I can see is jack2 configured with waf. Don't remember why I
>> chose waf-samba. Because I am on business trip I cannot take care before
>> next week.
>>
>> Andreas
>>
>>>
>>> +Bian who added waf samba in:
>>> commit 962e346df99696a10657a2ea7b2166dfaf290289
>>> Author: Bian Naimeng <biannm@cn.fujitsu.com>
>>> Date:   Tue Jun 16 14:18:25 2015 +0900
>>>
>>>     waf-samba: add new class
>>>
>>>     waf-samba is a build system used by samba related software
>>>
>>> +Joe and Joe and who maintains samba and related recipes +
>>> meta-networking
>>>
>>>
>>> On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>
>>>> Why would they do that?  Shouldn't it be a fatal bug if waf isn't foun=
d?
>>>>
>>>> On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com>
>>>> wrote:
>>>>
>>>>> * there are some recipes like jack and other which inherit waf-samba
>>>>> which inherits waf, but they don't use waf for configure, strange isn=
't
>>>>> it?
>>>>>
>>>>> * fixes:
>>>>> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf
>>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>>> support.
>>>>> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version=
,
>>>>> exit code 127. Assuming waf version without bindir/libdir support.
>>>>> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf
>>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>>> support.
>>>>> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
>>>>> execute waf --version, exit code 1. Assuming waf version without
>>>>> bindir/libdir support.
>>>>> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
>>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>>> support.
>>>>> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf
>>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>>> support.
>>>>>
>>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>>> ---
>>>>>  meta/classes/waf.bbclass | 3 +++
>>>>>  1 file changed, 3 insertions(+)
>>>>>
>>>>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>>>>> index c3e744e5de..eec4d9496d 100644
>>>>> --- a/meta/classes/waf.bbclass
>>>>> +++ b/meta/classes/waf.bbclass
>>>>> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>>>>>      from distutils.version import StrictVersion
>>>>>      srcsubdir =3D d.getVar('S')
>>>>>      wafbin =3D os.path.join(srcsubdir, 'waf')
>>>>> +    if not os.path.isfile(wafbin):
>>>>> +        bb.note("%s doesn't exist, cannot check whether it supports
>>>>> --bindir/--libdir" % wafbin)
>>>>> +        return
>>>>>      status, result =3D oe.utils.getstatusoutput(wafbin + " --version=
")
>>>>>      if status !=3D 0:
>>>>>          bb.warn("Unable to execute waf --version, exit code %d.
>>>>> Assuming waf version without bindir/libdir support." % status)
>>>>> --
>>>>> 2.15.1
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>
>>>>
>>>>
>>>
>

--001a114437ca7f8e01056406e116
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">+Stefan<br></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, Jan 31, 2018 at 12:38 AM, Martin Jansa <span dir=
=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">ma=
rtin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><div dir=3D"ltr">Thanks Andreas,<div><br></div><div>jack is the only one =
which inherits waf directly not through waf-samba.</div><div><br></div><div=
>More surprisingly it also has ${S}/waf it seems:</div><div><a href=3D"http=
s://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c869629299f35=
7/waf" target=3D"_blank">https://github.com/jackaudio/<wbr>jack2/blob/<wbr>=
c1647819eed6d11f94b21981d9c869<wbr>629299f357/waf</a><br></div><div><br></d=
iv><div>So the WARNING: shown for jack probably had different reason than t=
he rest of them and that is:</div><div><br></div><div><div><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);te=
xt-decoration-style:initial;text-decoration-color:initial;float:none;displa=
y:inline">jack/1.9.12-r0 $=C2=A0</span>jack/1.9.12-r0/git/waf --version</di=
v><div>Error: run waf-light from a folder containing waflib<br></div></div>=
<div><br></div><div>it doesn&#39;t like running waf from outside ${S} and=
=C2=A0waf_preconfigure is executed from ${TOPDIR} before do_configure switc=
hes to ${S}</div><div><br></div><div>I don&#39;t know how common this situa=
tion is, if all waf scripts are like that, this one (after &quot;cd ../jack=
/1.9.12-r0/git&quot;) says:</div><div>waf 1.8.17 (<wbr>cd7579a727d1b390bf9c=
bf111c1b20<wbr>e811370bc0)<br></div><div><br></div><div>so I&#39;ll leave t=
hat to original author to figure it out, I don&#39;t use waf anywhere, so I=
 cannot properly test the use case he was trying to fix.</div><div><br></di=
v><div>Regards,</div><div><br></div><div><br></div></div><div class=3D"HOEn=
Zb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Tue, Jan 30, 2018 at 11:41 PM, Andreas M=C3=BCller <span dir=3D"ltr=
">&lt;<a href=3D"mailto:schnitzeltony@gmail.com" target=3D"_blank">schnitze=
ltony@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an><br><br>On Tuesday, January 30, 2018, Martin Jansa &lt;<a href=3D"mailto=
:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">+Andreas who added=
 waf inherit in jack in:<div><div>commit 0f8f1973e229a0799098bc2334416f<wbr=
>ec8c608b50</div><div>Author: Andreas M=C3=BCller &lt;<a href=3D"mailto:sch=
nitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</=
a>&gt;</div><div>Date:=C2=A0 =C2=A0Sat Oct 8 12:03:32 2016 +0200</div><div>=
<br></div><div>=C2=A0 =C2=A0 jack: swap to jack2</div></div></div></blockqu=
ote></span><div>As far as I can see is jack2 configured with waf. Don&#39;t=
 remember why I chose waf-samba. Because I am on business trip I cannot tak=
e care before next week.</div><span class=3D"m_4846283783382334223HOEnZb"><=
font color=3D"#888888"><div><br></div><div>Andreas</div></font></span><div =
class=3D"m_4846283783382334223HOEnZb"><div class=3D"m_4846283783382334223h5=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div><div>+Bian=
 who added waf samba in:</div><div><div>commit 962e346df99696a10657a2ea7b21=
66<wbr>dfaf290289</div><div>Author: Bian Naimeng &lt;<a href=3D"mailto:bian=
nm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&gt;</div><di=
v>Date:=C2=A0 =C2=A0Tue Jun 16 14:18:25 2015 +0900</div><div><br></div><div=
>=C2=A0 =C2=A0 waf-samba: add new class</div><div>=C2=A0 =C2=A0=C2=A0</div>=
<div>=C2=A0 =C2=A0 waf-samba is a build system used by samba related softwa=
re</div></div><div><br></div><div>+Joe and Joe and who maintains samba and =
related recipes + meta-networking</div><div><br></div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018 at 1:03 PM,=
 Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com=
" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><div dir=3D"ltr">Why would they do that?=C2=A0 Shoul=
dn&#39;t it be a fatal bug if waf isn&#39;t found?</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote"><div><div>On 30 January 2018 at 08:3=
0, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.=
com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br></di=
v></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div><div>* there are some recipes l=
ike jack and other which inherit waf-samba<br>
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
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114437ca7f8e01056406e116--
