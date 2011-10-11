Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RDjYR-0004rr-Ml
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 23:08:03 +0200
Received: from mail-ey0-f180.google.com ([209.85.215.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Oct 2011 14:02:19 -0700
Received: by eyg5 with SMTP id 5so36396eyg.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 14:02:18 -0700 (PDT)
Received: by 10.223.65.76 with SMTP id h12mr41763451fai.7.1318366938184;
	Tue, 11 Oct 2011 14:02:18 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id f25sm181733faf.7.2011.10.11.14.02.16
	(version=SSLv3 cipher=OTHER); Tue, 11 Oct 2011 14:02:17 -0700 (PDT)
Message-ID: <4E94AED6.6030000@intel.com>
Date: Tue, 11 Oct 2011 14:02:14 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<4E94AB7A.6050603@intel.com>
	<CBC51C50-4E8D-45AC-98D5-7131F7A5A28E@dominion.thruhere.net>
In-Reply-To: <CBC51C50-4E8D-45AC-98D5-7131F7A5A28E@dominion.thruhere.net>
Cc: Matthew McClintock <msm@freescale.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Tue, 11 Oct 2011 21:08:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2011 01:59 PM, Koen Kooi wrote:
>
> Op 11 okt. 2011, om 22:47 heeft Saul Wold het volgende geschreven:
>
>> On 09/30/2011 10:21 AM, Matthew McClintock wrote:
>>> From: Tom Rini<tom_rini@mentor.com>
>>>
>>> At issue is that route/pktloc.c (not generated) depends on
>>> route/pktloc_syntax.h (generated).
>>>
>>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>>> ---
>>>   .../libnl/fix-pktloc_syntax_h-race.patch           |   26 ++++++++++++++++++++
>> I just noticed that this patch get put in the libnl directory, not the libnl-2.0 directory.
>>
>> Can you pull all the libnl changes together and resbumit this, also is there a reason you can not just update this to the latest libnl 3.2.1?
>
> libnl3 is *again* incompatible with its previous version, like libnl2 is incompatible with libnl1.
>
Koen,

Thanks for that bit of info, I had not gotten much further into 
investigating libnl, other than seeing the newer version out there.

Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



