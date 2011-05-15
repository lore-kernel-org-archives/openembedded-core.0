Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QLeHK-0006tZ-Ht
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 18:34:50 +0200
Received: by bwz5 with SMTP id 5so3565917bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 09:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XIAC2OKdiEjpOedEmc3bwmQ/NqSZFSuZZA16JlExNgA=;
	b=BLw7i5VIL5S0xJigpXwiYoh92cFBYnv1+lSw3EQdyzKh/UchbWJowOz6wVb5CYowht
	JU7CKtdAUP42kGkt/pG6zEZkzrSDIKbQZPNIS44K3RcU9lzfUURYg7cCrzBylxfZv12p
	es1rBJ5vns2XwTochC6S8y0G/cU9H5P7rdRZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=KgXE697ar0XWKLyobGKXWQO7Xg0RDV5mOKySQMxAkZzpUYVfI/vSSH3DJt46c5IWwk
	jKieElU9sFz2SfT4i7pKFI7BPwV41lyINWT4ZcMrGczs4HXrifGl2HronZhzJZbgVaka
	BHB2lKzWrx2GzeAxlTyJUAqoyekqfys4545gE=
MIME-Version: 1.0
Received: by 10.204.134.207 with SMTP id k15mr3384884bkt.135.1305477119205;
	Sun, 15 May 2011 09:31:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.79.70 with HTTP; Sun, 15 May 2011 09:31:59 -0700 (PDT)
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Date: Sun, 15 May 2011 13:31:59 -0300
X-Google-Sender-Auth: -3y6H1Jnm4jHpYc16RQuTJHR_5E
Message-ID: <BANLkTim0qhXCPJgQhD1bkbA_PxYuNp0yLw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 00/15] 14-May Consolidated Pull
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
X-List-Received-Date: Sun, 15 May 2011 16:34:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, May 14, 2011 at 22:32, Saul Wold <sgw@linux.intel.com> wrote:
> Some LSB Fixes from Kang, ARM and MACHINEOVERRIDES tweaks from
> Khem, and some glib and defaultsetup changes from Martin.
> Along with a QT4 Update from Paul.

You missed my last version of:

cmake: add support for oe qt4 tools names

Please add it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


