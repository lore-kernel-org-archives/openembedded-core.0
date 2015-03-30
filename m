Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id D92B76013D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 18:07:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 06D413151D67
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:07:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Jjw6nL9_clqM
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:07:15 +0200 (CEST)
Received: from [172.22.22.61] (55d4741c.access.ecotel.net [85.212.116.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 2ECE93151D61
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:07:15 +0200 (CEST)
Message-ID: <551990D2.10904@opendreambox.org>
Date: Mon, 30 Mar 2015 20:07:14 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1427532627.14020.217.camel@linuxfoundation.org>	<CAP9ODKoPyP-Ynsg4KeL9wCNf+f04xWQJR=FUVt3o0QWjPKNbcg@mail.gmail.com>	<1427727523.14020.306.camel@linuxfoundation.org>	<CAP9ODKqyu8HrwqoUyaNFKStjdJekpgXpc2A7EBLSqV0JTaVbHw@mail.gmail.com>	<1427731374.14020.307.camel@linuxfoundation.org>
	<CAP9ODKrPtAMqpsWE2t65tiWhLNhZ52bKSJxWG0qN-ae1ZTHNYA@mail.gmail.com>
In-Reply-To: <CAP9ODKrPtAMqpsWE2t65tiWhLNhZ52bKSJxWG0qN-ae1ZTHNYA@mail.gmail.com>
Subject: Re: [PATCH] dpkg-native: Avoid 'file changed' errors from tar
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
X-List-Received-Date: Mon, 30 Mar 2015 18:07:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 30.03.2015 18:21, Otavio Salvador wrote:
> On Mon, Mar 30, 2015 at 1:02 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2015-03-30 at 12:02 -0300, Otavio Salvador wrote:
>>> +When running do_package_write_deb, we have trees of symlinked files

Richard, did you intend to write "hardlinked" here?

>>> +such as the dbg source files in ${PN}-dbg. If something makes another
>>> +copy of one of those files (or deletes one), the number of links a file
>>> +has changes and tar can notice this, e.g.:
>>> +
>>> +| DEBUG: Executing python function do_package_deb
>>> +| dpkg-deb: building package `sed-ptest' in
>>> `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
>>> +| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
>>> +| dpkg-deb: error: subprocess tar -cf returned error exit status 1
>>> +
>>> +Tar returns an error of 1 when files 'change' and other errors codes
>>> +in other error cases. We tweak dpkg-deb here so that it ignores an exit
>>> +code of 1 from tar. The files don't really change (and we have locking in
>>> +place to avoid that kind of issue).
>>>
>>> This is exactly what I would expect for the long commit log. Sorry but
>>> I strongly disagrese with you as the commit log in the patch does
>>> connect with the short log so I still believe the commit log could be
>>> improved.
>>
>> Well, I strong disagree with that, I don't believe it makes sense to cut
>> and paste the same information into both places, sorry.
> 
> I disagree someone should go into a patch header to understand it.
> 

It's my impression that if Richard had omitted the first sentence of his
commit message, the message would still have been descriptive enough,
and nobody would ever have complained.

Regards,
Andreas

