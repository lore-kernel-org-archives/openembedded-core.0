Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id B88006F167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 17:45:46 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id i8so1841671qcq.23
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 09:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y9ITRuLGQbpS2hbiWE4vi4stmlrPF4ryBbvLwaDbBt0=;
	b=rkwviaqgOmvDTy7jOxgvEMVU/AQUgNwtbFfnPoGE3ANJS/rh4rgz/8r9ApwIc/EgKY
	nkK3sE8Vyw5ru9IQI47ShYk3dj8n8fbvLKqtnvMG0c9Camyj3KjFe1sD1Vkfq8tE1Vn0
	ayu1IE+y647uVA0XCQXmx3Qnw/KvFyIW4P3IbDUUp5Y0Zt6hIu2ofFQCifP8L+UUtBDx
	YiGTVodf980vfv2+3SL8ygx6tdJ4t7ebTQabdMhUGtk2PggZcGmWPiakBQWUZ9HZzily
	wSxKq+WBhkOJ4Fgc0+c9ID4S2hvSc9Qoh9105PPk1Oa8wsyWRIFbZGa0IaUo2c843aF8
	7V/Q==
X-Received: by 10.140.21.201 with SMTP id 67mr1059254qgl.78.1393436746957;
	Wed, 26 Feb 2014 09:45:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 26 Feb 2014 09:45:26 -0800 (PST)
In-Reply-To: <2631264.Ll8XlRBBiZ@peggleto-mobl5.ger.corp.intel.com>
References: <1393419467-6018-1-git-send-email-diego.sueiro@gmail.com>
	<2631264.Ll8XlRBBiZ@peggleto-mobl5.ger.corp.intel.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 26 Feb 2014 14:45:26 -0300
Message-ID: <CAMCfZKHM_RsfEOw64nXTc56WJZXAsgzeSBj3xyia81OgB=aeiQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] packagegroup-qt-toolchain-target.inc: add libQtUiTools static library
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
X-List-Received-Date: Wed, 26 Feb 2014 17:45:47 -0000
Content-Type: multipart/alternative; boundary=001a11c151f0520ab904f352c633

--001a11c151f0520ab904f352c633
Content-Type: text/plain; charset=ISO-8859-1

Paul,
On Wed, Feb 26, 2014 at 11:42 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> I know there's already been a bit of discussion about this patch already,
> so I
> apologise if this has already been covered, but the commit message doesn't
> completely justify this addition. Most people don't statically link to Qt,
> which is why we haven't included any static libraries in the SDK (and as a
> rule we typically don't include any static libraries in our SDKs). Why is
> this
> individual library out of all of the libraries that Qt ships special?
>
I did a research on internet and just found static library for uitools. I
could not found anything that explains the reasons for not generating a
shared library.
People will not be able to use uitools If this library is not shipped with
SDK.
I tried to explain this dependency on commit message:

> libQtUiTools.a and libQtUiToolsE.a needs to be installed on
> meta-toolchain-qt
> and meta-toolchain-qte respectively.
> Whitout this static library, compiling qt apps which needs uitools will
> fail.




Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c151f0520ab904f352c633
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Paul,<br><div class=3D"gmail_qu=
ote">On Wed, Feb 26, 2014 at 11:42 AM, Paul Eggleton <span dir=3D"ltr">&lt;=
<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.egg=
leton@linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":ti2" style=3D"overflow:hidden">I know there&#3=
9;s already been a bit of discussion about this patch already, so I<br>


apologise if this has already been covered, but the commit message doesn&#3=
9;t<br>
completely justify this addition. Most people don&#39;t statically link to =
Qt,<br>
which is why we haven&#39;t included any static libraries in the SDK (and a=
s a<br>
rule we typically don&#39;t include any static libraries in our SDKs). Why =
is this<br>
individual library out of all of the libraries that Qt ships special?</div>=
</blockquote></div>I did a research on internet and just found static libra=
ry for uitools. I could not found anything that explains the reasons for no=
t generating a shared library.</div>

<div class=3D"gmail_extra">People will not be able to use uitools If this l=
ibrary is not shipped with SDK.<br>I tried to explain this dependency on co=
mmit message:</div><div class=3D"gmail_extra"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-co=
lor:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

<span style=3D"font-family:arial,sans-serif;font-size:13px">libQtUiTools.a =
and libQtUiToolsE.a needs to be installed on meta-toolchain-qt<br></span><s=
pan style=3D"font-family:arial,sans-serif;font-size:13px">and meta-toolchai=
n-qte respectively.<br>

</span><span style=3D"font-family:arial,sans-serif;font-size:13px">Whitout =
this static library, compiling qt apps which needs uitools will fail.</span=
></blockquote><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a" style>

<br></div><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><=
br></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a=
 href=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;ut=
m_medium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"=
_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c151f0520ab904f352c633--
