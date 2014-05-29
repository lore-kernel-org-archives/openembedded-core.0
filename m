Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id D42A36FD3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 18:47:51 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id z60so2235425qgd.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 11:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ww0LxxX6E6XeTXtDgJ10NL63U7fmD23vBtJaX/SLbsg=;
	b=UySxrKHEKt/wISDiipxk3lMTzUsMxKNhshbPTY+ylr9jjQSL/QKwBs10o5SAIEMXlw
	+Au8WYKp4JIRnsAZl4SM3a0AeXVDgHACh9GQ+eK6jBBbES7gqoNiLmFxQ3zL3LB2PaZc
	1ajPWJl5y0jNDYgfGUrC14+qWGhSuQatdlZSGHtQQfl9sIKJShLhb3eJHyZlcXaPTRmw
	3L5v8yXu1DwHwgbfBxsoHORXmit+HSXvYY13EMbAjiqsz8Jh0Y57c4HlrV+5i/qSXwmW
	Ru3CFDGOMtz5S7b5n/l1EqFxDHNt08qVHRbDB7Fk6bxcTQJUqxxLbPFlkS09Y4zOhg7i
	DC4w==
X-Received: by 10.140.44.72 with SMTP id f66mr12413470qga.78.1401389272049;
	Thu, 29 May 2014 11:47:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 29 May 2014 11:47:31 -0700 (PDT)
In-Reply-To: <53877D8B.8030603@linux.intel.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
	<5387654C.5090309@linux.intel.com>
	<CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
	<CAMKF1sqy9DQ+zwMA_HHijYXF9Ltk-Nm6U4i0C6yDuxndfWx34w@mail.gmail.com>
	<CAMCfZKHFGk2myN0R9LXNY1ZoWFd+WQLx5r98BpnC7-0R3XrASg@mail.gmail.com>
	<538775A4.9060908@linux.intel.com>
	<CAMCfZKHPn4CVHF3cM5ONH9FBz6nrUtHNsiannyXm9OoaEuVHDQ@mail.gmail.com>
	<53877D8B.8030603@linux.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 29 May 2014 15:47:31 -0300
Message-ID: <CAMCfZKE_wOdkDUZTtknPhkjFqp-pODwx-BXdzKJp4bokAZUjkA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 18:47:56 -0000
Content-Type: multipart/alternative; boundary=001a1139a7e4c0d1df04fa8e5dae

--001a1139a7e4c0d1df04fa8e5dae
Content-Type: text/plain; charset=ISO-8859-1

Sau!,
On Thu, May 29, 2014 at 3:33 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/29/2014 11:22 AM, Diego Sueiro wrote:
>
>> Sau!,
>>
>> On Thu, May 29, 2014 at 3:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>  On 05/29/2014 10:50 AM, Diego Sueiro wrote:
>>>
>>>  Khem,
>>>>
>>>> On Thu, May 29, 2014 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>   On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro <
>>>> diego.sueiro@gmail.com>
>>>>
>>>>> wrote:
>>>>>
>>>>>  For now these are the recipes:
>>>>>>
>>>>>> shared-mime-info_1.2.bb
>>>>>> gconf_3.2.6.bb
>>>>>> libsoup-2.4_2.45.3.bb
>>>>>> gconf_3.2.6.bb
>>>>>> avahi_0.6.31.bb
>>>>>> xkeyboard-config_2.11.bb
>>>>>> libfm_1.1.2.2.bb
>>>>>> glib-networking_2.38.0.bb
>>>>>> connman-gnome_0.7.bb
>>>>>>
>>>>>>
>>>>>> Find attached the config.log for shared-mime-info-native.
>>>>>>
>>>>>> I had recently update my Ubuntu from 12.10 to 14.04. Do you think it
>>>>>> can
>>>>>> cause this error?
>>>>>>
>>>>>>
>>>>>>  Do you have intltool-update binary on your host ? outside sys root ?
>>>>>
>>>>> and if yes then whats the version of it.
>>>>>
>>>>>
>>>>
>>>> $ intltool-update --version
>>>> intltool-update (intltool) 0.50.2
>>>> Written by Kenneth Christiansen, Maciej Stachowiak, and Darin Adler.
>>>>
>>>> Copyright (C) 2000-2003 Free Software Foundation, Inc.
>>>> This is free software; see the source for copying conditions.  There is
>>>> NO
>>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>>> PURPOSE.
>>>>
>>>>
>>>>   Looking at the log file, seems to have some output about the
>>>> nativeperl,
>>>>
>>> I missed the output of this initially:
>>>
>>> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>>>
>>> seems you have some additional output that is confusing things
>>>
>>> If you run bitbake shared-mime-info -c devshell and then within the
>>> devshell run intltool-update --version, what happens?  It seems that the
>>> nativeperl is getting getting printed out.
>>>
>>> any chance you are available on IRC freenode #yocto, I am sgw_ there,
>>> maybe we can work this realtime
>>>
>>> Sau!
>>>
>>>
>> I've cleaned perl-native and everything seems to be working now.
>>
>>  Interesting, I wonder what caused that in the first place.
>
> Did that resolve the other bugs that you filed also?  I am also trying to
> work on those python issues.
>
> Sau!


That bugs were from different build/projects.
I'll try to to the same clean steps and see if it solve the issues.


Reagrds,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a1139a7e4c0d1df04fa8e5dae
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Sau!,<br><div class=3D"gmail_qu=
ote">On Thu, May 29, 2014 at 3:33 PM, Saul Wold <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>=
&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"">On=
 05/29/2014 11:22 AM, Diego Sueiro wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Sau!,<br>
<br>
On Thu, May 29, 2014 at 3:00 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.=
intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On 05/29/2014 10:50 AM, Diego Sueiro wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Khem,<br>
<br>
On Thu, May 29, 2014 at 2:48 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
<br>
=A0 On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro &lt;<a href=3D"mailto:di=
ego.sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com</a>&gt;<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
For now these are the recipes:<br>
<br>
<a href=3D"http://shared-mime-info_1.2.bb" target=3D"_blank">shared-mime-in=
fo_1.2.bb</a><br>
<a href=3D"http://gconf_3.2.6.bb" target=3D"_blank">gconf_3.2.6.bb</a><br>
<a href=3D"http://libsoup-2.4_2.45.3.bb" target=3D"_blank">libsoup-2.4_2.45=
.3.bb</a><br>
<a href=3D"http://gconf_3.2.6.bb" target=3D"_blank">gconf_3.2.6.bb</a><br>
<a href=3D"http://avahi_0.6.31.bb" target=3D"_blank">avahi_0.6.31.bb</a><br=
>
<a href=3D"http://xkeyboard-config_2.11.bb" target=3D"_blank">xkeyboard-con=
fig_2.11.bb</a><br>
<a href=3D"http://libfm_1.1.2.2.bb" target=3D"_blank">libfm_1.1.2.2.bb</a><=
br>
<a href=3D"http://glib-networking_2.38.0.bb" target=3D"_blank">glib-network=
ing_2.38.0.bb</a><br>
<a href=3D"http://connman-gnome_0.7.bb" target=3D"_blank">connman-gnome_0.7=
.bb</a><br>
<br>
<br>
Find attached the config.log for shared-mime-info-native.<br>
<br>
I had recently update my Ubuntu from 12.10 to 14.04. Do you think it can<br=
>
cause this error?<br>
<br>
<br>
</blockquote>
Do you have intltool-update binary on your host ? outside sys root ?<br>
<br>
and if yes then whats the version of it.<br>
<br>
</blockquote>
<br>
<br>
$ intltool-update --version<br>
intltool-update (intltool) 0.50.2<br>
Written by Kenneth Christiansen, Maciej Stachowiak, and Darin Adler.<br>
<br>
Copyright (C) 2000-2003 Free Software Foundation, Inc.<br>
This is free software; see the source for copying conditions. =A0There is N=
O<br>
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR<br>
PURPOSE.<br>
<br>
<br>
=A0 Looking at the log file, seems to have some output about the nativeperl=
,<br>
</blockquote>
I missed the output of this initially:<br>
<br>
/&lt;snip&gt;/tmp/sysroots/x86_64-<u></u>linux/usr/bin/nativeperl found<br>
<br>
seems you have some additional output that is confusing things<br>
<br>
If you run bitbake shared-mime-info -c devshell and then within the<br>
devshell run intltool-update --version, what happens? =A0It seems that the<=
br>
nativeperl is getting getting printed out.<br>
<br>
any chance you are available on IRC freenode #yocto, I am sgw_ there,<br>
maybe we can work this realtime<br>
<br>
Sau!<br>
<br>
</blockquote>
<br>
I&#39;ve cleaned perl-native and everything seems to be working now.<br>
<br>
</blockquote></div></div>
Interesting, I wonder what caused that in the first place.<br>
<br>
Did that resolve the other bugs that you filed also? =A0I am also trying to=
 work on those python issues.<br>
<br>
Sau!</blockquote></div><div class=3D"gmail_extra"><br></div>That bugs were =
from different build/projects.</div><div class=3D"gmail_extra">I&#39;ll try=
 to to the same clean steps and see if it solve the issues.<br><br><br clea=
r=3D"all">

<div><div dir=3D"ltr"><div>Reagrds,</div><div><br></div>--<br>*dS<br>Diego =
Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.embarcad=
os.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_ca=
mpaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.b=
r</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a1139a7e4c0d1df04fa8e5dae--
