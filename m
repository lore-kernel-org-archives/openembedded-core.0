Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SeR7m-0007Zy-P1
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 15:27:10 +0200
Received: by vbbfr13 with SMTP id fr13so2968543vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 06:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bESGwGbK5SDAyYuJeoaQULr0CM1vNtlj8LKHlA+9mco=;
	b=PhKHmpEUFGJbN37+WQpUHJPdLseKmJceWKp3nKpnVIurhLKeDZuCpm60XY7BLYwaXh
	Gu/dGVkrlKn/I1ZgvUcYUPr+hQe6COaJgyAv1F/WQeT/iaKpje52BM57oJQwtM10AcP1
	qok9KRn3VIxZd8MRw04SMlWsRWPoxDKhab+znbSMBOXZ8Mu7leKTElhrRTofMWhMvTjE
	Bo3OOQj21w6QVLiZHOGtZ/FIok9CU20DfH8thIvrZxDdhUJQPb8lpVmwtM7TRbQo//uM
	/s7EQayFsOJr67ZpsWI7oUDV4oQmEvvqBDqBdl+31vEi5V59/hPRcWjkuFA7fR7MInT1
	HC4A==
MIME-Version: 1.0
Received: by 10.52.100.229 with SMTP id fb5mr12177530vdb.102.1339506995659;
	Tue, 12 Jun 2012 06:16:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.155.130 with HTTP; Tue, 12 Jun 2012 06:16:35 -0700 (PDT)
In-Reply-To: <1339506820.8065.2.camel@ted>
References: <cover.1338658338.git.otavio@ossystems.com.br>
	<1339151624.27075.0.camel@ted>
	<CAP9ODKo415ewPTCpy5_dmziRRZgqesjof6zBKmjgHgDFO_XrcA@mail.gmail.com>
	<1339506820.8065.2.camel@ted>
Date: Tue, 12 Jun 2012 10:16:35 -0300
X-Google-Sender-Auth: SK2vgheQxgrk-3mebHaBFsjOZFI
Message-ID: <CAP9ODKo+n7CeTL=e2kdzP=P-5SD=djHGEt8E6KdTym8sEjj+aA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Fix build failure of openjade using newer host
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
X-List-Received-Date: Tue, 12 Jun 2012 13:27:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 12, 2012 at 10:13 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I appreciate you don't want to get distracted with something like that
> and I can't really ask you to do it so I've done it myself put out an
> alternative patch for review.

I did try to make it this way and failed. Nice you did find a way for
it; this is indeed the better way to fix it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


