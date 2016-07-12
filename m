Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB2036067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 21:14:52 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id dx3so1725217pab.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 14:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=JSeBxtZ2GL2mQ23NNKvvB9FpZsNdyw7mCUIUXqAjbUk=;
	b=Vvstbewebp4779aErIekUxwliVj17cB61psOQuCkguiTX6X27EMZvf7qPI0G/BF4hH
	1XzjFNArTVwvrz/kxM9a0C7giLEh5yrdOPi/WvuGwFbBhuMicBOJirV4cO0EOUQtYDdz
	1Emh1DWO+mL2HYClPMdhj8mvoIu+mURCjFpDHnnAfQDZyjxp9ARcxNhZ63nI4F9yAqJT
	iWx0KJ3ilIdFnCjYSOOOn+ggnC+hfJoWdP1EvLsr9j8zQomxJdmmdJqcMgpkWLMUkQNE
	fQzkA3diUdZSaqDaWczaRIEivwq0pbIgqXvTRJPgGkOxebHw2i7OLjQUe2SagH7e9jCO
	g1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=JSeBxtZ2GL2mQ23NNKvvB9FpZsNdyw7mCUIUXqAjbUk=;
	b=kdLHQcJUzUMgQVBatW63L6Cif4p8rokqqBcHCVTPpk6XuX04M65h+Y6dHx/+YGyjN9
	lkmjBqy8Z60aDYbXeQC9seJGjX9quca42yjZdhws6Hm1PskcwvlAYUbyz7bR2E12JeBG
	/0JTua6nM9twIfq41yJs1p3lBsIQ7llMEXoxht/wfUpzut9iZ3x065CvArW9RvVx/Dgu
	zk6d8lQdrFqGSRF61gjg1wROivV85djSa9WTjwxWbBXPeUDMNuK6MTMipZF/CMfGGH3g
	re0EVhspc7pYLhzBi81xXiKNgoA6Xy57yFo8T/QtYJs+SjIY5gAuFixonI7VWT1+df0+
	JxgA==
X-Gm-Message-State: ALyK8tKcpzxGrKp7mtsky5QQdRqrJMBxlFm7+E9uejWK+mjt4Cmcq7EslkDtQ773bL4HbA==
X-Received: by 10.66.76.132 with SMTP id k4mr7552774paw.22.1468358092863;
	Tue, 12 Jul 2016 14:14:52 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	h8sm6261235pfh.49.2016.07.12.14.14.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 14:14:51 -0700 (PDT)
To: "Burton, Ross" <ross.burton@intel.com>, Gary Thomas <gary@mlbassoc.com>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57855DCA.1080807@gmail.com>
Date: Tue, 12 Jul 2016 14:14:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 21:14:57 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 07/12/2016 01:15 AM, Burton, Ross wrote:
> On 12 July 2016 at 08:57, Gary Thomas <gary@mlbassoc.com> wrote:
> 
>> Now that GCC 4.x is gone, we're left with (currently) 5.4 & 6.1
>> Is the intention to track these both for a while, or will 5.x
>> also be gone once things are working with 6.x?
>>
>> ... just wondering where to spend my effort since I'll have to
>> make my targets (some are very old) work with at least 5.x
>>
>> Any advice?  Thanks
>>
> 
> Personally I was thinking that gcc 5.x and 6.x should stay in oe-core for
> this cycle, and then drop 5.x after the release.


Wouldn't that be dropped iff GCC 7.0 is release? or are you saying we
should only have one GCC version?

- armin

I'm not the toolchain
> owner though so that's just an opinion.


> 
> In theory bringing back toolchains isn't rocket science - just copying the
> 4.x recipes from oe-core prior to their removal into a new layer and
> setting GCCVERSION should work.
> 
> Ross
> 
> 
> 

