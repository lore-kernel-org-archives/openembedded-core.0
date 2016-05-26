Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 0A043736B6;
	Thu, 26 May 2016 20:41:55 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id h185so34881794qke.2;
	Thu, 26 May 2016 13:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=HmHB+vWIsWtOo1kvNr3Ro8hngiUKLE5HYtzp8ZYBRco=;
	b=COpCxB4+qQMoO0ebLcBOzPWzOeZGo/ta0MxTgv8fPXaTVRreaD9iUmv3nqTmBpQ9i1
	bqqo9QK8dBVza7p125RESxZ69agCZOmGcQs7CF6OALmjahIfHEKY4fAlBjqueaO2PILm
	Qx3TJ3C+ojwZf0cOIJ0vf8WpjGzgLjCrzDucoHR6H4ZjtHaKVH7a6cEvxhYuwRTg6ScA
	vR3IOgriji/kludwSI1H6deg/cXZ3WBz2cNN3VhPI3/C5LIPLKgMr6pgwCevEr8k4r39
	yXSVwLHN2b6n497ad1JNXKGljFF3oRD5Fv41NBfdtf2CMloGcvsP73bGGBPmqPvN967M
	4Tjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=HmHB+vWIsWtOo1kvNr3Ro8hngiUKLE5HYtzp8ZYBRco=;
	b=N+z4uTTvGQSX7oUVPooo7FotVJ03WVoPhjbwDBfqPHw0Cy8L/eC127UP+3tfHx8rVn
	lO5j+RTyBMJHcDgYMbtOl2f9rEnsQXOEg2IUiKnArTpUp6WFNGnZf8xmlQzSVaFN3j6d
	GaVKFUEC8QJuQE9rxlF4sor5lhUXagHCpAcAecO07Yc1lyNBdAWEb3XRTtENQsnD+YJL
	w98MzYeg9F7AYXqt0D5BayPvZOVswDVGjv0PnDFHq06WMfMdE2U0p777fQeYUP0osaMy
	CDVqBNWVPCVJ/pc5qLQ3VJHroAbbaqmk4AjotOPrfpqY2fVqW3PZDSu3b5IWbu8+FHAf
	6LxA==
X-Gm-Message-State: ALyK8tLrLoyavEeEhK7kUrIawkL6vOtQeqNz0p9kSdD+14Xi8g6+UBn44Pg5q/KkQQ54/Q==
X-Received: by 10.55.82.6 with SMTP id g6mr11135720qkb.40.1464295315986;
	Thu, 26 May 2016 13:41:55 -0700 (PDT)
Received: from [192.168.1.139] (cable-pool5-cs-73.doycomm.com. [66.219.182.73])
	by smtp.gmail.com with ESMTPSA id
	t91sm1602131qgd.24.2016.05.26.13.41.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2016 13:41:55 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1464054649898.9b34c448@Nodemailer>
	<20160524092336.GA27824@mbabyjoh-desk.ger.corp.intel.com>
	<CAOd_LFwLw9QMk4YdpbE2aD5k3CwiWQfcqhczdFM4=iBGhFQ98A@mail.gmail.com>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
From: Cliff Brake <cliff.brake@gmail.com>
Message-ID: <bb71cddc-082c-ecd4-287c-79be3e672748@gmail.com>
Date: Thu, 26 May 2016 16:41:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 20:41:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Excellent idea -- I'll plan to do at some point ...

Thanks,
Cliff



On 05/26/2016 04:14 PM, Paul Eggleton wrote:
> On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
>> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.com> wrote:
>>> meta-java repo was moved to:
>>> git://git.yoctoproject.org/meta-java
>>>
>>> Is it possible to update the list with that info?
>> Done, thanks!
>>
>> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a02341562a9b
>> f254b3dd9dc71704
> At some point it would be great if this script could be driven from the OE 
> layer index rather than being a separate entity - then updates would largely 
> be self-service for the maintainers, or at least they would only need to be 
> done in one place.
>
> Cheers,
> Paul
>


