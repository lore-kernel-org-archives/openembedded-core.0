Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id C701C65C87
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:39:16 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B7BC6F811E4; Thu, 30 Oct 2014 09:39:16 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D84F7F811DF;
	Thu, 30 Oct 2014 09:39:15 -0600 (MDT)
Message-ID: <54525BA9.9000606@mlbassoc.com>
Date: Thu, 30 Oct 2014 09:39:21 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1414508747-4688-1-git-send-email-gary@mlbassoc.com>	<CAJTo0LaLRhRASrwdHQboWYjbsGzBmCZgq4J1Qv_i5KDo17ZhVQ@mail.gmail.com>
	<CALbNGRTQQTza3PftOobxDqMvJUGwsGKRAcRX49CXtzUeTOcSzQ@mail.gmail.com>
In-Reply-To: <CALbNGRTQQTza3PftOobxDqMvJUGwsGKRAcRX49CXtzUeTOcSzQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-pygtk: Restore pkg-config file
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
X-List-Received-Date: Thu, 30 Oct 2014 15:39:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-10-30 09:26, Andreas Müller wrote:
> On Thu, Oct 30, 2014 at 1:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 28 October 2014 15:05, Gary Thomas <gary@mlbassoc.com> wrote:
>>>
>>> Some previous version of this recipe was errantly removing the
>>> pygtk-2.0.pc
>>> (pkg-config) file.  This is needed for other packages to be able to build
>>> against this library.
>>
>>
>> It's deleting the code generator too.  This entire recipe gives me the
>> heebie-jeebies...
>>
>> Ross
>>
> I have a similar patch in for very long time [1]. At the time of
> creation I ran several tests without suspicious results. The whole
> 'dirty fix #1' can go.
>
> Andreas
>
> [1] https://gitorious.org/schnitzeltony-oe-meta/oe-core/commit/dedf83428f297e9461f5c88c32c78192fa96585e
>

Wow, since Jan 2013 and no action?

Was this proposed to OE-core (i.e. sent to the list)?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

