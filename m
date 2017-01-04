Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2A26F6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 13:05:06 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id c20so304853643itb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 05:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cSAmGuLw67BZiZxoeBJqdFLt/1CzbipcvLy6s6k/oVg=;
	b=PfEvZAYVzSwP8mYXHe1hQrAkTzI2eTwc2Tl+nZde/haMfgz33hiQOSmLXugQEw+mGC
	NOdAbwhC+18rxLRda+5Hoaes7SZ7c6bFB0pXaNaoJzVZ9LMk54S67QU3jb6CATPELf3r
	2HTIPYexfs0Vjj4EX0mqqPaarca41NfARdv77qRHuE2lTKDg5rMGwbrJo6CJOhZNkT+F
	j2Qs0IbIMV8o3fKNpzgIAzi3dkVlJsSrBSnnbxIXefn8kgWmKX/Ijumh+QVl/Mbdkhwe
	0FSbDdS2pA4UNo8upZeb4IEy+3MmP6p89IVfEjQfQUXjJtPRdB4TUPeEKffTE4o6N/wh
	BfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cSAmGuLw67BZiZxoeBJqdFLt/1CzbipcvLy6s6k/oVg=;
	b=mcNCl+4z7LqBwdJ2k4IJ4ht/JQmBssLDk0cdMuW9RUvAY8JWe/ACw2T8MMSDoHhr6T
	n0hRN7VFYxQK5dMv0O0KBDilFZPeIJErdBdga9pi07qH+/avfYGbkyERQOWDxtaK2aq2
	Q3IqjUZ5xPAVj5Cv2hgrfBd/hYpF1bfxYhz5pB2UYW7uJPv5yB/FmUh+RA3M7lP8MJC6
	Q97oHnv9t0si1xHhLqCSekV7xdlinc2c661+RTupYmRMxT0+A1OgLZ0mebkSUMIkB8cj
	NIACPKLkiCScrjoxgR2rGylbHsU9BIA2VmmXx2MlQ2q+Vzj9sOJUkjMmtZbFhIucU4DC
	AbUQ==
X-Gm-Message-State: AIkVDXJ2bqxHjysf6hU+FdMEcpir2KENJ6vC5WUgY+9n7kGLexDOJ5aCkknlUtUKxasnwOqe
X-Received: by 10.36.5.141 with SMTP id 135mr3216316itl.47.1483535107030;
	Wed, 04 Jan 2017 05:05:07 -0800 (PST)
Received: from pohly-mobl1 (p57A56308.dip0.t-ipconnect.de. [87.165.99.8])
	by smtp.gmail.com with ESMTPSA id
	f187sm27699399ita.7.2017.01.04.05.05.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jan 2017 05:05:06 -0800 (PST)
Message-ID: <1483535103.28169.52.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 04 Jan 2017 14:05:03 +0100
In-Reply-To: <af03426da1f2d00149a2021b8d681b2dcef3a1ea.1482376395.git.paul.eggleton@linux.intel.com>
References: <cover.1482376395.git.paul.eggleton@linux.intel.com>
	<af03426da1f2d00149a2021b8d681b2dcef3a1ea.1482376395.git.paul.eggleton@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] classes/buildstats: don't expand variable pointing to SystemStats
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
X-List-Received-Date: Wed, 04 Jan 2017 13:05:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-12-22 at 16:13 +1300, Paul Eggleton wrote:
> We're placing an object into the datastore - it's very definitely not
> something we want to be expanding.

Why does it matter? Is it faster to tell getVar() that expansion isn't
necessary?

I'm fine with the change, I'm just trying to understand whether this
merely cosmetic or has some real impact.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




