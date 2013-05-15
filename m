Received: from mail-we0-f172.google.com ([74.125.82.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UcgFZ-0004RU-Fc
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 20:16:34 +0200
Received: by mail-we0-f172.google.com with SMTP id w60so1828212wes.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 10:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=34sJQDKzQEaRX+c4iXWn8VxeewTHzAIFF+tQHfaGgIU=;
	b=oTuCjRV74ieH12ozteVct23nY4KNzScf4ROAsNqHSZ078mwfgiXG//E8tssL01yaaP
	JJIpnoCMp5zeAwdmA2oY6m74xBqLYfeWehqmlt4Ztj2NY9lpwsgsiOxogmv5BIeCvT9C
	DnEjmNIQnrY0RUfn+IAmtrDZoM9rQ2Y/PdRPNkXGe0tChm+wr7z/EmROyFI99KOJ4o0D
	37XEq/roNLq/BjoFx/MlbA1sIH1uYILFMGYX73Q66/VV6UrAN59WnpzZ675Sz/YRDowM
	YK6mvStqs59fkUte/2g/KgyuubXBm1aykt8x3DHsukAQjulocQDYUELaXByBNDY1zhnL
	8SfQ==
MIME-Version: 1.0
X-Received: by 10.180.37.109 with SMTP id x13mr16415483wij.20.1368640696186;
	Wed, 15 May 2013 10:58:16 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Wed, 15 May 2013 10:58:16 -0700 (PDT)
In-Reply-To: <CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
References: <cover.1368423406.git.raj.khem@gmail.com>
	<CAHUNapTYnSeB0yfXdxtRjqk49y8VHO9KPR_RjxgsN5rWCvDvdg@mail.gmail.com>
	<alpine.DEB.2.02.1305131536070.2354@oneiric>
	<CAHUNapSAjqkiNCy4bBxp_7JLmMDRc0omMYggfgZ33KhbEyqbZw@mail.gmail.com>
	<alpine.DEB.2.02.1305131558330.23405@oneiric>
	<CADkTA4MSXBhGpZAzUzdWTZEgvsvkXp9EOO8PPgKX2-LSw3pTgA@mail.gmail.com>
	<alpine.DEB.2.02.1305131650030.12354@oneiric>
	<CADkTA4O7Ls7sPfKXcLnR_ordcHKnGqkPCRtrDjWm7xXeUDgqaA@mail.gmail.com>
	<alpine.DEB.2.02.1305131805100.28372@oneiric>
	<A5DB8053-5E16-47A6-B83D-70F75EE5C592@gmail.com>
	<alpine.DEB.2.02.1305132059460.25048@oneiric>
	<CAHUNapQ2DctEVAKNX2X6--w5GH=BA8Qd3bSXtCCpY+Uqr__gUw@mail.gmail.com>
	<CADkTA4OkTOJXa6EDDCUCyckMtJdJq+sCexrtQgo-85v84edpgQ@mail.gmail.com>
	<CAHUNapQcwEJPrDgrzTtUrY7N-R7MBzsAMY-3MvefOvt0f=0f+g@mail.gmail.com>
	<D9D792CF-EAA0-4B7B-8C5D-9429196AEC70@gmail.com>
	<alpine.DEB.2.02.1305140423590.26605@oneiric>
	<CADkTA4O1VFk1juzepWzjV1FjF9F2J_A83ga92USdgxwegd3Qwg@mail.gmail.com>
	<alpine.DEB.2.02.1305140824360.23009@oneiric>
	<CADkTA4M+Ya24qHwFbB-ETyGwTM-8p_OvuzkUF4yDaQ+=iDZQuA@mail.gmail.com>
	<CAHUNapTw8-B5AEk2YN3t+vRkjwVOS65Ehs6HV5RkbipYUWpS3A@mail.gmail.com>
	<CADkTA4P+CaEJFfkWSzGrcYMgs7Kxa9iNkgNbQou0xhf53oP6Uw@mail.gmail.com>
Date: Wed, 15 May 2013 13:58:16 -0400
Message-ID: <CAHUNapSuTwy0sSDCXAmk6PEqVkqJzGsrLyPJL9VQCaN5gMbOOA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Robert P. J. Day" <rpjday@crashcourse.ca>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Add qemumips64 machine support
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
X-List-Received-Date: Wed, 15 May 2013 18:16:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 15, 2013 at 1:24 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> You set the SRCREV that Khem sent. That was my 3.8.4. commit. The version
> number in the directories is coming coming from the PV of the package, which you
> didn't tweak.

Ahh... yes. Thank you. Makes perfect sense now :-)


