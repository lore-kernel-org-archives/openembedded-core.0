Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AC40C6DC01
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 02:38:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB42cEod002767
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 3 Dec 2013 18:38:14 -0800 (PST)
Received: from server.local (128.224.22.115) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 3 Dec 2013 18:38:14 -0800
Message-ID: <529E9594.3020201@windriver.com>
Date: Tue, 3 Dec 2013 21:38:12 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Chris Larson
	<kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>	
	<CABcZAN=RUKdQcxE=9aQoXcap2LYA9F5begiT5jD2-JFY-h-NYw@mail.gmail.com>
	<1386110407.4463.148.camel@ted>
In-Reply-To: <1386110407.4463.148.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Random fixes from the Mentor Graphics push queue
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
X-List-Received-Date: Wed, 04 Dec 2013 02:38:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/2013, 5:40 PM, Richard Purdie wrote:
> On Tue, 2013-12-03 at 11:40 -0700, Chris Larson wrote:
>> On Wed, Nov 27, 2013 at 11:07 AM, Christopher Larson
>> <kergoth@gmail.com> wrote:
>>          The following changes since commit
>>          f991d2d60b74f5ebd990f77aecd3324b1a4533e9:
>>
>>            libpng: set reasonable SUMMARY (2013-11-27 11:51:08 +0000)
>>
>>          are available in the git repository at:
>>
>>            https://github.com/kergoth/oe-core.git random-fixes
>>            https://github.com/kergoth/oe-core/tree/random-fixes
>>
>>          Christopher Larson (7):
>>            update-rc.d: process symlinks recursively
>>            perf: remove /usr/local/include from default makefile
>>          includes
>>            pulseaudio: fix RDEPENDS traversal for consolekit
>>
>> Were there issues with these, or was it just that further testing was
>> necessary? I noticed this series was partially applied.
>
> On the most part just being cautious for M1.
>
> The perf one does worry me as we keep going around in circles on it
> where we change one thing, it breaks something else, we fix that,
> something else breaks, we fix that and we end up back where we started.
> The commit history and/or the mailing list should have details about
> what happened there. CC'ing Bruce since I know he has opinions on the
> perf fix. Bruce, did we get a fix for that upstream in the end?

My favourite topic. I'm working on the upstream fix, which was that we
shouldn't be using CFLAGS and LDFLAGS to pass build values into perf,
but instead use EXTRA_CLFAGS (which exists) and EXTRA_LDFLAGS (Which
doesn't exist yet, and that's the patch I have queued).

Looking at Chris' posted patch, I can't actually tell what it was 
fixing, since INCLUDES isn't directly used by the perf Makefiles and on
a really quick check, I can't see what CONFIG_INCLUDES is set to either.

I'm sure I'm just being dense (long day) and I'm missing something, so
I can't map the short log's intent to what the patch is actually doing.

The patch won't undo anything that we are working to fix/change
upstream, but since something is whizzing over my head, I can't be sure
about side effects.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
>
>


