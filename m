Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SF8Hp-0000NP-UT
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 20:16:58 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0005CF81243; Tue,  3 Apr 2012 12:07:49 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5E235F81242;
	Tue,  3 Apr 2012 12:07:49 -0600 (MDT)
Message-ID: <4F7B3C75.5030200@mlbassoc.com>
Date: Tue, 03 Apr 2012 12:07:49 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4F7B38C7.6010909@mlbassoc.com> <4F7B3B8C.6000200@windriver.com>
In-Reply-To: <4F7B3B8C.6000200@windriver.com>
Subject: Re: Schizophrenic package management
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
X-List-Received-Date: Tue, 03 Apr 2012 18:16:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-04-03 12:03, Mark Hatle wrote:
> On 4/3/12 12:52 PM, Gary Thomas wrote:
>> Why are both opkg-native and rpm-native needed to build images?
>> When I asked this previously, I was told that rpm was used because
>> it has superior dependency tracking. Fair enough (I guess), but
>> then why is opkg required if I build an image using
>> PACKAGE_CLASSES = "package_rpm"
>>
>
> rpm-native is used for internal dependency scanning. The exact tool is "rpmdeps". These dependencies may or may not be rolled up into package level dependencies by the packaging
> tool (which may be opkg, deb or rpm). (see package.bbclass)
>
> opkg-native is used for handling alternatives and similar during packaging and image creation. So it's also needed.

Why?  Surely one or the other should be useful for this.  I'm sure
that RedHat doesn't need opkg to build their images...

>
> I don't believe opkg, or rpm are needed on the target image though, unless of course you select one of them as the packaging type and you want target package management.

Yes, of course.  I just don't see the need to have to build both
just to create my image.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


