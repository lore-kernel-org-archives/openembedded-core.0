Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 6916576704
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 20:05:19 +0000 (UTC)
Received: (qmail 31870 invoked by uid 1003); 11 Aug 2015 20:05:18 -0000
Received: from unknown (HELO ?10.0.0.3?) (philip@opensdr.com@91.114.167.84)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	11 Aug 2015 20:05:17 -0000
To: Andre McCurdy <armccurdy@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <cover.1439204506.git.jussi.kukkonen@intel.com>
	<bf492f53a8df38b0f7d51f9e5409167d022dc291.1439204506.git.jussi.kukkonen@intel.com>
	<CAJTo0LZPwjPuxgnnjvAyqhBWoK8JWJdMOO2G6MGGgj1An6FxUg@mail.gmail.com>
	<CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <55CA557A.3050106@balister.org>
Date: Tue, 11 Aug 2015 22:05:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=X3H8irDHCkohwFCdqou_-BuZLqHz7CYiAA9dqD5LruDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] screen: Add version 4.3.1
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
X-List-Received-Date: Tue, 11 Aug 2015 20:05:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 08/11/2015 09:54 PM, Andre McCurdy wrote:
> On Tue, Aug 11, 2015 at 12:32 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 10 August 2015 at 13:08, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>> * Preserve the old 4.0.3 version (GPLv2+) and add new 4.3.1 (GPLv3+)
>>
>> Is screen considered sufficiently core that we should maintain both GPLv2
>> and v3 recipes?  I'm not convinced it is.
> 
> Is it sufficiently "core" to be in oe-core at all?
> 
> Or maybe it's time to replace screen with tmux?

I use screen a lot. The question is, should the Yocto Project work
towards converting screen users to tmux so we can drop it from or-core.

Philip

> 
>>> * Remove unused debian patch from SRC_URI of 4.0.3, increase PR
>>
>> No need to increase PR.
>>
>> Ross
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

