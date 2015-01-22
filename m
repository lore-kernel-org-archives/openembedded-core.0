Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id BE70A7299C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:05:12 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 200so1031488ykr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=dgnKyIz3bd8mUmGYXvGYVxLEr4gdQ+ppuMfFG3TBzsU=;
	b=cQojO0ejOkZbaEt02NDxwGYa9h9EuXXqL0cihPmVq+hQNPOpOnHsZH+p6Z/Kdx8Dwm
	mDIspDreYzQG5IRxehWy5X7ZKeQCbAC5ubP+jbSQLnDr5u+nCXZyMnudWd+vzfJwrEBl
	0KIPxK0VV5VHQlvl4rIdcGOxzYtotigx0lHSfmEZ0R9rJKMeJhXiZeBrQ0dtKwGvf8NI
	PdHl4/8Hq8sFUTstq+vBbWg6dZxQQuXqwin2ZWajPMOFO4em8dpv/JZJBlWbjk2OUtbR
	nFkJzDakizWeXIhs6cop5Fpo7KpUolUTE4r++nU1iqJ/Z3olJEZu72r0MUN1ZsdY4iZT
	hbfw==
MIME-Version: 1.0
X-Received: by 10.170.174.197 with SMTP id q188mr1469180ykd.110.1421942712938; 
	Thu, 22 Jan 2015 08:05:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Thu, 22 Jan 2015 08:05:12 -0800 (PST)
In-Reply-To: <20150122160010.GQ20639@denix.org>
References: <CAP9ODKoygArG8C+wJm7buqgfnjU_MkvfOxoiFGKNfjhAXYgc9g@mail.gmail.com>
	<20150121191123.GH20639@denix.org>
	<CAP9ODKrsE7aWFdVtMrfns3DhC0XJTP=2umjhsU=EZcMmd4EVUQ@mail.gmail.com>
	<20150121202005.GK20639@denix.org>
	<CAENGNheynLDPzuS6xEJTLbkuheB93cH0wsa2DY-M6i=jqHkdvA@mail.gmail.com>
	<CAJTo0LbY54BAQAx1HcgwBZNGNPSwEzmV6zhbn_mB76=vLnkWxg@mail.gmail.com>
	<20150122145715.GO20639@denix.org>
	<CAJTo0LbgjEA63TCrh=bE7HuLWE=vi5PTgK1h0f0-YLBaXgbjnA@mail.gmail.com>
	<20150122151742.GP20639@denix.org>
	<CAP9ODKqeEKQiPzj3Os1Ps=+5xLk10i=g6gSmqDhHyyZ3+yMjrQ@mail.gmail.com>
	<20150122160010.GQ20639@denix.org>
Date: Thu, 22 Jan 2015 14:05:12 -0200
X-Google-Sender-Auth: wkfiT3IPwXu-HGy5Pocmff2eezo
Message-ID: <CAP9ODKoYTLKjC1_Bg4yfrEaHqZBt7Uhcz47J+K1sPScnFN3+zg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2015.01
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
X-List-Received-Date: Thu, 22 Jan 2015 16:05:16 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 22, 2015 at 2:00 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, Jan 22, 2015 at 01:40:43PM -0200, Otavio Salvador wrote:
>> On Thu, Jan 22, 2015 at 1:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Thu, Jan 22, 2015 at 03:02:06PM +0000, Burton, Ross wrote:
>> >> On 22 January 2015 at 14:57, Denys Dmytriyenko <denis@denix.org> wrote:
>> >>
>> >> > Please note that he's talking about current 2014.07 version, not the
>> >> > update!
>> >> > Can you confirm that it works or fails on the autobuilder?
>> >> >
>> >>
>> >> Sorry, got lost in the thread.  The old version works fine, the upgrade
>> >> breaks.
>> >
>> > That's not the case for the rest of us, unfortunately...
>> >
>> > I'm suspecting sstate got something to do with the fact that it still works
>> > for the old version on autobuilder.
>> >
>> >
>> > Let me emphasise it - this specific u-boot-fw-utils-cross recipe used to
>> > build fine, but now fails in the same exact way regardless of the version,
>> > either current 2014.07 or the updated 2015.01.
>> >
>> > So, it seems to me that fixing it is rather out of scope of this version
>> > update patch... :)
>> >
>> > I'm thinking of 2 short-term workarounds - don't update this particular recipe
>> > to the new version; or remove it altogether. I'm sure Otavio wouldn't be happy
>> > either way, but fixing it should probably be a separate effort...
>>
>> We should have denied the update on previous versions. It has been
>> broken by your update to 2014.07:
>>
>> Author: Denys Dmytriyenko <denys@ti.com>
>> Date:   Tue Sep 16 19:10:01 2014 -0400
>>
>>     u-boot: update to version 2014.07
>>
>>     u-boot doesn't really support building its tools for the target, as they are
>>     built with HOSTCC compiler, which is also used to compile fixdep utility
>>     that gets executed during the build. Since it might be beneficial to have a
>>     target version of mkimage, let's hack it to build fixdep in a separate step.
>>
>>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>     Signed-off-by: Ross Burton <ross.burton@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> and this has not been checked if it kept building at that time.
>
> Yes, it was building that time! And Ross has proof of that with autobuilder
> logs. He wouldn't have accepted it if autobuilder was breaking. It was
> breaking on another recipe and I fixed that. But fw-utils-cross was fine.
>
>
>> So I'm ok with this update to go and you work in fix it in a follow up
>> patch, but drop it is not acceptable. It has a clear use case.
>
> If it has such a clear use case, how do you use it when it's broken?

Well a non commonly used one? I didn't expect often use would be a
trade metric here but ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

