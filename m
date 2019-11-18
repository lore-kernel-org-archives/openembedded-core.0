Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6644F7F8B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 18:37:21 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 86E735C3985;
	Mon, 18 Nov 2019 19:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574102241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BI7WozWX66CPVEFewKtQGx4HkdKC3OdpxhdcoIcNj7U=;
	b=Gj3h/WuCN1FCaJJYG2c8JrZFfACLm+QkjxY1djNbCF6ERuwIaBfA+6foBRX0FhGYKCnR26
	2g9KZYJgJmnAKG4qOO3s5CoyHItneX1BRwrO8ZpVl/3qg7SHoLIKWjV60j4HEg0Jo/dlf3
	VDRq9ltnaRyY4/ujyBUC4GbExRgkUnA=
MIME-Version: 1.0
Date: Mon, 18 Nov 2019 19:37:20 +0100
From: Stefan Agner <stefan@agner.ch>
To: Ross Burton <ross.burton@intel.com>
In-Reply-To: <eb8e027d-2797-4bce-a59d-e7e2eb369aa6@intel.com>
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
	<e03eeb0f-f8cd-f6ea-ad02-44f41bdf1e84@gmail.com>
	<eb8e027d-2797-4bce-a59d-e7e2eb369aa6@intel.com>
Message-ID: <4beb1e7703a6733e81e62cfde8ca1531@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.9
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Mon, 18 Nov 2019 18:37:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2019-11-18 17:53, Ross Burton wrote:
> On 18/11/2019 16:47, akuster808 wrote:
>> Does a possible Poky LTS have any factor in deciding to add more
>> packages to core?
> 
> Even without the LTS there's a (relatively) long-term commitment to
> maintain recipes.
> 
> Personally, I'm happy with Zstd being in meta-oe for now, and possibly
> re-evaluating in the next cycle.

Not having it in oe-core would mean we would have to exclude it from
build testing [1].

From what I can tell, that would be a first: Every other compression
conversion is part of oe-core.

It had quite some adoption lately, e.g. Fedora 31 uses zstd by default
to compress their rpm packages [2].

IMHO, this are good arguments for adding it to oe-core now.

[1]
http://lists.openembedded.org/pipermail/openembedded-core/2019-November/288882.html
[2]
https://fedoraproject.org/wiki/Changes/Switch_RPMs_to_zstd_compression

--
Stefan

