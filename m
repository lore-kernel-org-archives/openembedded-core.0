Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SAjQX-0002RU-Ps
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 15:55:46 +0100
Received: by wgbdr12 with SMTP id dr12so1252068wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 07:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to:x-mailer:x-gm-message-state:content-type
	:content-transfer-encoding;
	bh=csWEqxiOoD+TjSrvRPyXm/DY+nYnSyW+xEq56U82tMs=;
	b=a6UlE6Nr+Ty9egvG91JPh+GyrP/3F4PcsDdG8yfuF31WW5q5P6CZLbViqCX0dRQXbx
	1sLR7ZMILZxpT85T/NelOq0qDnYGn0ol93OPaZLtwsZpOMcm9pCcPMADNVvZ0XlZkRkS
	/BIvQu6iS+xbDUXVIaSwemnInNk559ITdcw9ZVLi+OS8D2CfhuUBs7Mne6fSPw63RvKg
	AR5eOGa9GSLBAvvx5W+nVfZWsNlQce+42sJSP+bSJ4gwBk7PhcpZXXIJhea9jQ90Lcrv
	6vhEFKxM5j6E2hIBpML65tZ8H1u1Bi5oVfM58ffl8JKQ/DTcOhR6C1GFmBqSRFR91O8K
	sFxA==
Received: by 10.180.105.69 with SMTP id gk5mr6663934wib.3.1332427610902;
	Thu, 22 Mar 2012 07:46:50 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df3sm5766785wib.1.2012.03.22.07.46.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Mar 2012 07:46:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6449205.EIHV3lzBd1@helios>
Date: Thu, 22 Mar 2012 15:46:48 +0100
Message-Id: <50317DEE-D128-4700-845C-CD7E6A6656A3@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
	<16657624.ejDoFzWrx1@helios>
	<0E615ACC-662B-408B-BDAE-032723A55D15@dominion.thruhere.net>
	<6449205.EIHV3lzBd1@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkT1gljofk3pE9I2E44hiNFOO8rAvx1NT4h8Y4fP2Wo0sVPNgPFALssBse6rPK+PyyDezka
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC v2][PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Thu, 22 Mar 2012 14:55:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 22 mrt. 2012, om 15:25 heeft Paul Eggleton het volgende geschreven:

> On Thursday 22 March 2012 11:35:30 Koen Kooi wrote:
>> After a few more days of usage I'm going to create a follow-up patch =
that
>> will do:
>>=20
>> 1) reinstate the global git status --porcelain and make a single, =
empty
>> commit if nothing changed instead of N empty commits. 2) either parse =
the
>> output of git status or re-run it to see which top level entries need =
to
>> get committed and only run 'git add ; git commit' on those.
>>=20
>> That will keep tracking all builds, but will be less noisy. But it =
will be
>> slightly slower when the OS doesn't cache the git status, but I =
decided
>> that I can personally live with that.
>>=20
>> So what do you think about that?=20
>=20
> Well, avoiding >1 empty commits sounds good. I'm happy to go with your=20=

> assessment as you're more likely to be observing actual performance =
than me=20
> (I'm not really monitoring the performance of buildhistory on our =
autobuilder,=20
> only the output).
>=20
> FYI I didn't comment on the splitting into separate commits patch =
earlier=20
> because it doesn't really bother me either way. I do think people will =
find it=20
> easier to use the buildhistory-diff tool rather than looking at the =
git log=20
> directly (or the web-based equivalent when I finish that.); but I'm =
happy to=20
> continue supporting those that prefer to read the log.
>=20
>> If you like the idea, would you like it as follow up or as a respin =
of the
>> series?
>=20
> Since it hasn't been merged I'll go for a respin, if you don't mind.

I'll respin and take Martins concerns in as well. Not sure when the new =
patchset will be sent, 2 weeks of tradeshows, bspfests and summits ahead =
:)

regards,

Koen=


