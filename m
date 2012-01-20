Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Ro5ij-0005Ee-G4
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jan 2012 05:04:57 +0100
Received: by lags15 with SMTP id s15so80420lag.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 19:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=z/v+AUBB9l21w0mARODE2v/Z1Ymb1B01x9R6miM+mjc=;
	b=QSvELwhNL1/g87eDxEFjeixb5vZcw/7GTrxAqxHcl2dZvSlSk5RFgN3QT48JozCFht
	l7gCNFVXLjtGn1qVQqF5fwllXMxWiz+toVfyZjraoSK3vTscrA6cHyJd2AhLYAENIm3G
	COo7iczp+rQoebmAZz85h2h8526wDWh0sa2r8=
MIME-Version: 1.0
Received: by 10.152.136.16 with SMTP id pw16mr8431421lab.12.1327031837400;
	Thu, 19 Jan 2012 19:57:17 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.30.135 with HTTP; Thu, 19 Jan 2012 19:57:17 -0800 (PST)
In-Reply-To: <cover.1326826646.git.josh@linux.intel.com>
References: <cover.1326826646.git.josh@linux.intel.com>
Date: Fri, 20 Jan 2012 01:57:17 -0200
X-Google-Sender-Auth: pRTdHCEWbsADokrv4IVrx_hy-2A
Message-ID: <CAP9ODKrxHP9o_EK6FX6FOipp=L_ecDuuSnyNcH8RbRYBQ1iskA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Busybox syslog tweaks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Jan 2012 04:04:57 -0000
Content-Type: multipart/alternative; boundary=f46d042f920c461d9304b6edad71

--f46d042f920c461d9304b6edad71
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jan 17, 2012 at 16:59, Joshua Lock <josh@linux.intel.com> wrote:

> This set of changes makes some minor changes to the configuration of
> busybox's
> syslog.
>

I'd like to ask for you to think about a way of sharing the code that
parses the conf file between sysv and systemd. My current proposal is:

* move init code to parse the conf file onto a script (possibly
/lib/busybox/busybox-syslogd or similar)
* change init to use it
* we change meta-oe to use it as well.

Thoughts?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--f46d042f920c461d9304b6edad71
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jan 17, 2012 at 16:59, Joshua Lock <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:josh@linux.intel.com">josh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
This set of changes makes some minor changes to the configuration of busybo=
x&#39;s<br>
syslog.<br></blockquote><div><br></div><div>I&#39;d like to ask for you to =
think about a way of sharing the code that parses the conf file between sys=
v and systemd. My current proposal is:</div><div><br></div><div>* move init=
 code to parse the conf file onto a script (possibly /lib/busybox/busybox-s=
yslogd or similar)</div>
<div>* change init to use it</div><div>* we change meta-oe to use it as wel=
l.</div><div><br></div><div>Thoughts?</div><div>=A0</div></div>-- <br>Otavi=
o Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. S=
ystems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" target=3D"_bla=
nk">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" =
target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--f46d042f920c461d9304b6edad71--
