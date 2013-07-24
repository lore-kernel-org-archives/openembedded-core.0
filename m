Return-Path: <brandon@rascalmicro.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1736065F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 20:32:32 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so812254pdi.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 13:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type:x-gm-message-state;
	bh=QrfEBPGK7JCiojn4kkFpqy7WWR8qW8Q6rujLJrMvspc=;
	b=EmNNsx4Zmo/8EV471xfzw6JyE+vpBgfARiQfy3vNfK2po76xDHFIaOHMGxDPoQbZQE
	aFTIkeAgK0bVE80fzYNx7lV+9Yoj4x26Ycn5Qtz9pLpm8Z0WZFciVBGuKvj7mPNyGkbV
	RZduS/6SEv/QnWD6r/1nzzmn412MnANjUnjfvPLGGv55iifiPw5lkChjnQpZRx/nOiCe
	iC/STXXv8Pa9MLUWovSIWLkbJgFnO3nAeohXbZtBlA+5eA4aVMDPxVAEHSsqzTV+UpIj
	67Wco/YJueEvhCSU3Mzbxtef5elte8zXhgHjeohCxyjFVvR7Nst+uSEZDb5GbiQtGnDN
	sZnw==
MIME-Version: 1.0
X-Received: by 10.68.163.195 with SMTP id yk3mr43515099pbb.142.1374697953090; 
	Wed, 24 Jul 2013 13:32:33 -0700 (PDT)
Received: by 10.68.62.194 with HTTP; Wed, 24 Jul 2013 13:32:32 -0700 (PDT)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <CABcZANk0rWk0z9afLRrvgJQK2XnNgNN2E8UYnbp9bMOz4AS2_w@mail.gmail.com>
References: <CA+b4E8z+1_okUN0-JhDoc50FoLLM=3+WUxai1BtyyCLRVkmy9Q@mail.gmail.com>
	<CABcZANk0rWk0z9afLRrvgJQK2XnNgNN2E8UYnbp9bMOz4AS2_w@mail.gmail.com>
Date: Wed, 24 Jul 2013 16:32:32 -0400
Message-ID: <CA+b4E8wZtBGio4aAV8Dkj+nra1xUTRBU+H_EHe2a22S=59w+pg@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Chris Larson <clarson@kergoth.com>
X-Gm-Message-State: ALoCoQmrXV0RdQglsStnEO4NJQ6sUDzEgl5H88pB5d8Awlz/pLNa0nr+aoGPbHzE1Bqtt6THfHC6
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Making SSL headers available during build?
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
X-List-Received-Date: Wed, 24 Jul 2013 20:32:32 -0000
Content-Type: multipart/alternative; boundary=047d7bacb4802aeed404e247cf41

--047d7bacb4802aeed404e247cf41
Content-Type: text/plain; charset=ISO-8859-1

Ah, I have already done that, so my problem must lie elsewhere. uWSGI uses
a weird Python build script, so I'm probably failing to configure it
correctly.

Thanks for the rapid response.

Brandon


On Wed, Jul 24, 2013 at 4:27 PM, Chris Larson <clarson@kergoth.com> wrote:

> On Wed, Jul 24, 2013 at 1:25 PM, Brandon Stafford <brandon@rascalmicro.com
> > wrote:
>
>> I'm working on updating an old recipe for uWSGI to add SSL support. I
>> think this requires putting a collection of SSL headers in
>> sysroots/ARCH/usr/include.
>>
>> How do I go about telling Bitbake to do that?
>>
>> If it helps, my current recipe is here:
>> https://github.com/rascalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb
>>
>
> Add openssl or gnutls (whichever you need) to DEPENDS. Done. :)
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



-- 
Brandon Stafford
Rascal Micro: small computers for art and science
Somerville, MA, USA

--047d7bacb4802aeed404e247cf41
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, I have already done that, so my problem must lie elsew=
here. uWSGI uses a weird Python build script, so I&#39;m probably failing t=
o configure it correctly.<div><br></div><div>Thanks for the rapid response.=
</div>
<div><br></div><div>Brandon</div></div><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">On Wed, Jul 24, 2013 at 4:27 PM, Chris Larson <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank"=
>clarson@kergoth.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra">=
<div class=3D"im"><div class=3D"gmail_quote">On Wed, Jul 24, 2013 at 1:25 P=
M, Brandon Stafford <span dir=3D"ltr">&lt;<a href=3D"mailto:brandon@rascalm=
icro.com" target=3D"_blank">brandon@rascalmicro.com</a>&gt;</span> wrote:<b=
r>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>I&#39;m working on updating an old reci=
pe for uWSGI to add SSL support. I think this requires putting a collection=
 of SSL headers in sysroots/ARCH/usr/include.</div>


<div><br></div>
<div>How do I go about telling Bitbake to do that?</div><div><br></div><div=
>If it helps, my current recipe is here:=A0<a href=3D"https://github.com/ra=
scalmicro/openembedded-rascal/blob/rascal/recipes/uwsgi/uwsgi_1.9.14.bb" ta=
rget=3D"_blank">https://github.com/rascalmicro/openembedded-rascal/blob/ras=
cal/recipes/uwsgi/uwsgi_1.9.14.bb</a></div>


</blockquote></div><br></div>Add openssl or gnutls (whichever you need) to =
DEPENDS. Done. :)<span class=3D"HOEnZb"><font color=3D"#888888"><br>-- <br>=
Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBake, Open=
Embedded, OpenZaurus<br>
Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div>Brandon=
 Stafford</div><div>Rascal Micro: small computers for art and science</div>=
<div>Somerville, MA, USA</div>
</div>

--047d7bacb4802aeed404e247cf41--
