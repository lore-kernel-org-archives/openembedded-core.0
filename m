Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ64d-0006hv-Jq
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 20:25:35 +0100
Received: by bkbzt4 with SMTP id zt4so3371270bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=HyOsW7kHkPcPk5Iy6Hzehr1WHP1C74bT/08q+2W6Tu4=;
	b=HPcbgYRcJw4ewEoAalMek8vmtsq12nqVbnO7qu6cfcM4TbYfuggmDip7QPZUD+On6E
	3+7lAsIL+7IHLNJUz87m2CsMlzIWm8b1EMUEkMu7QChi7cME7Vo2+skfvhQ6RajXD2LY
	Z9bd3tsQtNMbNPsjLjilorAi5jCqS6BP2izxE=
MIME-Version: 1.0
Received: by 10.205.128.3 with SMTP id hc3mr1646345bkc.29.1323458324681; Fri,
	09 Dec 2011 11:18:44 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.113.132 with HTTP; Fri, 9 Dec 2011 11:18:44 -0800 (PST)
In-Reply-To: <4EE25DB2.3060803@linux.intel.com>
References: <1323456842-16941-1-git-send-email-otavio@ossystems.com.br>
	<4EE25DB2.3060803@linux.intel.com>
Date: Fri, 9 Dec 2011 17:18:44 -0200
X-Google-Sender-Auth: NEZ_-rGshldjeJPkHQNchisyUC4
Message-ID: <CAP9ODKrpm3oRSby5=biozhr8k5=bvVAjqkxh7w7_2r21bNp_rA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: disable ntp support
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
X-List-Received-Date: Fri, 09 Dec 2011 19:25:35 -0000
Content-Type: multipart/alternative; boundary=000e0cdfc8365153c904b3ada753

--000e0cdfc8365153c904b3ada753
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Dec 9, 2011 at 17:12, Darren Hart <dvhart@linux.intel.com> wrote:

> | checking linux/if_alg.h usability... no
> | checking linux/if_alg.h presence... no
> | checking for linux/if_alg.h... no
> | configure: error: User-space algorithm header files are required
> | ERROR: oe_runconf failed
> NOTE: package connman-0.78-r2: task do_configure: Failed
>
> Not sure if it's related, but connman still doesn't build for me with
> this patch applied.
>

It builds fine for x86 and arm7 here.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--000e0cdfc8365153c904b3ada753
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Fri, Dec 9, 2011 at 17:12, Darren Hart <span =
dir=3D"ltr">&lt;<a href=3D"mailto:dvhart@linux.intel.com">dvhart@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">| checking linux/if_alg.h usability... no</div>
| checking linux/if_alg.h presence... no<br>
| checking for linux/if_alg.h... no<br>
| configure: error: User-space algorithm header files are required<br>
| ERROR: oe_runconf failed<br>
NOTE: package connman-0.78-r2: task do_configure: Failed<br>
<br>
Not sure if it&#39;s related, but connman still doesn&#39;t build for me wi=
th<br>
this patch applied.<br></blockquote><div><br></div><div>It builds fine for =
x86 and arm7 here.</div><div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: =
<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossyste=
ms.com.br</a>=A0 <a href=3D"http://www.ossystems.com.br" target=3D"_blank">=
http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--000e0cdfc8365153c904b3ada753--
