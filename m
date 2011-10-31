Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RKv3T-0008NK-I8
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 17:49:47 +0100
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 31 Oct 2011 09:43:41 -0700
Received: by wye20 with SMTP id 20so1060135wye.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 09:43:39 -0700 (PDT)
Received: by 10.216.137.229 with SMTP id y79mr1037718wei.104.1320079419774;
	Mon, 31 Oct 2011 09:43:39 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id e7sm33431321wbh.12.2011.10.31.09.43.37
	(version=SSLv3 cipher=OTHER); Mon, 31 Oct 2011 09:43:39 -0700 (PDT)
Message-ID: <4EAED036.5070808@intel.com>
Date: Mon, 31 Oct 2011 09:43:34 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EAE0428.2020209@windriver.com> <4EAE04FF.1070207@windriver.com>
In-Reply-To: <4EAE04FF.1070207@windriver.com>
Cc: Kang Kai <Kai.Kang@windriver.com>
Subject: Re: What is the strategy to update eglibc?
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
X-List-Received-Date: Mon, 31 Oct 2011 16:49:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/2011 07:16 PM, Kang Kai wrote:
> On 2011年10月31日 10:12, Kang Kai wrote:
>> Hi Saul,
>>
>> I just want to update eglibc but eglibc is using its 2.14 branch and
>> use svn commit revision "15225" as current version. Of course it is
>> behind the latest svn revision, but I don't quit sure about which is
>> the right revision to update eglibc.
> Hi Saul,
>
> And right now is 2 commits behind the latest revision, do it worth to
> update right now?

Kai,

I know that Khem recently added the eglibc 2.14 recipe, but I think that 
we are still actually using the 2.13 recipe as defined by EGLIBCVERSION.

At this point, it might be good to know what's changed by those 2 
commits and maybe do a full build and system test with EGLIBCVERSION set 
to 2.14 to find out if the problems are resolved.  You might look back 
in the email list to mid-June to see what the original set of issues was.

Sau!


> Thanks!
>
>>
>> Could you give me some guide? Thank you!
>>
>> Regards,
>> Kai
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



