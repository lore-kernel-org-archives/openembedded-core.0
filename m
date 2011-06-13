Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QW9CT-0004WX-Jn
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 17:37:13 +0200
Received: by bwz5 with SMTP id 5so4507419bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 08:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=E3UXd2mLtSxiU9RfBcd4i2gRH4CTk/Dwah9bmH9/ZlE=;
	b=W295iFa9GIzlErAiQOAj/X2UH+08cXQxkUPv0rFUIDP9KJNmhba6W1fM2xknaiCPQS
	UN1wsjNaSfCfwawe3N5SLXh93kXF9Wbe8bynFdkQfaG1yWPLNR8aRQR2KrDfBSau0S6L
	3wECOCWYbb/Swjopr7vtSi2gw4nUb2kTH+8L0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=d2UGKfsPuDfs4LCR/3jYTIhXrkGca0UFnX78zvi1uMhlB3ssH5X9wuMcSkcR3OhOs1
	Og0xtJI6F/C1q3x/GUmRx6RjsP/+xbuJmC4qemfZxeD3o+IjiED1GWHweMUGOj7Gk3bJ
	Z4XmozLT2g5wn/tqXx5OFNo8kq1si/gtd8gr0=
MIME-Version: 1.0
Received: by 10.204.40.199 with SMTP id l7mr1865779bke.103.1307979227388; Mon,
	13 Jun 2011 08:33:47 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.116.82 with HTTP; Mon, 13 Jun 2011 08:33:47 -0700 (PDT)
In-Reply-To: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
References: <33AB447FBD802F4E932063B962385B3554AE4989@shsmsx501.ccr.corp.intel.com>
Date: Mon, 13 Jun 2011 15:33:47 +0000
X-Google-Sender-Auth: ZduqyAPgtwDTZs8J89t2PVLzYSg
Message-ID: <BANLkTikZxd4Gg0b0nanMupmdYBf-3LUp7g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Eggleton, Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCH] RFC - combo layer repo tool
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
X-List-Received-Date: Mon, 13 Jun 2011 15:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/6/13 Yu, Ke <ke.yu@intel.com>:
...
> =A0 =A0Combo layer tool provides three functionalities:
> =A0 =A0- init: when the combo layer repo and component repo is not existe=
d,
> =A0 =A0 =A0init will "git init" the combo layer repo, and also "git clone=
" the
> =A0 =A0 =A0component repo

I think it is duplicating many features of git submodule. It seems
more logical to put a script above git submodule rather then use a
full repository for it.

Am I missing anything?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


