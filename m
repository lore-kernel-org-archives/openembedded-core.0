Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F13470A89
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:43:45 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id n8so5720843qaq.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=No/FfNuatwy87V4434J8pkbE+xKhB4AZSXA4WKE5XNM=;
	b=OumfTdOtAD//mA0hE9ye7U1swsopUAz0+9qfKYffeswd8p/XonlnPR1HNegm/dzjrL
	XqX3TruhPY93uT03rLUNvjq+rymIi7AEBmCK1OlrZFh/ZDxRsY1I8iinB6LI5ojFy5Ij
	Rf+KBq7i8cJAEoFY9q5QpGtxp1zSeb9fpC1kaYBI/TU66d1nHtuqrw76SiMoVSIJebW8
	0lVyBwcp12t5WR3R0yny+B9YLCQKTSDhOlUBBberiFGNs2I8iAKhehRQR36JK3r1ajAI
	sKfjLC18vT3hoDu/3+PizeA0atfcA5v4GluLDknJQ+xvG/LwXp3iRq/izPS4dgV6L7Qh
	Zpgw==
X-Gm-Message-State: ALoCoQkcz8iys8A1zDAomysx1M9P1SePQ7W5ey2i7jVtXys2S6bPvmT0ljpAsY8eSJCnn2/dzdkg
X-Received: by 10.224.103.194 with SMTP id l2mr27073846qao.93.1411724626670;
	Fri, 26 Sep 2014 02:43:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 26 Sep 2014 02:43:26 -0700 (PDT)
In-Reply-To: <9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
References: <1411686803-13274-1-git-send-email-ross.burton@intel.com>
	<9C24F433-394B-4682-B921-7BD865351E64@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 10:43:26 +0100
Message-ID: <CAJTo0LbUPQfspN5yet6XvQziSk-pDqDHf0GvhCi06xn3CohUJg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] curl: add a PACKAGECONFIG for librtmp
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
X-List-Received-Date: Fri, 26 Sep 2014 09:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2014 07:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Using librtmp has nasty legal consequences in various countries, is there a way to express that risk? Something analogous to the commercial license protection we have.

Agreed, but wouldn't that be something done in the rtmpdump recipe?

Ross

