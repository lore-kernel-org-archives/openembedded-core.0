Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tbw1v-0002fg-2M
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 17:23:03 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so4607603pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 08:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3Yj5OuifRP60o6Pp7zPh9vBd9cG0feE3G3MJr8jqpPo=;
	b=f6gBOF9J2engCe54WvjuynPVW5eMEBdPl6VMVstNWOpGEFTlZSUXn72+b5tYim+r2f
	9gT7cIqqR7iALg1KoQoGM3Ncp/i3F17zd1J0YXu2ANDPkyrx9lXGYK0rnLRqMC97r5X5
	oSU2yS77+1WWF925moZ0xpLNcj/BDi+rxP57ShMhEbIIjJaogmEAfHw/rcU5FH04IWPx
	cCkhadwvI/ZS0YDnE9lHmZz8inssXS35eLQ66ha9dQD7SKZDjO6Qd6DDuWJNeRLExe0q
	t+bq5sWQY70QKSvXGb3HyGAiDV+8NPL1IebftcpM1Cfx26ZzaJKVGIaDRfGJ4FpE7Wg4
	CjSA==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr15731857pbc.24.1353686934076; Fri,
	23 Nov 2012 08:08:54 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Fri, 23 Nov 2012 08:08:53 -0800 (PST)
In-Reply-To: <1353672970.13864.739.camel@phil-desktop>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
	<1353621779.10459.67.camel@ted>
	<1353665804.13864.713.camel@phil-desktop>
	<1353672077.1361.4.camel@ted>
	<1353672970.13864.739.camel@phil-desktop>
Date: Fri, 23 Nov 2012 14:08:53 -0200
X-Google-Sender-Auth: r-yPDnXVPBy9E4mVnKthOwNToFI
Message-ID: <CAP9ODKrFwPDLn4t-cXSmHa3ieFR-i7p05K7wM21hCez5F28eNQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
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
X-List-Received-Date: Fri, 23 Nov 2012 16:23:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 23, 2012 at 10:16 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2012-11-23 at 12:01 +0000, Richard Purdie wrote:
>> I'm not sure "gratuitous" is entirely fair, the metadata as it stands
>> today is fairly linux centric.
>
> For some (maybe large) parts of the metadata that's probably true, but
> gcc-cross does happen to be usable on non-linux with only minor
> adjustments to EXTRA_OECONF and it would be nice to keep it that way.

I am curious, what you use it for?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


