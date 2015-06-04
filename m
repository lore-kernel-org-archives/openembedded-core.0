Return-Path: <akuster808@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id BBE74734B8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 17:51:08 +0000 (UTC)
Received: by qcmi9 with SMTP id i9so20784071qcm.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 10:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=vAiVuGc45zC5/Qw+6cU2W5MhuhDZLIRBcvZh4IB5ygA=;
	b=NvC9fUi5kvsy+Hcjoqg8cgnOXJm/K7JATE022r9OvL+0PbZ84EpQPj/MW8t7r1vSZm
	frcQ/i97NERP1BRKR8fqV+hwUeNweK5c6+Xtb63fc4EPNdZaDJaTsih1J9zc3O0wObOd
	fIGEFniweephJ103LgMSson6gZOer+Vuv3NHqbRAfyf4BxFeuNhvEu4virUvg2druCJK
	rov1M0tU0wK8Sb3cKIujSXXSlWnQ81XR7ONL/Km+SFzXlVWmBksNnXEeZP0ouY0yBRLj
	KfO75p3+kf07QqUk1QmB58VSnAz7VZ32eRSYC3RA1B2x+MryAAcLqSNjNSqQ59nQmr44
	QrDA==
X-Received: by 10.55.22.4 with SMTP id g4mr71828081qkh.10.1433440269188;
	Thu, 04 Jun 2015 10:51:09 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:64ea:8623:c8c5:b8b9?
	([2601:c:a700:3ba7:64ea:8623:c8c5:b8b9])
	by mx.google.com with ESMTPSA id
	b109sm2760244qga.48.2015.06.04.10.51.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 10:51:08 -0700 (PDT)
Message-ID: <55709009.90508@gmail.com>
Date: Thu, 04 Jun 2015 10:51:05 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1430502462-26698-1-git-send-email-Martin.Jansa@gmail.com>
	<5547FB9B.5080102@gmail.com> <20150604083617.GA2376@jama>
In-Reply-To: <20150604083617.GA2376@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dizzy][PATCH] mesa: update --with-llvm-shared-libs configure option
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
X-List-Received-Date: Thu, 04 Jun 2015 17:51:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

done

On 06/04/2015 01:36 AM, Martin Jansa wrote:
> On Mon, May 04, 2015 at 04:07:07PM -0700, akuster808 wrote:
>> merged to staging.
>> - armin
>
> Ping for merging staging to dizzy branch
>
>> On 05/01/2015 10:47 AM, Martin Jansa wrote:
>>> From: Andre McCurdy <armccurdy@gmail.com>
>>>
>>> As per the Mesa 10.2 release notes, "--with-llvm-shared-libs"
>>> has been renamed to "--enable-llvm-shared-libs".
>>>
>>>     http://www.mesa3d.org/relnotes/10.2.html
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>>> ---
>>>    meta/recipes-graphics/mesa/mesa.inc | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>>> index 1857f3c..658bd3a 100644
>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>> @@ -62,7 +62,7 @@ PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --witho
>>>    PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
>>>    PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
>>>    MESA_LLVM_RELEASE ?= "3.3"
>>> -PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
>>> +PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --enable-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE} \
>>>                                   ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>>>    export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
>>>
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

