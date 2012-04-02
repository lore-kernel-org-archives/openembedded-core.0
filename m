Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SEp7s-0003q1-Ax
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Apr 2012 23:49:24 +0200
Received: by qcso7 with SMTP id o7so1871093qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Apr 2012 14:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=BTFPxdynzfgE6QNuus6AEAM0sONjIPUStR4jeAZioVs=;
	b=JGvvWWK+5P3uRzlghY8wjN+n2GtIuJopxVIAqucrOLiC0LDmoWix70RYzP/+ZeG7Zf
	VbFynWm6ANSpfr0aTg4krmKb+XMbTl1n53XMbGJ7ClaypeCWKCJ6DqdNnGK7alFONx+9
	o2ZJJfPFvjqEovP/8oad3DkvgtLa7Wuwx1HeFJxvLN/oSMoHhKKoYvqDaDWVbY7n/7eN
	efs5yXIDE4HrSFujsi9dLRsIXO2O2NMJSub7lmPW9ZkX8xZQvXgkaGwjeiyZVaaCTZMA
	FViq77+Bo5Tz9ZmdqMP1V8wf7Z8tfNBjbJbtp4GuRGAMu5CE+hgQMVnCTRgsG9nJKBA+
	DHoQ==
Received: by 10.229.111.199 with SMTP id t7mr4038973qcp.84.1333402815400; Mon,
	02 Apr 2012 14:40:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.24.196 with HTTP; Mon, 2 Apr 2012 14:39:55 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1204021730530.6159@oneiric>
References: <alpine.DEB.2.02.1204021730530.6159@oneiric>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 2 Apr 2012 14:39:55 -0700
X-Google-Sender-Auth: vV2yx0FVZPxGFd0e13GNaJyfGLc
Message-ID: <CABcZANkiGGT2see21u3cTMa8QiAFaskRchhLEMAAo==zrfS4Xg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: should all class files be inherited by *something*?
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
X-List-Received-Date: Mon, 02 Apr 2012 21:49:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2012 at 2:34 PM, Robert P. J. Day <rpjday@crashcourse.ca> wr=
ote:
> =C2=A0poking around the meta/classes/*.bbclass files and one looked a bit
> odd -- scons.bbclass. =C2=A0i was under the impression that class files
> were supposed represent a *general* kind of functionality so i was
> curious as to what this file represented.
>
> =C2=A0more to the point, it doesn't look like anything in oe-core inherit=
s
> that class. =C2=A0so what exactly is its purpose?
>
> =C2=A0and following up on that, another example of that kind of file is
> oelint.bbclass -- again, i don't see anything in oe-core that inherits
> it.

There will *always* be classes that aren't inherited by anything. Look
at devshell. Some classes will always be opt-in only.
--=20
Christopher Larson


