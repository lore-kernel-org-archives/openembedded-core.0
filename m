Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 6140A71637
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 03:06:35 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=[10.79.148.146])
	by smtp.twobit.us with esmtpsa (TLSv1.2:DHE-RSA-AES128-SHA:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1YArmt-0001gK-Vf; Tue, 13 Jan 2015 03:05:02 +0000
Message-ID: <54B48BB1.1050806@twobit.us>
Date: Mon, 12 Jan 2015 22:06:25 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1421009125-13379-1-git-send-email-flihp@twobit.us>
	<CAJTo0LaqfgwbwvN5BR3dzxP-LbgfocwZO2GjT1-Y9Qyy8xyg=w@mail.gmail.com>
In-Reply-To: <CAJTo0LaqfgwbwvN5BR3dzxP-LbgfocwZO2GjT1-Y9Qyy8xyg=w@mail.gmail.com>
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-2.7-manifest: Add package for contextlib module
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
X-List-Received-Date: Tue, 13 Jan 2015 03:06:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 01/12/2015 01:15 PM, Burton, Ross wrote:
> On 11 January 2015 at 20:45, Philip Tricca <flihp@twobit.us> wrote:
> 
>> This is required for python code using 'with' statements.
>>
> 
> This isn't applying to master, can you rebase it?

Rebased on master before sending. No changes since. Did you mean
master-next? I wasn't sure which was preferred but I can submit the
patch on either.

https://github.com/flihp/openembedded-core/tree/contextlib

Thanks for taking a look at this and sorry for the confusion.

Best,
Philip

