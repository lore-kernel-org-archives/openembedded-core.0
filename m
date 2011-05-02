Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH1ay-0000LT-MF
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 00:28:00 +0200
Received: by ewy5 with SMTP id 5so1888625ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=XHTmt5WSn7yfiHO6OIytFouZq9remlLltFG0hlVQ0pU=;
	b=n99VDgZvOq3JGRIcdjrZSC3L5ARnb0VLEewempf2z8lThXPNc5TlOO7chCRQ3n/MWF
	IaQaTuA9eZZMXPqvqL1Kz0QJtcTGvEezL5xPUBvTT/enRDrZbJZi+Fz6i2O05O5qoKZn
	WjbQl5ZbAyD+Va/2y+WYj4G+ITy3dAQxjt3HU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Ze2cxvE/6NuAYwl7NWlZWfGowbZ5XSK9DqdFXxcrNgvpbSwnyI1vIQatIxSgxsc7X7
	Z5U5Lpssel4XiE/EsiFA/LOiqYqD0ZIm0g8rEciSml9T7g3Oq3tTjjHzvjZb8Vh5VcRC
	ATxMkTd6FgzoY59EpWgug0DwXFy/oGPhwi/q8=
Received: by 10.14.5.4 with SMTP id 4mr3315917eek.205.1304375124161; Mon, 02
	May 2011 15:25:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 15:24:54 -0700 (PDT)
In-Reply-To: <4DBE9E61.9030206@gmail.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBE978D.8020209@mlbassoc.com> <4DBE9E61.9030206@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 15:24:54 -0700
Message-ID: <BANLkTikaV1pxuW8Wupqv3q9yEFg42F3zXQ@mail.gmail.com>
To: Gary Thomas <samoht.yrag@gmail.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Mon, 02 May 2011 22:28:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 2, 2011 at 5:06 AM, Gary Thomas <samoht.yrag@gmail.com> wrote:
> It seems that the file
> gcc-4_6-branch-backports/0055-Remove-svn-mergeinfo.patch is empty
> in your tree, so patch didn't create it for me. =C2=A0Should it just be r=
emoved
> from the SRC list?
>

good find. Yes it should be. I will remove it and repush to same branch


