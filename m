Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0C0B6FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 00:25:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u190PG0X006216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 8 Feb 2016 16:25:16 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Feb 2016 16:25:15 -0800
To: Trevor Woerner <twoerner@gmail.com>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
References: <56B922B3.9070604@gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56B931EA.6060107@windriver.com>
Date: Mon, 8 Feb 2016 18:25:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56B922B3.9070604@gmail.com>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 00:25:18 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Which arch/tune are you targeting?  I know that on a few processors 2.26 has
added "link time optimization" (i.e. our processor is broken and we're working
around problems in the linker.)

It's possible you hit one of those cases, or it may simply be that much slower
for some reason.  But worse then double the time is really terrible.

On 2/8/16 5:20 PM, Trevor Woerner wrote:
> This is more of a "FYI", but I've noticed that the build time of my 
> chromium recipe has gone from ~45 minutes to ~2h15m when the only thing 
> that changes is to move openembedded-core from the commit just before 
> upgrading binutils to version 2.26 ([fd75637] native.bbclass: Set 
> CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS) to the one immediately 
> after ([86ade2c] binutils: Upgrade to 2.26).
> 
> Oddly enough I don't see this same behaviour when building, for example, 
> core-image-minimal, so I have no idea what makes chromium so special 
> and, therefore, whether other recipes might be similarly affected.
> 
> Also, it seems as though a lot of the added time is coming from the 
> linking stage, but I don't have (or know how to get) hard numbers for 
> that. Is there a way to get build times for each task within one recipe?
> 
> I've repeated this test 6 times (build just before binutils-2.26, build 
> just after binutils-2.26) and the results are always within a couple 
> minutes of each other. So I doubt this is some random occurrence.
> 


