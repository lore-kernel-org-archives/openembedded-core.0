Return-Path: <twoerner@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 01F3F728AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 21:21:52 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id vy18so6096429iec.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 13:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=6M2WfkzwoOvD8KVh9mj81awiYojGXrgEwtMMmp2oc/0=;
	b=IOAoylcZKbBsS2Lt6J9xYnf5nefqMZOaEFUcWfiEGWaMAcCiZYbM9Jq8oYxkA5N1BC
	jFtFGCTpn+OS8ul56C4jWUgHKI1rMedX+Av/TUUPyWyvPlLFT4ovmf19ox/5QU4Jq7PE
	pXFjUEiydoCoQgAy8yKEUmjZlmB9bSyCdWNtobZjiGOUrIwrJ5G/L4FLjU4paLz+QpdZ
	x5M8p6Ep4bySitDkfxcUp8mHsRf+B3OWHZkQcu6W//d165xnRxDlzd0mg116mBj0Uw2p
	C1oFeQjZWBE6oMN2kx20SB1ikVyaxGpBX3ItWnyVxgtsGZ1na4jToE7+NnBWsGjiUKfZ
	gUEg==
X-Received: by 10.42.71.194 with SMTP id l2mr4895082icj.71.1420665713400;
	Wed, 07 Jan 2015 13:21:53 -0800 (PST)
Received: from [192.168.141.85] ([67.55.37.231])
	by mx.google.com with ESMTPSA id 5sm1303167iom.7.2015.01.07.13.21.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 13:21:52 -0800 (PST)
Message-ID: <54ADA374.8050006@gmail.com>
Date: Wed, 07 Jan 2015 16:21:56 -0500
From: Trevor Woerner <twoerner@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1420622709.25779.60.camel@linuxfoundation.org>
In-Reply-To: <1420622709.25779.60.camel@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] Bug reporting and good bug reports
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
X-List-Received-Date: Wed, 07 Jan 2015 21:22:01 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


On 01/07/15 04:25, Richard Purdie wrote:
> I also have a patch. Where should I share them? How do I ensure everyone
> with an interest in this defect actually gets the patch? Sure I can
> create email and send to the people who I think need to know.

When I went through that whole "let's add a MAINTAINERS file" thing last
year this is exactly what I had in mind at that time. A developer could
configure git to automatically invoke the script that accompanied that
patch during a "git send-email ...". The purpose of the script was to go
through the MAINTAINERS file to create a list of relevant people. But
the script was also smart enough to look at the lines of code the patch
was modifying and include the people who wrote the lines the patch was
going to modify.

Unfortunately everyone seemed to think a MAINTAINERS file was only good
for assigning responsibility, which is something that had never occurred
to me at the time :-)

> The
> bugzilla lets interested parties add themselves to bugs though.

...and people could add themselves as "R"'s in a MAINTAINERS file! :-)
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/MAINTAINERS#n73

