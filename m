Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 134CF7DDAA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 12:45:20 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id q21so677748vsg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 05:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SzPNeWTAV6FXXEwOCREsA0emuDLiVyGufQOMgGol6A8=;
	b=NC/t9xWogvoLgT9+jvl1mMZ+nILnWWGOiY3trVCr9P8lWHuTd/jh8lW4+W1hwq6SWh
	tGH4dI6mES0cK9Gf2MfEKBcLUXHFCPFj7F2hBXszqHld3YmlooIu0zIF+X0F/ZeQzCHQ
	HjHQXzs8Jmulw8npufVDx/rNzogPyvDj+uaXzmunudCZkmQMYDvyJcssezH6yJQI0RMR
	Go0M2b6DsdZRuPlRuK7H+4DDO4NouOmlchTkyN3XGvQBUUgGcy9u3gHhYzpL2y0v/1nY
	rYwMCBgO0ntwLgpMt+N1Od+S/SoUG51KImeFw0hJLmxKuwtY39fYYhRLNYHTyKEW/caE
	1B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SzPNeWTAV6FXXEwOCREsA0emuDLiVyGufQOMgGol6A8=;
	b=htQMVV8FpEOTcKTEIS2tWeUVtP3IoJS6bftAjR3/yhoALHPPOw56wK5P0821/myXH5
	kQJfD/7flAUNdvzuTzjlMWzIk5Jhz/situj4CFw80qFZZutGIh5+8QxobnjpoPh6eh6u
	s8v5MBPiAmFuhwGcob88wMUJF6cj3V0Pn/PFvQ3aM7UQJxioams1kIrtfjkiKDLT9U6U
	qbnz928HpdBDvcMovpqXjMP12sO86YZmY/d6NIsNmBf/vq99/bvvQOnMXKefbJ68FVTe
	InGRdu2dRrdyj40/yLEo+tMqHWs7hD4U+nTDYPfhC2tufevm83N2NbLLHIh0BLhJ3J7R
	IdrQ==
X-Gm-Message-State: APjAAAUwYjOPLFINJCeI5ASN5Z+Fp8KW1osRaIgjo7WgwWaMUBsGtz4V
	P4msAh37MCBdmVy7YJToGtf60t48oIu04XPMygM=
X-Google-Smtp-Source: APXvYqw0Bvb5BYGhYiOw9xzZJSSThUo0lxLlFSvCbTnfT5H53RL3uPM1Ebq435VJlKs/IvG/HM0X1xN9VY0IHi7c+kg=
X-Received: by 2002:a67:c40f:: with SMTP id c15mr8334518vsk.94.1571921121810; 
	Thu, 24 Oct 2019 05:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
	<8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
	<5290bb1a-4cc8-4ed9-8f33-3c8994f06f22@herbrechtsmeier.net>
	<CANNYZj99FATCkw+6V088NkTWm3DEUAcoZaP+XBUR0xZnGeeQdw@mail.gmail.com>
	<22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
In-Reply-To: <22cbc060-0f73-4354-1edb-ca90dbed4d73@herbrechtsmeier.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Oct 2019 14:45:10 +0200
Message-ID: <CANNYZj9L7O9a9RfyXpQP7kY2X_HNt5P9yJQCmUONeZq1rWDKwQ@mail.gmail.com>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Cc: "Paul Eggleton \(paul.eggleton@linux.intel.com\)"
	<paul.eggleton@linux.intel.com>, rennes@savoirfairelinux.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Thu, 24 Oct 2019 12:45:21 -0000
Content-Type: multipart/alternative; boundary="00000000000014a63f0595a7687a"

--00000000000014a63f0595a7687a
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Oct 2019 at 14:40, Stefan Herbrechtsmeier <
stefan@herbrechtsmeier.net> wrote:

> > I don't think it's at all realistic to stick to the 'one recipe per
> > component' in node.js world. A typical 'npm install' can pull down
> > hundreds, or over a thousand dependencies, it's not feasible to have a
> > recipe for each.
>
> Do you have an example package?
>

Yes:
http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/001270.html

I have also written an 'essay' on generally dealing with this kind of thing:
http://lists.openembedded.org/pipermail/openembedded-architecture/2017-March/001269.html

Alex

--00000000000014a63f0595a7687a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 24 Oct 2019 at 14:40, Stefan Herb=
rechtsmeier &lt;<a href=3D"mailto:stefan@herbrechtsmeier.net">stefan@herbre=
chtsmeier.net</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">&gt; I don&#39;t think it&#39;s at =
all realistic to stick to the &#39;one recipe per <br>
&gt; component&#39; in node.js world. A typical &#39;npm install&#39; can p=
ull down <br>
&gt; hundreds, or over a thousand dependencies, it&#39;s not feasible to ha=
ve a <br>
&gt; recipe for each.<br>
<br>
Do you have an example package?<br></blockquote><div><br></div><div>Yes:</d=
iv><div><a href=3D"http://lists.openembedded.org/pipermail/openembedded-arc=
hitecture/2017-March/001270.html">http://lists.openembedded.org/pipermail/o=
penembedded-architecture/2017-March/001270.html</a></div><div><br></div><di=
v>I have also written an &#39;essay&#39; on generally dealing with this kin=
d of thing:</div><div><a href=3D"http://lists.openembedded.org/pipermail/op=
enembedded-architecture/2017-March/001269.html">http://lists.openembedded.o=
rg/pipermail/openembedded-architecture/2017-March/001269.html</a></div><div=
><br></div><div>Alex<br> </div></div></div>

--00000000000014a63f0595a7687a--
