Return-Path: <anders@chargestorm.se>
Received: from stoexhub03.domain01.net (unknown [83.145.59.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0469D6FA6A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 09:51:09 +0000 (UTC)
Received: from ad.chargestorm.se (213.114.64.43) by stoexhub03.domain01.net
	(10.12.10.3) with Microsoft SMTP Server (TLS) id 8.3.279.1;
	Tue, 27 May 2014 11:51:09 +0200
Date: Tue, 27 May 2014 11:51:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20140527095102.GF7185@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1401184227-1138-1-git-send-email-corneliux.stoicescu@intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
X-GFI-SMTP-Submission: 1
Subject: Re: [PATCH] oeqa/controllers/beaglebonetarget.py: fix conditions for files copied to /boot
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
X-List-Received-Date: Tue, 27 May 2014 09:51:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Just nitpicking a little...

It should ideally have had a [PATCH v2] header, to make it easier to see
that it's an updated patch.

If Saul or someone else picks this up, there should be no need to
resubmit. But anyway, for the next time.

* Corneliu Stoicescu <corneliux.stoicescu@intel.com> [140527 09:46]:
> Using '&&' as condition operator in '[ ! -e /mnt/testrootfs/boot/uImage ] && cp ~/test-kernel /mnt/testrootfs/boot/uImage' would result in exit code 1 if the first condition is not met.
> Changing the code to handle the conditioning more cleanly and correctly return exit status 0 if [ ! -e /mnt/testrootfs/boot/uImage ] returns exit code 1.

Preferably, the commit message should be line wrapped at ~78 chars.

> Without this if the file existance check would fail then the image deploy task would stop.

> Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
> ---

A short changelog between version should go here. (In this case just
stating that the commit message was improved).

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

