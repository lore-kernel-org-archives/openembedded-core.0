Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1S3TY0-0000FR-AH
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 15:33:28 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A63F0F81213; Fri,  2 Mar 2012 07:24:58 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 9F7E8F81210;
	Fri,  2 Mar 2012 07:24:56 -0700 (MST)
Message-ID: <4F50D838.7000703@mlbassoc.com>
Date: Fri, 02 Mar 2012 07:24:56 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330675739.1086.154.camel@localhost.localdomain>
	<1330691655.15224.14.camel@ted> <4F50CDAD.6060209@mlbassoc.com>
	<1330696435.309.3.camel@ted>
In-Reply-To: <1330696435.309.3.camel@ted>
Subject: Re: [image_types_uboot] getdepends for ext2.gz.u-boot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 14:33:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-02 06:53, Richard Purdie wrote:
> On Fri, 2012-03-02 at 06:39 -0700, Gary Thomas wrote:
>> On 2012-03-02 05:34, Richard Purdie wrote:
>>> On Fri, 2012-03-02 at 16:08 +0800, Ni Qingliang wrote:
>>>> Hello,
>>>>
>>>> when using ext2.gz.u-boot as IMAGE_FSTYPES, I got error when doing
>>>> rootfs with error info:
>>>> genext2fs: command not found
>>>>
>>>> after checked fuction imagetypes_getdepends, I guess the ext2's
>>>> dependency is not considered. maybe we should assign 'ext2' to
>>>> 'basetype', but not 'type' directly.
>>>>
>>>> Any idea?
>>>
>>> Does
>>> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=78ae63423f123f89a5c72c85539e6ed71bd2653d fix the problem for you?
>>
>> This looks like what I'm doing with my own generator.  I tried
>> it, with&  without this patch, and I don't get a ext2.gz.u-boot
>> image, only a broken link.
>
> That sounds like what happens if you don't inherit image_types_uboot

Indeed.  This method also works perfectly, thanks!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


