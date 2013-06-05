Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5954A6065C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jun 2013 17:12:15 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id at1so379182iec.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 10:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5za1I9HRtjj0YI5YvLhx9fxVjzbTNJluIX1087hRCIA=;
	b=xfT83Pazke0C8JxX0xAazrFRWbsMqnDbo/D/aEHTsqVn/9kMp1KOKg3zM5ZNtx7wO8
	2k9nXCYKvRa/QdmO7eicIJfx19uTTksJ2mIM1rh3QGOx29BW5aoWQ1w1fNGb4Ro/MyTP
	TzaE/FnGWZx7es1OWjmNu2ICroEjYG9gUwWJ4IaOXCF8Xutyws5d1xrBMJT66oFMqNFY
	58qSuvcq3cMOH68Q044Y6cZAn96j/X4urapB8YdWI879TrZgVYMwa/OGcV4npx1CHlZ3
	SHxXKppOp4ta09/po7cpHcFEOtY+PhlaHi8YlV7VigB2+hSnumsCX+gfGJf217RAYr5+
	ercg==
MIME-Version: 1.0
X-Received: by 10.42.121.211 with SMTP id k19mr15090190icr.26.1370452335760;
	Wed, 05 Jun 2013 10:12:15 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.11.231 with HTTP; Wed, 5 Jun 2013 10:12:15 -0700 (PDT)
In-Reply-To: <51AF6E2F.8040309@linux.intel.com>
References: <1370417067-30166-1-git-send-email-nicolas.dechesne@linaro.org>
	<51AF67B8.20502@linux.intel.com>
	<CAP71WjzSHWmKYLTs3_Ao6Mt_sKnUdNCHM3dSMSs8FpKbVyuCoQ@mail.gmail.com>
	<51AF6E2F.8040309@linux.intel.com>
Date: Wed, 5 Jun 2013 14:12:15 -0300
X-Google-Sender-Auth: iIR5K0zD5khrr-8Lvhh-FgtdTU8
Message-ID: <CAP9ODKrxMh3PGGwVHdVFcUL2-Ag4vA2bAKr+3PGKGNDzwMJnpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 05 Jun 2013 17:12:15 -0000
Content-Type: multipart/alternative; boundary=20cf301b613ba79c4004de6b4c6b

--20cf301b613ba79c4004de6b4c6b
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 06/05/2013 09:32 AM, Nicolas Dechesne wrote:
>
>>
>> On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>>     You could just directly put the nativesdk-libx11 in place of the
>>     variable, no need to have the variable there.
>>
>>
>> yes, that's what I had initially, but found it was less easy to read...
>> with X11DEPENDS it's more 'obvious' that there is something special..
>> that said, i can make the change if that's really needed.
>>
>>  We do use the X11DEPENDS elsewhere when there are multiple dependencies,
> but I also found cases where we just include the dependency directly in the
> test. I was trying pick a direction: single entry no X11DEPENDS, multiple
> entries use X11DEPENDS.
>
> Comments, flames, ...
>

Yes; I sent this patch in Febuary:
http://patchwork.openembedded.org/patch/44759/

Please use this one instead of the recent one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--20cf301b613ba79c4004de6b4c6b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Wed, Jun 5, 2013 at 1:58 PM, Saul Wold <span dir=3D"ltr">&lt;<a =
href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">On 06/05/2013 09:32 AM, Nicolas Dechesne=
 wrote:<br>

</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:s=
olid;padding-left:1ex"><div class=3D"im">
<br>
On Wed, Jun 5, 2013 at 6:30 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.i=
ntel.com" target=3D"_blank">sgw@linux.intel.com</a><br></div><div class=3D"=
im">
&lt;mailto:<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@lin=
ux.intel.com</a>&gt;&gt; wrote:<br>
<br>
=A0 =A0 You could just directly put the nativesdk-libx11 in place of the<br=
>
=A0 =A0 variable, no need to have the variable there.<br>
<br>
<br>
yes, that&#39;s what I had initially, but found it was less easy to read...=
<br>
with X11DEPENDS it&#39;s more &#39;obvious&#39; that there is something spe=
cial..<br>
that said, i can make the change if that&#39;s really needed.<br>
<br>
</div></blockquote>
We do use the X11DEPENDS elsewhere when there are multiple dependencies, bu=
t I also found cases where we just include the dependency directly in the t=
est. I was trying pick a direction: single entry no X11DEPENDS, multiple en=
tries use X11DEPENDS.<br>

<br>
Comments, flames, ...<br></blockquote><div><br></div><div style>Yes; I sent=
 this patch in Febuary:=A0<a href=3D"http://patchwork.openembedded.org/patc=
h/44759/">http://patchwork.openembedded.org/patch/44759/</a></div><div styl=
e>
<br></div><div style>Please use this one instead of the recent one.=A0</div=
></div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<=
a href=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projet=
os.ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--20cf301b613ba79c4004de6b4c6b--
