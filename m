Received: from mail-vc0-f169.google.com ([209.85.220.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UYCaJ-0004To-FP
	for openembedded-core@lists.openembedded.org;
	Fri, 03 May 2013 11:47:25 +0200
Received: by mail-vc0-f169.google.com with SMTP id gd11so1245130vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 May 2013 02:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=n9ckuKg8llzCqesS1hjfaoyuT6rTjIVbdqtoA2EIuA8=;
	b=eDhuFZKkKJggDK89f+WEhW5AftPdrZPE4GEOZ7msWRyyfv5sUDVeD4lHE3nwSINoLz
	U0318gbrxDx7linhBX0UgsPFlfZQiVbO4WaQQ0AqbzBek75lxRzGnhEpBE3DaYHooWt2
	QvE/Rpju8IWCbckW6tRMd/0i19Uviau2pJRnEonmD3VaWLO5aTuGA0xoScZhlEC/b0BA
	GnTOCbIvVJU8t1i8uuhXF2peg88RRzt6NMh3jyrnmb7rjdU1sdjZijBRtHWylF5agYmJ
	mCw6UmOLlPninxDIawRXly90Lp3WPF47TbyP00b817DrUN+eqT/+wd5Buiun0YLARyY2
	rIpA==
X-Received: by 10.220.155.8 with SMTP id q8mr3373013vcw.42.1367573368387; Fri,
	03 May 2013 02:29:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 3 May 2013 02:29:08 -0700 (PDT)
In-Reply-To: <5182AB5B.1080200@windriver.com>
References: <CAJTo0LZdtT=qg2k3eBJ_DQHQzMvqS0vwFSmkgCxxG7KOiPWfzQ@mail.gmail.com>
	<lyy5bxl2h7.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<5182AB5B.1080200@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 May 2013 10:29:08 +0100
Message-ID: <CAJTo0LYA6XiLQcmX9GJv_aMdSw05S+3eTDtBMsuzVU642JiZtw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQkeoHnBkEL8yl3OuJJuRi/Bmj835bnx/LqKQ8wQqFnpYKTTz2lBB28EmGrdRfDiuI5wok+j
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libexecdir and multilib
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
X-List-Received-Date: Fri, 03 May 2013 09:47:25 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2013 19:07, Mark Hatle <mark.hatle@windriver.com> wrote:
> Just because we're using RPM doesn't mean we have to follow Fedora.  There
> are a lot of things that Fedora does wrong (and right) IMHO.  Same with
> Debian and others.  We need to make sure we do appropriate choices based on
> the users of OE-Core.  These users may need specific situations and/or
> expect certain configurations that they are used to from Fedora.  So
> deviating for the sake of deviating is bad as well... There needs to be a
> technical reason for it.

Agreed - we can't take the stance of "follow Fedora as we're using
rpm" as we're also using dpkg (and Debian's policy is different to
Fedora's in almost point where FHS is vague) *and* opkg (which doesn't
have a native distro in that sense).  In the area of libexec and
multilib there is no consensus at the moment.

Ross


