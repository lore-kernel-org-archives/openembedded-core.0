Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S0vJT-0001g2-6A
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 14:35:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 15A2231594D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:27:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Qd8IvRW3YjXd
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:27:23 +0100 (CET)
Received: from [172.22.22.61] (drms-590c477b.pool.mediaWays.net [89.12.71.123])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id DEEFE31594D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2012 14:27:22 +0100 (CET)
Message-ID: <4F479039.7090708@opendreambox.org>
Date: Fri, 24 Feb 2012 14:27:21 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329910007-8441-1-git-send-email-obi@opendreambox.org>
	<1329910007-8441-2-git-send-email-obi@opendreambox.org>
	<CFE738D1-7A44-4F57-BB18-818DD5474E01@dominion.thruhere.net>
	<20120224081006.GA2519@sakrah.homelinux.org>
In-Reply-To: <20120224081006.GA2519@sakrah.homelinux.org>
Subject: Re: [PATCH 1/5] libsoup-2.4: don't depend on libgnome-keyring unless x11 is defined
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
X-List-Received-Date: Fri, 24 Feb 2012 13:35:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.02.2012 09:10, Khem Raj wrote:
> On (22/02/12 13:56), Koen Kooi wrote:
>>
>> Op 22 feb. 2012, om 12:26 heeft Andreas Oberritter het volgende geschreven:
>>
>>> * Drop dependency on GNOME if x11 is disabled.
>>>
>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>>> ---
>>> meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    4 ++--
>>> 1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
>>> index 8e6ef26..861a1aa 100644
>>> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
>>> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb
>>> @@ -6,9 +6,9 @@ LICENSE = "LGPLv2"
>>> LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
>>>
>>> SECTION = "x11/gnome/libs"
>>> -PR = "r1"
>>> +PR = "r2"
>>>
>>> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 libgnome-keyring"
>>> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 ${@base_contains('DISTRO_FEATURES', 'x11', 'libgnome-keyring', '', d)}"
>>
>> that one likely needs a --disable-something to be deterministic.
> 
> may be --without-gnome or --disable-gnome-keyring ?

The flag --without-gnome is right. I've updated this patch [1],
but I'm waiting before resubmitting it, because after Richard's
comments I'm unsure which distro feature should be tested or
whether PACKAGECONFIG should be used.

Regards,
Andreas

[1] http://git.openembedded.org/openembedded-core-contrib/commit/?h=obi/current&id=5c7c62268aa56a5d4d58764653ef95a9deb683ad


