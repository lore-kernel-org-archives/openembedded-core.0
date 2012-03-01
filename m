Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1S38cP-0002ZY-Nw
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 17:12:37 +0100
Received: by vbbfr13 with SMTP id fr13so601024vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2012 08:04:07 -0800 (PST)
Received-SPF: pass (google.com: domain of otavio.salvador@gmail.com designates
	10.52.240.177 as permitted sender) client-ip=10.52.240.177; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	otavio.salvador@gmail.com designates 10.52.240.177 as permitted
	sender) smtp.mail=otavio.salvador@gmail.com;
	dkim=pass header.i=otavio.salvador@gmail.com
Received: from mr.google.com ([10.52.240.177])
	by 10.52.240.177 with SMTP id wb17mr8941049vdc.63.1330617847646
	(num_hops = 1); Thu, 01 Mar 2012 08:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wchNi6raKQetMjyD7jAhg+tSxol7WjoA0/scgyFm/0k=;
	b=ap6jF2UQ0Bk4JNzI6s6mhVzlS5ekt92mFu/tZmIRcr2GYVOBLL06I1OqFBQCxagukJ
	qlTSjYKFzJ7G8/18OixCxsIbNKk0br46XRkVZ6cnoEpl7OxQhbF+/ndd266IEHI9QeSV
	IICKBslJwMLWIEcAuIJqFrmsz6Yig4CIHBdNU=
MIME-Version: 1.0
Received: by 10.52.240.177 with SMTP id wb17mr7550612vdc.63.1330617847605;
	Thu, 01 Mar 2012 08:04:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Thu, 1 Mar 2012 08:04:07 -0800 (PST)
In-Reply-To: <4F4F9B21.3000407@mlbassoc.com>
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted> <4F4F918B.4010404@mlbassoc.com>
	<4F4F9552.8040107@mlbassoc.com> <1330616672.31767.23.camel@ted>
	<4F4F9B21.3000407@mlbassoc.com>
Date: Thu, 1 Mar 2012 13:04:07 -0300
X-Google-Sender-Auth: GPqzeLXALc65Uaq_J56kENWhLFc
Message-ID: <CAP9ODKqmYL2QPDJk8AdDOxoL+EZ+B4y7OwLbsZ-+NDRLjxz3+Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 16:12:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 1, 2012 at 12:52, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-03-01 08:44, Richard Purdie wrote:
>> Is this going to cause us a problem in real world usage? I'd hope in the
>> general case we use standard formatting?
>>
>> I have to admit I'm getting more than a little frustrated with what
>> seems like a continual set of changes bouncing this format around in
>> different directions :(.
>
> I agree and I'm sorry I missed this in my first change - I was just
> trying to make the time stamps be consistent.
>
> As far as I can recall (which is a really long time), 'date' has always
> wanted the format MMDDHHmm[YYYY], so I think that's what we should expect=
.
> That format doesn't compare easily which is why the timestamp was changed
> (not by me) to a more ISO standard YYYYMMDDHHmm. =A0If busybox has 64-bit
> math enabled, then this can be compared with no problems, it just has
> to be munged into the format 'date' wants.

So we can have compat and 64-bit math and have it properly behaving?

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


