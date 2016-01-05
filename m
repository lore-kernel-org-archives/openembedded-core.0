Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id A04AA60589
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 19:15:33 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id 77so165597153ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jan 2016 11:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=9peR8R0u6TWBOCRTaMnfi0MdYN5WsMbLt6oybcay7Fc=;
	b=nK4JMKaaE+nAgddizkK4ZfEoYJVaIn7Sx42Pp67cXSQPWMomBv9WKW+EdXegkt4mWY
	ptTZIoTR4iSjrkcnksk387xT6yjrM+hOvCaOS7CkW4UlYYyFKZ10JHYgnK+utxlEdO30
	/luxM4YJHmbfNJ0SDRJWA8FQXxrW4bWSsK6ZlDabkS8MKttb9zCCC788ugGrAag4ygGq
	d1Lw9H+xGtLcqfYS9Gyw2enIZF1Te16igYH071Va2NoT6ZsOgBCGxHxIIfEcWeF9Cpat
	sUCj5J/ihi2lPG+4bkYcoqn61UWbzd/BmKHorOCQGoqpHgcTSkcIxC6DO/9jDkCmTBns
	Eo5Q==
X-Received: by 10.107.136.75 with SMTP id k72mr46544512iod.155.1452021334257; 
	Tue, 05 Jan 2016 11:15:34 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	qb7sm1617870igb.8.2016.01.05.11.15.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jan 2016 11:15:33 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1451997165-25159-1-git-send-email-ross.burton@intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568C1651.8060500@gmail.com>
Date: Tue, 5 Jan 2016 14:15:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451997165-25159-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] sstate: change "stamp is not reachable, removing manifests" message from info to debug
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
X-List-Received-Date: Tue, 05 Jan 2016 19:15:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01/05/16 07:32, Ross Burton wrote:
> This code path has proven to work, so change the log level from info to debug so
> it doesn't spam the log in normal use.

I liked having this as part of the regular processing. If I only update
my upstream repositories once a week (for example) my next "bitbake ..."
would show which packages had upgrades. It was a cheap way of doing an
image diff, if you will.

In order to keep those messages now I would have to enable debug, which
will generate quite a lot more information.

Yes, I know I could get the "image diff" functionality by enabling
buildhistory and going that route, but as I said above this was sort of
a "cheap" image diff for free ;-)

