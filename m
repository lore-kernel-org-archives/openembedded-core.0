Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SrCs7-0005DD-Nr
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 20:51:48 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6HIeQuo025593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:40:27 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 17 Jul 2012 11:40:26 -0700
Message-ID: <5005B1AD.1050709@windriver.com>
Date: Tue, 17 Jul 2012 13:40:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207171053310.6162@oneiric>
	<50059D18.2050100@windriver.com>
	<alpine.DEB.2.02.1207171340560.7173@oneiric>
	<5005A56E.2090300@windriver.com>
	<alpine.DEB.2.02.1207171402460.7400@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207171402460.7400@oneiric>
Subject: Re: is there really a "fakeroot" task flag?
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
X-List-Received-Date: Tue, 17 Jul 2012 18:51:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/12 1:08 PM, Robert P. J. Day wrote:
> On Tue, 17 Jul 2012, Mark Hatle wrote:
>
>> On 7/17/12 12:41 PM, Robert P. J. Day wrote:
>>> On Tue, 17 Jul 2012, Mark Hatle wrote:
>>>
>>>> On 7/17/12 9:55 AM, Robert P. J. Day wrote:
>>>>>
>>>>>      perusing bitbake user manual and in section 2.1.18, "Task
>>>>> Flags", there's mention of "fakeroot".  that's not really a
>>>>> task flag, is it? i thought that that's (now?) a keyword
>>>>> that's used to define a task with that property.
>>>>>
>>>>>      is that line in the user manual incorrect?
>>>>
>>>> My understanding is this is a key word that gets turned into a
>>>> task flag.
>>>
>>>     ok, that makes sense.  that's just not clear from that section
>>> in the bitbake manual.  are there any other special cases like
>>> that?
>>
>> I believe that both "fakeroot" and "python" are the two only two
>> inline "task flags".
>
>    i'm reading bitbake's "build.py", and that looks right.  only one
> other observation -- i see another what looks like a task flag,
> "lockfiles", that's not mentioned in the bitbake user manual.  is that
> actually a task flag?  should it be mentioned in that section?
>
>    i think that's all of my whining about task flags.

It is a task flag.  It's a lockfile that is used on a task-level basis.  If the 
lock is held, then the task will wait until the lock clears.

--Mark

>
> rday
>




