Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TBMuH-0006l8-W3
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 11:37:22 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Sep 2012 02:24:49 -0700
Received: by obblz20 with SMTP id lz20so393948obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 02:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kjdcrRadg7nfl7+yvOgqLZctO1BhPXiLDrjqWNSy4v0=;
	b=HpsV5gl/ZUAQneCVpNuAazUOws/PrT3IqTEeOcCnb2ARaSP28nK+ORGwmMPA1Uuq/u
	b1EgxI9AIIia3qgIcR1sVqz14HvmC32GFBYl/ZDb7N03QqpCYUHgjXQgcCVVhRo/M1IP
	AYDxQARir9RoSatO05t+icH4JAwPfgyVqhk546w7htb6h8Rr5IR/BUnjLTFv9tM3jPPi
	QAOoBkRfmgboo1ckUg3d5qJPgvrIwfhQSSwr2LnAH9zaOxzpxVGBLnbydLnTsKxTkEas
	c6H9biTWc0CKZE4cuCRrWwvalQPquzy7PIKsGAM9yC0bJ++71o3lWjZH+kIm0YBco+5h
	ZYHA==
Received: by 10.60.171.174 with SMTP id av14mr17545265oec.61.1347355488491;
	Tue, 11 Sep 2012 02:24:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Tue, 11 Sep 2012 02:24:27 -0700 (PDT)
In-Reply-To: <EF1BA017-A04B-4FA6-B519-916F2F052FA1@dominion.thruhere.net>
References: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
	<1347297632-16529-3-git-send-email-ross.burton@intel.com>
	<EF1BA017-A04B-4FA6-B519-916F2F052FA1@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Sep 2012 10:24:27 +0100
Message-ID: <CAJTo0LZ0BcWNycM43SpYsfERsu3cX3rUhXvn_eFMuaYUS=JzZg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlDETUBW/9LHJh1RpmQrYNMdsZNbbZwxy9haeG98DhyuQWVgAET5KvwxfbLbfqRq/56NiG4
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libx11: don't split libX11-xcb out into a libx11-xcb package
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
X-List-Received-Date: Tue, 11 Sep 2012 09:37:22 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2012 07:22, Koen Kooi <koen@dominion.thruhere.net> wrote:
> What's the upgrade path? This commit will create a clash because now 2 packages will provide the same file. Is that pain really worth it?

The pain is "just" a matter of some dependencies I - again :(  -
forgot to add.  The library disappearing entirely at some glorious
point in the future (from the list Martin provided, it looks like
libstartup-notification and libpulse are the main offenders) is a good
reason to ditch this patch.

Ross


