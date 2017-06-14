Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B93C77833A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 09:28:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5E9StxK012091
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Jun 2017 10:28:56 +0100
Message-ID: <1497432535.3942.40.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tobias Hagelborn <tobias.hagelborn@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 10:28:55 +0100
In-Reply-To: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
References: <1497421480-21923-1-git-send-email-tobiasha@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 14 Jun 2017 10:28:56 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Tobias Hagelborn <tobiasha@axis.com>
Subject: Re: [PATCH] devtool: deploy-target: Support stripped libs and execs
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
X-List-Received-Date: Wed, 14 Jun 2017 09:29:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-14 at 08:24 +0200, Tobias Hagelborn wrote:
> New devtool deploy-target option --strip which enables deploying
> stripped binaries, saving some space on target.
> 
> * Copies the files of ${D} into a new directory and strips them in
> place
> * Based on sysroot_strip from staging.bbclass
> * Added devtool.conf option "strip" for changing default behavior
> * Added .ko strip support compared to original function sysroot_strip

This looks very like the original strip function. Would it be possible
to create one generic strip function in lib/oe which we could call from
the various places rather than duplicating this again?

(I think staging.bbclass and lib/oe/package.py:runstrip() are already
similar code).

Cheers,

Richard

