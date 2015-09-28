Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id DC21A7626C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:45:51 +0000 (UTC)
Received: by laclj5 with SMTP id lj5so55046291lac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=XRydlwsU8Af1RW5ecQoKM3n8RPW1qT2mo9qyNTXFMXk=;
	b=fBDBP8iFpNyDKloi75i2tjbQWTBDh2yWBnxS8z/L4D2Hv9x5OxEQmntFZBZiY8zJ7P
	K5qyiddEjiB/Toyrjz6QfhIR+vLZkFYdaLQLrZyVUR3V0FoG38YDQlD5UIDm7GUa8Uhw
	mg0b+ZWPFUd0B7ZbtFEIF6iHqnyEajlFC6vSU8dnrvTTVRiIpqh7EgOraDThu7F1fFX9
	DKtuLM2CDd1WNmA3g5hme2DDv0tT5c0UKfXebEY2nrVe7QVgiUX77m37S3D1bzEmbLHI
	DSDcCvexEhaCiJDzLN9UD5em8AGiKq9Q2nbfwmYivu30jOnc3GP/HLs9dCITzYyB5UV7
	yiiQ==
X-Gm-Message-State: ALoCoQmRpNFTjvL1tzvwAnp5CnIQWGk4tAhvSRpLdjzLtUMKZmVNI8Wf5lANMaDuehrSqlUEDGeW
X-Received: by 10.152.28.38 with SMTP id y6mr65028lag.16.1443422750592;
	Sun, 27 Sep 2015 23:45:50 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	dt9sm1904761lbc.38.2015.09.27.23.45.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Sep 2015 23:45:49 -0700 (PDT)
Date: Mon, 28 Sep 2015 08:45:48 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150928064548.GB4933@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1443224121-24741-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1443224121-24741-1-git-send-email-net147@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH v2] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 28 Sep 2015 06:45:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jonathan Liu <net147@gmail.com> [150926 01:34]:

> This avoids a "Could not unlink" warning when extracting a /var/run
> symbolic link pointing to /run from the base-files package as it is
> unable to unlink the /var/run directory when it contains opkg.lock.

> This also fixes an issue where /var/run is created as a directory
> instead of a symbolic link to /run.

> Signed-off-by: Jonathan Liu <net147@gmail.com>
> Acked-by: Anders Darander <anders@chargestorm.se>

Acked-by: Anders Darander <anders@chargestorm.se>


/Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

