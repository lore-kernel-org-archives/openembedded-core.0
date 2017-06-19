Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 3800B780FA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 13:32:33 +0000 (UTC)
Received: (qmail 676 invoked by uid 1003); 19 Jun 2017 13:32:34 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.117.63)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	19 Jun 2017 13:32:34 -0000
To: "Burton, Ross" <ross.burton@intel.com>
References: <1497868738.24449.41.camel@linuxfoundation.org>
	<cbc4d73d-be96-309d-a749-0ad344572a22@balister.org>
	<CAJTo0LYp_Vw5qZMqNZPRYQO4uy3oTdcH-ESVeSuHTZgC1HnhEA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <900921c1-e048-1dbc-4630-4134b07e3a23@balister.org>
Date: Mon, 19 Jun 2017 09:32:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYp_Vw5qZMqNZPRYQO4uy3oTdcH-ESVeSuHTZgC1HnhEA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] OE-Core/Yocto Project's first CVE (CVE-2017-9731)
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
X-List-Received-Date: Mon, 19 Jun 2017 13:32:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/19/2017 09:29 AM, Burton, Ross wrote:
> On 19 June 2017 at 14:20, Philip Balister <philip@balister.org> wrote:
> 
>> So the issue is leaking credentials, not build system paths? I mention
>> this because we do leak build system paths into images in other places.
>>
> 
> Yes, SRC_URI can contain username/passwords, and even if you filter those
> out explicitly you can expose internal hostnames and so on.

But we do expose internal host names in other places ...

Philip

> 
> Ross
> 

