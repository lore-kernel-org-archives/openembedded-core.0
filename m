Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBNnb-0006aE-3n
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 12:06:49 +0100
Received: by mail-vc0-f172.google.com with SMTP id l6so1863785vcl.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 02:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=LskEObIslWEe5MGBf7wgnXNS952Yk6y/aWP2zrdpIZM=;
	b=IsPpWXQnsZfNih/AYBDGIvek4y5FxUZX8GYD5kKhLwjyn1IIOdhWKXdBng7+zktYt7
	MnK5kIt5olK3LdCKs467jPthCGRWxqxfrIiEY3bMLosxr6Y6WIaxsjUD/9zGOX7UREbU
	HcpB8ve/t263CSIZ4nN40PSR8XsC6Wt3/FYMPUi4FTlkzVlrHPBmqnpKFLAeA8L31ghR
	0hid0e6qCqtcprvbcNjGR+6RRsaOI7VL5XQ07rvuibQ8kjqJw2P0GGHkmclnBl6hOj3H
	Wc5QN3BK/FhZAg15TgSa1ICsuERmGZCXO5t7iwYUhI/nbBClwSdeBgIFq17HmmtRg2tE
	WRCA==
X-Received: by 10.220.215.73 with SMTP id hd9mr3886256vcb.19.1362135023487;
	Fri, 01 Mar 2013 02:50:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 02:50:03 -0800 (PST)
In-Reply-To: <CA+AhUGyTXD1cBArSo82+JnSrs6KKLw0O9U78U215-RJmFbhOeg@mail.gmail.com>
References: <CA+AhUGyTXD1cBArSo82+JnSrs6KKLw0O9U78U215-RJmFbhOeg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 10:50:03 +0000
Message-ID: <CAJTo0LaCg+LKbg_OCzXf6NxvcyCHWnbY4bJxBYO13rgvv=Z9TQ@mail.gmail.com>
To: =?UTF-8?Q?Erik_Bot=C3=B6?= <erik.boto@pelagicore.com>
X-Gm-Message-State: ALoCoQnUYs/IaM8K5Kyu70doAvC4ePEO09JEO1gAog7tq931os6qeW6dyeg02pS8J8++ve+mhw6f
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd-systemctl-native not pulled in when building systemd image
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
X-List-Received-Date: Fri, 01 Mar 2013 11:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 1 March 2013 09:25, Erik Bot=C3=B6 <erik.boto@pelagicore.com> wrote:
> I'm building a small image with systemd as DISTRO_FEATURES_INITMAN and
> it's also in DISTRO_FEATURES. But checking the log.do_rootfs I see
> that systemctl is missing when running the postinst script of e.g.
> systemd-compat-units.

That's a bug in systemd-compat-units, it should be depending on
systemd-systemctl-native - I'll fix that now.  The dependencies
injected by systemd.bbclass will only be used if you've recipes using
the class, so presumably you don't.

Ross


