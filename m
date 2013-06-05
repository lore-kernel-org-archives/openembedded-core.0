Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id E0DB56A598
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 17:23:30 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id ef5so3083522obb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 10:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=OVLGMqzd5JwBakGJUbzHFZtHMOdKoB1k2r8AzQpvM1Q=;
	b=QzgTq5/uDM/NLIT1TA3ipf1P8utXMg+fXcErqG/QRJT3ArU2Wa/PVWgq1z2mgS/i0f
	utrKcR+o+eb06xF9P7yg609gq90XZjWMvtossXH1Bk9ucTHjxBmNky2/VGTCa+p+9VxH
	QA36kiAmPdFU3WzedxYHau0M6jIIddu7QF9vVRoYSgKjZUd5jKWgh+lIdCq9+3Gino+n
	3OWiumbtuaD5fFawHnT2ah7VAWOjoiBf2lw3+saW46S4mMHBzb88mTRDfrf0RUdUUtDE
	0q4BSFehR4gOg1w7kPtWOBzYe6f8qSNib75uzbJctRRKedFVRsLf2hLYNLLzRqCOGP1m
	HIww==
X-Received: by 10.60.132.6 with SMTP id oq6mr15282252oeb.113.1370453011207;
	Wed, 05 Jun 2013 10:23:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.27.165 with HTTP; Wed, 5 Jun 2013 10:23:11 -0700 (PDT)
In-Reply-To: <51AF7336.8050802@linux.intel.com>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
	<CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
	<51AF7336.8050802@linux.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 5 Jun 2013 19:23:11 +0200
Message-ID: <CAP71WjxL2g=k5hcgAo70Linsf-Occ-tdh1jM+ppYmghALDsq3w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQnZYg7yaRu4FMQ4yHVfRbL2Z8519SQoyV+0xX6N8fWemA+cdb2hUSWae/o0CFrnMvyMDX2U
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 05 Jun 2013 17:23:31 -0000
Content-Type: multipart/alternative; boundary=047d7b471e48ea28e004de6b74ba

--047d7b471e48ea28e004de6b74ba
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/05/2013 10:12 AM, Otavio Salvador wrote:
>
>>
>>
>>
>> On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>>
>>
>>         On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <sgw@linux.intel.com
>>         <mailto:sgw@linux.intel.com>
>>         <mailto:sgw@linux.intel.com <mailto:sgw@linux.intel.com>>> wrote:
>>
>>              You could just directly put the nativesdk-libx11 in place
>>         of the
>>              variable, no need to have the variable there.
>>
>>
>>         yes, that's what I had initially, but found it was less easy to
>>         read...
>>         with X11DEPENDS it's more 'obvious' that there is something
>>         special..
>>         that said, i can make the change if that's really needed.
>>
>>     We do use the X11DEPENDS elsewhere when there are multiple
>>     dependencies, but I also found cases where we just include the
>>     dependency directly in the test. I was trying pick a direction:
>>     single entry no X11DEPENDS, multiple entries use X11DEPENDS.
>>
>>     Comments, flames, ...
>>
>>
>> Yes; I sent this patch in Febuary:
>> http://patchwork.openembedded.**org/patch/44759/<http://patchwork.openembedded.org/patch/44759/>
>>
>> Please use this one instead of the recent one.
>>
>>
> Well reading back on that, it looks like I was waiting for an EXTRA_OECONF
> or related change to the autoconf scripts.
>
> Sau!


hmm. ok, sorry Otavio, i missed the other patch. I will check on my side
too about EXTRA_OECONF.


>
>
>  --
>> Otavio Salvador                             O.S. Systems
>> http://www.ossystems.com.br http://projetos.ossystems.com.**br<http://projetos.ossystems.com.br>
>> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>>
>

--047d7b471e48ea28e004de6b74ba
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 7:19 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 06/05/2013 10:12 AM, Ot=
avio Salvador wrote:<br>
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
<br>
On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.i=
ntel.com" target=3D"_blank">sgw@linux.intel.com</a><br></div><div class=3D"=
im">
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:<br>
<br>
<br>
=A0 =A0 =A0 =A0 On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold &lt;<a href=3D"ma=
ilto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a><br>
=A0 =A0 =A0 =A0 &lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D=
"_blank">sgw@linux.intel.com</a>&gt;<br></div><div class=3D"im">
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
Sau!</blockquote><div><br></div><div style>hmm. ok, sorry Otavio, i missed =
the other patch. I will check on my side too about EXTRA_OECONF.</div><div =
style>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
--<br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> <a href=3D"http://projetos.ossystems.com.br" target=3D"_blan=
k">http://projetos.ossystems.com.<u></u>br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
" target=3D"_blank">+55 (53) 9981-7854</a> =A0 =A0 =A0 =A0 =A0 =A0Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750" target=3D=
"_blank">+1 (347) 903-9750</a><br>


</blockquote>
</div></div></blockquote></div><br></div></div>

--047d7b471e48ea28e004de6b74ba--
