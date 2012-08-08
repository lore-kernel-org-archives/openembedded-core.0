Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz21F-0001cR-CA
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 10:53:33 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 01:41:45 -0700
Received: by obbuo19 with SMTP id uo19so712270obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 01:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type
	:x-gm-message-state;
	bh=FXam7KRqJkaqz+XB16aYXFD4YLJih/z7cUy0jrirj4w=;
	b=g7KCIqAV/W7YKJUcB9IK7keh5M+aFgdVgb4QgmHm6qCxNEFtVDA8rG0dh9nD9h+LBi
	i7jr9fCUhPoFe4snAdK3oRHdR0Hf1L3yJccnctCxb18VxJCNryRJ54ZWcOo0vBCSyS+2
	ZqbXH5GMdyj+uIUxHkJPrmmSZDcUKGmB29fezefeubG1Tv6apWpLApH1p3xBgIq3G0Tv
	xLNAMGSeqhTAwMaO5/o+YWwEfqWOKQmXRSyFyNEgFNH80LNUp6Upxp5ptc5nFjrdxOcN
	fBnU61d3qjJg2B2LUIrZaQwHfTqIpiAU4CJl3z3NJFEHRu8tDvdKp85Nz5n+Fy9AzPn0
	C1vg==
Received: by 10.182.169.40 with SMTP id ab8mr29185610obc.34.1344415304568;
	Wed, 08 Aug 2012 01:41:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 01:41:24 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 09:41:24 +0100
Message-ID: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQk8K9ntxSdBfLpZdYydgSXtfhmQ+pTC7j1pbmzsoz6+C4aSDReI+aQIol03BED14JLBKDqM
Subject: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 08:53:33 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

As everyone who's used it can attest, Web (the optional browser in
Sato) is pretty rough.  Part of my plans about replacing Sato with a
leaner environment involves replacing it with Midori, and if there
isn't any disagreements I'll work on a submission to merge Midori into
Sato now for everyone who expects the Sato web browser to be useful.

This will involve pulling a few projects from meta-oe to oe-core:
ca-certificates, python-docutils and vala specifically (although its
possible that we can drop the vala dependency).

Ross


