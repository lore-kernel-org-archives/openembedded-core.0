Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SBEE9-0008TH-Hk
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 00:49:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 35260315A499
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:40:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id WDN+1K97faDE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:40:00 +0100 (CET)
Received: from [172.22.22.61] (drms-590ec3b4.pool.mediaWays.net
	[89.14.195.180])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id E5D24315A48B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2012 00:39:59 +0100 (CET)
Message-ID: <4F6D09CE.9080405@opendreambox.org>
Date: Sat, 24 Mar 2012 00:39:58 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120310 Thunderbird/11.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1332544467-2071-1-git-send-email-andrei@gherzan.ro>
	<4F6D0836.7000907@opendreambox.org>
In-Reply-To: <4F6D0836.7000907@opendreambox.org>
Subject: Re: [PATCH] python: Add tk to DEPENDS
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
X-List-Received-Date: Fri, 23 Mar 2012 23:49:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 24.03.2012 00:33, Andreas Oberritter wrote:
> On 24.03.2012 00:14, Andrei Gherzan wrote:
>> This is needed for _tkinter python module.
>>
>> [YOCTO #1937]
>>
>> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
>> ---
>>  meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/python/python_2.7.2.bb b/meta/recipes-devtools/python/python_2.7.2.bb
>> index cb0a1d5..6969929 100644
>> --- a/meta/recipes-devtools/python/python_2.7.2.bb
>> +++ b/meta/recipes-devtools/python/python_2.7.2.bb
>> @@ -1,5 +1,5 @@
>>  require python.inc
>> -DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib"
>> +DEPENDS = "python-native bzip2 db gdbm openssl readline sqlite3 zlib tk"
> 
> Andrei,
> 
> this breaks builds without x11:
> 
> ERROR: Nothing PROVIDES 'virtual/libx11' (but .../meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb DEPENDS on or otherwise requires it)
> ERROR: libx11-diet PROVIDES virtual/libx11 but was skipped: 'x11' not in DISTRO_FEATURES
> ERROR: libx11-trim PROVIDES virtual/libx11 but was skipped: 'x11' not in DISTRO_FEATURES
> ERROR: libx11 PROVIDES virtual/libx11 but was skipped: 'x11' not in DISTRO_FEATURES
> ERROR: libx11-nativesdk PROVIDES virtual/libx11 but was skipped: 'x11' not in DISTRO_FEATURES
> ERROR: Required build target 'tk' has no buildable providers.
> Missing or unbuildable dependency chain was: ['tk', 'virtual/libx11']
> 
> Besides that, tk is not part of OE-core.

Sorry, I missed your patch adding tk to OE-core. Please disregard my
previous message. xproto doesn't seem to depend on libx11, so the
DEPENDS listed in your patch should be OK.

Regards,
Andreas


