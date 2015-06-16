Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 3DB876AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 12:33:40 +0000 (UTC)
Received: (qmail 11364 invoked by uid 1003); 16 Jun 2015 12:33:41 -0000
Received: from unknown (HELO ?192.168.11.121?)
	(philip@opensdr.com@71.171.14.12)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Jun 2015 12:33:41 -0000
Message-ID: <558017A3.80707@balister.org>
Date: Tue, 16 Jun 2015 08:33:39 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1433189842-17654-1-git-send-email-philip@balister.org>
	<1433189842-17654-2-git-send-email-philip@balister.org>
	<CAJTo0LYLxsH6_28DCakvnaKMpUyk=syfGcsfrQriTj8y_21n6Q@mail.gmail.com>
In-Reply-To: <CAJTo0LYLxsH6_28DCakvnaKMpUyk=syfGcsfrQriTj8y_21n6Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] packagegroup-core-tools-profile.bb: Remove oprofile.
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
X-List-Received-Date: Tue, 16 Jun 2015 12:33:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/16/2015 08:08 AM, Burton, Ross wrote:
> On 1 June 2015 at 21:17, Philip Balister <philip@balister.org> wrote:
> 
>> Oprofile functions duplicate perf. Since perf is easier to use drop
>> oprofile
>> from the core-tools-profile package.
>>
>> Also, the oprofile-ui package opens a port on the device. removing this
>> package reduces a possible security issue for devices with profiling tools.
>>
> 
> I filed this in the "think about" box when you submitted it, but then
> failed to think.  My concern was "oprofile is the profiling tool we support
> with oprofileui on the host" but that point is fairly moot right now as
> oprofileui doesn't work anymore... (#7054).
> 
> When that's fixed, we can re-add the tooling as appropriate.

My gut feeling is people are moving to perf, which is also part of
tools-profile.

Philip

> 
> Ross
> 

