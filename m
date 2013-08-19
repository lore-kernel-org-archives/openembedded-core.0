Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-10.prod.phx3.secureserver.net
	(p3plsmtpa08-10.prod.phx3.secureserver.net [173.201.193.111])
	by mail.openembedded.org (Postfix) with ESMTP id E35C969686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 22:57:33 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa08-10.prod.phx3.secureserver.net with 
	id EmxY1m00Y1mTNtu01mxZ2H; Mon, 19 Aug 2013 15:57:34 -0700
Message-ID: <5212A2DC.2000601@pabigot.com>
Date: Mon, 19 Aug 2013 17:57:32 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Joe MacDonald <Joe.MacDonald@windriver.com>
References: <520B8B6C.40408@pabigot.com> <20130814141339.GY17945@jama>
	<20130814143157.GB3894@windriver.com>
In-Reply-To: <20130814143157.GB3894@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: recipe whitespace style questions
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
X-List-Received-Date: Mon, 19 Aug 2013 22:57:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/14/2013 09:31 AM, Joe MacDonald wrote:
> [Re: [OE-core] recipe whitespace style questions] On 13.08.14 (Wed 16:13) Martin Jansa wrote:
>
>> On Wed, Aug 14, 2013 at 08:51:40AM -0500, Peter A. Bigot wrote:
>>> SRC_URI = "file://skeleton \
>>>              file://skeleton_test.c \
>>>              file://COPYRIGHT \
>>> "
>>>
>>> which I'll call "none", and;
>>>
>>> SRC_URI = "file://skeleton \
>>>              file://skeleton_test.c \
>>>              file://COPYRIGHT"
>>>
>>> which I'll call "joined".
>>>
>>> Again, for consistency's sake it would be nice to have a
>>> recommendation.  I personally prefer "none", which matches the closing
>>> bracket style for functions.
>>>
>>> Next: I've also seen:
>>>
>>> SRC_URI = " \
>>>       file://skeleton \
>>>       file://skeleton_test.c \
>>>       file://COPYRIGHT \
>>> "
>> I prefer this one (especially for longer variables or entries) or "none",
>> because with "none" it's easier to see where multiline variable ends.
>>
>> Worst is IMHO "joined" because when appending one more line you have to
>> edit 2 lines to move '"' so the diff for review is longer and harder to
>> read than just one added line.
> +1

To close this out: that's three votes for the style named "none" or the 
one with separated lines.  No objections raised.

I'd thought the style guide was part of the Yocto documentation so I 
could prepare a patch to it, but it appears to only exist 
(independently) on the Yocto 
(https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide) and 
OpenEmbedded (http://www.openembedded.org/wiki/Styleguide) wiki sites.

In lieu of my applying for accounts on those sites and updating them 
I'll leave it that I think these additions would document the 
conclusions of this discussion, and are what I'll try to follow in my 
own Yocto-based recipe development:

* Multiple-line continuations should be indented to the level of the 
content following the introductory quote symbol on the first line.

* Alternatively, the first line of a multi-line value may be continued 
after the introductory quote symbol, with all subsequent content lines 
indented four spaces (or one tab if within a shell function)

* Any closing quote of a multiple-line continuation should be placed at 
the indentation level of the first continued line.

Peter

