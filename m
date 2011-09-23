Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R78tR-0002W4-Iz
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 18:46:29 +0200
Received: by bke11 with SMTP id 11so4030456bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qCqgStB3+Ix1M4CaLUQ87PNzsEq0XAYNibQRktVkBMo=;
	b=Gz5f3wa3BJGECqJCSIwH+SJ4YmCPqaybJB42zR0NFdDi3bcrgU8f1Vo1FkiNRD7R6M
	HSpmGiHqP4ifb3k557OO3+anpEnRf2BC9CJVZRKJoWkc8RAUzCITG492DY5TCqGQ72fi
	TO+qSXEAYj/veB6bNO24kwQSFv+/wG9NOge+g=
MIME-Version: 1.0
Received: by 10.204.138.193 with SMTP id b1mr2710289bku.114.1316796068677;
	Fri, 23 Sep 2011 09:41:08 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.35.198 with HTTP; Fri, 23 Sep 2011 09:41:08 -0700 (PDT)
In-Reply-To: <1316734501.28323.18.camel@ted>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
	<1316734501.28323.18.camel@ted>
Date: Fri, 23 Sep 2011 13:41:08 -0300
X-Google-Sender-Auth: O4_xTpQ6Fr93w7KmAE_-ua79Akc
Message-ID: <CAP9ODKqWLVrKRE+HT4k82f+BYdY96N_h581dp8u0AETWBTQV0w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Fri, 23 Sep 2011 16:46:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2011 at 20:33, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-09-22 at 09:49 -0300, Otavio Salvador wrote:
>> I noticed the 2011-1 branch today and it seems it is not fully merged
>> into master; this is a mistake since it will create an upgrade path
>> problem for users of it.
>
> Its a branch, master continues on, that branch just gets fixes suitable
> for a stable/release branch. I appreciate people have different
> definitions of stable and we need to do a better job of documenting what
> those criteria are. As a quick attempt:

The point here is not about what is allowed to get into it or not but
how it is going to work related to master.

The point is that if we keep it as a branch and doesn't merge it into maste=
r.

If we merge the stable branch into master, from time to time, users
that want to go to move to master can merge master into their branch
as it has a common parent and the conflicts fixed. If it is done too
late, it becomes a nightmare.

This is something I'd like to discuss and see how people think about
the process and what way we ought to use.
--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


