Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RRm1X-0002V7-7w
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 15:36:07 +0100
Received: by bkbzs2 with SMTP id zs2so4508238bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 06:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=CO1+vP3m4J4uta0km6BRrqVo+2h4MSl+hKIW0Xb6WjA=;
	b=O9PQ3aBwuSHJj80FtJUjDcd7qOiR0g21DUW7M3zZOsv8Grg+mpJnn8GbZhmbXKzZCv
	KTy+S3lXPqMt5KmbIqBA8ZWIAK1GzwfaPDuUcLkqQCrcX10Y124O2j5VVaZhveXTvF8V
	c9L49Wj98NGBOYEd1pyXKwyZ+QkWMAbP0vRq4=
MIME-Version: 1.0
Received: by 10.205.128.19 with SMTP id hc19mr7704674bkc.9.1321712975700; Sat,
	19 Nov 2011 06:29:35 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.26.143 with HTTP; Sat, 19 Nov 2011 06:29:35 -0800 (PST)
In-Reply-To: <CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
References: <1321570027-29390-1-git-send-email-msm@freescale.com>
	<CAP9ODKqjGqLg3u-VzFBAqhVSDUBUwG5eFSTtZcv+Zo7mnPLEAQ@mail.gmail.com>
	<CAEsOVNeb2SLwPX74YDcA4-iFJ6TNm7OAkXUw9Fun-nBkVkhaMA@mail.gmail.com>
	<CAP9ODKpA3smbm3MhiXJCOnFqBOZs7DoSRomE1rZP6Ys0bkW2bQ@mail.gmail.com>
	<CAEsOVNcW=g+cjM9w_tECrmpX0pSoDj80ohtu253PK8h2cVpyRw@mail.gmail.com>
Date: Sat, 19 Nov 2011 12:29:35 -0200
X-Google-Sender-Auth: AG5_7_hYmHHAWaA0UeyyCalvzig
Message-ID: <CAP9ODKqyzY706Z+gpD6X2G2JBf6frki6S07=NabBxFMxB5pojg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove ttyS* from /etc/inittab that are not present
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
X-List-Received-Date: Sat, 19 Nov 2011 14:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2011 at 00:32, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Thu, Nov 17, 2011 at 6:29 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> I see your point but add more "must be online" requirements is wrong
>> IMO.
>
> It must be online though in this case?

The code you add needs to be running on target and doesn't work at
rootfs built time. This is bad and adds more complications to
read-only-fs support.

>> This could be done with a specific package that could mangle the
>> image at first boot if really need but doing it by default on oe-core
>> seems the wrong way.
>
> Isn't that exactly what this is doing?
>
> Easy enough to add this to a separate recipe or bbapends elsewhere if
> there is disagreement.

The need to diverge from machine default is the exception and this
could be handled on the image being built, as post rootfs hook or an
specific package with postinst to be run at target boot to setup it,
and not by default.

I see possible use cases for it, I just against it being the default behavi=
our.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


