Return-Path: <martin@geanix.com>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id AC39F77146
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 19:16:29 +0000 (UTC)
Received: from [10.0.0.11] (unknown [85.184.147.232])
	by mail.hundeboll.net (Postfix) with ESMTPSA id AA2441C0904;
	Thu, 21 Jun 2018 21:16:28 +0200 (CEST)
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	openembedded-core@lists.openembedded.org
References: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <c907cd81-910d-bb64-12a8-2145e347f803@geanix.com>
Date: Thu, 21 Jun 2018 21:16:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180322134413.8079-1-rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH] wic: allow bitbake variables in kickstarter files
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
X-List-Received-Date: Thu, 21 Jun 2018 19:16:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-IE
Content-Transfer-Encoding: 8bit

On 2018-03-22 14:44, Rasmus Villemoes wrote:
> image_types_wic.bbclass has a mechanism for doing variable substitution
> on .wks files by simply letting the input file be called
> .wks.in. However, that doesn't allow using variables in files included
> via the include directive.
> 
> This adds (somewhat naive) support for variable substitution in all
> files parsed by wic. The user should add all required variables to
> WICVARS to get them exported appropriately.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

ping³

