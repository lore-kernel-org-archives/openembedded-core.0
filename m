Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TadEE-0006hF-Ig
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Nov 2012 03:06:22 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2209968pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 17:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YtzyD5gptkmAUmdh/u0pC1keu6kUFUVQOUb4YGaxGF4=;
	b=TT7Vf8cLXwuvhJhgnkTrkCDHoSPhJbtmy1L3MVuaIqhRh0/31KkRH9ZGCGw8x5KhnU
	GUZ6NFM4RNuBm7QuV1CV6JBvzXgKFBKEBKmVHMXHUzX1on0XNF0MEH6tEIwSZJePXgdX
	UTBYR9SzJ/mOC2LsR2iUBdHfyHrMa5eiy0Rkm2Baao6z7GiGmWklWXWIOX20ATQlqXY+
	oDmH4KlzifOIoJtFrBq+Zh+1b3j6XapvwnUYQCdXWG3oVHK8sb06cWovyxJ9xduvQA8g
	c+15DMtVKPPo6fRAXl7mL2kDJvOpzdvP2nyg7M0TVbuUITGC9sn0EqYSgU0t2bPEUX9l
	htTQ==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr38757142pbc.136.1353376335673;
	Mon, 19 Nov 2012 17:52:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 19 Nov 2012 17:52:15 -0800 (PST)
In-Reply-To: <accf99081d61ccd85804b53505322da81d2a82dd.1353374801.git.sgw@linux.intel.com>
References: <cover.1353374801.git.sgw@linux.intel.com>
	<accf99081d61ccd85804b53505322da81d2a82dd.1353374801.git.sgw@linux.intel.com>
Date: Mon, 19 Nov 2012 23:52:15 -0200
X-Google-Sender-Auth: OP2NQZhfzLYa3HZjWu2xTCN6wDw
Message-ID: <CAP9ODKp8J2mYKa7rDLzATBpYZeO+ipJmEa5zu8yPyER+khmGKg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 10/13] rt-tests/hwlatdetect: Update to 0.85
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
X-List-Received-Date: Tue, 20 Nov 2012 02:06:22 -0000
Content-Type: multipart/alternative; boundary=047d7b33cf6abc395304cee37bfc

--047d7b33cf6abc395304cee37bfc
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 11:30 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>

Please move the SRCREV to the bb file; the .inc is not a version but common
packaging and common code.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--047d7b33cf6abc395304cee37bfc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Mon, Nov 19, 2012 at 11:30 PM, Saul W=
old <span dir=3D"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"=
_blank">sgw@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@lin=
ux.intel.com</a>&gt;<br></blockquote><div><br></div><div>Please move the SR=
CREV to the bb file; the .inc is not a version but common packaging and com=
mon code.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--047d7b33cf6abc395304cee37bfc--
