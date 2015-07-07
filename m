Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7BA9E73223
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 05:47:01 +0000 (UTC)
Received: by labgy5 with SMTP id gy5so29032495lab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 22:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=AoB/5Cm17jAnDrMfRZFvlfWDijj3+DnJH+pQtDZ63AA=;
	b=Kw3x9lFQYkCw5nUIRazbAsct95Gtktg2V2zf7rTbbv/3nqKaFk/LoaVib/r2QMQF2e
	lpEMuNXHrvErwa65EIlGj4QQBvfdBmyv8QXF4606w5yc8DhAQHSEXS8BkngAhjSrjPUF
	m6NRnj2YazsXOnx1nYa6V7QGsWopueVn0CTfemISCFK8sZRAcOHRurCje1fmzawdl2bI
	Nny7LzF88/iXcHz4t0XSMKW9iD2TufVRahSsbnEp+kKHyzww1WZQMsUxuLX4QGytpvet
	UJDhxWic+IM1PAdO35ez73nzXUTFqHQpJYYtJ2dyM4aIV9KBD6Jwl6rRYp+cWfsPvi3u
	o63g==
X-Gm-Message-State: ALoCoQnLugOaF0weiOzSueaZsbJU+zmiXcZAlFzKpt3jEsNRVbwYa7W2ySlMgXIHcw0E3jZsDV/2
X-Received: by 10.112.126.101 with SMTP id mx5mr2364309lbb.35.1436248020337;
	Mon, 06 Jul 2015 22:47:00 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id df8sm5297524lac.3.2015.07.06.22.46.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jul 2015 22:46:59 -0700 (PDT)
Date: Tue, 7 Jul 2015 07:46:57 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150707054657.GB17548@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1435497302.git.akuster808@gmail.com>
	<1548004.RNEmCtHdiu@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LYcEcQfGQTKhq9tkRJNLJTw=LQHEp65e9NqMf7xtPCgMQ@mail.gmail.com>
	<2433609.uH57bnQbKA@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2433609.uH57bnQbKA@peggleto-mobl.ger.corp.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Tue, 07 Jul 2015 05:47:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Paul Eggleton <paul.eggleton@linux.intel.com> [150706 15:58]:

> On Monday 06 July 2015 14:04:46 Burton, Ross wrote:
> > On 4 July 2015 at 12:38, Paul Eggleton <paul.eggleton@linux.intel.com>

> > wrote:
> > > Well, at minimum for our purposes LGPLv3 (or LGPLv3+?) needs to be
> > > added to LICENSE in the nettle recipe (with &). Whether or not
> > > someone chooses to exclude that license in their configuration
> > > through INCOMPATIBLE_LICENSE is a completely separate matter (and
> > > that is, as you allude to, a distinct license from GPLv3).

> > FWIW the YP documentation states to mark GPL LGPL and AGPL v3 in
> > INCOMPATIBLE_LICENSE to build a GPLv3 image, on the rationale that the
> > usual clauses that upset people are not specific to the GPL variation.  The
> > autobuilder just excludes GPL right now, but there's a bug to fix this.

Good. I had assumed that it was changed after the discussion that lead
to the additional mentioning of LGPL-3.0 and AGPL-3.0 in the YP Manual.

> > Of course IANAL and the opinion of someone who actually does use
> > INCOMPATIBLE_LICENSE to remove GPLv3 software would be appreciated!

Well, I guess that it's the opinion of someone who uses that, and has
been running that through lawyers that's needed. Maybe one of the
commercial distributors can chim in on that.

Otherwise I guess that a lot of people using INCOMPATIBLE_LICENSE are
doing that on a layman's basis, just like me...

> I'm also not a lawyer, but for that exact reason I don't think we want to get 
> into any question of license equivalence or similarity - INCOMPATIBLE_LICENSE, 
> if used, needs to list all of the licenses you wish to exclude, so if you want 
> LGPLv3 excluded then you need to state that in addition to GPLv3 (and 
> naturally any recipe that builds LGPLv3-licensed source needs to state as such 
> in the LICENSE value).

Yes, we certainly don't want to state that everything except for a short
list of licenses is OK. In the end, that's up to each and every company
making products to decide.

Though, in the YP documentation, we state as an example on how to get
GPLv3-free builds, that you should set INCOMPATIBLE_LICENSE to "GPL-3.0
LGPL-3.0 AGPL-3.0", per an e-mail thread from last year (if I remember
correctly. I know that at least Mark Hatle was involved in that thread,
as well as I).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

