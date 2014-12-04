Return-Path: <ashcharles@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 821C5601F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 16:57:23 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id h15so19033516igd.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Dec 2014 08:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=5wQ77872w06+tkDU6CbOVtyY8fQuMuLxTFCjVkRe7Kk=;
	b=NJzvu8WUj/Tf9H+9jm18p8b9cQkXKz9A+OhKCJdkGe6skZelWvnpaH2fWea5w+uMiH
	4483gyL64z6HFEFRoDHKrVAbP7uJINsnRCQVulr0TJ3g+rDBp60gOuYbvROzKwcumZk5
	PupRnwPB6N8t2pXkVCFqMfN8l6JVKiMEH/8Lq/b+DCht9rekVRzykA2ZD6MZomdjRtwl
	ubVqvD2Vgc2kwm+EP7A7PhxIntz2m05Br/D2Z0c9FKe7t/xq0LgYK1nVNhOLhSPGkHEl
	GZZt+rg3GBNSN9Jh/Law/StbgLqb2ii6d7H5CODUJZxru5t4Xbk4uxS/bdf4mEdCy6Xn
	Wqhg==
X-Received: by 10.50.147.74 with SMTP id ti10mr62101336igb.21.1417712243554;
	Thu, 04 Dec 2014 08:57:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.7.143 with HTTP; Thu, 4 Dec 2014 08:56:53 -0800 (PST)
In-Reply-To: <CAJTo0Lb7TcAKd6rkAUMPtgMVSW6pxZ6brFtNCBAVGGbj-Vuvog@mail.gmail.com>
References: <1412389675-13389-1-git-send-email-Martin.Jansa@gmail.com>
	<20141004023040.GO25706@jama> <20141024090416.GB2430@jama>
	<CAJTo0LauN8+Qc14WNkuOmQmhrF=2nXzfrM_O560E0gfqMgfLtQ@mail.gmail.com>
	<CALbNGRTJxpctu143L8myaN1yzDdMVUVJhFoH3iznyr8webpgRA@mail.gmail.com>
	<CAK8F28knQaCCX0uctfEKDg=9eGgw20nZ0j27C-BBkfhdZH=iAw@mail.gmail.com>
	<CAJTo0Lb7TcAKd6rkAUMPtgMVSW6pxZ6brFtNCBAVGGbj-Vuvog@mail.gmail.com>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 4 Dec 2014 08:56:53 -0800
Message-ID: <CAK8F28k=1GQBVnG8buNGiuiVOs=5zN8eQhLYAG0PVqU2OjQ=MA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [WIP][PATCH] systemd: don't move libgudev around, it breaks libgudev-1.0.la
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
X-List-Received-Date: Thu, 04 Dec 2014 16:57:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Would it be possible to cherry-pick this commit "systemd: don't move
libgudev around, it breaks libgudev-1.0.la"
(7807d1d8b9535a87ba3e5ab7df21a2954708333f on oe-core,
41ae2056e6b6f17a1d9fe7408596a448f3e605ad on poky) to the dizzy branch?

Thanks,

Ash

On Fri, Nov 28, 2014 at 9:23 AM, Burton, Ross <ross.burton@intel.com> wrote=
:
> I can't see why not.  CC'ing Armin, the dizzy maintainer.
>
> On 27 November 2014 at 21:29, Ash Charles <ashcharles@gmail.com> wrote:
>>
>> I cherry-picked this patch onto dizzy and it unbroke my build.  Is it
>> possible/reasonable for it to be included in dizzy?
>> --Ash
>>
>> On Fri, Oct 31, 2014 at 1:21 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > On Fri, Oct 24, 2014 at 12:29 PM, Burton, Ross <ross.burton@intel.com>
>> > wrote:
>> >>
>> >> On 24 October 2014 10:04, Martin Jansa <martin.jansa@gmail.com> wrote=
:
>> >>>
>> >>> Should I resend without WIP tag now when ChenQi confirmed that movin=
g
>> >>> libgudev isn't needed?
>> >>
>> >>
>> >> No need, I've merged it into my staging branch already.
>> >>
>> > This should go into dizzy - right?
>> >
>> > Andreas
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

