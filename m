Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QYxPL-0004DV-SQ
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 11:38:07 +0200
Received: by fxm19 with SMTP id 19so1148673fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 02:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=uTULba0NipVIlkPDyKKRs9QyZE9G01Ru8LgD9f/6NtI=;
	b=nTuTxpNXJEkv0m23slGoHqh2YWQuL+h7qJku6SXx3kQsHUXdCQposZMZXWBhWmADYd
	DIz3EYqIqpHLSrwOj5xiy5EDFBJnOU61oc4GaeOq4XCWGtqJDcNHHVcZUSoavbCQhw63
	QEaumZ5+2jphv9gRTfjkfGNXAY6lLrZusqDHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kShTy0fgk3YbfPFB1sA2wT7mdxv4Rtaa6DptQu+nreAy+WlYIl4Ic/i1zlD45zJyi9
	0Wngt3vowNYVZGJTyOmbNpOzH90a9KyJg2P8F3SJjyEhRNmW4bVH+aFnLh8eG23HFqUt
	gHQioLwUICxHkplzOaBlC3loFNEwia3bmvyX0=
MIME-Version: 1.0
Received: by 10.223.94.129 with SMTP id z1mr3529967fam.144.1308648874795; Tue,
	21 Jun 2011 02:34:34 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 02:34:34 -0700 (PDT)
In-Reply-To: <1308647576.21613.10.camel@phil-desktop>
References: <cover.1308642976.git.dongxiao.xu@intel.com>
	<42f214f6550292a92714dc3e0d29eaf8d2e5d250.1308642976.git.dongxiao.xu@intel.com>
	<1308647576.21613.10.camel@phil-desktop>
Date: Tue, 21 Jun 2011 11:34:34 +0200
Message-ID: <BANLkTin6-QheW3=aOKNB9h9RcOo4SL9nhA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] connman: Upgrade to version 0.75
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
X-List-Received-Date: Tue, 21 Jun 2011 09:38:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 21, 2011 at 11:12, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-21 at 16:08 +0800, Dongxiao Xu wrote:
>> -DEPENDS =A0=3D "libgdbus dbus glib-2.0 hal iptables"
>> -RDEPENDS_${PN} =3D "wpa-supplicant resolvconf"
>> +DEPENDS =A0=3D "libgdbus dbus glib-2.0 hal iptables ofono wpa-supplican=
t resolvconf bluez4"
>
> What does the dependency stack for ofono look like? =A0If it's non-trivia=
l
> then I am not sure it is a good idea to add ofono to DEPENDS
> unconditionally.

Although Koen showed that the dependcies were quite trivial, I'd
prefer to not build ofono if it is possible.

> Ditto bluez4, I don't think that should be in there unless
> DISTRO_FEATURES requested it.

Yes, I certainly agree with you on bluez4. If we don't have bluetooth
enabled for our machine/distro, I definitely prefere to not build it.

To me it's not only about the risk that we increase the rootfs, but
also about build-times. Even if we have quite fast machines today, it
is a waste of CPU cycles to build lots of SW that aren't going to be
used...

Adding a dependency etc is easily done in a bbappen-file, which makes
the reversed desire quite easy. I'm not sure if there is an easy way
of removing item from e.g. DEPENDS and EXTRA_OECONF etc.

Regards,
Anders


