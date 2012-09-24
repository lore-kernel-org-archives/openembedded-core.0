Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TG89A-0001zA-Hr
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:52:24 +0200
Received: by wgbdq11 with SMTP id dq11so4037690wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:mime-version
	:in-reply-to:references:date:delivered-to:message-id:subject:from:to
	:content-type; bh=srC6Ew5IU0Vbzj/8zYmPX+ETY/KYdIhSNo9adGb0iq8=;
	b=L+jX8/vc/vmGLjuulopGY2b9yaa5iTh8SDdvtpmZ/9DS5n0SHXonCSZYrJizt1WoY1
	qvc2Tjzh0Tr+rnVeCSIFZqks04A71MGRRjNDZ9zNlEU2eO1bS58LjXJO6IWY6f7tokc5
	cxq72LnxtX0ALvEvob+rSNv7G77T8uiZmlQGD0vq7O1YOUbDrceh/eG5irWEswz6bWMq
	vNZyFXiDmpBDl6D/ZzbXuVnRXi66s92wEjyGmTSNbh2/bdIG8PTxlWw943jgzDb40pJq
	HzWNCC6hnIqcviMSFKHpYhLClGUeqpWIt8XBxlYdg9kIy1CEcYYiQHzlRi9oN/t4rvTp
	X35A==
Received: by 10.216.28.213 with SMTP id g63mr1351619wea.42.1348489943792;
	Mon, 24 Sep 2012 05:32:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm11511581wiy.9.2012.09.24.05.32.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:32:23 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Mon, 24 Sep 2012 14:32:25 +0200
Resent-Message-ID: <20120924123225.GA3295@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Received: by 10.64.49.71 with HTTP; Mon, 24 Sep 2012 04:31:19 -0700 (PDT)
In-Reply-To: <506041A9.10009@mlbassoc.com>
References: <503550B4.6060708@gmail.com> <5035DBF4.2020201@r-finger.com>
	<503639B2.4000605@gmail.com>
	<CAMKF1sqhPaHkiOn5uTiF6mQixoatRL8queN6XX5AvQaxL1nvzg@mail.gmail.com>
	<50598A24.1040503@gmail.com> <1348483894.8662.3.camel@ted>
	<506041A9.10009@mlbassoc.com>
Date: Mon, 24 Sep 2012 13:31:19 +0200
Message-ID: <CA+chaQc=6ccJRdgb42TSHAzZ++fAWVG1V9fzNeCa9bZWm7Zuzg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Subject: Re: [poky] do_fetch error with gcc-cross-initial_4.7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 12:52:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 24, 2012 at 1:19 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2012-09-24 04:51, Richard Purdie wrote:
>>
>> On Wed, 2012-09-19 at 12:02 +0300, Florin wrote:
>>>
>>> Trying to build something today and still takes forever and crashes at
>>> fetch. Looking at the gcc-4.7.inc I see it's still from git.
>>> What would the resolution be for this issue?
>>
>>
>> The recipe is now using a release tarball. There is talk of ways to
>> improve the fetcher in this regard in future too but that is probably
>> 1.4 work at this point.
>
>
> Has this change actually been merged to master?  I just updated and
> did not see it.
>
> ... anxiously awaiting this change to arrive in master :-)

It is in oe-core/master
http://git.openembedded.org/openembedded-core/commit/?id=5e03d1e83d0536a2fc69a88d3e5407108836203f


