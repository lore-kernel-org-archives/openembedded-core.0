Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Su2cB-0000hl-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 16:31:04 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 25 Jul 2012 07:19:32 -0700
Received: by ghbz12 with SMTP id z12so692920ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 07:19:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=GfZo6FTy4Zp+ndSRgvFYLAQYu8xKlWVuAKiugQDaTdw=;
	b=MZz5/EM40u6Ar+TGlDahAPCgk8KaA3/DC8YXdgTEXWSQnvyzknAmcmQTvSpi0erxVn
	GGT6O/Bo/g4HZztkOg4wxQrncYnAWwnusiFGiWxFlfRR4zsKnxDKjd0mVKk4nBhJ4OoW
	ArfpDehp6zMkeDHZ+QNp3BpstiurjD4hUTd62P3bHE2HZVHwsJ+QPx2Ti47ZkBgeF4Y6
	oVEkiytE4eHWVmsA3O3gq9mKJUD6SjmMIZ7P7QlnP7ix4ev3Iyryz55BAHIAGEzIBBeO
	9hwFioLJM9a6VavTMwutoe/yUCY47Cf0gmYvVwy2uhr6TJMWxfDHdlsjV9vlZSnTrr0A
	X3Sw==
Received: by 10.42.80.6 with SMTP id t6mr24872037ick.15.1343225971968; Wed, 25
	Jul 2012 07:19:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.70.229 with HTTP; Wed, 25 Jul 2012 07:19:10 -0700 (PDT)
In-Reply-To: <E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
	<E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Jul 2012 15:19:10 +0100
Message-ID: <CAJTo0LbFcZYhBzgO4wEhnS4Dq+msQP9pu8Biagiy3cPGUoPGkA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnRZEUP9KprHN4Z2PogfQF8NgXCDrnhPlzcSox3TzdLFpO+6RHQHB0WAe9eTAdMsanfDw4U
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 14:31:04 -0000
Content-Type: text/plain; charset=UTF-8

On 25 July 2012 15:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This breaks the upgrade path

So how would the upgrade path be unbroken?  A dummy dbus-x11 package
that pulls in dbus, I suspect.

Ross


