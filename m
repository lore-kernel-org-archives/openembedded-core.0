Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T3tuy-0005M8-Ty
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 21:15:13 +0200
Received: by lagv3 with SMTP id v3so83604lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=sg/kIzZX4J8SMA66pDH1/ODHJK63enuRtSOQOxHkJcY=;
	b=QS224IEYZDFkQbd6+tNy97vqBnZpCvQMh8QppG+mfuDDDqsRVe/h2a0l5MGc0hZitf
	2P/ak39zWTNCsQDfW88l7oWNlQsRiXjLQi7gUgJCO+AKN/NPbpaLKAyYpZi4NbpNIjYd
	LRHICsji0DzQFPGorsIIksdfA3r3LWbxMTTF4SEabNIBJlCRbM2oWvgqKoIGjVd2QFpT
	ZTnx8fBzPQyr4bbXmKpXbNOTpqiX7NgNqjTfPFNlLukQK0b4RLTsr5sU1+MUtQdTRkUk
	bzFvMO3Thic7M0fxA8saNrAUCGKUBP5XwuD3x2q5frvE/MepFOxYRc1C1NLw5WfOkMCA
	Ukfg==
Received: by 10.152.112.233 with SMTP id it9mr18339271lab.40.1345575788840;
	Tue, 21 Aug 2012 12:03:08 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.19.2 with HTTP; Tue, 21 Aug 2012 12:02:48 -0700 (PDT)
In-Reply-To: <CAMKF1spHrm52LmxO=b7G4i_DmSY+eNVR_2=LUX2bqKUGTyxgaQ@mail.gmail.com>
References: <1345566017-15508-1-git-send-email-msm@freescale.com>
	<CAMKF1sp2eYPuaU0yF-BBX9DNjPHwFjfOknLen10gog1n3spDfA@mail.gmail.com>
	<CAEsOVNcX=DeAbNpcMPP_sZPzgqN+uKksgodhS6-fTGAaZkLx9Q@mail.gmail.com>
	<CAMKF1sphgACT00prBya6svo_dbcV2hOGdj1ACk1hVUyEvqtNEQ@mail.gmail.com>
	<CAEsOVNeFeP9DTnsZhOBT1Ntr3P7Maw_UJmnVAL6c0D1Cu17W1w@mail.gmail.com>
	<CAMKF1sqAvkE=TM3KeAdW3DjaPWpDi6=8ZAGpOgBDHR7hXDwsug@mail.gmail.com>
	<5033D668.3070909@linux.intel.com>
	<CAMKF1spHrm52LmxO=b7G4i_DmSY+eNVR_2=LUX2bqKUGTyxgaQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 21 Aug 2012 12:02:48 -0700
X-Google-Sender-Auth: V7PKw2gs6rxJ_vMrYR-C7wsUAjg
Message-ID: <CABcZANkC-w4r59-7NXK4TufF6dms2cdRAzD+pFYSvcYrOWX1WQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kmod-native_git.bb: fix builds for hosts with older libc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 19:15:13 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 11:48 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 21, 2012 at 11:41 AM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 08/21/2012 11:30 AM, Khem Raj wrote:
>>>
>>> On Tue, Aug 21, 2012 at 11:10 AM, McClintock Matthew-B29882
>>> <B29882@freescale.com> wrote:
>>>>
>>>> On Tue, Aug 21, 2012 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>
>>>>> On Tue, Aug 21, 2012 at 10:59 AM, McClintock Matthew-B29882
>>>>> <B29882@freescale.com> wrote:
>>>>>>
>>>>>> On Tue, Aug 21, 2012 at 12:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>>
>>>>>>> On Tue, Aug 21, 2012 at 9:20 AM, Matthew McClintock
>>>>>>> <msm@freescale.com> wrote:
>>>>>>>>
>>>>>>>> +
>>>>>>>> +do_configure_prepend (){
>>>>>>>> +       if ! grep O_CLOEXEC -r ${includedir_native}/bits/fcntl.h;
>>>>>>>> then
>>>>>>>> +               export CFLAGS="$CFLAGS -D O_CLOEXEC=0"
>>>>>>>> +       fi
>>>>>>>> +}
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> IMO It would be safer to create a patch for kmod itself where you
>>>>>>> define O_CLOEXEC if it
>>>>>>> was not defined before. The above seems a bit risky
>>>>>>
>>>>>>
>>>>>> Why is it risky? I only wanted to do this for affected systems. There
>>>>>> is not an easy way to do this with a patch, unless of course I apply
>>>>>> the patch manually.
>>>>>
>>>>>
>>>>> manually gripping at the host installation and then if O_CLOEXEC might
>>>>> be in comments
>>>>
>>>>
>>>> How about grep define.*O_CLOEXEC -r ${includedir_native}/bits/fcntl.h
>>>>
>>>>> and furthermore it if it comes from fcntl.h which is not where you are
>>>>> looking for
>>>>
>>>>
>>>> I am grepping this file though?
>>>
>>>
>>> I would go into the specific file where its asking for O_CLOEXEC
>>>
>>> and add
>>>
>>> #ifndef O_CLOEXEC
>>> # define O_CLOEXEC 0
>>> #endif
>>>
>>> and be done with it

This does seem like a nicer approach.
-- 
Christopher Larson


