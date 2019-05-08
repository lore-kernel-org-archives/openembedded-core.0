Return-Path: <alex.kiernan@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D56F7DEA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 20:44:15 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id r62so6727400vsc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 13:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DeQxCpR17M9godNPQzaZi+vZyUJIixYgD4/vK8pnkco=;
	b=LRUSG0XQ8ReDSMb/aPFENC0UKHvc/rJL3fHpyRbzjhwP0o4pbiI61CZAzx+Kfjncka
	OqS0Lnx2/uBHNzGcs8ixgcxcMejK9xI6kGAiD3kMDdhs9Y1i0LbHYgObJmbGsKy6sAhb
	Bz/3CnPPquG3e1JOQ8I+xwwVlWjqDhJRsqDEkzZbTUbG0pTlCnOhvpQCbYMZHW7IH37Y
	HNxXOkhOgeXwTJrHF2htu+N8DXWtDynfIz51ReyUynpPwutSA1JtzOTMtQJfUOksMEK/
	Kp2RPU5LVPpXiz/XPYdEsUgYT5Cz25xCt55+TJD336vjFsY33TIlb90RJXVCPya0dTj5
	VDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DeQxCpR17M9godNPQzaZi+vZyUJIixYgD4/vK8pnkco=;
	b=lzvjIeB1HOi1nKsJ/MWZslkR9dG7Z/2Kb8ZwKgT6noqed9uA8Wuv7e+rALKI8dH0ji
	EwZcRGau6wTZt9ALOJt5eDc/ad25MERSBJoy1cyZkFb7TcZnfdZJ3h0qOrlTQpjDN2V8
	ag41XIg2q+7FfmX9gah/KX5ATTK75LyHHjaGdSG2XA5Dr5XCg/3CLM0u9YvZk53DznIS
	6LkfrlV58mBvESBkLF1Jj8mL9w6lfryKwe+6J6f+2Uucq9nKNrswQA/KbdBof3q2jC/D
	/i/UE9G6MhgEMLpgYHXthnUoZluX2qBFZpa71H1/F+QaESBlM1YszdUABovw4sIRy9XQ
	eZ3A==
X-Gm-Message-State: APjAAAU33hqS5xwdaA9/a3Crc4clrXaVIsGfCkAtJEAj094eSNbcCoyG
	xF1SH6cidq2kOh8XiA3MNWmvz36RhxmCvc75YL8=
X-Google-Smtp-Source: APXvYqyFkwsRyi8b4bk4NL5Bcn7c9ocbqnwCxidWGGZazipxZgxLMIQK6vfcUaXFZBb5P+wDHgy86ytW7XSlmV8rxdo=
X-Received: by 2002:a67:af10:: with SMTP id v16mr145606vsl.149.1557348255944; 
	Wed, 08 May 2019 13:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190502210944.62696-1-alex.kiernan@gmail.com>
	<20190502210944.62696-3-alex.kiernan@gmail.com>
	<CAKmqyKMDa1gW4ib+3TdJ5v6-58bNjQWmo6GV_6LxkcxpitZNaA@mail.gmail.com>
In-Reply-To: <CAKmqyKMDa1gW4ib+3TdJ5v6-58bNjQWmo6GV_6LxkcxpitZNaA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 8 May 2019 21:44:04 +0100
Message-ID: <CAO5Uq5TdwdWLiymaOQ91Y3uugg5vzR1EPWGtiRrRE49ktihgUg@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6 2/6] systemd: do not create machine-id
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2019 20:44:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 8, 2019 at 9:19 PM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, May 2, 2019 at 2:10 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >
> > From: Jonas Bonn <jonas@norrbonn.se>
> >
> > There is no reason to have an emtpy machine-id as part of the systemd
> > package.  Either:
> >
> > i)  the filesystem is writable and the file will be created
> > automatically; or
> > ii) the filesystem is read-only, in which case the empty machine-id file
> > should be created as part of the read-only-rootfs tweaks.
> >
> > Signed-off-by: Jonas Bonn <jonas@norrbonn.se>
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
>
> This patch now results in no "/etc/machine-id" being created which
> breaks systemd-networkd WiFi connections.
>
> I now always see this error when trying to connect to WiFi with
> wpa_supplicant: "DHCP4 CLIENT: Failed to set IAID+DUID"
>

I posted this series earlier that fixes everything I know about
(including the lack of /etc/machine-id in the stateful case):

https://patchwork.openembedded.org/series/17495/

If you can test and I'll have a look if there's anything else that
needs addressing?

-- 
Alex Kiernan

