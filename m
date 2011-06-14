Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QWMaE-0005ya-Gn
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 07:54:38 +0200
Received: by fxm19 with SMTP id 19so4010137fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2011 22:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9HvSBS3n+D1YqQuiqrKR33hITie+MbALhYTHMv8jc0c=;
	b=hIdnoBzBsmBgHSLrXOxhLb73iLo2Bx3zjId+KwOXI5Vxo5ytdLE79hdHzlF/XLja8g
	il2dydi9VplnyM8h0ATnJKi+lYmpfYS5ODXRlqmHR22Qk1fyZrOFwf8DUmXPOtziVQ0o
	D0mWljDnagotE2SRmQzpM3GNMkm54H2hhpibA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Q6rw5twidNArtewV6yjJYkC0Qx1nmVjTgk5XcRaSopmcHmSN4M5IMBj+0Kr4lJXZCS
	7pWaeHk6+fdQFfi1mQ3+0mtyIMlEcdlsyNg8fxn8T342jC4sEN8Yk0hPsswWokjxPm9a
	MLlFS6jJGc295cF5I1ZHErovHY7iXBuh2kMfQ=
MIME-Version: 1.0
Received: by 10.223.32.142 with SMTP id c14mr801192fad.59.1308030673371; Mon,
	13 Jun 2011 22:51:13 -0700 (PDT)
Sender: anders.darander@gmail.com
Received: by 10.223.109.19 with HTTP; Mon, 13 Jun 2011 22:51:13 -0700 (PDT)
In-Reply-To: <BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
	<BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
Date: Tue, 14 Jun 2011 07:51:13 +0200
X-Google-Sender-Auth: cdildqcv5hz7DKKLhgEOK8SWtf4
Message-ID: <BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Tue, 14 Jun 2011 05:54:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 00:22, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2011/6/13 Anders Darander <anders@chargestorm.se>:
>> + =A0 =A0 =A0 =A0# We have bitbake in PATH, get TMPDIR from bitbake
>> + =A0 =A0 =A0 =A0TMPDIR=3D`bitbake -e | grep TMPDIR=3D\" | cut -d '=3D' =
-f2 | cut -d '"' -f2`
>
> This change inspired me just another crazy idea.
> Getting some variable from bitbake is frequently used task. May be our
> bitbake people will add some special mode to bitbake for this? E.b.
> like bsd make have (make -V KERNCONF)[1].
>
> I would suggest syntax like 'bitbake -V TMPDIR'

That would definitely simplify a few lines in a number of scripts.

I'll put it on my todo-list, although it is getting rather long now
(with very little time allocated for working on that list)...

Regards,
Anders


