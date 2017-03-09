Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id D160F730F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:05:53 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z13so35934132iof.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 12:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Hhaphv+/JPbcqP5n3cVPHG+cRU7K2lWefijrD2UUakc=;
	b=XS+ypRhJppVoD6Lk4YY4UhKAGEvRg/Rku/ZayHmnPYQAx0ELSoy2DJQ5AeaB/UFtv2
	2IMnkU+Djbwf3lAdQDY1NFlLyiO5ms1k13uWPUVTplKDI3ywiAcUuvG0/UCUjJ4FBIN1
	kl6DW+EvHb9DhQ/6zV8zDbMfaAbTebv354XQdRq/QW2SjfhfFbrurxOUO80IqsOWfgMB
	RPn0oqLfT9gYTh1aqXCYApsgPWdlgbDyK1I+HHGNS4pkxOteITJua9x2Wlc2h8WV65jf
	t/ffLHsha17hdn13yTqzLbjfhfR+5uFa3qPdh3kn4ND7gfpeEFZPfV8vb2EYdLtfCblg
	dPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Hhaphv+/JPbcqP5n3cVPHG+cRU7K2lWefijrD2UUakc=;
	b=SfVgY5y4DvvSpN5Lh55lKTsfy4+Vp/6uaOwpinZus2iZ0PTD9vGOSMigXkHEmWlIlB
	d3y59MCukgPQ5xv3QMzLxB2Z9Lz7pjpr186uglKcssDN3ghpVp8DllvBI0K3sXbJFjvK
	eLY6QHg8lpjSlu2XISxbsKWGAeuVur2pgbLaSITnd13kal9LoBMpLdswkkKalcjPNwOm
	8QQPEvZd3EymAnBUcl4WteEX0pZY/Stln4xdeM++MLLj1NtIdXAMKjIgoebQ/fMpF4Tu
	b8nOZoABpRDBOmC4XJ4P3EAqr9XD3c3qFky1xdBH3Oc9eyAeq2gog4MMyY5DgXo2kgkq
	s/dw==
X-Gm-Message-State: AMke39ms+d3aGfrF69MQMKXHNHP0KOPe3XBjIljphpiuSVETJFyygSgSPNH2MlMXwBPpzTPM
X-Received: by 10.107.39.70 with SMTP id n67mr12952769ion.114.1489089954608;
	Thu, 09 Mar 2017 12:05:54 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D47C.dip0.t-ipconnect.de. [93.232.212.124])
	by smtp.gmail.com with ESMTPSA id
	e195sm5526965itb.18.2017.03.09.12.05.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Mar 2017 12:05:53 -0800 (PST)
Message-ID: <1489089950.7785.374.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Joshua Lock <joshua.g.lock@intel.com>
Date: Thu, 09 Mar 2017 21:05:50 +0100
In-Reply-To: <20170308172417.15776-2-joshua.g.lock@intel.com>
References: <20170308172417.15776-1-joshua.g.lock@intel.com>
	<20170308172417.15776-2-joshua.g.lock@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] meta-selftest: add selftest-ed recipes
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
X-List-Received-Date: Thu, 09 Mar 2017 20:05:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-08 at 17:24 +0000, Joshua Lock wrote:
> The oe-selftest oescripts.TestScripts.test_cleanup_workdir was using
> gzip and the GPLv2 variant to test cleanup of the workdir. This broke
> with the removal of GPLv2 recipes from OE-Core.
> 
> Instead of relying on recipes in OE-Core remaining static we should
> ensure that meta-selftest provides recipes required for the tests to pass.
> To that end we take a copy of the current GPLv2 and GPLv3 variants of ed
> and include them in meta-selftest as new recipes.
> We chose ed over gzip as gzip has dependencies which would require
> additional GPLv2 recipes to be included in meta-selftest.

Wouldn't the test become faster when using artificial recipes, i.e.
something which doesn't really need sources? Such an artificial recipe
can use a local file as its "source", for example.

Or did I misunderstand something and the selftest doesn't really build
ed?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




