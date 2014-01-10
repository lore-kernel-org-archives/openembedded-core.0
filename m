Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7A20260CF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:41:32 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id uz6so5085708obc.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=U2Xi/0ZyIStrK8ne2DB6Ta8NU91bRadrfgt0hRBK3VQ=;
	b=loyKAR9GirbNUYay6DzDSI0DJRkLA2nMDVwOSzpzAXYDUyJs/DTF4dlKPXLxvr4hUM
	pCYhrgFhLC+t/kPPDr4P/rZ9a5DX0+h3M8hEpfK3qFC9D7PSn1aE7qVOHf2TCB/f64YI
	Iu8QyKppCrS9vq1Wcnso/G8bS8iz3kOJAuNNdSx9yrbNoTQ8ZN0HTBOjwy39gjHGGLWo
	OPJZlcNcnLC1wKV6CjVqLsHiJvYbz13krG8AznR2yMFgQekX1636ud9BHtJenwmusLFz
	qI6t2rghA28DjBSgRDPbDU7IfwAi/+Y/QA9Df8ouKT7GWrBb9kBW4cxe3KvzrOS+eBzb
	Wkeg==
MIME-Version: 1.0
X-Received: by 10.182.78.68 with SMTP id z4mr8995887obw.29.1389375692872; Fri,
	10 Jan 2014 09:41:32 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 10 Jan 2014 09:41:32 -0800 (PST)
Date: Fri, 10 Jan 2014 15:41:32 -0200
X-Google-Sender-Auth: 71RCHW1gWPWn5bEvUe1w-afxct0
Message-ID: <CAP9ODKpJzcrWy2RjpLJeS-KJCrNHYM+UPh2-NU9icnaBuJSSXA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: GCC bugfix backport into Dora
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
X-List-Received-Date: Fri, 10 Jan 2014 17:41:32 -0000
Content-Type: multipart/alternative; boundary=047d7b2e4d52a222f504efa13cd4

--047d7b2e4d52a222f504efa13cd4
Content-Type: text/plain; charset=ISO-8859-1

Hello,

The Dora branch seems to be affected by a toolchain bug:

http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57532

4.8.2 includes this bugfix and I'd like to know if it is planned anything
in this direction to Dora or not?

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--047d7b2e4d52a222f504efa13cd4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>The Dora branch seems to be affe=
cted by a toolchain bug:</div><div><br></div><div><a href=3D"http://gcc.gnu=
.org/bugzilla/show_bug.cgi?id=3D57532">http://gcc.gnu.org/bugzilla/show_bug=
.cgi?id=3D57532</a></div>
<div><br></div><div>4.8.2 includes this bugfix and I&#39;d like to know if =
it is planned anything in this direction to Dora or not?<br clear=3D"all"><=
div><br></div><div>Regards,</div><div><br></div>-- <br>Otavio Salvador =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =A0 =A0 =A0 =A0<a href=3D"http://code.ossystems.com.br" targ=
et=3D"_blank">http://code.ossystems.com.br</a><br>Mobile: +55 (53) 9981-785=
4 =A0 =A0 =A0 =A0 =A0 =A0Mobile: +1 (347) 903-9750<br>

</div></div>

--047d7b2e4d52a222f504efa13cd4--
