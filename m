Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 126C760557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:38:22 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id r71so4587122wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 15:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2HeJ+G4AjseUzvDQREwpTteeSzMZH+HDUgnVs7H/aaM=;
	b=oQKDGRFu9Byi2Eu6uHxaVkJjaJYG4AJ4tQMB00KjlXxrKrxGwoupn3DI16fegtlh4V
	nRQ2/Hrig3rDKSpg3pwD8TMk7f7k61iUDCmTXuU8y3/UciENBlh+MUCpIXi4CEdDL9/I
	5ldcwODY0CmZhdtznbP6z4CQUEjSniOm2NnuIAuNgP+6/vayHfbf7Fnwq0cneWnuy1y3
	ED6DHO9nYMeTDOt1YHy17ptmQ35xXFItT++Xbzp+kBmAdEIy26Uw1S6IHEK8Zes9Fxfl
	3Ou562wIcQKsq0ryLl90M9Jm6rOcPT353AJxlmRyIZ4DT8V70l/dSmF3bTNBGO0b62Zj
	/O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2HeJ+G4AjseUzvDQREwpTteeSzMZH+HDUgnVs7H/aaM=;
	b=MajzKMEa5ZKId9A76RMpvAisqD4NLqQepmmQB+9NConYLo9qESonDDn9Vo5RdEIUE2
	3zCBoZ45rLaFgFWx3LEpHp0y9O/AVEWho/ZZSf2ykIu/h3o0L4nP+0bTsFdNMuRK1Mtg
	SC3RFSdSRt6laesrt54sxQrfhU1H1WkQUIku2L6Itxxe6P8g2qO+PJgcFtffCvmf3T60
	aQvhT0LSKcCFljSWVKIVWJTx/emi9JjyglVvF1aLi7PuafOTxQxp1iVXkdh7Kt0FZuDL
	QQk1u1PKCiNgRdLIiGjUVlhDdZDfvhUGZ/YT6w9qxdipZlhBQtPaGbKf6Vi99xv4udoi
	OBMg==
X-Gm-Message-State: AKwxytdo9upEEU5m4fUCOItwIHOacgQt/cYtoPSvU2UQ4hAeDMS2/bUg
	cyJXWV/4L3WGSnQG3QKq4xpWYwdray2k8f5NrQs=
X-Google-Smtp-Source: AH8x224OlQFn9zG7/lpmuHMu4E3IWEtdj8htNBiBJVG5Pkl+LOfI992X4Pj+5SjpuT+TZqEg1jhxfpdu2iv2/w3SPnA=
X-Received: by 10.28.191.131 with SMTP id o3mr17530431wmi.81.1517355503674;
	Tue, 30 Jan 2018 15:38:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 15:38:23 -0800 (PST)
In-Reply-To: <CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
References: <20180130083003.39-1-Martin.Jansa@gmail.com>
	<CAJTo0LYmP0iqbm5X50FPi80=LB+tUD90JVzYPf8uah=c0ysiew@mail.gmail.com>
	<CA+chaQc57j=7JQx3iNHfomkjVXmZX7Lm+yLED+xzMg7uhrVa8w@mail.gmail.com>
	<CALbNGRSkvxi3AWkzZcsipSspQnEjsdZ4VKwbFGRN0o9tY4G2-A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 31 Jan 2018 00:38:23 +0100
Message-ID: <CA+chaQdBgGX-K3fb15L6LR6f=iFZUkvb250xK5+4pjPyrYbf4w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
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
X-List-Received-Date: Tue, 30 Jan 2018 23:38:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c07423ccb6a45056406db89"

--94eb2c07423ccb6a45056406db89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andreas,

jack is the only one which inherits waf directly not through waf-samba.

More surprisingly it also has ${S}/waf it seems:
https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c86962929=
9f357/waf

So the WARNING: shown for jack probably had different reason than the rest
of them and that is:

jack/1.9.12-r0 $ jack/1.9.12-r0/git/waf --version
Error: run waf-light from a folder containing waflib

it doesn't like running waf from outside ${S} and waf_preconfigure is
executed from ${TOPDIR} before do_configure switches to ${S}

I don't know how common this situation is, if all waf scripts are like
that, this one (after "cd ../jack/1.9.12-r0/git") says:
waf 1.8.17 (cd7579a727d1b390bf9cbf111c1b20e811370bc0)

so I'll leave that to original author to figure it out, I don't use waf
anywhere, so I cannot properly test the use case he was trying to fix.

Regards,



On Tue, Jan 30, 2018 at 11:41 PM, Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

>
>
> On Tuesday, January 30, 2018, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>
>> +Andreas who added waf inherit in jack in:
>> commit 0f8f1973e229a0799098bc2334416fec8c608b50
>> Author: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> Date:   Sat Oct 8 12:03:32 2016 +0200
>>
>>     jack: swap to jack2
>>
> As far as I can see is jack2 configured with waf. Don't remember why I
> chose waf-samba. Because I am on business trip I cannot take care before
> next week.
>
> Andreas
>
>>
>> +Bian who added waf samba in:
>> commit 962e346df99696a10657a2ea7b2166dfaf290289
>> Author: Bian Naimeng <biannm@cn.fujitsu.com>
>> Date:   Tue Jun 16 14:18:25 2015 +0900
>>
>>     waf-samba: add new class
>>
>>     waf-samba is a build system used by samba related software
>>
>> +Joe and Joe and who maintains samba and related recipes + meta-networki=
ng
>>
>>
>> On Tue, Jan 30, 2018 at 1:03 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>
>>> Why would they do that?  Shouldn't it be a fatal bug if waf isn't found=
?
>>>
>>> On 30 January 2018 at 08:30, Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> * there are some recipes like jack and other which inherit waf-samba
>>>> which inherits waf, but they don't use waf for configure, strange isn'=
t
>>>> it?
>>>>
>>>> * fixes:
>>>> WARNING: libldb-1.1.29-r0 do_configure: Unable to execute waf
>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>> support.
>>>> WARNING: samba-4.6.7-r0 do_configure: Unable to execute waf --version,
>>>> exit code 127. Assuming waf version without bindir/libdir support.
>>>> WARNING: libtalloc-2.1.9-r0 do_configure: Unable to execute waf
>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>> support.
>>>> WARNING: jack-1.9.10+gitAUTOINC+2d1d323505-r0 do_configure: Unable to
>>>> execute waf --version, exit code 1. Assuming waf version without
>>>> bindir/libdir support.
>>>> WARNING: libtevent-0.9.31-r0 do_configure: Unable to execute waf
>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>> support.
>>>> WARNING: libtdb-1.3.14-r0 do_configure: Unable to execute waf
>>>> --version, exit code 127. Assuming waf version without bindir/libdir
>>>> support.
>>>>
>>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>>> ---
>>>>  meta/classes/waf.bbclass | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>>>> index c3e744e5de..eec4d9496d 100644
>>>> --- a/meta/classes/waf.bbclass
>>>> +++ b/meta/classes/waf.bbclass
>>>> @@ -29,6 +29,9 @@ python waf_preconfigure() {
>>>>      from distutils.version import StrictVersion
>>>>      srcsubdir =3D d.getVar('S')
>>>>      wafbin =3D os.path.join(srcsubdir, 'waf')
>>>> +    if not os.path.isfile(wafbin):
>>>> +        bb.note("%s doesn't exist, cannot check whether it supports
>>>> --bindir/--libdir" % wafbin)
>>>> +        return
>>>>      status, result =3D oe.utils.getstatusoutput(wafbin + " --version"=
)
>>>>      if status !=3D 0:
>>>>          bb.warn("Unable to execute waf --version, exit code %d.
>>>> Assuming waf version without bindir/libdir support." % status)
>>>> --
>>>> 2.15.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>
>>>
>>

--94eb2c07423ccb6a45056406db89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andreas,<div><br></div><div>jack is the only one wh=
ich inherits waf directly not through waf-samba.</div><div><br></div><div>M=
ore surprisingly it also has ${S}/waf it seems:</div><div><a href=3D"https:=
//github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c869629299f357/=
waf">https://github.com/jackaudio/jack2/blob/c1647819eed6d11f94b21981d9c869=
629299f357/waf</a><br></div><div><br></div><div>So the WARNING: shown for j=
ack probably had different reason than the rest of them and that is:</div><=
div><br></div><div><div><span style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial;float:none;display:inline">jack/1.9.12-r0 $=C2=A0</s=
pan>jack/1.9.12-r0/git/waf --version</div><div>Error: run waf-light from a =
folder containing waflib<br></div></div><div><br></div><div>it doesn&#39;t =
like running waf from outside ${S} and=C2=A0waf_preconfigure is executed fr=
om ${TOPDIR} before do_configure switches to ${S}</div><div><br></div><div>=
I don&#39;t know how common this situation is, if all waf scripts are like =
that, this one (after &quot;cd ../jack/1.9.12-r0/git&quot;) says:</div><div=
>waf 1.8.17 (cd7579a727d1b390bf9cbf111c1b20e811370bc0)<br></div><div><br></=
div><div>so I&#39;ll leave that to original author to figure it out, I don&=
#39;t use waf anywhere, so I cannot properly test the use case he was tryin=
g to fix.</div><div><br></div><div>Regards,</div><div><br></div><div><br></=
div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue,=
 Jan 30, 2018 at 11:41 PM, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:schnitzeltony@gmail.com" target=3D"_blank">schnitzeltony@gmail.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"=
"><br><br>On Tuesday, January 30, 2018, Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">+Andreas who added =
waf inherit in jack in:<div><div>commit 0f8f1973e229a0799098bc2334416f<wbr>=
ec8c608b50</div><div>Author: Andreas M=C3=BCller &lt;<a href=3D"mailto:schn=
itzeltony@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a=
>&gt;</div><div>Date:=C2=A0 =C2=A0Sat Oct 8 12:03:32 2016 +0200</div><div><=
br></div><div>=C2=A0 =C2=A0 jack: swap to jack2</div></div></div></blockquo=
te></span><div>As far as I can see is jack2 configured with waf. Don&#39;t =
remember why I chose waf-samba. Because I am on business trip I cannot take=
 care before next week.</div><span class=3D"HOEnZb"><font color=3D"#888888"=
><div><br></div><div>Andreas</div></font></span><div class=3D"HOEnZb"><div =
class=3D"h5"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><br></div=
><div>+Bian who added waf samba in:</div><div><div>commit 962e346df99696a10=
657a2ea7b2166<wbr>dfaf290289</div><div>Author: Bian Naimeng &lt;<a href=3D"=
mailto:biannm@cn.fujitsu.com" target=3D"_blank">biannm@cn.fujitsu.com</a>&g=
t;</div><div>Date:=C2=A0 =C2=A0Tue Jun 16 14:18:25 2015 +0900</div><div><br=
></div><div>=C2=A0 =C2=A0 waf-samba: add new class</div><div>=C2=A0 =C2=A0=
=C2=A0</div><div>=C2=A0 =C2=A0 waf-samba is a build system used by samba re=
lated software</div></div><div><br></div><div>+Joe and Joe and who maintain=
s samba and related recipes + meta-networking</div><div><br></div></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jan 30, 2018=
 at 1:03 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burt=
on@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Why would they do that?=
=C2=A0 Shouldn&#39;t it be a fatal bug if waf isn&#39;t found?</div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div>On 30 January =
2018 at 08:30, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.=
jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wr=
ote:<br></div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><div>* there are so=
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
</blockquote>
</div></div></blockquote></div><br></div>

--94eb2c07423ccb6a45056406db89--
