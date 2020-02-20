Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1B7A9610BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 22:06:30 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 2so51082pfg.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 14:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:user-agent:mime-version:content-transfer-encoding;
	bh=LvIkMzBYlKSs4Rx+3yb8ALFsEpE/15xSsoRGLIdKSBU=;
	b=sCn1Yn4iZ8LjmuoTFlBA9NM7Kt1TQKH47ZpdkOT/Ulm6cmQXdlokigtbE8Jmc9Lhgv
	V72OZX8Uq9zzFqFbE7gUOjMNPIKaR8c/bEYSPpV9p/2ajhefHFvoEsXPeflSOFr/KPQA
	7IbDI/GEP83VkPd5kx1OXI8VvOOlQv5zW0MsTcQW/tnh3yVlKFKK/96jmS1tJfWfi7mZ
	Sfqwk7k3MuvzM2JbKOPI3T58pRxEa9Ztf3KXyyjVXnfY7XUjgU5knotGyR2FkzeAHELH
	E83dUndtBcq10X5q9TbXzzZiUxeFUe1qNydQOLqvJTykab1iQStXl8SMhpG27uYLP5v8
	btsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=LvIkMzBYlKSs4Rx+3yb8ALFsEpE/15xSsoRGLIdKSBU=;
	b=d15zvPgzolfcJj1+pFH7rIg4BjK/yVT4GRQCxkr4ldvZonRxBr3JKpXWxY5bl6JLcx
	FOw33GgjcJHQGj428CTfeLxA5j+79tyJQ+LgKtnbtspM85y0O8yoLpYQEKK7qjvqKpEO
	xHFMoWKC0XdLefHN5d/i5mscOZ6XqpOBAu8F5hDTTOpNQLXJXn5JvVW9uCFUhl+VHesQ
	WIUUBSYWAlawgJU4f1OkqSMyx1dYvMdjaWHwCtabDfQahOqcfFWnhVKHzyv+sjFfsObz
	efOf/PC8WADDEcrCbxvJ8Zpwpl9jwg3rhvpS6jQg/xd2iyCqOh8JUOjbfw0V9S09SyjP
	rh4A==
X-Gm-Message-State: APjAAAX9s2eG7y+jjVmmpvo4Pw8hhOMJ3qwd0173j3Poa9TMNca7Ejhg
	Orwkh/mkijN5LVT3383vqCEjxyJYyZg=
X-Google-Smtp-Source: APXvYqwhrWJDWBCNf3E3FD+eSu9mBBoc7YHN/w+ViIiR52acosUqsFgnP4sDkZCt3V3jnr/ykx3h1Q==
X-Received: by 2002:a62:5343:: with SMTP id h64mr32794005pfb.171.1582236390872;
	Thu, 20 Feb 2020 14:06:30 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::ebc])
	by smtp.gmail.com with ESMTPSA id z4sm556967pfn.42.2020.02.20.14.06.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 14:06:30 -0800 (PST)
Message-ID: <7dd9779b1be7e10a54b3b1bff4788cae931cb02a.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 20 Feb 2020 14:06:29 -0800
In-Reply-To: <CAJ86T=URADiQr=_iOdw990WWCHhkDL0sAS-oD1JEtyV9UOHGXg@mail.gmail.com>
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
	<CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
	<CALbNGRSFZcsh0ZKBgyRX+eg3ThZbRf1ryiVbHU5Y0vZgd0BkTg@mail.gmail.com>
	<CAMKF1srmsrx8Nq4gSj5ZDK0o1d4t8AtDWnjtDgzT1Py8i=Njtg@mail.gmail.com>
	<CAJ86T=URADiQr=_iOdw990WWCHhkDL0sAS-oD1JEtyV9UOHGXg@mail.gmail.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 22:06:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-02-20 at 14:00 -0800, Andre McCurdy wrote:
> On Thu, Feb 20, 2020 at 12:33 PM Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Feb 20, 2020 at 12:24 PM Andreas Müller <
> > schnitzeltony@gmail.com> wrote:
> > > On Thu, Feb 20, 2020 at 1:45 PM Andreas Müller <
> > > schnitzeltony@gmail.com> wrote:
> > > > On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
> > > > <alex.kanavin@gmail.com> wrote:
> > > > > You need to at the same time drop the introspection
> > > > > enablement logic from EXTRA_OECMAKE I think?
> > > > > This line:
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb?h=master-next#n70
> > > > > 
> > > > > And for consistency, it would be good to do the same for gtk-
> > > > > doc.
> > > > 
> > > > This is odd: I fell over this because there was no gir created.
> > > > Did
> > > > not notice it was few lines below. Need to check that - maybe I
> > > > am a
> > > > bit off-sync to master or something is wrong elsewhere.
> > > > 
> > > > Will sync to master and send V2 then.
> > > > 
> > > Finally had time to look into again. In the recipe there is
> > > 
> > > GI_DATA_ENABLED_armv7a = "False"
> > > GI_DATA_ENABLED_armv7ve = "False"
> > > 
> > > => My patch is wrong it overrides above accidentally - thanks
> > > Alex!
> > > 
> > > Since webkit builds gir fine (my machine is armv7ve) that does
> > > not
> > > seem necessary any more. I would like to send out a patch
> > > removing at
> > > least armv7ve - shall I take the risk to remove armv7a - maybe as
> > > two
> > > patches?
> 
> These two should be equivalent for all practical purposes and so
> should be updated together. ie remove them both, one patch.

it will run user mode qemu underneath, which is not same for both, are
you sure libraries and apps it will run are identical ?



