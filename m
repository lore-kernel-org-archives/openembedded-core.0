Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 446D2731DB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 18:01:29 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id q21so260240591iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 10:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:references:cc:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=DUIw+Vg/5VIn/seRa1enyZDoGxf4Xv7H0NvYISufz4M=;
	b=hwaaVgwNmgjH6MgQ3F0Qn13rEYCG2vDWGiFjmdF+kJzQad8evY9zCm3PSyJqs2ShqR
	PJzprBCZhRWcplnpFJTnYur6XYuL7t9q6BNN/mpldpmDWwBQMeFobgUOungjZzLR14sN
	lUrztQ8E4OpLa8F9UssT42o1F9P7I5iP7qtKyPcc7TIEtq8mTjoYhIVXRmZz6K1Vzzg0
	XDatraQ38INGzHKlrkgZDsTH8lzoKKBF3enuPK1/WHLd8kyI7bW/wWLNi4yBWyLQ3j7R
	dvBWKIpxgVafjRBP+Wx6mYNJAIr7cE8nSyemKIvzt+q9oqEUtlCMKt698I30017y96yD
	JrAw==
X-Received: by 10.107.135.198 with SMTP id r67mr55785625ioi.103.1452189690140; 
	Thu, 07 Jan 2016 10:01:30 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	w84sm4896955ioi.20.2016.01.07.10.01.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 10:01:28 -0800 (PST)
References: <568DF5C6.90509@gmail.com> <568E1CB6.708@windriver.com>
	<568E86EF.5050408@gmail.com>
	<CAJTo0LaDS4+ETDGLc+Ja8Q+TjCOJ=xn6dSvO4UsNMnLUPhzkcw@mail.gmail.com>
	<1452184627.7598.132.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568EA7ED.6010806@gmail.com>
Date: Thu, 7 Jan 2016 13:01:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1452184627.7598.132.camel@linuxfoundation.org>
Subject: Re: invoking a native compiler (gcc)
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
X-List-Received-Date: Thu, 07 Jan 2016 18:01:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 01/07/16 11:37, Richard Purdie wrote:
> On Thu, 2016-01-07 at 15:46 +0000, Burton, Ross wrote:
>> On 7 January 2016 at 15:40, Trevor Woerner <twoerner@gmail.com>
>> wrote:
>>> I was surprised to find that BUILD_CC is being set to whatever
>>> comes up
>>> first in our build computer's PATH. But I guess the alternative
>>> would be
>>> to make our builds longer by compiling our own native compiler for
>>> such
>>> cases.
>>>
>> You could always set BUILD_CC to explicitly point to the right
>> compiler on your machine.  When I was trying to make OE work on
>> Darwin I had to set BUILD_CC to point at brew's gcc binaries.
> Or you setup PATH to include things in the right order as we do with
> other native tools...

I was surprised to learn that a compiler from the host machine was
potentially being used as part of a build, not which one is found and
being used. When I discovered this I was quite sure I had configured
something incorrectly. This is more of an academic exercise, I didn't
run into any problems.

I guess we're covered in the sense that each release specifies which
distros are supported. So as long as any native tools that are used in
each of the support distros are able to produce a successful build
everything should be fine. BUILD_CC is almost like an implicit
ASSUME_PROVIDED.

