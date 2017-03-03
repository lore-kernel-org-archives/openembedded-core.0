Return-Path: <ml@embed.me.uk>
X-Greylist: delayed 2080 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 03 Mar 2017 10:53:37 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 00B41774FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:53:37 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.20.1703020605560.10072@uk63952.mitel.com>
	<alpine.LFD.2.20.1703020627050.11911@uk63952.mitel.com>
	<20170303095825.k2mfmg2mnut7hvks@ad.chargestorm.se>
	<alpine.LFD.2.20.1703030504170.6531@uk63952.mitel.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <19415188-9877-089c-5816-0e1a4f263a0e@embed.me.uk>
Date: Fri, 3 Mar 2017 10:18:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1703030504170.6531@uk63952.mitel.com>
Subject: Re: "inherit setuptools" versus "inherit pypi" -- a python style question
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
X-List-Received-Date: Fri, 03 Mar 2017 10:53:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 03/03/17 10:06, Robert P. J. Day wrote:
> On Fri, 3 Mar 2017, Anders Darander wrote:
> 
>> * Robert P. J. Day <rpjday@crashcourse.ca> [170302 12:33]:
>>
>>> On Thu, 2 Mar 2017, Robert P. J. Day wrote:
>>
>>>>   inherit pypi setuptools
>>>>   require python-psutil.inc
>>
>>>> and the corresponding .inc file contains:
>>
>>>>   RDEPENDS_${PN} += " \
>>>>     ${PYTHON_PN}-shell \
>>>>     ${PYTHON_PN}-subprocess \
>>>>     ${PYTHON_PN}-threading \
>>>>   "
>>
>>>> so the first recipe inherits pypi, the second one inherits setuptools,
>>>> and the third inherits *both*. what is the *preferred* style?
>>
>> Well, different purposes... If you take a look at pypi.bbclass, it's all
>> about how to retrieve the module (source code). setuptools.bbclass is
>> about how to install the module...
>>
>> Ie retrieving and installing...
> 
>   yes, i finally twigged to that, but is there a *preferred* style?
> from what i've seen, if there is a pair of files for a python module:
> 
>   * foo.bb (which includes ...)
>   * foo.inc
> 
> the common style seems to be that:
> 
>   * foo.bb inherits setuptools, while
>   * foo.inc inherits pypi (if necessary, of course)
> 
> at least i think that was the common style. obviously, there are
> perfectly acceptable variations, i'd just like to know if there is a
> recommended style.
> 

One reason for this is for py2/py3 reciepes. python-foo.bb will inherit
setuptools, while python3-foo has to inherit setuptools3. So I would
imagine that setuptools should always go in the bb. While pypi is python
version agnostic I believe.

Cheers,

