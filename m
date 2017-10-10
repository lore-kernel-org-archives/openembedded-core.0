Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with ESMTP id EA88177527
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 12:58:03 +0000 (UTC)
Received: (qmail 21858 invoked by uid 1003); 10 Oct 2017 12:58:05 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.111.57)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	10 Oct 2017 12:58:05 -0000
To: =?UTF-8?Q?=c3=98ystein_Walle?= <oystwa@gmail.com>,
	=?UTF-8?Q?Maciej_Borz=c4=99cki?= <maciej.borzecki@rndity.com>
References: <20171010120012.20163-1-oystwa@gmail.com>
	<33c05071-504f-897e-48d7-c3e6ddaefaaa@linux.intel.com>
	<CAD4b0_JXtK+3RxhNKG-yP8nb_hCLdt+vO_58H1p1jXSc5Striw@mail.gmail.com>
	<CAFaJEqs=GgsEwsjT3=e6hYnK8TMvgUfZd2c475wwsgMeUU6cgQ@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <3722358e-1ccc-6ada-1326-46e4bc8276ba@balister.org>
Date: Tue, 10 Oct 2017 05:58:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFaJEqs=GgsEwsjT3=e6hYnK8TMvgUfZd2c475wwsgMeUU6cgQ@mail.gmail.com>
Cc: =?UTF-8?Q?=c3=98ystein_Walle?= <ow@datarespons.no>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: fix typo in toolchain file
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
X-List-Received-Date: Tue, 10 Oct 2017 12:58:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit

On 10/10/2017 05:38 AM, Øystein Walle wrote:
> On 10 October 2017 at 14:31, Maciej Borzęcki <maciej.borzecki@rndity.com> wrote:
>> On Tue, Oct 10, 2017 at 2:25 PM, Alexander Kanavin
>>
>>> Where is the typo and what is it, exactly?
>>
>> -set( CMAKE ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
>>
>> missing _ between CMAKE and ASM
> 
> Correct. As it is the code defines a variable named "CMAKE" with the
> contents "ASM_FLAGS ${CMAKE_C_FLAGS}". As far as CMake is concerned that
> is valid and so this will not generate any form of error, but may
> result in incorrect flags.
> 
> I can resend the patch with a better commit message if you like.

That would be nice. I stared at the line for a bit trying to see the
typo also.

Philip


> 
> --
> Øsse
> 

