Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qp0FF-0005DO-13
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:54:01 +0200
Received: by pzk2 with SMTP id 2so1904259pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=wdR47MyyriPb63+BS54PqCWeUm8t1FtBnUjf/i9Rhas=;
	b=aOIb+KY6R1fktYknbOdZHxz/ZzhoU+xKF8piTXV4G+Tnk26rI1W4r3dSHdoZlowYi+
	IgooS54qF8qRyJfm3pQao09AFCFLusvWVx/YZxWZQMFi5KLyUJqthij+kyORwODNSsDK
	MCrrVroxPks82n1zEJOajvcRpfLMnxlFeefFw=
Received: by 10.143.68.4 with SMTP id v4mr887334wfk.292.1312472973727;
	Thu, 04 Aug 2011 08:49:33 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d1sm2346434pbj.56.2011.08.04.08.49.32
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:49:32 -0700 (PDT)
Message-ID: <4E3ABF8B.2090808@gmail.com>
Date: Thu, 04 Aug 2011 08:49:31 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311807353.git.tom_rini@mentor.com>
	<d395c1bac934913af1ed7c8fc3a09601c823339b.1311807353.git.tom_rini@mentor.com>
	<1312465942.2344.743.camel@rex> <3084551.78r5ORDKhl@perseus>
	<1312470848.6733.2.camel@phil-desktop>
In-Reply-To: <1312470848.6733.2.camel@phil-desktop>
Subject: Re: [PATCH 3/9] Various site files: Drop monotone
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
X-List-Received-Date: Thu, 04 Aug 2011 15:54:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 08:14 AM, Phil Blundell wrote:
> On Thu, 2011-08-04 at 08:08 -0700, Khem Raj wrote:
>> On Thursday, August 04, 2011 02:52:22 PM Richard Purdie wrote:
>>> On Wed, 2011-07-27 at 15:56 -0700, Tom Rini wrote:
>>>>   # links
>>>>   ac_cv_lib_png_png_create_info_struct=${ac_cv_lib_png_png_create_info_s
>>>>   truct=yes}>
>>>> -# mono
>>>> -cv_mono_sizeof_sunpath=108
>>>> -
>>>>
>>> Isn't mono different from monotone?
>>
>> yes its for mono. I think we should keep it since there are many users of mono
>> from oe.dev world who would want mono in future may be from  future meta-mono
>
> Why couldn't the site entry just go in meta-mono too, if that's where
> the recipes are living?  I don't think it makes much/any sense (for
> testability reasons as much as anything else) to have a load of siteinfo
> entries lying around that no oe-core recipe actually uses.

yes it could. Infact having this variable exported during mono configure 
would be better solution.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



