Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id D50C4607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 07:07:20 +0000 (UTC)
Received: by lbcpe5 with SMTP id pe5so44697570lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jul 2015 00:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=HPLfm7jYjx2ZayaTL/j9EKPqNSh6frXjn/u3LiMOHR4=;
	b=Nlr7IULczqb/xPnR85ybIHcCiORdWTcpp2wwkoyBOA2zHXMiCg1xCa6NBYc9ZLyi6s
	MJ/0lmg1WC625sY85KRHnkgok2QJ+4X19Dr2kbezLknKIFUyp8PPWXmVFBSQ2IA/I01B
	j+fKzn59/aqKec765fLT2g7qYghvPJpU5sMeH+Bkw8q6hxxdfnpfYbO4yAZXJ8Zkc4pv
	GmSvcJKrX+ALU5AkaEeCEMyRuUF7eC0cIN+6TWcQlAmLYEtbltx4vph4PoEFqtAB/xLm
	MFGfhTwU9sD2rn61M3+8BvFyIEGi8KRJZu+2guwGySQssd6sheyY40V5ih5t/MPE51c3
	IWYA==
X-Gm-Message-State: ALoCoQlPHHh6ptRDiDQZM4n8RwI4aS9R4skcaFSHxhG0AM9TUK2yBf/oPr6Cc32oAwgEUT+qRNkp
X-Received: by 10.112.63.201 with SMTP id i9mr34220762lbs.93.1435907239113;
	Fri, 03 Jul 2015 00:07:19 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id h3sm2088263lbj.19.2015.07.03.00.07.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 00:07:18 -0700 (PDT)
Date: Fri, 3 Jul 2015 09:07:16 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150703070716.GA21416@ad.chargestorm.se>
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
X-List-Received-Date: Fri, 03 Jul 2015 07:07:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* akuster808 <akuster808@gmail.com> [150702 19:05]:

> The current version of nettle 2.7 has one file that is GPL v3.
> mini-gmp.*

> so the license for 2.7 should be updated IMHO. So wont that put us in the
> same boat as the upgrade?

Ouch, that's no good!

Ideally, we should look at that file and see for how long it's been part
of nettle. If it's just for a short time, maybe we could go back to a
point in time just prior to the inclusion (or license change) of that
file.

Has it been like this for far too long, well, then we either have to see
what impact this has on non-GPLv3 builds...

One option, depending on the age etc, could be to check if it's possible
to get that single file re-licensed. Short-term, we have to fix the
license and backport that fix to all supported versions that are
affected, even though that might introduce regressions in images around
the world... 

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

