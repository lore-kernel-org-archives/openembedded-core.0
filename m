Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJmJM-0008Lz-4Z
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 14:45:12 +0200
Received: by wwb17 with SMTP id 17so5642595wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 05:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=cn74haO9RRR731B2EJert3z14YLz8NDQniKBcG6fofo=;
	b=iMBH08jLWVoZtG9kBLVks+uxfNiUpNiSBb2LTjtFYa7XxA4ibb84XH53w5c5+KsBAh
	6ELVYnTCAr4v68XbbkV4SmhcqjTW65mk76IJFMzVOkvP0+TdvmOwxSNx5NguK2JQoXqN
	vxF1u3awWB8tOB8NnS4dfopuLBidxHN1hZNLA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=xKYt2xo0fcBCzjgN7inJX9KfnrfcboKSt2EoT+Mo/zL4eMbHclmuWsCBBBwKvcvsUa
	p9PSl7okLkBCTaU5QloXfB8lJFxtignU5K1j4ERFEAGgd7SpiWYusL0TsUfpNwABfNVb
	t24LsbR4r8ZDyICUFnMTtfS3L7GaTDLWZ7xFg=
MIME-Version: 1.0
Received: by 10.216.82.77 with SMTP id n55mr115188wee.52.1305031346811; Tue,
	10 May 2011 05:42:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 05:42:26 -0700 (PDT)
In-Reply-To: <1305017425.30391.252.camel@rex>
References: <cover.1305004776.git.sgw@linux.intel.com>
	<c0f7ebbe59b32dace3ae8a4a5dab8622b09f895b.1305004776.git.sgw@linux.intel.com>
	<1305017425.30391.252.camel@rex>
Date: Tue, 10 May 2011 09:42:26 -0300
X-Google-Sender-Auth: PiguAem2otH9rpXxGsyuqLhc7Sc
Message-ID: <BANLkTin2N5edkKyWu-wKfqkeB6VUJVdTrQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 25/30] cmake.bbclass: fix qmake and rpath issues
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
X-List-Received-Date: Tue, 10 May 2011 12:45:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 05:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
> We could unconditionally make native.bbclass set the override too...

I can revert this part of this and provide a patch to native.bbclass for it=
.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


