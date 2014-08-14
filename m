Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-08.prod.phx3.secureserver.net
	(p3plsmtpa07-08.prod.phx3.secureserver.net [173.201.192.237])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF31610F5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 11:50:53 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-08.prod.phx3.secureserver.net with 
	id ebqt1o00M1mTNtu01bqu4V; Thu, 14 Aug 2014 04:50:54 -0700
Message-ID: <53ECA29D.10204@pabigot.com>
Date: Thu, 14 Aug 2014 06:50:53 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1407963825-20257-1-git-send-email-pab@pabigot.com>
	<1407963825-20257-3-git-send-email-pab@pabigot.com>
	<CAMKF1soo1HEfuD99aDVpY7Q8PyUgqV4ujtSTRvjeDaGfuRyUCQ@mail.gmail.com>
In-Reply-To: <CAMKF1soo1HEfuD99aDVpY7Q8PyUgqV4ujtSTRvjeDaGfuRyUCQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] gcc-4.8, gcc-4.9: remove inappropriate patch
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
X-List-Received-Date: Thu, 14 Aug 2014 11:50:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2014 05:44 PM, Khem Raj wrote:
> On Wed, Aug 13, 2014 at 2:03 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> 0037-gcc-4.8-PR56797.patch was originally added as an OE backport during
>> 4.8.0.  Upstream merged it in 4.8.1, and it was present in 4.9.0.
>>
>> The original patch still applies to 4.9.1 (and presumably 4.8.2), but
>> now is modifying store_multiple_sequence instead of
>> load_multiple_sequence (the two functions are nearly identical).  It may
>> or may not be necessary in store_multiple_sequence, but absent a bug
>> report upstream supporting its application in this case, or a least an
>> updated comment and upstream status in the patch, I think this patch
>> should be dropped.
>>
>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> This looks good.

May (should) I add S-o-b lines from you to the V2 series for these or 
are these informal acks?

Peter


