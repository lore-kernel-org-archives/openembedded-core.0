Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RL3pl-0000G8-M6
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 03:12:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA1265Rg022654
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 31 Oct 2011 19:06:05 -0700 (PDT)
Received: from [128.224.162.225] (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 31 Oct 2011 19:06:05 -0700
Message-ID: <4EAF545D.9000006@windriver.com>
Date: Tue, 1 Nov 2011 10:07:25 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <4EAE0428.2020209@windriver.com> <4EAE04FF.1070207@windriver.com>
	<4EAED036.5070808@intel.com>
In-Reply-To: <4EAED036.5070808@intel.com>
X-Originating-IP: [128.224.162.225]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	pA1265Rg022654
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 01 Nov 2011 02:12:14 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B411=E6=9C=8801=E6=97=A5 00:43, Saul Wold wrote:
> On 10/30/2011 07:16 PM, Kang Kai wrote:
>> On 2011=E5=B9=B410=E6=9C=8831=E6=97=A5 10:12, Kang Kai wrote:
>>> Hi Saul,
>>>
>>> I just want to update eglibc but eglibc is using its 2.14 branch and
>>> use svn commit revision "15225" as current version. Of course it is
>>> behind the latest svn revision, but I don't quit sure about which is
>>> the right revision to update eglibc.
>> Hi Saul,
>>
>> And right now is 2 commits behind the latest revision, do it worth to
>> update right now?
>
> Kai,
>
> I know that Khem recently added the eglibc 2.14 recipe, but I think=20
> that we are still actually using the 2.13 recipe as defined by=20
> EGLIBCVERSION.
>
> At this point, it might be good to know what's changed by those 2=20
> commits and maybe do a full build and system test with EGLIBCVERSION=20
> set to 2.14 to find out if the problems are resolved.  You might look=20
> back in the email list to mid-June to see what the original set of=20
> issues was.

Thanks, Saul! I'll try that.

>
> Sau!
>
>
>> Thanks!
>>
>>>
>>> Could you give me some guide? Thank you!
>>>
>>> Regards,
>>> Kai
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



