Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SGEU5-00051e-Am
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 21:06:09 +0200
Received: by vbbfr13 with SMTP id fr13so1466356vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2012 11:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qOVcs+1qFV3zoiGI9EGgE/BqvCz7wzjhAWhKgDGS5ks=;
	b=n8pu4nmC78rWhejQL3XlH8tVSUQ1n7ZA6bJie8n06NMpVsJJDAMNAyQk1+U5TLiBxN
	EpHDnqzhtYAKj/myHhMw04e6EJ9YSLf23vOMVGF611l1hRpuMM8AgKzXgJWdBexorRx3
	gl50rdOV2EK+oT/RU/KdOQVC2pauzH9BTB8K6ItW0WWndO5n2QIjcOB0tM7DAw1ZywQZ
	ZaNDp6wC2IR2ieocPrJjZVQr6rjangT90cYZnSfkXbwdX2P453H6FppgtNcvgripWfoQ
	0ydiPKyE190FEpHw9PIBZQFrHVVqpndVse9CjX5LrfV2tHdGJh+5lV7Hmxo4toK4uDXz
	4njQ==
MIME-Version: 1.0
Received: by 10.220.228.200 with SMTP id jf8mr476206vcb.0.1333738615754; Fri,
	06 Apr 2012 11:56:55 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.2.195 with HTTP; Fri, 6 Apr 2012 11:56:55 -0700 (PDT)
In-Reply-To: <1333202821.18082.225.camel@ted>
References: <1333202821.18082.225.camel@ted>
Date: Fri, 6 Apr 2012 15:56:55 -0300
X-Google-Sender-Auth: zImS0w8BxfTohw2XRNwKYYF8ayo
Message-ID: <CAP9ODKrMHgjHt4fa4s40+_3QL9zVb2boK0KFia-iLpQSiQ2p-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Re-execution of tasks - test report and results
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
X-List-Received-Date: Fri, 06 Apr 2012 19:06:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 31, 2012 at 11:07, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As some people have noticed, there are some rebuild issues happening due
> to sstate and the use of hashes in the stamp files. By this I mean the
> case where due to some checksum change, some task gets rerun and the
> task was not written to run a second time.

I had failures today at:

perl
python
wget

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


