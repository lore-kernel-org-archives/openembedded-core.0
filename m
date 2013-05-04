Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UYht7-0006KZ-84
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 21:12:58 +0200
Received: by mail-vc0-f175.google.com with SMTP id lf10so2244228vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2013 11:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=B8zkdQxUZeLFHcu0TGSsd8p+vMdm3G7K2Wo6//jsYV8=;
	b=M6aP5g1RuOjpVUt7psQQUIuzTPVXed/XreKghGzHTCxjz9rd/1OulBnFkbAU2ZjjJT
	u4PG1Tf0YzR83DozKIzQQNq9bBEuOdfWeJGi9ZkeCTWf2A6SZY9OXqlqm/RZ4jlF2ac8
	F8zkFrLNUdP8ye1lQJQCB4riXuqwPTZG6uiHqrdSRvJ/wMe1D9jn0LfFz2EP9UC0FBEV
	mB2fpbO93mvf0Sm95LRVkTejvbXP0eaypsmf9PVzKHjMYFmV2ULmIFxjFkdAknnUvqni
	grYqvP2FgLlltmMD4Ou1btnPYtGeroS+Sp10LgKQb7IC9ljS7DwpsdP/ibzQoenZRp4x
	m2tw==
X-Received: by 10.52.117.212 with SMTP id kg20mr4413035vdb.55.1367693696203;
	Sat, 04 May 2013 11:54:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Sat, 4 May 2013 11:54:36 -0700 (PDT)
In-Reply-To: <3611267.eqIsdCBgi9@helios>
References: <1367622401-28624-1-git-send-email-sgw@linux.intel.com>
	<5184753F.9010904@linux.intel.com> <3611267.eqIsdCBgi9@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 4 May 2013 19:54:36 +0100
Message-ID: <CAJTo0Lb2p30KFcSX+aP94DhfBTzFApeUTc3DsewCTkoAsZSD4g@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnBP5JJRWqulONaeUivWtKR/rw/+evzw3beaWUxdGu+mXhvy6is6SrHySNkRg6GfCvJUj6v
Cc: Darren Hart <dvhart@linux.intel.com>,
	Scott Rifenbark <scott.m.rifenbark@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dmidecode: fix fetch path to use BP
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
X-List-Received-Date: Sat, 04 May 2013 19:13:03 -0000
Content-Type: text/plain; charset=UTF-8

On 4 May 2013 09:11, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> The easiest thing is to imagine what would happen were the recipe to be
> BBCLASSEXTENDed to native - would xyz-native make sense where you've used the
> reference, or does it always need to be xyz regardless of how it is being
> built? If the former, PN (or P with the version); if the latter, BPN (or BP
> with the version).

I've been hitting errors related to this when doing ML builds which is
a good one for breakage as PN gets prefixed, and fixing where they
were causing errors.  I was thinking it would make sense for some
common-sense sanity checks to be done - ie SRC_URI shouldn't contain
PN, FILES_foo shouldn't contain BPN (the foo bit, that is), and so on.

Ross


