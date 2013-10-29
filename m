Return-Path: <sebmennetrier@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0B66D430
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 16:13:10 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id e14so123147iej.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 09:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ESrLqV/vfdxsrY1MtmjYRgSj7yYURLJKDoHgO8iLk88=;
	b=t77NiIdlOruBjNGADCokbxWOgp9eTmpyOkeRgTa1UbDnHMvQDuoaEVZ4T/2B4hRpqB
	AjAfOvieuUIl9+8SAajxI7QFzNp3kxVX8lyFjQBy60ZFCkcI03qunvloAFF7wHLiOndq
	xQohdLAO1E6YBdIE/mmS3DjqgOLlml7LBpKPjWS9K+iXnMAjykxvGuL7IBdYMmCq/HCJ
	lSzGixZZpAtCvDeBC/sTYScvuamuDTkOOnhu2z9+4C63zUT8fBYT7RA4pqgjE4S0wjgo
	ZAIcXxXnDPBlemcWqwaJdui/fpYkw1fdz3McE3clr1aJnX36kBP3z55VrilBQTSkNxp0
	askg==
MIME-Version: 1.0
X-Received: by 10.42.121.132 with SMTP id j4mr272223icr.42.1383063192438; Tue,
	29 Oct 2013 09:13:12 -0700 (PDT)
Sender: sebmennetrier@gmail.com
Received: by 10.43.141.70 with HTTP; Tue, 29 Oct 2013 09:13:12 -0700 (PDT)
In-Reply-To: <CABgO3_NxvRU5ZtonpPuSKb_FhmAkKoD1-HUmKD9v-+hqE0s8rg@mail.gmail.com>
References: <CABgO3_ODLSb2ZWrkqN6jry7WNehq_rhRTBcorRQj+wuHTjfE7A@mail.gmail.com>
	<1622119.vHvDT1LZVD@helios>
	<CABgO3_NxvRU5ZtonpPuSKb_FhmAkKoD1-HUmKD9v-+hqE0s8rg@mail.gmail.com>
Date: Tue, 29 Oct 2013 17:13:12 +0100
X-Google-Sender-Auth: NJ4gXdGpMjE1utYTHU4A7pW5K8A
Message-ID: <CABgO3_MGuZGv7XKkYonTea2QEB2-ZhNCkqqBoqdyVpW5uSUWbw@mail.gmail.com>
From: Sebastien MENNETRIER <s.mennetrier@innotis.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue with package_rpm : can't install files named "%name..."
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
X-List-Received-Date: Tue, 29 Oct 2013 16:13:11 -0000
Content-Type: multipart/alternative; boundary=20cf3010eb9349a85804e9e37ee4

--20cf3010eb9349a85804e9e37ee4
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I tried to create a patch to fix this issue :
http://lists.openembedded.org/pipermail/openembedded-core/2013-October/085689.html

Regards,
Seb


2013/10/28 Sebastien MENNETRIER <s.mennetrier@innotis.org>

> Paul,
>
> Thanks for your answer. I filled a bug :
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5397
>
> Regards,
> Seb
>
>
> 2013/10/28 Paul Eggleton <paul.eggleton@linux.intel.com>
>
>> Hi Sebastien,
>>
>> On Monday 28 October 2013 14:44:57 Sebastien MENNETRIER wrote:
>> > I try to cross-compile and install rubygems and the gems contain some
>> > directories and files named "%name...".
>> >
>> > To create the rpm package, a spec file that contains the list of all
>> files
>> > and directories that must be in the rpm package is generated in
>> do_package.
>> >
>> > The rpm process replace all the "%name" in the spec file by the name of
>> the
>> > package. So the package process try to include some file and directory
>> that
>> > doesn't exist.
>> >
>> > How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?
>>
>> It is a limitation in package_rpm.bbclass's current behaviour, yes. It
>> probably needs to be fixed to escape % at the start of a filename when
>> writing
>> out the spec file (assuming that is possible, that is). Could you please
>> file a
>> bug for this (at bugzilla.yoctoproject.org)?
>>
>> Thanks,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>>
>
>

--20cf3010eb9349a85804e9e37ee4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi,<br><br></div>I tried to create a patch to fi=
x this issue : <a href=3D"http://lists.openembedded.org/pipermail/openembed=
ded-core/2013-October/085689.html" target=3D"_blank">http://lists.openembed=
ded.org/pipermail/openembedded-core/2013-October/085689.html</a></div>

<div><br></div>Regards,<br>Seb</div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">2013/10/28 Sebastien MENNETRIER <span dir=3D"ltr">&l=
t;<a href=3D"mailto:s.mennetrier@innotis.org" target=3D"_blank">s.mennetrie=
r@innotis.org</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div><div>Paul,<br><br=
></div>Thanks for your answer. I filled a bug : <a href=3D"https://bugzilla=
.yoctoproject.org/show_bug.cgi?id=3D5397" target=3D"_blank">https://bugzill=
a.yoctoproject.org/show_bug.cgi?id=3D5397</a></div>

<div>
<br></div>Regards,<br></div>Seb</div><div class=3D"HOEnZb"><div class=3D"h5=
"><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">2013/10/28 =
Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.i=
ntel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span><br=
>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Sebastien,<br>
<div><div><br>
On Monday 28 October 2013 14:44:57 Sebastien MENNETRIER wrote:<br>
&gt; I try to cross-compile and install rubygems and the gems contain some<=
br>
&gt; directories and files named &quot;%name...&quot;.<br>
&gt;<br>
&gt; To create the rpm package, a spec file that contains the list of all f=
iles<br>
&gt; and directories that must be in the rpm package is generated in do_pac=
kage.<br>
&gt;<br>
&gt; The rpm process replace all the &quot;%name&quot; in the spec file by =
the name of the<br>
&gt; package. So the package process try to include some file and directory=
 that<br>
&gt; doesn&#39;t exist.<br>
&gt;<br>
&gt; How can I resolve this issue ? Is it a bug in package_rpm.bbclass ?<br=
>
<br>
</div></div>It is a limitation in package_rpm.bbclass&#39;s current behavio=
ur, yes. It<br>
probably needs to be fixed to escape % at the start of a filename when writ=
ing<br>
out the spec file (assuming that is possible, that is). Could you please fi=
le a<br>
bug for this (at <a href=3D"http://bugzilla.yoctoproject.org" target=3D"_bl=
ank">bugzilla.yoctoproject.org</a>)?<br>
<br>
Thanks,<br>
Paul<br>
<span><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--20cf3010eb9349a85804e9e37ee4--
