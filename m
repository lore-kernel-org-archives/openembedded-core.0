Received: from mail-ie0-f177.google.com ([209.85.223.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ronunes@gmail.com>) id 1UNBrC-0006uR-UM
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 02:47:30 +0200
Received: by mail-ie0-f177.google.com with SMTP id tp5so1097572ieb.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2013 17:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=ohdZSpCX8Vf0PETpoyUF/y+UyeZFD1msxrqsqiwJZPQ=;
	b=xMkAaRL1Mv95C4g7JewICf6LOppkHYdVM+aKTUMVebVxJZj73qdaJJVmnwMCmyS+FZ
	0w+lOrt9DFpbuE543SuVZK4SllStFrvo2vGflg3o8aWe/5Sqq9yNc1LK7VNaJiPXJgOU
	MKI02jz31zkV4zxf7sJwv2nb4q2zowSaG7vIJlf44GhOLGzojkPGTI0BvxRhnlZnS3Em
	KkKq8RcWUbGHKi72ZM3nSvwUi37njwZNPgWMD8BwMTv86jwponwjaTaLlaTdJs2qJqrC
	ARCP/usxLv/68B8tKcgsU2kYJCgtP0J73XFnnBSXghTeHVmvcw81QZs/hq404DcxJC55
	0PoA==
MIME-Version: 1.0
X-Received: by 10.50.111.161 with SMTP id ij1mr6034615igb.85.1364949007817;
	Tue, 02 Apr 2013 17:30:07 -0700 (PDT)
Received: by 10.64.232.103 with HTTP; Tue, 2 Apr 2013 17:30:07 -0700 (PDT)
Date: Tue, 2 Apr 2013 20:30:07 -0400
Message-ID: <CACb8hfEDoLbsoiZk4d=r7Teu11i8-WwZC1QSO5_nOmQjggkZSQ@mail.gmail.com>
From: Rogerio Nunes <ronunes@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] alsa-tools: Update autotools.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 00:47:36 -0000
Content-Type: multipart/alternative; boundary=047d7b3a8a62bf63c704d969f44a

--047d7b3a8a62bf63c704d969f44a
Content-Type: text/plain; charset=ISO-8859-1

My approach was to add PACKAGECONFIG with gtk+ and a new patch, instead of
modifying autotools.patch.

This way we only eliminate some more sub-modules when not using x11 in
distro.

I'm sending my patches now.

________________________________________
From: otavio.salvador@gmail.com [otavio.salvador@gmail.com] on behalf of
Otavio Salvador [otavio@ossystems.com.br]
Sent: Tuesday, April 02, 2013 13:46
To: Saul Wold; Nunes Rogerio-B35650
Cc: Trevor Woerner; Nobuhiro Iwamatsu;
openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] alsa-tools: Update autotools.patch

On Tue, Apr 2, 2013 at 12:59 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 03/29/2013 06:18 AM, Trevor Woerner wrote:
>>
>> I'm seeing this exact same error when I perform a "bitbake world", and
>> have been for the last couple days
>>
> I believe this is a real problem, and I suggested to Nobuhiro that using
> PACKAGECONFIG with gtk+ would be a better solution, but have not see a
> follow-up patch for this.
>
> Patches welcome!

Rogerio (added to Cc) was working in a patch for this; I think he
should have it ready for submitting it soon.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b3a8a62bf63c704d969f44a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote">My approach was to add PACKAGEC=
ONFIG with gtk+ and a new patch, instead of modifying autotools.patch.<br><=
br></div><div class=3D"gmail_quote">
This way we only eliminate some more sub-modules when not using x11 in dist=
ro.<br><br>I&#39;m sending my patches now.<br><br>
________________________________________<br>
From: <a href=3D"mailto:otavio.salvador@gmail.com">otavio.salvador@gmail.co=
m</a> [<a href=3D"mailto:otavio.salvador@gmail.com">otavio.salvador@gmail.c=
om</a>] on behalf of Otavio Salvador [<a href=3D"mailto:otavio@ossystems.co=
m.br">otavio@ossystems.com.br</a>]<br>

Sent: Tuesday, April 02, 2013 13:46<br>
To: Saul Wold; Nunes Rogerio-B35650<br>
Cc: Trevor Woerner; Nobuhiro Iwamatsu; <a href=3D"mailto:openembedded-core@=
lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>
Subject: Re: [OE-core] [PATCH] alsa-tools: Update autotools.patch<br>
<br>
On Tue, Apr 2, 2013 at 12:59 PM, Saul Wold &lt;<a href=3D"mailto:saul.wold@=
intel.com">saul.wold@intel.com</a>&gt; wrote:<br>
&gt; On 03/29/2013 06:18 AM, Trevor Woerner wrote:<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m seeing this exact same error when I perform a &quot;bitbak=
e world&quot;, and<br>
&gt;&gt; have been for the last couple days<br>
&gt;&gt;<br>
&gt; I believe this is a real problem, and I suggested to Nobuhiro that usi=
ng<br>
&gt; PACKAGECONFIG with gtk+ would be a better solution, but have not see a=
<br>
&gt; follow-up patch for this.<br>
&gt;<br>
&gt; Patches welcome!<br>
<br>
Rogerio (added to Cc) was working in a patch for this; I think he<br>
should have it ready for submitting it soon.<br>
<br>
--<br>
Otavio Salvador =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S=
. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br">otavio@ossystems.com.br<=
/a> =A0<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%2053%209981-7854" value=3D"+555399817854">+55 =
53 9981-7854</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0<a href=3D"http://projetos.ossy=
stems.com.br" target=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>
<br>
</div><br></div>

--047d7b3a8a62bf63c704d969f44a--
