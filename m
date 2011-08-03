Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qod08-0007kS-B5
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:04:52 +0200
Received: by yxi19 with SMTP id 19so521349yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 08:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=5sjbMM0yHWbhWcF5Nk1C6uNr6/h3g5LWbF1/RpAHwRw=;
	b=yE2k+0mQ9LGkUEZWqcXD+tT6/pc6RX2UhQsRDwSbb6ciu6SMfBCKVR2wEjV+K3B7f4
	8x/pkb70h8GfsfUetzhCow7csuw4rJlZVcqMofganOZYrE3dvrbVagXUOOSKXe5DYJlo
	mFawU+j8HQYZC6Ja4w374FSuP6IHO6SDV8r5c=
Received: by 10.143.20.35 with SMTP id x35mr4751033wfi.114.1312383628960;
	Wed, 03 Aug 2011 08:00:28 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d3sm1141156pbh.21.2011.08.03.08.00.27
	(version=SSLv3 cipher=OTHER); Wed, 03 Aug 2011 08:00:27 -0700 (PDT)
Message-ID: <4E396289.5070509@gmail.com>
Date: Wed, 03 Aug 2011 08:00:25 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1311682779.git.edwin.zhai@intel.com>	<73ea8ff94e4bda213df1a5a39615f4cd39899589.1311682779.git.edwin.zhai@intel.com>	<C36AA1E0-9A00-4761-9912-A3AC81367446@dominion.thruhere.net>
	<1311686782.2344.236.camel@rex> <4E38FE6C.3010005@intel.com>
In-Reply-To: <4E38FE6C.3010005@intel.com>
Subject: Re: [PATCH 2/3] xinput-calibrator: Add 0.7.5 as new recipe
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
X-List-Received-Date: Wed, 03 Aug 2011 15:04:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/03/2011 12:53 AM, Zhai, Edwin wrote:
>
>
> Richard Purdie wrote:
>>
>> On Tue, 2011-07-26 at 14:53 +0200, Koen Kooi wrote:
>> > This one looks suspicously like the one in meta-oe. Apart from that,
>> > is it really needed in oe-core?
>>
>> Given that the xcalibrate extension has been removed from the xserver I
>> think we're going to either need to migrate the tools like xtscal or
>> adopt other tools. Certainly OE-Core should have a consistent story for
>> touchscreens...
>>
>
> RP,
> There is another recipe pointercal-xinput that provides script for
> calibration based on xinput_calibrator's output. So moving xinput,
> xinput_calibrator and pointercal-xinput from meta-oe to oe-core make a
> consistent story?
>
> If no objection, I'll do this...

yes please. I have not been able to caliberate screen using 
xinput-calibrator. I would try anything that will get me going.

>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



