Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id 46341731BD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:21:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id A8E10206BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:21:31 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Thu, 14 Jan 2016 07:21:31 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=4eL7KGCVm5s2xm9
	U+t1RVlqcjgo=; b=j4E/9OTm5cXD0lNaawQl5dzqUtyHjQ0KZ+oyBsIxmLHnvLv
	odvCt33KpRDVgutuSlkZjYzlmFDrxUQ3tS3spCr4VsPWNSNJeM/Wr8zp5en0zom2
	zGeP50FpFLcWQYlDfrrY1IaLfw9OCkgqwp3fzxPujI7x5HhasOnM8uXYRLnE=
X-Sasl-enc: smyWUAUs3gcPEhgWFZa9rCkR7Ja4A6lfkndg0Rm9e1Ku 1452774091
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0A04B680174;
	Thu, 14 Jan 2016 07:21:30 -0500 (EST)
Message-ID: <1452774089.11077.100.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:21:29 +0200
In-Reply-To: <5697824A.8040503@linux.intel.com>
References: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
	<5697824A.8040503@linux.intel.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Thu, 14 Jan 2016 12:21:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-01-14 at 13:11 +0200, Alexander Kanavin wrote:
> On 01/14/2016 08:52 AM, Tanu Kaskinen wrote:
> > Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v
> > 1.1.0
> 
> What about all the other alsa-* recipes?

They are coming.

-- 
Tanu

