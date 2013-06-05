Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id ABA586065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 17:43:06 +0000 (UTC)
Received: by mail-ie0-f173.google.com with SMTP id k13so4464302iea.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 10:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YTQRhsvQsIhn5RndAdLhsKdm3PSciZq2XD1MWsW68v4=;
	b=zAyNDzaT1TYXBvMtGF2Ep6u4DqwA4A4kECFaUhzYn7X9EWS5E1ADiFoLWxgfgmN57S
	Z7ubIFv0OmGxQmwe3oagzn7EkX9LCclPIeeZ1ZIeJ89nCuDqUWDy7JoUmlylnrd7eQYC
	gf6bSrPZE1ckba2ouu2+kJbNpsHaCj4IG2LzZRQCiac6GV0Pf1dQoelQ0dPt7UjIQnW4
	LjjUHC1BYfbqW0LNWe2uiJkMIaIOr9AadWHdCYyx3G188e6t4HUvvQuE9Ud1ZhYHgetW
	u9ckIu7X3R5j4zwrXxAM+c/RC0B0hezK1ocADUNn/t4OW3xYb2CF3EX2lFR2/jNXxpyr
	01jQ==
MIME-Version: 1.0
X-Received: by 10.50.1.70 with SMTP id 6mr3701940igk.54.1370454187118; Wed, 05
	Jun 2013 10:43:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.11.231 with HTTP; Wed, 5 Jun 2013 10:43:07 -0700 (PDT)
In-Reply-To: <CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
	<CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
Date: Wed, 5 Jun 2013 14:43:07 -0300
X-Google-Sender-Auth: jC8xjRAVn76P4a6m7qslN-pYnJ8
Message-ID: <CAP9ODKqiVaF3njGCLXHhT7n03d-QyESQAdw3S+HF2-JNEazCMw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH dylan, master] Fix meta-toolchain-qte SDK build for x11-less DISTRO
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
X-List-Received-Date: Wed, 05 Jun 2013 17:43:07 -0000
Content-Type: multipart/alternative; boundary=047d7bd6c730011b2e04de6bbba3

--047d7bd6c730011b2e04de6bbba3
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <
nicolas.dechesne@linaro.org> wrote:

>
>
>
> On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
>>
>>>
>>>
>>>
>>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold <sgw@linux.intel.com
>>> <mailto:sgw@linux.intel.com>> wrote:
>>>
>>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>>>
>>>
>>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <sgw@linux.intel.com
>>>         <mailto:sgw@linux.intel.com>
>>>         <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>>
>>> wrote:
>>>
>>>              You could just directly put the nativesdk-libx11 in place
>>>         of the
>>>              variable, no need to have the variable there.
>>>
>>>
>>>         yes, that's what I had initially, but found it was less easy to
>>>         read...
>>>         with X11DEPENDS it's more 'obvious' that there is something
>>>         special..
>>>         that said, i can make the change if that's really needed.
>>>
>>>     We do use the X11DEPENDS elsewhere when there are multiple
>>>     dependencies, but I also found cases where we just include the
>>>     dependency directly in the test. I was trying pick a direction:
>>>     single entry no X11DEPENDS, multiple entries use X11DEPENDS.
>>>
>>>     Comments, flames, ...
>>>
>>>
>>> Yes; I sent this patch in Febuary:
>>> http://patchwork.openembedded.**org/patch/44759/<http://patchwork.openembedded.org/patch/44759/>
>>>
>>> Please use this one instead of the recent one.
>>>
>>>
>> Well reading back on that, it looks like I was waiting for an
>> EXTRA_OECONF or related change to the autoconf scripts.
>>
>> Sau!
>
>
> hmm. ok, sorry Otavio, i missed the other patch. I will check on my side
> too about EXTRA_OECONF.
>

Nicolas, don't worry. It is normal to end redoing some stuff.

Last time I checked it had no support in Qt build system; I am not sure if
it uses or not the host headers (in case they exist) but it needs testing
to be sure.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7bd6c730011b2e04de6bbba3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 2:23 PM, Nicolas Dechesne <span dir=3D"ltr">=
&lt;<a href=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicola=
s.dechesne@linaro.org</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_ext=
ra"><br><br><div class=3D"gmail_quote"><div><div class=3D"h5">On Wed, Jun 5=
, 2013 at 7:19 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@li=
nux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<=
br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>On 06/05/2013 10:12 AM, Otavio Salvador=
 wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div>
<br>
<br>
<br>
On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.i=
ntel.com" target=3D"_blank">sgw@linux.intel.com</a><br></div><div>
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:<br>
<br>
<br>
=A0 =A0 =A0 =A0 On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold &lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a><br>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a>&gt;<br></div><div>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a> &lt;mailto:<a href=3D"mailto:sgw@linux.int=
el.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;&gt;&gt; wrote:<br>
<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0You could just directly put the nativesdk-libx11=
 in place<br>
=A0 =A0 =A0 =A0 of the<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0variable, no need to have the variable there.<br=
>
<br>
<br>
=A0 =A0 =A0 =A0 yes, that&#39;s what I had initially, but found it was less=
 easy to<br>
=A0 =A0 =A0 =A0 read...<br>
=A0 =A0 =A0 =A0 with X11DEPENDS it&#39;s more &#39;obvious&#39; that there =
is something<br>
=A0 =A0 =A0 =A0 special..<br>
=A0 =A0 =A0 =A0 that said, i can make the change if that&#39;s really neede=
d.<br>
<br>
=A0 =A0 We do use the X11DEPENDS elsewhere when there are multiple<br>
=A0 =A0 dependencies, but I also found cases where we just include the<br>
=A0 =A0 dependency directly in the test. I was trying pick a direction:<br>
=A0 =A0 single entry no X11DEPENDS, multiple entries use X11DEPENDS.<br>
<br>
=A0 =A0 Comments, flames, ...<br>
<br>
<br>
Yes; I sent this patch in Febuary:<br>
<a href=3D"http://patchwork.openembedded.org/patch/44759/" target=3D"_blank=
">http://patchwork.openembedded.<u></u>org/patch/44759/</a><br>
<br>
Please use this one instead of the recent one.<br>
<br>
</div></blockquote>
<br>
Well reading back on that, it looks like I was waiting for an EXTRA_OECONF =
or related change to the autoconf scripts.<br>
<br>
Sau!</blockquote><div><br></div></div></div><div>hmm. ok, sorry Otavio, i m=
issed the other patch. I will check on my side too about EXTRA_OECONF.</div=
></div></div></div></blockquote><div><br></div><div style>Nicolas, don&#39;=
t worry. It is normal to end redoing some stuff.</div>
<div><br></div><div style>Last time I checked it had no support in Qt build=
 system; I am not sure if it uses or not the host headers (in case they exi=
st) but it needs testing to be sure.</div></div><div><br></div>-- <br>Otavi=
o Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Sys=
tems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" =
target=3D"_blank">http://projetos.ossystems.com.br</a><br>Mobile: +55 (53) =
9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--047d7bd6c730011b2e04de6bbba3--
