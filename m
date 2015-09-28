Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id A705F7626C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:42:15 +0000 (UTC)
Received: by labzv5 with SMTP id zv5so3818807lab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Sep 2015 23:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:organization:user-agent;
	bh=8pag+PPmFGPViKz/Tq+kzqrOeP7f11HDi8pABSgY0Ek=;
	b=fViZ61ovcJAracq/1ja8xCCXw/csFnUPiqHOr/EWUtJr9AvQLmCjCSBjD7WQGOHW16
	1Dzzdf71dRMtV9WzUNdqf0nQTDbgvibgu76zyB8CN3BXG34rc9NP0OZofesuN71jyTqJ
	v8tnTUV7UC8EE59VBv9X5FTC+x2S23PdydJMLJD3JdOilpawDP4JmIXKwgWumE2vgWP+
	En4LB1Url/+BzdhKsI6kGDdC94BTAk4lvnAYx6riP2Gxo7y7TxsIfJK6cBwfSbGdza+L
	IwOTYU0ylA/iIc0LMzp0lVmKUSeSWjzPLj1f8d8/Tv4894I+nP7oMAKov4nWxZK9k8RK
	Bvhg==
X-Gm-Message-State: ALoCoQkGXL2cyIbaKBb7VfMpgxvwEg336Acxn3NS9SdGX/HdBM6K5qQ45LBp4JvmRM1IKy5OES4w
X-Received: by 10.152.178.194 with SMTP id da2mr5092604lac.77.1443422534210;
	Sun, 27 Sep 2015 23:42:14 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id v3sm1928296lae.13.2015.09.27.23.42.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Sep 2015 23:42:12 -0700 (PDT)
Date: Mon, 28 Sep 2015 08:42:11 +0200
From: Anders Darander <anders@chargestorm.se>
To: Jonathan Liu <net147@gmail.com>
Message-ID: <20150928064211.GA4933@ad.chargestorm.se>
Mail-Followup-To: Jonathan Liu <net147@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1442833766-16676-1-git-send-email-net147@gmail.com>
	<20150921121652.GG4630@ad.chargestorm.se>
	<56056305.3060606@gmail.com>
MIME-Version: 1.0
In-Reply-To: <56056305.3060606@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 28 Sep 2015 06:42:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jonathan Liu <net147@gmail.com> [150925 17:07]:

> On 21/09/2015 10:16 PM, Anders Darander wrote:
> >* Jonathan Liu <net147@gmail.com> [150921 13:08]:

> >>This avoids a "Could not unlink" warning when extracting a /var/run
> >>symbolic link pointing to /run from the base-files package as it is
> >>unable to unlink the /var/run directory when it contains opkg.lock.
> >>This also fixes an issue where /var/run is created as a directory
> >>instead of a symbolic link to /run.
> >This fixes my recently discoverd runtime issues, when forwardporting a
> >systemd-based distro from daisy/dizzy to the current master.

> >>Signed-off-by: Jonathan Liu <net147@gmail.com>
> >Acked-by: Anders Darander <anders@chargestorm.se>


> Bump.

This one needs a rebase. Could you send one?

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

