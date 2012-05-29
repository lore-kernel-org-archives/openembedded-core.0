Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SZTmD-0004Se-LC
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 23:16:25 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 29 May 2012 14:06:06 -0700
Received: by qcmv28 with SMTP id v28so2163566qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2012 14:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=23+/GtIfFe1mWuMdWq+ebHPmHdiV70HT2XKk5WrrVNQ=;
	b=PvUpLd8R6TRqQKhCnIQf5wkZ/lLu2cCbsNGryKbuaeGOsjS/FPcQOyxZmt1FzNopmz
	4h5qfh9rLp0vUIzLuMGl/MQJMm4sNBcx1w6h/w3pcQRMGCByV2t9jmZGWRXMJ3h1L4aR
	CsHR4ViOyV4FBd06wjNnyLtAHm6QNfI0wzZAu21p1PC008kG/+8/ylWwep5ZsBQDjtB/
	g+AIaKkHygUuzKakyuZ0sDX0xd4We/1lU96dfztUxhuhj5hAwTFJniS13M8kMRQ1M9BS
	KPk1lQikTRN6l6HD6VpKjOoIY0/m/FrefpQQazop+8UiB+kUeMqFkTgckAxBzpr4jvN9
	4x+Q==
Received: by 10.224.174.205 with SMTP id u13mr1015722qaz.57.1338325565265;
	Tue, 29 May 2012 14:06:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.162.12 with HTTP; Tue, 29 May 2012 14:05:45 -0700 (PDT)
In-Reply-To: <41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
References: <cover.1338323483.git.ross.burton@intel.com>
	<41C46607-08A4-46F1-8572-3320B7FD2615@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 29 May 2012 22:05:45 +0100
Message-ID: <CAJTo0LaFHe1jGQLoNkS6MkHwsM58iLJiRXpSSEKo-UqNQwjJCA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmhToUoKZmQQyBvCY4it7yp8apqAS8RzBsnj2UwWJ2TDTo2tnazLJNKnAnW9Zw0mesFm9A2
Subject: Re: [PATCH 0/4] Upgrade connman to 1.0
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
X-List-Received-Date: Tue, 29 May 2012 21:16:25 -0000
Content-Type: text/plain; charset=UTF-8

On 29 May 2012 21:56, Koen Kooi <koen@dominion.thruhere.net> wrote:
> IIRC the sed was done to get around the 'atconsole' restriction, is that not needed anymore? E.g. can I ssh in as root and run the connman tests and when I log in to gdm as a simple user will connman-gnome work?

If that was the intention then it's a very heavy-handed solution...

Out of the box, root can access the service.  There is another patch
to add "xuser" for systems which run a raw X session as that user.  If
you're logging in with gdm to an arbitrary user, then the at_console
test should work, right?

(one of my plans is to remove hacks like this and have a lightweight
way of starting an X session as a normal user and actually registering
it as a session)

Ross


