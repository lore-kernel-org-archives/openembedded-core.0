Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBA273223
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 05:34:14 +0000 (UTC)
Received: by laar3 with SMTP id r3so181622546laa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jul 2015 22:34:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=Bvwf7DkRje+ClkHEKgzd2x/V268ArRT2wBrADRW8YWk=;
	b=Y4nBQXwAOzNVkOnlhgj9JcKqxnUnjSlzD3QkpLs4rdnKw0CZZ5sy946GIUaJwKeBv1
	QWADc0gOM9WeU1JraTXYCvzQOZ6UQImTW6oV0P8OG2LlipoJQAPZLmUKxh4XXcBmWeX9
	VUjeqz/ULEdGYULiqZwMOJ0nQK9A9pZKLqK2VkowqWtcIAhzZ8MSzUekwh11c3uQXF+F
	YglEc5ijdGcvJ+98tSw4QTXa4Uv5py2SWgYlnDuNaObOXqvOilVtuUvvWxWuLKuTQahJ
	VlSPiu+Q6gAx25D7pdGVreeTSdglkrDXskNPRvLgFSDH3/hDKTUXCjAwHusywxl8rcEI
	C7fg==
X-Gm-Message-State: ALoCoQnV0Sbe1Yo6jdmhtZc39CP/Kj8iATbqlbdaC/BnLRJAJlbFhjdsAO59DLbcDLxoGzjQvslo
X-Received: by 10.112.89.201 with SMTP id bq9mr2245986lbb.39.1436247253286;
	Mon, 06 Jul 2015 22:34:13 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id oq2sm5307808lbb.34.2015.07.06.22.34.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Jul 2015 22:34:12 -0700 (PDT)
Date: Tue, 7 Jul 2015 07:34:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150707053411.GA17548@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1435497302.git.akuster808@gmail.com>
	<6769ffd59132415288582211bed1c32739a52430.1435497302.git.akuster808@gmail.com>
	<CAJTo0LZ58Ojrb=9ctie+VvB7F9BQJHSKsVghsSgedSn0EbnRQg@mail.gmail.com>
	<55956F2C.2040301@gmail.com>
MIME-Version: 1.0
In-Reply-To: <55956F2C.2040301@gmail.com>
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
X-List-Received-Date: Tue, 07 Jul 2015 05:34:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* akuster808 <akuster808@gmail.com> [150702 19:05]:

> The current version of nettle 2.7 has one file that is GPL v3.
> mini-gmp.*

> so the license for 2.7 should be updated IMHO. So wont that put us in the
> same boat as the upgrade?

Well, after looking a little bit at the repo in question, my
understanding is that all files (well, those few I looked at, including
mini-gmp.*) is dual licensed LGPLv3 /or/ GPLv2+, in the current master
branch. It looks like this was done 2014-04-12, in 12 commits.

So could you double check the 3.1.1 release, and verify whether it only
consists of LGPLv3 | GPLv2+ licensed files, or if there actually are any
files having the GPLv3(+) restriction?

At least the commits from 2014-04-12 suggests that the whole nettle repo
was clarified to be dual-licensed as  LGPLv3 | GPLv2+ (though there's of
course a risk that some files are left untouched). Though, it also
suggests that upstream is willing to ensure that GPLv2 compatibility
remains as an option.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

