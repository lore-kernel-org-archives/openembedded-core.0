Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TWxLN-0000RK-Q3
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 23:46:34 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1689348dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 14:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=1fYb20EBRQ/kNFVDdNOCW+TfiPDpI6R9DMFhU0S39f8=;
	b=p4FSrXpsNdxMnAEjNsc15bQ89j7MtlVQ+DxOmoVTZWmu+tNCDUrPRpLxlUILpaZWnQ
	4WsN+mrgSWruEyIYzcD70x2JhOmiPQDjSWG1tiQKTSM1HwvBtge/vZyJ7n7RZFa/rDxV
	e3A3Hq9ujy5RKITGCUEAEQp2N4jvv4B3pcZiLetAtcrAepUE3WxzqGA3Ax6c5JGH4CAs
	HJsK98WfOx05MXg3RtWf+IQ1wBhagC1XHEs1tI+xVb4BkX/80IGhYuH9NBC5wxC/t1um
	ihohJKgM+pTHBiQ5MWqGpMX9wnFqQMh9jdqQ3JmklCfjdMXBQSIbhBbSMU+IIVzludLI
	B32Q==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr37410127pbc.64.1352500363721; Fri,
	09 Nov 2012 14:32:43 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 9 Nov 2012 14:32:43 -0800 (PST)
In-Reply-To: <154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
References: <cover.1352455397.git.ross.burton@intel.com>
	<154a30032b03a9ce269752adbf5bbec85205720e.1352455397.git.ross.burton@intel.com>
Date: Fri, 9 Nov 2012 20:32:43 -0200
X-Google-Sender-Auth: -EFsKjFP8kOHGf-llfJNxQT3ZA4
Message-ID: <CAP9ODKor1L_sv0hLi_-FTCY383fyE0NguXEeMp1U0=KcPQrk1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta: remove redundant _FOR_BUILD variables
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
X-List-Received-Date: Fri, 09 Nov 2012 22:46:34 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c12ebcfa9c04ce1787dd

--e89a8ff1c12ebcfa9c04ce1787dd
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 9, 2012 at 8:09 AM, Ross Burton <ross.burton@intel.com> wrote:

> Signed-off-by: Ross Burton <ross.burton@intel.com>
>

Please bump PR. Even it might not change the end result we need to force a
rebuild as we did change the meta-data and we risk having a subtle bug
somewhere.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff1c12ebcfa9c04ce1787dd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Fri, Nov 9, 2012 at 8:09 AM, Ross Bur=
ton <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br></blockquote><div><br></div><div>Please bump =
PR. Even it might not change the end result we need to force a rebuild as w=
e did change the meta-data and we risk having a subtle bug somewhere.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e89a8ff1c12ebcfa9c04ce1787dd--
