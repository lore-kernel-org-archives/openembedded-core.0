Received: from starfish.geekisp.com ([216.168.135.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1SZLQB-0002BU-H7
	for openembedded-core@lists.openembedded.org;
	Tue, 29 May 2012 14:21:07 +0200
Received: (qmail 19669 invoked by uid 1003); 29 May 2012 12:10:24 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.167.139)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	29 May 2012 12:10:23 -0000
Message-ID: <4FC4BCC8.7090503@balister.org>
Date: Tue, 29 May 2012 08:10:48 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJTo0La2e0ncRy6ugDa8Yx3uTcuYGXKBbZ8f5CTg9d7kJGis+w@mail.gmail.com>	<4FC35FAD.7090505@intel.com>
	<4FC35FBA.2060200@gherzan.ro>	<4FC37C81.6080200@intel.com>	<CAK18fxFpx-X-V465UJN7ziqmN6Fj6bz6YkckjhztTkqX5q2KwA@mail.gmail.com>	<CAJTo0LZ5WuTMA=yuLm65PX-sp2Rx_L8UAg4JL1j5JcHvLC=o9A@mail.gmail.com>	<1338212677.20169.75.camel@ted>
	<CAK18fxFNrZPCZK2Ny6vr2qz6oHDFvtAA4Jw9SjjAb0djcxN7SQ@mail.gmail.com>
In-Reply-To: <CAK18fxFNrZPCZK2Ny6vr2qz6oHDFvtAA4Jw9SjjAb0djcxN7SQ@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [PATCH 0/3] Package Updates
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
X-List-Received-Date: Tue, 29 May 2012 12:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/28/2012 09:58 AM, Andrei Gherzan wrote:
> On Mon, May 28, 2012 at 4:44 PM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> 
>> On Mon, 2012-05-28 at 14:30 +0100, Burton, Ross wrote:
>>> On 28 May 2012 14:26, Andrei Gherzan <andrei@gherzan.ro> wrote:
>>>> There is an internal test suite for dbus. You can enable building those
>>>> tests in configure:
>>>> "--enable-tests"
>>>
>>> Is there a good reason why these shouldn't be always ran when building
>> dbus?
>>
>> Well, we're cross compiling so it depends how they're written and
>> whether they can run in a cross environment. We've also taken steps to
>> reduce our build time so if these need something like perl or python,
>> adding those into the dependency chain is problematic.
>>
>>
> The fact that these tests are not compiled by default it's good. As a
> normal user of dbus i don't need those. But while doing an update a compile
> with tests i think it's necessary.

Can you build the tests and package them separately? Then they could be
installed as part of a test image.

Philip


