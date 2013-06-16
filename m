Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1B3296080B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 19:12:14 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id ta17so2364652obb.22
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 12:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=AdxIzJxZWk2COM0WhgMvOu+dMbfLSnUnwByFwK6skC4=;
	b=EiP7LVKEvXbj/hWifqSJutv+0tx+oRzTW1OpECPdWaHznuj2G7B/R67OTt/pYmx2eZ
	PVC5ARLDInAxYyQu+agw1AQDbFBjPisyW+KvsHseCDw3uDr1j0JNrK4MoPIMbeM6xROF
	kvfWovb78Izn58kLoVBvtDcgY4hNcKtl2UEJzBgOF1+oHvyOToQPNp3y4P3CeXZxltyn
	Es+pBup7vgZqh6X5Y6GP74pVtj4Irv1QYwSnOmLBbz1qLYgrkZ4Z024fDiEfUBznDffV
	pyxQIca2yDAMwzS7bHYiw/uO5w/LICsid0qdV/Hgm4aF6iEtMy9gs5TOu29oYFV2u0Ap
	e2Pw==
MIME-Version: 1.0
X-Received: by 10.60.134.236 with SMTP id pn12mr7145898oeb.4.1371409934407;
	Sun, 16 Jun 2013 12:12:14 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.108.167 with HTTP; Sun, 16 Jun 2013 12:12:14 -0700 (PDT)
In-Reply-To: <1371242900-7066-1-git-send-email-sgw@linux.intel.com>
References: <1371242900-7066-1-git-send-email-sgw@linux.intel.com>
Date: Sun, 16 Jun 2013 16:12:14 -0300
X-Google-Sender-Auth: aQqxba2pSrhPFEXNADmsRFcxZ9I
Message-ID: <CAP9ODKqx7Fnsrxnfyuz4VaQCQNzomyAZsd_CqxVSx_tavS=HKw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Preserve/Unset and Restore TERM
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
X-List-Received-Date: Sun, 16 Jun 2013 19:12:14 -0000
Content-Type: multipart/alternative; boundary=047d7b471f6afb607504df4a4165

--047d7b471f6afb607504df4a4165
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jun 14, 2013 at 5:48 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Having a value in TERM that is not recognized by the nativesdk can cause
> potential escape sequences appearing in the output stream, the can be seen
> on Ubuntu with TERM=xterm-256color. Unsetting TERM allows for consistent
> results in the python output.
>
> Also, don't exit, use return, otherwise the shell exits and get no error
> information.
>
> [YOCTO #4732]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

Please split the fix and get the exit/return fix applied. While on that,
ensure the errors are send to >&2 as done in other error messages.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b471f6afb607504df4a4165
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Fri, Jun 14, 2013 at 5:48 PM, Saul Wold <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Having a value in TERM that is not recognize=
d by the nativesdk can cause<br>
potential escape sequences appearing in the output stream, the can be seen<=
br>
on Ubuntu with TERM=3Dxterm-256color. Unsetting TERM allows for consistent<=
br>
results in the python output.<br>
<br>
Also, don&#39;t exit, use return, otherwise the shell exits and get no erro=
r information.<br>
<br>
[YOCTO #4732]<br>
<br>
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div style>Please split=
 the fix and get the exit/return fix applied. While on that, ensure the err=
ors are send to &gt;&amp;2 as done in other error messages.=A0</div>
</div><div><br></div>-- <br>Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br><a href=3D"http://www.ossystems.co=
m.br" target=3D"_blank">http://www.ossystems.com.br</a> =A0 =A0 =A0 =A0<a h=
ref=3D"http://projetos.ossystems.com.br" target=3D"_blank">http://projetos.=
ossystems.com.br</a><br>
Mobile: +55 (53) 9981-7854 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750=
<br>
</div></div>

--047d7b471f6afb607504df4a4165--
