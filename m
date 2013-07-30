Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9EC866B480
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 18:28:45 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp13so6232771pab.21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=K1ZRnrvKwIwn68RbpEIO4w/gkeMLmmi3NNikxkH+naI=;
	b=Ucd8dJ14YhmLFcsGVul5naQSiQwvO9+rbetq6u1/w2cmMG7bIKJd/OHfPjzItjvCMM
	GLEepDvIFaNN/Od/7PtHMXq7eGHG+wlXPTqCTgsj2TA7weuCTMVZ5FoG+2v2aTgFjlg+
	6TDy0URdKlvdFOCPG3fhj2XluIMBtATiXcL9gtUODvwm1aD/EZvNkYhwhTi4NpogtuHP
	t1ayUTcLxN4WfujrSTTBKCPiy11TRM/vIQskmjc+EsXHML0HeQ7v5e8rxm8LxbXmlUPN
	ltpxAkd7kyUU8M1Ix6ntKCSEDR8OMYasZPWlIkkHCb/ZIY5drLQgjUXKyjxYLxUxVbhv
	Riow==
X-Received: by 10.66.216.129 with SMTP id oq1mr33794136pac.75.1375208926467;
	Tue, 30 Jul 2013 11:28:46 -0700 (PDT)
Received: from ddeviny-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id wr9sm84471691pbc.7.2013.07.30.11.28.44
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Jul 2013 11:28:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51F7EDC7.1050105@linux.intel.com>
Date: Tue, 30 Jul 2013 11:28:42 -0700
Message-Id: <87BC44D8-DC37-4B4E-8E36-B25893EED742@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<20130629053844.GQ3261@jama>
	<408838C4-EA8B-4497-84D4-27B9309B65B8@gmail.com>
	<20130629153101.GV3261@jama>
	<45F76803-CA83-4DAC-A972-EE4CB8FEE054@gmail.com>
	<51F7EDC7.1050105@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/24] Add python3 recipes
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
X-List-Received-Date: Tue, 30 Jul 2013 18:28:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 30, 2013, at 9:45 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/30/2013 01:16 AM, Khem Raj wrote:
>>=20
>> On Jun 29, 2013, at 8:31 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>=20
>>> On Sat, Jun 29, 2013 at 07:11:35AM -0700, Khem Raj wrote:
>>>>=20
>>>> On Jun 28, 2013, at 10:38 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>>>>=20
>>>>> On Fri, Jun 28, 2013 at 03:03:39PM -0700, Khem Raj wrote:
>>>>>>=20
>>>>>> generate-manifest-3.3.py: Add script to generate python 3.3 =
manifests
>>>>>> python-3.3-manifest: Add python3 manifest file
>>>>>=20
>>>>>> classes: Add distutils for python3
>>>>>> setuptools.bbclass: Use python-distribute instead of
>>>>>>   python-setuptools
>>>>>> distutils3.bbclass: Port the distutils class fix to handle =
filenames
>>>>>>   with spaces
>>>>>> setuptools3.bbclass: Remove useless multiline comment
>>>>>> distutils: Introduce PYTHON_ABI variable
>>>>>> distutils3: Do build_ext as separate step during compile
>>>>>=20
>>>>=20
>>>>> I think these 2 groups could be squashed together for easier =
review, but
>>>>=20
>>>> do you mean create just two patches out of those ?
>>>=20
>>> Yes
>>>=20
>>>>> otherwise great work, thanks for doing it!
>>>>>=20
>>>>> I'll add them to jenkins a bit later when I get some better build =
that
>>>>> what we have now.
>>>>=20
>>>> They were added in order that the build keeps working with every =
commit for helping bisects on tree later
>>>=20
>>> I meant that e.g.
>>>  classes: Add distutils for python3
>>> introduces setuptools3.bbclass and
>>>  setuptools3.bbclass: Remove useless multiline comment
>>> just 3 commits later fixes that, the same with the left-over commit =
I
>>> mentined in other thread which was also resolved by some follow up
>>> commit, with all new .bbclasses together I would read them just =
once.
>>>=20
>>=20
>> Thanks Martin and Paul for reviewing and trying out the patches
>> Finally I have now addressed all the comments/feedback that was =
provided for this patch set.
>> The pull tree is now updated to latest.
>>=20
>> Take a look and install if its ok
>>=20
> Please review your patches for Upstream-Status: and Signed-off-by: =
tags.
>=20

I have pushed a patch on top which fixed these

> I will be reviewing and building this on the AB in mut.
>=20

OK


