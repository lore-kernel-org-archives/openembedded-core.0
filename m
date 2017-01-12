Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BBED60053;
	Thu, 12 Jan 2017 01:02:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c85so493895wmi.1;
	Wed, 11 Jan 2017 17:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=sxa1XgTN8h2xh4iBVDSh+4O7xkiSF5rNMGGViMDKbHg=;
	b=oPcV7DGarZYJDrQctMqPRMvLkM3rQoER/XEV77XZkzSdbPVimvFZl53HjGsw1zq/OX
	xnB4eNow5uSZcEalOTyN+MhvzlzimWKLs/VXi/ps8fb5R14bpTX6VNMp3xu4W3DvkXG6
	kk148/DeLTbThOubnj4oi7zKtR2soKfA7nHZfskkl5JTCXL4kxux2tpCcqytBAYcTHLs
	MgR7/DF95iheVQa66l3tOZAxbyj5MH3qxc+pOiSIqXjQU+xRYcbQC89xpuid1AG1n1RM
	2HGJYX2R51Bi7qfpV173OaGhe9aDVdCaE1Cl5/TC9SxfMEcKIlNXUawNudO+OKPJdPY3
	b0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=sxa1XgTN8h2xh4iBVDSh+4O7xkiSF5rNMGGViMDKbHg=;
	b=RmE67PElJeaZxOO9TzZ9MjeMr0oHT63d+/+Qw9I5XVWatuwiHvGdAC9uKscpjp+nvx
	JUfeNH+PlSnatS0z0/HjfSxgjJdgUNUFc1qETUnYGB82mFBpClbD6uT9vnppRKNyhFgi
	l8TZXEg3HlhtaAdWzY3Hez1xoMyeKhrDYfFR50/V9szZaNOVeCOw24vr4nS0iu8vUnIl
	+nK/td0Ke87a10dykKzy+LQ8u4Oek+kI/Hij6lPqRVVhEXj0Puk26eEDM1VUqBcLMRVO
	cgwZphaMUCxRGX6/pTt0XiIhkN36nOselR9YDYsmRgPiffdywAuMjC3brnZQYWifbALG
	wgdg==
X-Gm-Message-State: AIkVDXJpgd94Hi22BkJpE0sruymqcsVWon4AVbPgGHvOckiR1KJ2Eu6XeS1zSxxvQKXakSxGHsxh750dOTblqw==
X-Received: by 10.28.189.134 with SMTP id n128mr4575024wmf.77.1484182962535;
	Wed, 11 Jan 2017 17:02:42 -0800 (PST)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.194.186.232 with HTTP; Wed, 11 Jan 2017 17:02:22 -0800 (PST)
In-Reply-To: <CAKP9-Sh2bM9Qwet0FyeLBHAexkoNN089Xrr2ryQktPY5t7fQoA@mail.gmail.com>
References: <c93f2baf-e05d-fc8a-0789-9651dc5a1fd4@balister.org>
	<CAKP9-Sh2bM9Qwet0FyeLBHAexkoNN089Xrr2ryQktPY5t7fQoA@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Wed, 11 Jan 2017 17:02:22 -0800
X-Google-Sender-Auth: Clzu9EXcOCJYFIW7hbJtlMujUUg
Message-ID: <CA+YB3rb5QBEES7VCTT23t9BFOuzzspakbsvutA4ATn2sVjmS0A@mail.gmail.com>
To: "Sandeep G.R" <grsandeep85@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [yocto] OpenEmbedded Developers Meeting in Portland before ELC
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
X-List-Received-Date: Thu, 12 Jan 2017 01:02:44 -0000
Content-Type: multipart/alternative; boundary=001a114b0a1a4385700545db4680

--001a114b0a1a4385700545db4680
Content-Type: text/plain; charset=UTF-8

Hi Sandeep - yes, there is a DevDay planned for Friday Feb 24, after ELC.
Details and registration links are here:

https://www.yoctoproject.org/devday

On Wed, Jan 11, 2017 at 4:43 PM, Sandeep G.R <grsandeep85@gmail.com> wrote:

> Hi Philip,
>
> Is Yocto developer day planned during ELC-2017 Portland, USA. Can you
> share the registration details if any?
>
> On Mon, Jan 9, 2017 at 2:04 PM, Philip Balister <philip@balister.org>
> wrote:
>
>> As we do around each Embedded Linux Conference, OpenEmbedded will host a
>> developer meeting to discuss the state of OpenEmbedded and what efforts
>> we should focus on over the next six months or so.
>>
>> All developers and users are welcome to attend. We like to hear feedback
>> from a variety of people over what works, doesn't work, and is useful to
>> people using OpenEmbedded for all sort of applications.
>>
>> The meeting will be held Monday, Feb 20 at a location we can almost
>> announce. Based on prior years, the meeting will run from 9AM to 5PM.
>>
>> If you are going to attend add your name to:
>>
>> http://openembedded.org/wiki/OEDAM_2017
>>
>> Also, go ahead and add ideas for the agenda. We'll organize them better
>> just before the actual meeting.
>>
>> See you all in Portland,
>>
>> Philip
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>>
>
>
>
> --
> *Thanks & Regards,*
> *Sandeep G R*
>
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto
>
>


-- 
Jeff Osier-Mixon - Open Source Community Engineer, Intel Corporation

--001a114b0a1a4385700545db4680
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sandeep - yes, there is a DevDay planned for Friday Feb=
 24, after ELC. Details and registration links are here:<div><br></div><div=
><a href=3D"https://www.yoctoproject.org/devday">https://www.yoctoproject.o=
rg/devday</a><br></div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Wed, Jan 11, 2017 at 4:43 PM, Sandeep G.R <span dir=3D"ltr">=
&lt;<a href=3D"mailto:grsandeep85@gmail.com" target=3D"_blank">grsandeep85@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif;color:#073763">Hi Philip,</div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif;color:#073763"><br></div><div c=
lass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif;colo=
r:#073763">Is Yocto developer day planned during ELC-2017 Portland, USA. Ca=
n you share the registration details if any?</div></div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote"><span class=3D"">On Mon, Jan 9, 2017=
 at 2:04 PM, Philip Balister <span dir=3D"ltr">&lt;<a href=3D"mailto:philip=
@balister.org" target=3D"_blank">philip@balister.org</a>&gt;</span> wrote:<=
br></span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">As we do around e=
ach Embedded Linux Conference, OpenEmbedded will host a<br>
developer meeting to discuss the state of OpenEmbedded and what efforts<br>
we should focus on over the next six months or so.<br>
<br>
All developers and users are welcome to attend. We like to hear feedback<br=
>
from a variety of people over what works, doesn&#39;t work, and is useful t=
o<br>
people using OpenEmbedded for all sort of applications.<br>
<br>
The meeting will be held Monday, Feb 20 at a location we can almost<br>
announce. Based on prior years, the meeting will run from 9AM to 5PM.<br>
<br>
If you are going to attend add your name to:<br>
<br>
<a href=3D"http://openembedded.org/wiki/OEDAM_2017" rel=3D"noreferrer" targ=
et=3D"_blank">http://openembedded.org/wiki/O<wbr>EDAM_2017</a><br>
<br>
Also, go ahead and add ideas for the agenda. We&#39;ll organize them better=
<br>
just before the actual meeting.<br>
<br>
See you all in Portland,<br>
<br>
Philip<br>
</span><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m_-142=
1082286700835735HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org" target=3D"_blank">yocto@yoctoproj=
ect.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listinfo/yocto</a><=
br>
</font></span></font></span></blockquote></div><span class=3D"HOEnZb"><font=
 color=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"m_-1421082286700835735gmail_signature" data-smartmail=3D"gmail_signatur=
e"><div dir=3D"ltr"><div><div dir=3D"ltr"><font color=3D"#073763" face=3D"a=
rial, helvetica, sans-serif"><b>Thanks &amp; Regards,</b></font><div><font =
face=3D"arial, helvetica, sans-serif"><font color=3D"#073763"><b>Sandeep G =
R</b></font><br></font><br></div></div></div></div></div>
</font></span></div>
<br>--<br>
______________________________<wbr>_________________<br>
yocto mailing list<br>
<a href=3D"mailto:yocto@yoctoproject.org">yocto@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/yocto" rel=3D"noreferrer=
" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo/yocto</a><=
br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jeff Osier-Mixon =
- Open Source Community Engineer, Intel Corporation</div>
</div>

--001a114b0a1a4385700545db4680--
