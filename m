Received: from mail-oa0-f53.google.com ([209.85.219.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TsBq5-0001uQ-7K
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 13:30:02 +0100
Received: by mail-oa0-f53.google.com with SMTP id j6so17716138oag.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2013 04:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=jSfEjCwmlkL/S5DNRcdHBIhl5v0cKKe9fhq+g+OW9yI=;
	b=DFNGbwEoXy39x7J3h/ileiVi8Tesb5MeCgTZRTkFBVLBxxWVTuGUKDsusMoUawZnp3
	a1Lb6IEOBaOykIYnkH2Bv3gTnYFOGS6d7cnYHUvweRSx92OSK5XhVNmI701LgsWuL5zi
	hRLXcZdjL7FgMuVTtDkfpWuXdW1z8yklIpsHuSefhKsdRo4U1McZ1mC1TDtW0PTXiaO7
	vUvguE44/VCe7IBfWhFJioykVzImp3qXhNYaTydQsbUN3S0PbjnQU/TG6YRodg0Qr3CD
	IhfKbw6iTKdH0mb3hlKfXJUTXWMzeguU7ylU/P0SvSSVPzjfH2yHJoKKfzaFtADcEkTR
	SnmQ==
MIME-Version: 1.0
Received: by 10.182.54.103 with SMTP id i7mr42855692obp.62.1357560891505; Mon,
	07 Jan 2013 04:14:51 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Mon, 7 Jan 2013 04:14:51 -0800 (PST)
In-Reply-To: <CAJTo0LZh_uw9Q3yY+1kxaMLwMp8n-_LujKV3Tk6pkMcKtFfx2g@mail.gmail.com>
References: <50EAB9C9.1090903@linaro.org>
	<CAJTo0LZh_uw9Q3yY+1kxaMLwMp8n-_LujKV3Tk6pkMcKtFfx2g@mail.gmail.com>
Date: Mon, 7 Jan 2013 10:14:51 -0200
X-Google-Sender-Auth: ijjakr-qHJnGp0lVWlRpFWj69dY
Message-ID: <CAP9ODKp9QoHDJ9svT_Wse+80-PGUDuEktBgfyOjMqe7YPu+_tw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default xorg.conf is for x86 devices
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
X-List-Received-Date: Mon, 07 Jan 2013 12:30:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 7, 2013 at 10:10 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 7 January 2013 12:04, Marcin Juszkiewicz
> <marcin.juszkiewicz@linaro.org> wrote:
>> Can we replace default xorg.conf with empty one? I finally got X11
>> working on AArch64 just to notice that I have to remove xorg.conf file
>> to get them started.
>
> I'm all for removing xorg.conf wherever it's possible assuming it
> still works.  The default should be no xorg.conf with machine
> overrides where required.

I also support this. I have override it in our internal layer to make
it more generic.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


