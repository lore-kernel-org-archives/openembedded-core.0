Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TJ2wA-0002E1-3m
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 15:55:02 +0200
Received: by pbbro12 with SMTP id ro12so8918778pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2012 06:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=gsnHvjWBDRFfpcY86JinOohKJrFwlnSvHZUiIaKO5QY=;
	b=Nu7WJIGZnNgGqdKhCdX1fJr0Rnv+6MPavXffyUiCPMj8NFYpbBVi8Hts6Lc3siD/O2
	Iab4NbgMwKEzV7Mi6Ja9RwR5YK69kREv6BghKCxQ9EvaHFYlBwPB6Jl77a4GN4SEAkgv
	xxnsgQRfCIcGUMVQexk0vJee2Z0TYgp4DlRP+E2rx+6GM1g50HSH9Up/Qp//oovWdgQs
	Fx4/iMUbaqO3j6mkHGIuaoPTOEdXQ1KSAFcQCKtlD8ZG3Y5OFY1pitZmUqM5QqZI6mNU
	WXgXJPScP+kQ3m7qBvXmQwtRxVaWCupHwBw4BWGtEuStrCJ1ZxRsDOFVav4ldBUyAzDb
	GaFA==
MIME-Version: 1.0
Received: by 10.66.75.74 with SMTP id a10mr44377148paw.46.1349185322944; Tue,
	02 Oct 2012 06:42:02 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.36.105 with HTTP; Tue, 2 Oct 2012 06:42:02 -0700 (PDT)
In-Reply-To: <1349177925.15753.140.camel@ted>
References: <1349169606.32611.73.camel@phil-desktop>
	<1349176346.15753.139.camel@ted>
	<1349176541.32611.80.camel@phil-desktop>
	<1349177925.15753.140.camel@ted>
Date: Tue, 2 Oct 2012 10:42:02 -0300
X-Google-Sender-Auth: 2TB0bf_Z4aTGfC3rpQh6k3EOy0Y
Message-ID: <CAP9ODKqk-xe4vgx1aLJKgnceBU5Ds3RGKCZYkEo3sCKc4OGZaQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rootfs_ipk, image: Add debug capture support
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
X-List-Received-Date: Tue, 02 Oct 2012 13:55:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 2, 2012 at 8:38 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-10-02 at 12:15 +0100, Phil Blundell wrote:
>> On Tue, 2012-10-02 at 12:12 +0100, Richard Purdie wrote:
>> > Hasn't Paul added a general mechanism for doing this so we could add
>> > this feature a level higher so that it could be used by all packaging
>> > formats?
>>
>> Ah, possibly.  I'll have a look.  Can you give me a pointer to the
>> mechanism you were thinking of?
>
> Something like IMAGE_FEATURES += "dbg-pkgs" should trigger the addition
> of dbg packages.

Or IMAGE_FEATURES += "dbg-img" ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


