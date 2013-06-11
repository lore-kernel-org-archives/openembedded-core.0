Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id DD2076A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:27:41 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id fe20so6330179lab.20
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=URP52+gGMK5or5IHuTGbKHnNfwkhoQhgvvPdJW8JA6w=;
	b=e8/heUl6RzegGIopeXnVtB9yhXN+KoPnqkozmwIAwIMA3rFgjws+qYkDfZ/R4yEOK5
	37/njXeJtWAetz9vwBlCs/1n92nm92SE5HkD8aNaFQBd4dqgbQ6dQW9HGmiRaLAKMIDn
	yqbBRzKCCnTY4/WUe0gsdETZACDpzb//rrWDOVIp/Jo7+Jyo/VojHH9/jss8DrtR2RKJ
	9AJiyNhph/ingi4n/Lz9VIrA0kC/s8InLzIUxY8dGmin3eXXmfhwWObi8lBVmvEOgRMH
	HYbDbHI6dhmIKG22c2Ysgtjafi9GktgY1tPbLZCbucZ2V0JK3UeotIar4DpNeG07/cdg
	oz0g==
X-Received: by 10.152.7.39 with SMTP id g7mr6113856laa.72.1370914062278; Mon,
	10 Jun 2013 18:27:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.4.66 with HTTP; Mon, 10 Jun 2013 18:27:22 -0700 (PDT)
In-Reply-To: <51B67480.5010400@linux.intel.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<0face86bf815082f2080f84c0214a7835d0380dd.1370896990.git.chris_larson@mentor.com>
	<51B67480.5010400@linux.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Mon, 10 Jun 2013 18:27:22 -0700
Message-ID: <CABcZANkcJ4sOEECOhnhM0W=iYemVtWm70V7Hp4yD-EehY1c_TA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] libnewt: split python module into libnewt-python
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
X-List-Received-Date: Tue, 11 Jun 2013 01:27:42 -0000
Content-Type: multipart/alternative; boundary=001a11c28514b3241504ded6cda8

--001a11c28514b3241504ded6cda8
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 10, 2013 at 5:51 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/10/2013 01:47 PM, Christopher Larson wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> This is useful as it avoids pulling python into a build just to build
>> chkconfig. The python recipe uses the libnewt installed in the sysroot by
>> the
>> main package, so there's little loss of build time, other than the
>> additional
>> unpack/patch.
>>
>>  This one seems to introduce a new warning, this was from a populated
> build dir with sstate available
>
>  WARNING: The recipe libnewt-python is trying to install files into a
>> shared area when those files already exist.
>>
> Those files and their manifest location are:
>
> /srv/ssd/sgw/builds/world/tmp/**pkgdata/x86_64-poky-linux/**runtime/whiptail
>
>     Matched in manifest-x86_64-libnewt.**packagedata
>
> /srv/ssd/sgw/builds/world/tmp/**pkgdata/x86_64-poky-linux/**
> runtime-reverse/whiptail
>     Matched in manifest-x86_64-libnewt.**packagedata
> Please verify which package should provide the above files.


Oops, sorry about that. I'll submit a v2 patch series with this fixed.
Thanks.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c28514b3241504ded6cda8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 10, 2013 at 5:51 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D=
"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<=
/span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 06/10/2013 01:47 PM, Ch=
ristopher Larson wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" tar=
get=3D"_blank">chris_larson@mentor.com</a>&gt;<br>
<br>
This is useful as it avoids pulling python into a build just to build<br>
chkconfig. The python recipe uses the libnewt installed in the sysroot by t=
he<br>
main package, so there&#39;s little loss of build time, other than the addi=
tional<br>
unpack/patch.<br>
<br>
</blockquote></div>
This one seems to introduce a new warning, this was from a populated build =
dir with sstate available<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
WARNING: The recipe libnewt-python is trying to install files into a shared=
 area when those files already exist.<br>
</blockquote>
Those files and their manifest location are:<br>
<br>
/srv/ssd/sgw/builds/world/tmp/<u></u>pkgdata/x86_64-poky-linux/<u></u>runti=
me/whiptail <br>
=C2=A0 =C2=A0 Matched in manifest-x86_64-libnewt.<u></u>packagedata <br>
<br>
/srv/ssd/sgw/builds/world/tmp/<u></u>pkgdata/x86_64-poky-linux/<u></u>runti=
me-reverse/whiptail<br>
=C2=A0 =C2=A0 Matched in manifest-x86_64-libnewt.<u></u>packagedata <br>
Please verify which package should provide the above files.</blockquote></d=
iv><br>Oops, sorry about that. I&#39;ll submit a v2 patch series with this =
fixed. Thanks.<br>-- <br>Christopher Larson<br>clarson at kergoth dot com<b=
r>

Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics
</div></div>

--001a11c28514b3241504ded6cda8--
