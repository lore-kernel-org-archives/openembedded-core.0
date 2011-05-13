Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QKvIw-0001Ql-49
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 18:33:30 +0200
Received: by bwz5 with SMTP id 5so2557159bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JJFG5T6SSYzVDPy0pK+2fY1zDsx3lA6w4/bunx2KBCs=;
	b=OCZ+wEslw46Pyht4Brwst//vDVSErLKeJ8lI7gsqS/0+eWbHJgmUhflpnmKtS48CtR
	bMCEPxPknj4AXSkSnuLpmBDyqVY0t2GQ2veSMDrSDQ7ULd/WOsr6lvwMGdRHx9ntbaJq
	uJhgkI/x9vJpXFt8sH1lEB3ue4rW8FbmR0tvk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=eFYCoAl5Wjl/2QhxkrAvgDaS2YSbx/Upc4JDAttZgQmx8mAuKqpV9xXPP2jtFcILId
	1afpu5PkZ6LkBwMnU924NlViJLJvkVwORNpSypzo8GMDrearr2HzIV4VTeNJo2a3M4rn
	bo1r8hpI96OEqIYBAXU0fPMO7IC9pXMmQocZE=
MIME-Version: 1.0
Received: by 10.204.143.88 with SMTP id t24mr699731bku.189.1305304239567; Fri,
	13 May 2011 09:30:39 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Fri, 13 May 2011 09:30:39 -0700 (PDT)
In-Reply-To: <201105131719.10997.paul.eggleton@linux.intel.com>
References: <201105131719.10997.paul.eggleton@linux.intel.com>
Date: Fri, 13 May 2011 13:30:39 -0300
X-Google-Sender-Auth: cKaxcdg2SpJQIYQcL4PYjIcU2QY
Message-ID: <BANLkTin7JgN9YrFmMiKDZvpwZyHPjkkZkA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Qt4 - removal of 4.6.3
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
X-List-Received-Date: Fri, 13 May 2011 16:33:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2011 at 13:19, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Saul has suggested that we remove Qt 4.6.3 from oe-core in line with our
> policy of only having one version of a package that doesn't have GPLv2/v3
> versions. Is this going to be OK?

I also think it is a better way to go.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


