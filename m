Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RvG82-0003sW-3H
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 23:36:42 +0100
Received: by lbol12 with SMTP id l12so542542lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Feb 2012 14:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1m27jK1NftV6ZKh9UKD/ZS0blJYludHTlye2mbI1jb0=;
	b=MeZL9FN1ZHHsstSY76L0TTYrChLgcM8EPNgBeEgS8FAQFRJ52GjfKNDxRRqXRWtTJ+
	XR0xLeSrrOEVjlOuaRrvaA903oFl2RFaD3qWDWTtYmIERjZ1FwpqY9y9j5KIag8MqKhA
	AzS9n5QQWQpH0AsRg6ZwsMiPK2aaYv+ant7FI=
Received: by 10.152.112.41 with SMTP id in9mr16734074lab.27.1328740118240;
	Wed, 08 Feb 2012 14:28:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 8 Feb 2012 14:28:08 -0800 (PST)
In-Reply-To: <4F32F541.90005@gherzan.ro>
References: <1328717200-13689-1-git-send-email-andrei@gherzan.ro>
	<1328717410.14363.46.camel@phil-desktop>
	<CAP9ODKqUo7qazvdbWxQB_bQh3jpf+Uf=kf1YVp=Y-oB6QQYGGQ@mail.gmail.com>
	<1328720440.14363.56.camel@phil-desktop> <4F32C1A6.70402@gherzan.ro>
	<CAP9ODKqaWXbWMx7WRgDEDfqpWM1YPEhbPG_V93mYtd_QVqQJ1g@mail.gmail.com>
	<4F32F541.90005@gherzan.ro>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Feb 2012 14:28:08 -0800
Message-ID: <CAMKF1sqZF-1Lu2POy1BeTvPiJ7yvrCK3v0RWGbDrw+HHGTt5eQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: Update to 4.2.3-P2
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
X-List-Received-Date: Wed, 08 Feb 2012 22:36:42 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 8, 2012 at 2:20 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
>
> Should we move the whole openssl package to prefix=/ ? Or just the libcrypto
> library?

if libcrypto is emitted as a separate package then it would be easier
that you just relocate
it but if its bundled in a package that contains more stuff then you
might have to bean it out
and also make sure that all the dependencies that libcrypto requires
at runtime are also then
moved into /lib


