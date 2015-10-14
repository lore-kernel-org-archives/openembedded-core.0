Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id E3B8273232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 14:43:53 +0000 (UTC)
Received: by igbif5 with SMTP id if5so22423184igb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 07:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=QBiDrV6FW2ipCOAkN3pIjZDRiN5dQvN8c4ChTOct4qs=;
	b=TUv4C9zMywfDz9jjFFoGcJ+pcgLceWI7QuVXoF8YvRF0GHIMZU1dsVYHnbaiEKCUCV
	qB8HQQ2n2BH3f4itHNBqPKMJHQHgBxThkSSPxD17VPG5r4I8SJkPXNzJhk3/m21WbjTc
	4XbCgxGTvq3zMR1e1TrB3MI1f7SJ6BEDNj4h4/tz4qLC3Z4yIuWeKf+HW2F/8VOyIuGI
	xEw53E/YXUEAPRGr1Spu4D82keIuzDsY1QrxXc47m1FvBDCeuZtolWGksJVDfHkRpwLX
	mlLhtcKbPsEOYhNkqFh0BjLIbwwP6ez2LTJuv2S7jrv2oJQUGOH3Kn4vT2UwsNmOJd9m
	lXaQ==
X-Gm-Message-State: ALoCoQkojlOjQ8M4eb1gZ4iJygU1Wh7dKzDt8ix8XFtxZibQIfTdskHi6bSkyFmojfmRZB5RVgJP
X-Received: by 10.50.79.135 with SMTP id j7mr4154499igx.73.1444833833451;
	Wed, 14 Oct 2015 07:43:53 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180]) by smtp.gmail.com with ESMTPSA id
	rj10sm9200023igc.20.2015.10.14.07.43.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Oct 2015 07:43:52 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv82 with SMTP id v82so57481380iod.0;
	Wed, 14 Oct 2015 07:43:51 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.27.136 with SMTP id b130mr4658414iob.28.1444833831738;
	Wed, 14 Oct 2015 07:43:51 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 14 Oct 2015 07:43:51 -0700 (PDT)
In-Reply-To: <2371185.tThFydMRSC@peggleto-mobl.ger.corp.intel.com>
References: <1443597600-29477-1-git-send-email-adrian.ratiu@ni.com>
	<20151014141650.GC22448@jama> <561E67B3.7010304@ni.com>
	<2371185.tThFydMRSC@peggleto-mobl.ger.corp.intel.com>
Date: Wed, 14 Oct 2015 11:43:51 -0300
Message-ID: <CAP9ODKqqGf9rQu3iei1LkjfpznmLTL4xmA2SwxAqGLxfszYiMw@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH v2] meta-oe: recipes-graphics: add libvncserver recipe
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
X-List-Received-Date: Wed, 14 Oct 2015 14:43:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 14, 2015 at 11:41 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> FWIW assuming it works and isn't specially patched, I think for x11vnc we'd
> probably be better off using an external lib we can keep up-to-date rather than
> a bundled one that might be out-of-date; that is to say, if we are to keep
> x11vnc in OE-Core then we might as well also have libvncserver. (One might
> possibly ask if we really need x11vnc there though, I don't have an answer to
> that).

I think x11vnc could go to meta-oe. It does not seem to be widely used
and a core component.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

