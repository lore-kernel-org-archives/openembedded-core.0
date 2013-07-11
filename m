Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1C06F60592
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3DCBF3144291;
	Thu, 11 Jul 2013 12:53:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id uc3edKyF5ybZ; Thu, 11 Jul 2013 12:53:45 +0200 (CEST)
Received: from [172.22.22.61] (unknown [212.255.18.206])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 26E9D3144290;
	Thu, 11 Jul 2013 12:53:45 +0200 (CEST)
Message-ID: <51DE8EB8.60908@opendreambox.org>
Date: Thu, 11 Jul 2013 12:53:44 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-3-git-send-email-obi@opendreambox.org>
	<CAJTo0Laa7if2poYd_8AeLYDq8obefuw5F7ygSi+uz4LYpWrOkg@mail.gmail.com>
In-Reply-To: <CAJTo0Laa7if2poYd_8AeLYDq8obefuw5F7ygSi+uz4LYpWrOkg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] cogl-1.0: add option to enable GLES1
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
X-List-Received-Date: Thu, 11 Jul 2013 10:53:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2013 10:52, Burton, Ross wrote:
> On 11 July 2013 01:56, Andreas Oberritter <obi@opendreambox.org> wrote:
>> Only PACKAGECONFIG options for GL and GLES2 were available before.
> 
> The rationale behind this was that the GLES1 support isn't tested,
> mainly as there's not a lot of hardware that can't also do GLESv2.
> Was this enabled for completeness or are you actually restricted to
> GLESv1?

It's for completeness, so if you have libraries for both GLES1 and
GLES2, you can compare them easily and then choose the one that works
better for your application. If nothing else, then this may improve test
coverage. Because it's disabled by default, introducing this option
doesn't have any bad side effects. On the good side, it explicitly
disables GLES1, so if a later version of cogl switches to
auto-detection, the behaviour of the build won't change.

Regards,
Andreas

