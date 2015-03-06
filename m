Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 63BB46013D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2015 08:26:44 +0000 (UTC)
Received: by labgq15 with SMTP id gq15so2171830lab.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2015 00:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=4vImPHdHM9Jx10O1TxAWH27QMkoJUg/nDWF41Y1cqA8=;
	b=cq6sfrM4oWmp8WTeh71ocg4idZZkQ8Kkb7tIBpKcYlQJDA8BCYwpWMffOzXRCZdGDl
	vA7Xw3M/yxu3CHGy1F+qoMATPvQ+9ob/ZD6w+qGPA3hL5EgcCd48hIlvPGB5MtnFwmkC
	eN0TonIjfhGbrLuWvViufdpjfvv/MTYQ2Bwu5spYgSbr3boWzQJUXNk63WirSBus6dEl
	502zoOiXX2Run6zqQrjEOvY7IDufvAB8s9tIXptcW7aT0QiMmNdd1748Z4xGvK8iMx0U
	S3wQYBO2eJDhKDHbEbTjar/aqdOipWLML4oli+0qaZtCzdWNLO1+st/S/iqxwFgI02bf
	jNrw==
X-Gm-Message-State: ALoCoQkRJt7rmWH1W2+aM0K0TElvJMMZKRjS2XWiXYP0a0NLldEGhURHzH7ylgTxqQfI+pAPlClV
X-Received: by 10.112.98.201 with SMTP id ek9mr11775479lbb.68.1425630404764;
	Fri, 06 Mar 2015 00:26:44 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id i6sm1682075lai.1.2015.03.06.00.26.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Mar 2015 00:26:44 -0800 (PST)
Date: Fri, 6 Mar 2015 09:26:42 +0100
From: Anders Darander <anders@chargestorm.se>
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20150306082642.GB14309@ad.chargestorm.se>
Mail-Followup-To: Gary Thomas <gary@mlbassoc.com>,
	"Burton, Ross" <ross.burton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <1425570531-9477-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0La0cGM+YSFjj5XmR7eex7m5o7xc0rkmz96z2GGvY-jeEQ@mail.gmail.com>
	<54F88105.8020509@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <54F88105.8020509@mlbassoc.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] opkg: Fix error when recompiled
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
X-List-Received-Date: Fri, 06 Mar 2015 08:26:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Gary Thomas <gary@mlbassoc.com> [150305 17:15]:
> On 2015-03-05 08:52, Burton, Ross wrote:
> >On 5 March 2015 at 15:48, Gary Thomas <gary@mlbassoc.com
> ><mailto:gary@mlbassoc.com>> wrote:

> >    v2: Move the update of the opkg.conf file into 'do_install' which
> >    will prevent any erroneous [multiple] options to be added to
> >    'opkg.conf'


> >Don't put commentary about v2 in the commit message, as when it's
> >merged the content of v1 isn't relevant.

> Noted.

But for single patches, please keep it in the e-mail by putting it below
the first --- line. I.e. just before the list of all changed files.

It's really nice to see a changelog together with a v2, v3, v... patch.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

