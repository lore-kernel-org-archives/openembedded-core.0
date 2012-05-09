Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRvzh-00026L-H7
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 03:47:09 +0200
Received: by eekc1 with SMTP id c1so1746284eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=iXLqwAmv0TZuMhai7DhuWp37t4N3aM1gmyfdXi+aK8I=;
	b=ijjUYlg+EAk/SVhoGLGriGtc3+RfSessyLVDhB07dbn+vvsJxfobYyv36W+v7vh1Rp
	ZO6f63yDGrPV56UD6mnBVtjjbL+LQ84fR/X/GYSlWj0ljbkCtJw0pVtzaTOFm7vh8H1S
	SxfmFcrZh5bS7GXlrzhszRpWBueMP1myXiYEIb83m+9J7NYQ8mgZTZys4MkSgGtDd1yL
	r4e1Yc6/FEXxZBaTARVZVcw4cQoBsIXDrmYOLFQkUXQf2oK68HbO0Ue11SbIJj6h3HX+
	yjRwihM+6B5q5H5QW9vT2uTbnlo6+C1BUPmPH4J5IrwvhOJvi46fDYafzTOQxiabQC2u
	qCDA==
Received: by 10.14.187.1 with SMTP id x1mr3836023eem.101.1336527437523; Tue,
	08 May 2012 18:37:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 8 May 2012 18:36:46 -0700 (PDT)
In-Reply-To: <CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 May 2012 18:36:46 -0700
Message-ID: <CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Wed, 09 May 2012 01:47:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 8, 2012 at 5:59 PM, Marko Lindqvist <cazfi74@gmail.com> wrote:
>
>
> =C2=A0You should know that I'm just figuring out what to do with
> "rtld(GNU_HASH)" that already exist for eglibc. When building
> deb-packets based image, that results in:
> "reference to 'rtld': error in version: version number does not start
> with digit"
>
> =C2=A0I've confirmed that error message is caused by this by simply
> removing "(GNU_HASH)" -> eglibc build success

yeah this is rpm brain damage actually that we are dealing with here.
I think rpm should be fixed for this. I am not entirely sure why this
would be needed on current OE-Core lets say if its needed it should then
be made specific when someone is using rpm for packaging.


