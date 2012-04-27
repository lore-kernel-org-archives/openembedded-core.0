Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SNdgZ-0001Ue-Sa
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 07:25:40 +0200
Received: by qcso7 with SMTP id o7so189842qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Apr 2012 22:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=VvEPF0/APUxCXG/3RjG/4BJNQT1JuvPY4lfV2eNUJdU=;
	b=kWe8hMw70Od9jUjJRPTlb4H2G4GboKvWqm0VQou9ZkXEovEAalSPEVnmsH8OomQXU5
	pWuQTZcyC8hMzK8tLY6hlwh8rxCtQG7QfWPEugvtxEK6qGI/IKCGsGNgJQ4CUtliySPR
	Ud8sw1P6+q8XrZMhUxM3YY6PFYcPgL9Dnths37E6rCuIeRMR1tKh0dAItd1YVNrpEIlN
	D8/cjIDDBFOqCnZPqSh1HH2PhXC1LoXY27MvG9JN5iRHRR8z5de5UYdWFdSfVCqskPJD
	cdFuV92dE2GVfGsSQhmVzHhoh4rDFGClTIGf90/QGZWKxVWrYfHIqqxdCrzP7ShPIi5P
	OEKQ==
Received: by 10.224.211.5 with SMTP id gm5mr7757577qab.33.1335503761691; Thu,
	26 Apr 2012 22:16:01 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.79.79 with HTTP; Thu, 26 Apr 2012 22:15:41 -0700 (PDT)
In-Reply-To: <20120426174255.6739e594@wrlaptop>
References: <20120425203805.71113201@wrlaptop>
	<20120426160844.2d2a0b9f@wrlaptop>
	<4F99C5C5.8090901@windriver.com> <20120426174255.6739e594@wrlaptop>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 Apr 2012 22:15:41 -0700
X-Google-Sender-Auth: H6ljbqVXyOuROw8FK_rjpPq9XnY
Message-ID: <CABcZANn0Rzuf_oaP=8c6o7p8NK1afucYGQqmDLK-vb6K-FvAQQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Toolchain library whitelisting: A first pass (preliminary patch/RFC)
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
X-List-Received-Date: Fri, 27 Apr 2012 05:25:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 26, 2012 at 3:42 PM, Peter Seebach
<peter.seebach@windriver.com> wrote:
>> Change the above to:
>> =C2=A0 =C2=A0 =C2=A0multilibs =3D data.getVar("MULTILIBS", True)
>> =C2=A0 =C2=A0 =C2=A0if multilibs:
>
> If someone has done:
>
> MULTILIBS =3D ""
>
> this then ends up being confused because pairs[0] of the single
> returned item is still "", and that's not valid.


This doesn't make sense. If you do "if multilibs:" and multilibs is
the empty string, it'll evaluate as false, and that block won't be
entered.
--=20
Christopher Larson


