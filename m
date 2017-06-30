Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 430E77829B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 18:34:32 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id r36so28684912ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jun 2017 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ICakEBWEhsNF4Mc2hsF7tgZR/t9/wadMWoautKa/QhE=;
	b=0st1q3CsT51I396LsDghVzUYKvcBISVpNCZavDl2xlfz+M+eRcFNYcevozMaEduJbc
	IJagP3GZoHjrBW53UosYJhhzr4htDMCOAvZQy4oXJzXpjvDJJ27UfyBE2ghyPg4sFd04
	5+j/cF7JPD/bbunC7htLdS6Lde3X0kfQI6x/ji2dADx/wSNKHChNZzatrB+cTplJ4OTB
	7XHjKAQH5MztBYx7+GYhrxwJBzEntAxlvoVYKqLfM4LA56PkxalTXxnk4R46UIIukgBI
	LSRW4TWfu1d82nhS+wMaOxv2Dl4ihtSKYK+iLbxtc0t9RPGKO6I9jfBTI9FY+WNVvqxH
	ScvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ICakEBWEhsNF4Mc2hsF7tgZR/t9/wadMWoautKa/QhE=;
	b=dZ0s8hhmgGd/pOliltrmu1U1CEwvdNgGith1iGBIgrlTV87IYDdw+wnIuKAru2HFTD
	jPAOTrCLdZUFejTjdrp7wkmO/TZKeNntk2P4I6KoEvyyhiC0Y+4Mfq3W6OJx6BICxabX
	2GRLWO8skDanUbD4AXt88ltFbuwyml9hfx8iEd3lnIYZNEi64+nAthoYberW2LjtlJPv
	g/qEIrmQ7SGvkB7HEi4IHWS52xy67h+q1/DGFS6hF7uCvVE0s7SAhS1j9UNtR706Oebe
	shqyHdj8t3O4yF1AhEr2vBcBAY9KIlMNc0YUY2ZbYIBPX68P/Fl0D7IiQOYomDSXHKGp
	axhw==
X-Gm-Message-State: AKS2vOzDo7JxiXJmMTB2FzGVFkUe/URPHUWak1qFNeF0Dsgevm6uGWeo
	GlSFlYJ/27gETVR+
X-Received: by 10.107.32.139 with SMTP id g133mr22630833iog.58.1498847674142; 
	Fri, 30 Jun 2017 11:34:34 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FA66.dip0.t-ipconnect.de. [93.232.250.102])
	by smtp.gmail.com with ESMTPSA id y18sm455413ioy.13.2017.06.30.11.34.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 11:34:32 -0700 (PDT)
Message-ID: <1498847670.5259.9.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 30 Jun 2017 20:34:30 +0200
In-Reply-To: <CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
References: <cover.1498569961.git.ed.bartosh@linux.intel.com>
	<CAP9ODKopDxEYw9vereQjoHve=n2Of2v-3EHbxaiumZN3T0hH8Q@mail.gmail.com>
	<823180ba-066d-747d-8112-a110633a03a8@ossystems.com.br>
	<20170628073121.GA11425@linux.intel.com>
	<CAP9ODKoxxaJv=QZXp5m=Qt14t36n1TPXS19D+Xs3eyrPDG79bg@mail.gmail.com>
	<20170629083942.GA14649@linux.intel.com>
	<20170630083717.GA788@linux.intel.com>
	<1498813333.5259.4.camel@intel.com>
	<20170630122330.GA17125@linux.intel.com>
	<1498828593.5259.7.camel@intel.com>
	<20170630154456.GB28177@linux.intel.com>
	<CAP9ODKq3mB=0GBAZt21A3Ljw77TiNwBdCGZrSQt8L9rcr_i-Yw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/5] #11662 - wic should mount /boot
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
X-List-Received-Date: Fri, 30 Jun 2017 18:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-30 at 14:33 -0300, Otavio Salvador wrote:
> Other possible rootfs changes also should be possible to be disabled
> but IMO it should be per-feature (one for fstab, one for exclude,
> ...).

I also think it should be per-feature, it necessary at all.

I still do not fully understand under which circumstances wic modifies
the rootfs. If that happens only when explicitly requested in the wks
file as Ed said, then I don't see a need for any additional flags. Just
don't use the features which result in a rootfs modification.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




