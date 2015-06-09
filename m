Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id 06B12758A1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 14:53:43 +0000 (UTC)
Received: by obcej4 with SMTP id ej4so14914571obc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jun 2015 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=InsqFOB1AosNM4rOcnlPV+iCAq3mB1mxrfGAvWT6GDc=;
	b=EAeWuTKB591QWICXcyX8X7DaB2+t61SiN6X9quSzAL7ye2RkjrUxBNXpDHwGs88Rjr
	oSNWS3UA/eZL7P31SW44E/g6OI7B4A6pF8VAKylArisvarJVRJm81FJ7/FyRD+PggL5w
	DTLUK0LF93AMUJ2ca+tTMy558oohi8s+QhZfbYtdO6bjdj9aulzvbmx4uEKypp2p2wJq
	SoukqLonbL0HygVMHzwe/zLtx3k4nFF/Ce1T+wS14x1pXys16+9ROBP4F0Fyi2u9NMHV
	m2rI69Q4ilJBWKoKgcqkahEXn4JZknpb4ALtZx1wcp6w/OpP/0Ps3SAEKaw+gxumldda
	cY6A==
X-Received: by 10.182.18.7 with SMTP id s7mr16206538obd.40.1433861624348; Tue,
	09 Jun 2015 07:53:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.20.13 with HTTP; Tue, 9 Jun 2015 07:53:23 -0700 (PDT)
In-Reply-To: <CAJTo0LadVJPTXNb5MLV6AHhbcS9_rEN1qYz0D+cp0nmB4uv9aQ@mail.gmail.com>
References: <CAMCfZKFgggP5Y21S58+jq8n_se3a3Tg06f2HTFTj8j0Go3ATUA@mail.gmail.com>
	<CAJTo0LadVJPTXNb5MLV6AHhbcS9_rEN1qYz0D+cp0nmB4uv9aQ@mail.gmail.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 9 Jun 2015 11:53:23 -0300
Message-ID: <CAMCfZKGuZoHJGAYK4VgRM-q_GXWbn6VaEyrnnUFBvwXEdtMV2w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-qt5] Issue on linking qtwebengine
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
X-List-Received-Date: Tue, 09 Jun 2015 14:53:45 -0000
Content-Type: multipart/alternative; boundary=001a11c2dc80c6c621051816ec27

--001a11c2dc80c6c621051816ec27
Content-Type: text/plain; charset=UTF-8

Ross,

2015-06-09 10:09 GMT-03:00 Burton, Ross <ross.burton@intel.com>:

> On 9 June 2015 at 13:58, Diego Sueiro <diego.sueiro@gmail.com> wrote:
>
>> I'm using fido branch and I'm getting the linker killed due to out of
>> memory in a machine with 8GB of RAM.
>>
>
> I guess you'll want to pass the same options to the linker that we already
> pass to webkitgtk:
>
> LDFLAGS += "-Wl,--no-keep-memory"
>

Thanks, that did the trick.

But now I have another issue. :-(

When qtwebengine compile task are running in parallel with another task I
get an "file not recognized: File format not recognized" error.

I put PARALLEL_MAKE="" but the compile task still uses all CPUs.

Is there a way to tell openembedded to run a task without any other in
parallel?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2dc80c6c621051816ec27
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Ross,</div><div class=3D"gmail_=
extra"><br><div class=3D"gmail_quote">2015-06-09 10:09 GMT-03:00 Burton, Ro=
ss <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D=
"_blank">ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><div cla=
ss=3D"gmail_extra"><span class=3D""><div class=3D"gmail_quote">On 9 June 20=
15 at 13:58, Diego Sueiro <span dir=3D"ltr">&lt;<a href=3D"mailto:diego.sue=
iro@gmail.com" target=3D"_blank">diego.sueiro@gmail.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div>I&#39;m using fido branch and I&#39;m getting t=
he linker killed due to out of memory in a machine with 8GB of RAM.</div><d=
iv></div></blockquote></div><br></span>I guess you&#39;ll want to pass the =
same options to the linker that we already pass to webkitgtk:</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">LDFLAGS +=3D &quot;=
-Wl,--no-keep-memory&quot;<div class=3D""><div id=3D":11l" class=3D"" tabin=
dex=3D"0"></div></div></div></blockquote></div><br>Thanks, that did the tri=
ck.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Bu=
t now I have another issue. :-(</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">When qtwebengine compile task are running in para=
llel with another task I get an &quot;file not recognized: File format not =
recognized&quot; error.</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">I put PARALLEL_MAKE=3D&quot;&quot; but the compile task s=
till uses all CPUs.</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Is there a way to tell openembedded to run a task without any=
 other in parallel?</div><div class=3D"gmail_extra"><br><br clear=3D"all"><=
div><div class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,</div><div=
><br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br>=
<a href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;=
utm_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=
=3D"_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/=
<br></div></div></div>
</div></div>

--001a11c2dc80c6c621051816ec27--
