Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 913EC6FD0F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 18:22:59 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so2162360qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=k8PWJ+97LiuIJhsjoXkODyho3FRSQQJahPCOt255mlg=;
	b=y3wjTpRJDwWH2QevwD03Qc8hNDpItcP7K2kGUPQNMpxdfq5A5R1tWSpJnVd1Hwt2sU
	UPGCWXmr3ndxNQvCeVQA/KJSTAmBuKNsVAUz8L59yvmzOe8TIac+VHShdtZ/nq5VrYA+
	qUPl/hmPkYgUQx0srRWkT8OnVOrErK0EFrgcw4SEL6pUfLlF0OQGyNCGLdpw4UrLsC9u
	Mlg5cZxL3eE3Ys2ol+EZPFpKoA8YjPqWhXpxq5ZjxqWNXkvl97jKy9kPjUuO/nGPXRwR
	CbFBsbAFvF4hmScdRBX4ncw5zSngaGTY+w6JzUEUA3HWoFZ53EU+oz6f0MhrSex5hsHZ
	+32g==
X-Received: by 10.224.55.83 with SMTP id t19mr13527121qag.42.1401387780193;
	Thu, 29 May 2014 11:23:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Thu, 29 May 2014 11:22:40 -0700 (PDT)
In-Reply-To: <538775A4.9060908@linux.intel.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
	<5387654C.5090309@linux.intel.com>
	<CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
	<CAMKF1sqy9DQ+zwMA_HHijYXF9Ltk-Nm6U4i0C6yDuxndfWx34w@mail.gmail.com>
	<CAMCfZKHFGk2myN0R9LXNY1ZoWFd+WQLx5r98BpnC7-0R3XrASg@mail.gmail.com>
	<538775A4.9060908@linux.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 29 May 2014 15:22:40 -0300
Message-ID: <CAMCfZKHPn4CVHF3cM5ONH9FBz6nrUtHNsiannyXm9OoaEuVHDQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 29 May 2014 18:23:06 -0000
Content-Type: multipart/alternative; boundary=047d7b5daf78d4dff604fa8e04c6

--047d7b5daf78d4dff604fa8e04c6
Content-Type: text/plain; charset=ISO-8859-1

Sau!,

On Thu, May 29, 2014 at 3:00 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/29/2014 10:50 AM, Diego Sueiro wrote:
>
>> Khem,
>>
>> On Thu, May 29, 2014 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>  On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro <diego.sueiro@gmail.com>
>>> wrote:
>>>
>>>> For now these are the recipes:
>>>>
>>>> shared-mime-info_1.2.bb
>>>> gconf_3.2.6.bb
>>>> libsoup-2.4_2.45.3.bb
>>>> gconf_3.2.6.bb
>>>> avahi_0.6.31.bb
>>>> xkeyboard-config_2.11.bb
>>>> libfm_1.1.2.2.bb
>>>> glib-networking_2.38.0.bb
>>>> connman-gnome_0.7.bb
>>>>
>>>>
>>>> Find attached the config.log for shared-mime-info-native.
>>>>
>>>> I had recently update my Ubuntu from 12.10 to 14.04. Do you think it can
>>>> cause this error?
>>>>
>>>>
>>> Do you have intltool-update binary on your host ? outside sys root ?
>>>
>>> and if yes then whats the version of it.
>>>
>>
>>
>> $ intltool-update --version
>> intltool-update (intltool) 0.50.2
>> Written by Kenneth Christiansen, Maciej Stachowiak, and Darin Adler.
>>
>> Copyright (C) 2000-2003 Free Software Foundation, Inc.
>> This is free software; see the source for copying conditions.  There is NO
>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>> PURPOSE.
>>
>>
>>  Looking at the log file, seems to have some output about the nativeperl,
> I missed the output of this initially:
>
> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>
> seems you have some additional output that is confusing things
>
> If you run bitbake shared-mime-info -c devshell and then within the
> devshell run intltool-update --version, what happens?  It seems that the
> nativeperl is getting getting printed out.
>
> any chance you are available on IRC freenode #yocto, I am sgw_ there,
> maybe we can work this realtime
>
> Sau!
>

I've cleaned perl-native and everything seems to be working now.

Thanks for the support.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--047d7b5daf78d4dff604fa8e04c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Sau!,</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">On Thu, May 29, 2014 at 3:00 PM, Saul=
 Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"">On=
 05/29/2014 10:50 AM, Diego Sueiro wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Khem,<br>
<br>
On Thu, May 29, 2014 at 2:48 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro &lt;<a href=3D"mailto:diego.=
sueiro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com</a>&gt;<br>
wrote:<br>
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
</blockquote>
<br>
Do you have intltool-update binary on your host ? outside sys root ?<br>
<br>
and if yes then whats the version of it.<br>
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
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=
<br>
<br>
<br>
</blockquote></div></div>
Looking at the log file, seems to have some output about the nativeperl, I =
missed the output of this initially:<br>
<br>
/&lt;snip&gt;/tmp/sysroots/x86_64-<u></u>linux/usr/bin/nativeperl found<br>
<br>
seems you have some additional output that is confusing things<br>
<br>
If you run bitbake shared-mime-info -c devshell and then within the devshel=
l run intltool-update --version, what happens? =A0It seems that the nativep=
erl is getting getting printed out.<br>
<br>
any chance you are available on IRC freenode #yocto, I am sgw_ there, maybe=
 we can work this realtime<br>
<br>
Sau!<br></blockquote></div><br>I&#39;ve cleaned perl-native and everything =
seems to be working now.</div><div class=3D"gmail_extra"><br></div><div cla=
ss=3D"gmail_extra">Thanks for the support.<br><br clear=3D"all"><div><div d=
ir=3D"ltr">

<div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administ=
rador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?utm_source=
=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%2=
0Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--047d7b5daf78d4dff604fa8e04c6--
