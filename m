Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TCAVW-00073A-A8
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 16:35:06 +0200
Received: by lban1 with SMTP id n1so1804689lba.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=AniLFjGi0VD5o/4xAcCSI2QJ4MNOh7tlJxTRbUUTynA=;
	b=smvzgz/5dPp110YD3qdE/+IQl1pwSGi4qlJ/oWt4wrkKXeE4uDO/FR+iJkSJF+Dcbu
	M2kVf14Jgs2enVnNE1l9gC0Prjf9QgjhjYO9KwtWNa+KRV8QRym5WNB/EsRfIlmfwuWn
	lQ0OkD3djvRW8amfg86ZF42uv6fDEKoV+kE83M7L2V5xkJ1V7r4iB5p0SvqX1kKKIKPX
	90CN/ffcf7vALBqqHa94wgyU2mmxb9ppOYQUlkV0z4DespyJDI6cbauuRpGbPVvBYrP5
	KhrO/ov1HnOJyk1znar1zZySsex2I5ybch7WSNdRSGCY8zh0d/XH7cZUXhDUglPe/2GR
	SoXw==
Received: by 10.152.109.212 with SMTP id hu20mr2175642lab.3.1347546152583;
	Thu, 13 Sep 2012 07:22:32 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Thu, 13 Sep 2012 07:22:12 -0700 (PDT)
In-Reply-To: <CAP9ODKp8sKpVMi9MwdFxwZTq2-VMiRGzDzD=bBrFu8r4hZ0xMA@mail.gmail.com>
References: <cover.1346905978.git.raj.khem@gmail.com>
	<5c54fcdb91d19909f8658b6a6e8d6e6cac934cf2.1346905978.git.raj.khem@gmail.com>
	<504FF70B.7060701@mlbassoc.com> <1347458928.11710.21.camel@ted>
	<CAMKF1so6qUDFMw_aOZTdC4W_Dh=rDiiC1O7pvjaUQS2xkG8xWg@mail.gmail.com>
	<20120913121935.GC18675@giant>
	<CAP9ODKp8sKpVMi9MwdFxwZTq2-VMiRGzDzD=bBrFu8r4hZ0xMA@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 13 Sep 2012 07:22:12 -0700
X-Google-Sender-Auth: IneFW3kZutLv2yDhw9UItpLvAQg
Message-ID: <CABcZANkbpR66G2-4WnBjdcjUGd4Khbje-kvpd2geUaVMMxE=4A@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gcc: Switch SRC_URI to use svn
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 14:35:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 6:06 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Thu, Sep 13, 2012 at 9:19 AM, Bj=C3=B6rn Stenberg <bjst@enea.com> wrot=
e:
>> Khem Raj wrote:
>>> I agree but then 1.7 GB is noticeably huge too and it will only become
>>> larger in future so I don't think fetching from git will be a good solu=
tion
>>> for gcc ever.
>>
>> Can we use shallow clones? A quick test of gcc-4.7 gave me a 308 MB tar.=
gz when cloned with --depth 1.
>
> I did not check if the fetcher has this support  but it would be a
> nice solution.

Shallow clones won't be able to support SRCREV properly, as you can
only clone shallowly from HEAD, not from an arbitrary point in
history, AFAIK.
--=20
Christopher Larson


