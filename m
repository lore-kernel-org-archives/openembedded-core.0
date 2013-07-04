Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 1852A6A464
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 08:06:34 +0000 (UTC)
Received: by tygrysek.juszkiewicz.com.pl (Postfix, from userid 65534)
	id AD938D2270; Thu,  4 Jul 2013 10:06:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	tygrysek.juszkiewicz.com.pl
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.112] (87-206-60-225.dynamic.chello.pl
	[87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id DB81BD217F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:06:15 +0200 (CEST)
Message-ID: <51D52CF1.50607@juszkiewicz.com.pl>
Date: Thu, 04 Jul 2013 10:06:09 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20130704053401.GA25335@xiaoyu.lan>
In-Reply-To: <20130704053401.GA25335@xiaoyu.lan>
X-Enigmail-Version: 1.4.6
OpenPGP: id=117A251E
Subject: Re: Using OpenEmbedded for customized builds
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
X-List-Received-Date: Thu, 04 Jul 2013 08:06:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 04.07.2013 07:34, Holger Hans Peter Freyther pisze:

> Can this be already modeled? Do you have any idea how this could
> be done?

My idea is simple.

Keep each customer changes in separate layers and have separate builds
for base and each customer. Let then customer builds use base
sstate-cache in read-only mode (file:// mirror). This way you do all
base building in "base" dir/vm and customer ones in separate ones.

None of customer builds affect others and each of them uses sstate from
common "base" one.

