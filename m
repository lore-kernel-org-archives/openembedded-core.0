Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 91AC87C672
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 04:34:57 +0000 (UTC)
Received: from [172.16.169.141] (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 409A52201D8;
	Tue, 12 Mar 2019 17:34:57 +1300 (NZDT)
To: Khem Raj <raj.khem@gmail.com>
References: <20190311055151.31185-1-douglas.royds@taitradio.com>
	<CAMKF1sr0Gce=7VFVU76TDSz0Nc6mDWNO2-ZCzVzZkGS4cQuuTQ@mail.gmail.com>
	<54c2ba97-8701-169f-37b0-924da1e89c09@taitradio.com>
	<CAMKF1sp=gkVJ5H0sa41K=dVWsGg5tE4LOMvGn8Qzz3kzEik_Xg@mail.gmail.com>
From: Douglas Royds <douglas.royds@taitradio.com>
Message-ID: <6129b79f-1c5d-e3a2-4c29-f7439e972349@taitradio.com>
Date: Tue, 12 Mar 2019 17:34:57 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp=gkVJ5H0sa41K=dVWsGg5tE4LOMvGn8Qzz3kzEik_Xg@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Reduce verbosity for make invocation
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
X-List-Received-Date: Tue, 12 Mar 2019 04:34:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB

On 12/03/19 5:09 PM, Khem Raj wrote:

> On Mon, Mar 11, 2019 at 5:47 PM Douglas Royds
> <douglas.royds@taitradio.com> wrote:
>> On 12/03/19 6:18 AM, Khem Raj wrote:
>>
>> On Sun, Mar 10, 2019 at 10:53 PM Douglas Royds
>> <douglas.royds@taitradio.com> wrote:
>>
>> Since the dawn of time, we have set CMAKE_VERBOSE_MAKEFILE=1 in cmake.bbclass.
>> Back in 2016, we also explicitly set VERBOSE=1 in cmake_do_compile(),
>> to ensure that make (and ninja) output were verbose in log.do_compile.
>>
>> Turning off CMAKE_VERBOSE_MAKEFILE=1 means that make (or ninja)
>> invocations from the command-line are non-verbose,
>> giving CMake's default human-readable output on the terminal instead.
>> The user can still invoke VERBOSE=1 make if they do want verbose output.
>> This has no effect on the verbose output that goes into the logs.
>>
>> I think it would be better to have knob to turn is on and off both on
>> console and log files.
>>
>>
>> If you want it on for some reason, you can turn it on in your local.conf:
>>
>> EXTRA_OECMAKE_append=" -DCMAKE_VERBOSE_MAKEFILE=1"
>>
>> Alternatively, you can turn verbosity on for a single invocation (this is what I do when I need it):
>>
>> make VERBOSE=1
>>
>> You can also set an environment variable to make it always verbose, if you want that for some reason:
>>
>> VERBOSE=1 make
>>
>> Do we really need a new variable for this?
> its fine if we can ensure consistent behaviour, I dont like the fact that
> cmdline output would be different than whats stored in log files.


OK, that's a fair point. I'll update it with a variable.


