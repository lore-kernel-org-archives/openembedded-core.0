Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RBBkK-0004yD-MS
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 22:37:48 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 04 Oct 2011 13:32:13 -0700
Received: by wyh11 with SMTP id 11so968387wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 13:32:12 -0700 (PDT)
Received: by 10.227.27.165 with SMTP id i37mr1882939wbc.106.1317760331771;
	Tue, 04 Oct 2011 13:32:11 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id y10sm6590656wbm.14.2011.10.04.13.32.09
	(version=SSLv3 cipher=OTHER); Tue, 04 Oct 2011 13:32:11 -0700 (PDT)
Message-ID: <4E8B6D47.9000600@intel.com>
Date: Tue, 04 Oct 2011 13:32:07 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110906 Thunderbird/6.0.2
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4E8B6564.4090002@balister.org> <4E8B67C5.8050602@intel.com>
	<4E8B6C17.80509@balister.org>
In-Reply-To: <4E8B6C17.80509@balister.org>
Subject: Re: Bringing an image from OE to OE-Core
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
X-List-Received-Date: Tue, 04 Oct 2011 20:37:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/04/2011 01:27 PM, Philip Balister wrote:
> On 10/04/2011 04:08 PM, Saul Wold wrote:
>> On 10/04/2011 12:58 PM, Philip Balister wrote:
>>> I'm about to start bringing some images I use from OE to OE-core. The
>>> first issue I saw is there is no task-proper-tools in oe-core (where
>>> oe-core means the set of layers created by the Angstrom setup scripts).
>>>
>> Philip,
>>
>> Have you looked at task-core-basic, it is supposed to be more of a
>> desktop like set of tools, the idea being it's heavier weight than core,
>> will move to supporting the non-graphical part of LSB.
>>
>> Another caveat for task-core-basic is that it's the largetest non-gplv3
>> task that is used by core-image-basic.
>>
>> Does this task approach what you are looking for?
>
> It looks like a start, but I notice it brings in rpm. I'm not sure if I
> want that. I would have thought that the package manager would be a
> distro decision.
>
That's a bug that I would certainly take a patch for, unless rpm is 
required as part of LSB, that will need to be verified.

Sau!

> Philip
>
>
>>
>> Sau!
>>
>>
>>> Should I add task-proper-tools to meta-oe, or is there a better way to
>>> add a full features set of tools to an image? Basically, the image is
>>> more desktop like than embedded.
>>>
>>> Philip
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



