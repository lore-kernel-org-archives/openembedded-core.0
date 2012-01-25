Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rpzwa-0001pL-Au
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 11:19:08 +0100
Received: by wgbdt11 with SMTP id dt11so1405236wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 02:11:22 -0800 (PST)
Received: by 10.180.19.130 with SMTP id f2mr10017430wie.12.1327486282128;
	Wed, 25 Jan 2012 02:11:22 -0800 (PST)
Received: from [128.224.170.214] ([89.121.200.106])
	by mx.google.com with ESMTPS id eq5sm62012047wib.2.2012.01.25.02.11.21
	(version=SSLv3 cipher=OTHER); Wed, 25 Jan 2012 02:11:21 -0800 (PST)
Message-ID: <4F1FD549.7040708@gherzan.ro>
Date: Wed, 25 Jan 2012 12:11:21 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:8.0) Gecko/20111124 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1327447344.git.josh@linux.intel.com>
	<f7bd8523525f541676e8b2e416a4960b45cd7d7e.1327447344.git.josh@linux.intel.com>
	<CAMKF1sq=xpgO=4Ne0YQdkhqXhh_+VcpA2Xyx_Cm3xccUcv3d2A@mail.gmail.com>
	<4F1F45F0.208@linux.intel.com>
In-Reply-To: <4F1F45F0.208@linux.intel.com>
X-Gm-Message-State: ALoCoQlxBNFm+dzSwx3W6mshc3qWuL7lU7LCREksLwJA7hwsAFSJNCxITfCY02WPLFdv2DQmH5Ds
Subject: Re: [PATCH 2/4] linux-tools: don't build perf when GPLv3 in INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Wed, 25 Jan 2012 10:19:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2012 01:59 AM, Saul Wold wrote:
> On 01/24/2012 03:42 PM, Khem Raj wrote:
>> On Tue, Jan 24, 2012 at 3:26 PM, Joshua Lock<josh@linux.intel.com>  
>> wrote:
>>> Long term we should look at moving perf to a separate recipe but as a
>>> short term solution this patch will ensure that when GPLv3 is in
>>
>> would I be asking too much to do that instead of this patch :)
>> I think it will be good thing in general since other layers
>> now have to define these tasks if they inherit from oe-core kernel 
>> class.
>>
> Khem,
>
> The issue is timing and resources to do this work, it a larger task 
> that may take more than a few days to refactor perf into it's own 
> recipe and share the source area (ala work-shared/gcc).  We need to 
> get the non-GPLv3 build working again and this seems like the most 
> direct route to accomplish that.
>
> Sau!
>

This is a good workaround for this bug. Obviously a "refactor way" would 
be a better one in my opinion too. But for now, as this bug breaks a 
non-GPLv3 build, a fast solution, like this, is needed.


@g


