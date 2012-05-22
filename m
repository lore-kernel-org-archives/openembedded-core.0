Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SWpxU-00058N-OA
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 16:21:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 31BA8315C6D7;
	Tue, 22 May 2012 16:11:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tQVtTUQYaRKR; Tue, 22 May 2012 16:10:55 +0200 (CEST)
Received: from [172.22.22.61] (drms-590ec2e9.pool.mediaWays.net
	[89.14.194.233])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id C8B56315C6D6;
	Tue, 22 May 2012 16:10:54 +0200 (CEST)
Message-ID: <4FBB9E6C.6030509@opendreambox.org>
Date: Tue, 22 May 2012 16:10:52 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1337686647-1027-1-git-send-email-obi@opendreambox.org>
	<2080721.YZu0iU2L4T@helios> <4FBB9471.6040905@opendreambox.org>
	<1823492.ykGXyerc6j@helios>
In-Reply-To: <1823492.ykGXyerc6j@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] qt4(-embedded).inc: create variables to ease overriding
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
X-List-Received-Date: Tue, 22 May 2012 14:21:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 22.05.2012 15:36, Paul Eggleton wrote:
> On Tuesday 22 May 2012 15:28:17 you wrote:
>> On 22.05.2012 14:51, Paul Eggleton wrote:
>>> I think when we start getting to this level, especially because some of
>>> these options imply extra DEPENDS, we should try to use PACKAGECONFIG
>>> rather than specific variables.
>>
>> Introducing PACKAGECONFIG is a more complex change. It can still be done
>> in a later patch. 
> 
> It could be, but then we're introducing variables that will potentially go 
> into people's distro configs only to take them away in the near future. I'm not 
> especially keen on doing that.
> 
>> This patch just follows the semantics introduced by
>> QT_SQL_DRIVER_FLAGS 
> 
> Right, and when that was introduced some time ago we did not have 
> PACKAGECONFIG at all.
> 
> I realise this puts extra burden upon you, sorry about that. I can perhaps 
> offer to do the PACKAGECONFIG changes for you, but I won't be able to get to 
> them until next week at the earliest.

No need to hurry. I'll keep using my patch in my denzil-based branch
anyway, because denzil-next is unlikely to include either variant.

I'm not a big fan of PACKAGECONFIG. Its syntax is hard to read and hard
to write, maybe unless you're the inventor of it.

Looking for users of PACKAGECONFIG in OE-Core denzil, I saw it's used in
only 6 recipes. Even less in meta-openembedded (exactly 1). It looks
like it's not going to get adopted by many. So your statement about
taking away newly created variables in the near future is not
necessarily going to become true.

Besides that, introducing a new PACKAGECONFIG variable for Qt, that
includes new flags for basically everything already in QT_CONFIG_FLAGS,
doesn't seem to be an improvement.

Furthermore, as I understand it, PACKAGECONFIG handles only simple
on/off switches, but QT_CONFIG_FLAGS has switches for
on/off/plugin/system etc., and not everything you can build into qt can
be built as a plugin and vice versa, so the resulting set of
PACKAGECONFIG flags will likely become quite huge in order to be able to
express all options.

Regards,
Andreas


