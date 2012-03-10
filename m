Received: from mail.dream-property.net ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S6KH0-0004qf-Bn
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Mar 2012 12:15:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E940331591B0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 12:07:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id D3eQdjrxakjg
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 12:06:56 +0100 (CET)
Received: from [172.22.22.61] (drms-590c4a44.pool.mediaWays.net [89.12.74.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 8FFB6315919C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Mar 2012 12:06:56 +0100 (CET)
Message-ID: <4F5B35CF.4090001@opendreambox.org>
Date: Sat, 10 Mar 2012 12:06:55 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAFZPMoaRKkELBmd1u5SnWF5UDQiHawi9aRJFw72UqGrKLJQNHw@mail.gmail.com>
	<CAFZPMob-UQNR9Q-_EsumFpWj=49t9TNjFYF8WTNLgfDWQ+qiAQ@mail.gmail.com>
	<4F566375.30705@intel.com>
	<CAFZPMob0HRhYLbZLt7zvLQkJxF_mRxuF0w5MATNcOHwhLko0bA@mail.gmail.com>
	<4F58FF0A.6000400@intel.com> <4F5ADF1D.4050202@intel.com>
In-Reply-To: <4F5ADF1D.4050202@intel.com>
Subject: Re: broken ncurses support for python
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
X-List-Received-Date: Sat, 10 Mar 2012 11:15:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Scott,

On 10.03.2012 05:57, Scott Garman wrote:
> I filed bug #2070 to track this and have created the following fix for it:
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=sgarman/python-ncurses-fix&id=23c73da5f13b6c586353edb8143fa21058bf3a55

this will break if libdir equals base_libdir. A conditional is required
around mkdir and mv.

Regards,
Andreas


