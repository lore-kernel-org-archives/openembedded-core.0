Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SZkpR-00061C-1M
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 17:28:54 +0200
Received: by yhjj56 with SMTP id j56so3470486yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 08:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=pyMd+UQGWObje1JQTrPLfSb45nZ/7kTDJBRAjJNjS1k=;
	b=a7BCrPzZ1OgcI6VbH2gZHEMCmRZQitxZ7TOoRomxYnd33k/eXNHsVqsP/uwCuHP3ag
	p7anu7feG27xtDaRiiuNx2j3fFWGhq/wTiOjejotQ63SedNBsuD6krCy0vL92P7m75Wb
	J/7LKM0kaQ8Pjc8OhJogPFhp8B6n1MJdEDwwg+geL4YF97X1sHLVQ/aYDhpqH+3X+CpJ
	Ah6IoYUD/i8ZF7/l3dZp1y/zFPYevHCCpP9G9YPhXRAbCT4Y3U2CpgTkTMHvascw3Y1d
	q2Imqd2fLBKIp7xvMIP5S3UnQibAgvVSwhugtL7Z6+2FXgvdsnG1VBAuLfA2AOvwzg1J
	Sy1w==
MIME-Version: 1.0
Received: by 10.50.208.34 with SMTP id mb2mr11250312igc.5.1338391113407; Wed,
	30 May 2012 08:18:33 -0700 (PDT)
Received: by 10.231.233.196 with HTTP; Wed, 30 May 2012 08:18:33 -0700 (PDT)
Date: Wed, 30 May 2012 17:18:33 +0200
Message-ID: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: target rpm build failure
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
X-List-Received-Date: Wed, 30 May 2012 15:29:01 -0000
Content-Type: multipart/alternative; boundary=14dae9340cade29dfc04c1427640

--14dae9340cade29dfc04c1427640
Content-Type: text/plain; charset=ISO-8859-1

Hi All,

I'm falling in error building rpm-5.4.0 for target.
It fails on undefined reference to xmalloc, xcalloc, etc... that however
are internally defined and used as wrapper for real malloc, etc...
Please, can somebody try to build this package for me?
NOTE: the rpm build inclusion is dued by the "package-management" added in
the IMAGE_FEATURE for core-image-minimal.
NOTE2: I've pulled latest oe-core since two hours.

Many thanks for your help.
Giuseppe

--14dae9340cade29dfc04c1427640
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div>=A0</div><div>I&#39;m falling in error building rpm-=
5.4.0 for target.</div><div>It fails on undefined reference to xmalloc, xca=
lloc, etc... that however are internally defined and used as wrapper for re=
al malloc, etc...</div>
<div>Please, can somebody try to build this package for me?</div><div>NOTE:=
 the rpm build inclusion=A0is dued=A0by=A0the &quot;package-management&quot=
; added in the IMAGE_FEATURE for core-image-minimal.</div><div>NOTE2: I&#39=
;ve pulled latest oe-core since two hours.</div>
<div>=A0</div><div>Many thanks for your help.</div><div>Giuseppe</div>

--14dae9340cade29dfc04c1427640--
