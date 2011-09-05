Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R0fLA-0003Jg-0I
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 22:00:20 +0200
Received: by bkbzu17 with SMTP id zu17so4483624bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2011 12:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=PXatOWRx12Bqorp7B5T4ziWuMLFEfjiTRZhYJOuucCM=;
	b=NqZpCjyXwyYFmvm2DjUrmf9tK7/nOJ3RDoXh9gGdcXdj/rx/QPXsbQBEFwtF1nRyBX
	UjvPYBVdDRn01hJCEfStoEMUHLBSscEjWC4SFApobAJpJMn/lVMNOsNdm9KkVQCG/JLM
	IlLo0P7SxNPqecqzA5UISQkml+HBW6yTiGLB8=
MIME-Version: 1.0
Received: by 10.204.146.155 with SMTP id h27mr2244074bkv.353.1315252519552;
	Mon, 05 Sep 2011 12:55:19 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.131.201 with HTTP; Mon, 5 Sep 2011 12:55:19 -0700 (PDT)
In-Reply-To: <1315251077.1243.16.camel@ted>
References: <CAP9ODKoei49fOtr7sySUQkbXY-yrdaF+cVydXXfwOXxtQ+8kyQ@mail.gmail.com>
	<1314394806.5939.264.camel@rex>
	<CAP9ODKp6igGGDY2AQL+VqhYZm-GmFrKKcLg=5gRMaq5jwp+2MQ@mail.gmail.com>
	<1314517270.5939.268.camel@rex>
	<CAP9ODKpdUMKw0RUHgzy5LnEupR9+wOuan7xiekefGitHSROBbw@mail.gmail.com>
	<1315251077.1243.16.camel@ted>
Date: Mon, 5 Sep 2011 16:55:19 -0300
X-Google-Sender-Auth: Z3-rhIGHrS87DnwqdB86XP1hTEc
Message-ID: <CAP9ODKq5aGvS1yWBs_Xk4QDEjHyEMe9ufzYdxxmJUNFX1=NiZg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Use of multiple GIT repositories in SRCREV but updating PV
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
X-List-Received-Date: Mon, 05 Sep 2011 20:00:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2011 at 16:31, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Just to follow up for the benefit of the mailing list, we were missing a
> patch Holger submitted a while back for this problem which has now
> merged into bitbake master. You can now tell the fetcher to use
> something other than "git" as the checkout directory.

Besides, on Meta-OE, I have put a newer version of  gitpkgv that
supports SRCREV_FORMAT as well.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


