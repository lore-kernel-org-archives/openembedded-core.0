Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6272F7887F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 14:14:28 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w1SEERdN012484
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 28 Feb 2018 14:14:28 GMT
Message-ID: <1519827267.3436.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 14:14:27 +0000
In-Reply-To: <20180227224753.30881-1-JPEWhacker@gmail.com>
References: <20180227224753.30881-1-JPEWhacker@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [RFC 0/3] Add wildcards to SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Wed, 28 Feb 2018 14:14:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-02-27 at 16:47 -0600, Joshua Watt wrote:
> Wildcard support in SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS allows the native
> tools that were in a hardcoded list to be specified in layer.conf
> with
> the other exclusions.

I was always reluctant to add wildcard support to this but it does make
sense. It worked out ok in the testing I gave it. As we're at feature
freeze, this would have to go in ASAP.

Cheers,

Richard

