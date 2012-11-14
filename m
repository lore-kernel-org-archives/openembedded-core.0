Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TYS9J-0001LW-7t
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 02:52:17 +0100
Received: by mail-pb0-f47.google.com with SMTP id ro12so4611pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 17:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=l5FM97D2kXYIWvAZz9DXQiCSohCJUX0CKYF7ga8CxXc=;
	b=i9cQ7drp1mxFbr5gjDaWEcF2j/noF3Fj8OZruU04GBFHUzqEmTHMnNDWfnPE5ip7YD
	0xnQASIzbNl3br3Zk2CE/CwynUrA94oARk3QhvebOl8sAaRGfByokcL9aRSpJ0V1+9C/
	rZlkmKkeOlwuI2nxtUXIO9UJsEDKmfqEpF9XSQHu6F955mENIiCos74aTRYs3WoLQUbU
	fz9UOQTP0/IteJlTd2sJIJSQJiu+ilqX46mJTQSUg+iRrVk3+ZDIXoNyCeu4QhfXOtd8
	W5goSUrQlTaVKULA8m3UXzOFKBD/i55Wlz030r+0iwk6pZEA+yO3aJUPwREvrXGaH80T
	zZDA==
MIME-Version: 1.0
Received: by 10.68.254.10 with SMTP id ae10mr67287666pbd.126.1352857101703;
	Tue, 13 Nov 2012 17:38:21 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 13 Nov 2012 17:38:21 -0800 (PST)
In-Reply-To: <1352853188-3018-2-git-send-email-sgw@linux.intel.com>
References: <1352853188-3018-1-git-send-email-sgw@linux.intel.com>
	<1352853188-3018-2-git-send-email-sgw@linux.intel.com>
Date: Tue, 13 Nov 2012 23:38:21 -0200
X-Google-Sender-Auth: dg0wTLJpiXum_DqHuV-jOyPHZ70
Message-ID: <CAP9ODKovGBnuoaF65e5Vv3x16SFSWG3tjdwxsZg9_ZPahNQx2w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pulseaudio: fix string test
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
X-List-Received-Date: Wed, 14 Nov 2012 01:52:17 -0000
Content-Type: multipart/alternative; boundary=047d7b2e0da1fa986304ce6a96e9

--047d7b2e0da1fa986304ce6a96e9
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 13, 2012 at 10:33 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

I agree with the fix but the commit log could be improved. Please use
something as:

pulseaudio: Remove bashism from string test

This is more accurate and give a hint why you did the change.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b2e0da1fa986304ce6a96e9
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Tue, Nov 13, 2012 at 10:33 PM, Saul W=
old <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"=
_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div>I agree with the f=
ix but the commit log could be improved. Please use something as:</div><div=
>
<br></div><div>pulseaudio: Remove bashism from string test</div><div><br></=
div><div>This is more accurate and give a hint why you did the change.</div=
><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>
E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio=
@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"=
_blank">http://www.ossystems.com.br</a><br>Mobile: +55 53 9981-7854=A0 =A0 =
=A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://projetos.ossystems.com.br" target=
=3D"_blank">http://projetos.ossystems.com.br</a><br>
<br>

--047d7b2e0da1fa986304ce6a96e9--
