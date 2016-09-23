Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 568F560939
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 10:27:24 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id o3so10721317ita.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 03:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=UaiqQNYHlFdsdBD/wM7tv/fo8crqMJeZ5+qvW2VKUUY=;
	b=SiM/xOqkTmlV4sAm+Tz5GGike1D5oc4VWZ8ZkngJ0YLxMi+zRa1OYLAVM6ihPV+aH1
	NZfBqyMSe6r+yd8oJxEgKX1deR/eNT0tSN7Oi2bD0kR2U6GL9scGcqrjzFZDsPIMV7UG
	4MoRKHxYQ7QseRUz9JlvlVLW17yKlkqCCf2XBFOGFTPCawQDp7zlP6tTrRqjOw8cVTEl
	0fVpA3zU2LgJaLxurFT5TRQ/s7qLeIa5P6IuAp013x5zEBnRhHo75oQhMEkFxNwgDh5C
	UTJwGUkX2I2DhKW1a27ZHvj3/eqUhASk3nNJFe4N/GwHZTwIQtKP44hls02i1RDkH17s
	JCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UaiqQNYHlFdsdBD/wM7tv/fo8crqMJeZ5+qvW2VKUUY=;
	b=T17XENE8BP/efoCgoPvXoPVKlgXQWu/HskQH8SsJzOQo7MSidVjURWvZ2oqB3ODRDp
	FRidhufq0q13rgGS6QVXuPVfarbBmfRZPzj8VgqYkSrsOGfRHKpZmWsbDNOO5MiWiRei
	Zh5RVgOG1sfhcMkDRnY30hpiG4Z6WewlL45GzysyonqHHvl4Stku/DL5rqTt1eJwcRGn
	XUYzXbLv4MtB3mXwMvA7MwDsuAaDVItTSb/GfX7fX16f6rsAHtD2d7x2+pKbQwZQj/jj
	qOWe8de9u28l0nAcsATzMZnWjD5CKRdmkpW7+Lr+wLZ+50PZfoLG3c3OsWzmadICeaPi
	TY4A==
X-Gm-Message-State: AA6/9Rlxol2uuIJT4tIqMPUN+Cy9DmX+3UMT1UwBRzfRCu47NiIOa8/2QRnXkxhiJluSLwjb
X-Received: by 10.36.210.68 with SMTP id z65mr2529776itf.32.1474626446102;
	Fri, 23 Sep 2016 03:27:26 -0700 (PDT)
Received: from pohly-mobl1 (p57A56298.dip0.t-ipconnect.de. [87.165.98.152])
	by smtp.gmail.com with ESMTPSA id
	l15sm2595175ioe.14.2016.09.23.03.27.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Sep 2016 03:27:25 -0700 (PDT)
Message-ID: <1474626443.7161.5.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 12:27:23 +0200
In-Reply-To: <cover.1474619763.git.patrick.ohly@intel.com>
References: <cover.1474619763.git.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 10:27:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-09-23 at 10:38 +0200, Patrick Ohly wrote:
> Fixes several CVEs.
> 
> It compiled for me okay for qemux86, but running the ptests showed a
> problem in one of the new tests. I'll investigate that further

There is one FAIL:

../util/shlib_wrap.sh ./dtlstest ../apps/server.pem ../apps/server.pem
Starting Test 0
Failed to load server certificate
Unable to create SSL_CTX pair
make[2]: Leaving directory '/usr/lib/openssl/ptest/test'
FAIL: test_dtls

That's because server.pem wasn't installed. I'll fix that.

However, ptest-runner returns with 0, i.e. success? Should it do that?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




