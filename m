Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 56D4365CBC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 13:04:58 +0000 (UTC)
Received: (qmail 2153 invoked by uid 1003); 20 Aug 2015 13:04:58 -0000
Received: from unknown (HELO ?192.168.10.72?)
	(philip@opensdr.com@64.134.178.169)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	20 Aug 2015 13:04:58 -0000
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1439787800-21088-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LZRWXQOc+SCbL1PeJ9QXn_9WHKDC3y6t+QpJ8-_689Y6w@mail.gmail.com>
	<5402FBA9-07E4-47CF-983E-E8778B5AE2F6@gmail.com>
	<CAJTo0La4nHiHRLzraJdmO1AMSZ9RJGi=WSZAemrcGPFZTsoXrg@mail.gmail.com>
	<CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55D5D076.5000106@balister.org>
Date: Thu, 20 Aug 2015 09:04:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soxndfF7OLyAx-c49WBDdLhbbecQhxSj7ixeo2hFsRcTA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 V2] systemd: Upgrade 219 -> 224
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
X-List-Received-Date: Thu, 20 Aug 2015 13:04:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/19/2015 10:21 PM, Khem Raj wrote:
> On Wed, Aug 19, 2015 at 12:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 17 August 2015 at 16:41, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> There are many reasons, for me its overlay support for systemd-nspawn,
>>> networkd has got many new features that is now usable w.r.t. IP forwarding,
>>> vxlan etc.
>>> and it has many bug fixed in those 2000 odd commits since 219, no
>>> different then any other package upgrades we do in general it keep the
>>> upgrade workload lower as we roll the releases.
>>> Any specific concerns ?
>>
>>
>> Can we get an updated patch with a clearer commit log?

I've also heard that as systemd evolves, more binaries are getting added
to the base package that should be packaged separately for people
interested in small images. I do not have personal experience here, but
wanted to pass along the feedback.

We should look at buildhistory packaging differences when we do upgrades.

Philip

> 
> sent a v2 with more descriptions
>>
>> My concerns with the systemd upgrade were simply that until now we were
>> tracking the systemd-stable repository.
> 
> it was only in last release that it was switched to use stable
> repository in hope that it will help
> backporting to 1.8 release any future updates done on 219 easily. We
> never were pinned to stable release
> it just was a coincidence that 219 was right in time for 1.8 release.
> We want to avoid situations where core recipes
> from oe-core are overridden in other layers and staying latest helps that.
> 
>   If we want to change that policy to
>> the latest release, that's fine by me.
>>
>> Anyone else have an opinion here?
>>
>> Ross

