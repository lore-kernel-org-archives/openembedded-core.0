Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C006F7391A;
	Fri,  9 Oct 2015 15:52:54 +0000 (UTC)
Received: by igcrk20 with SMTP id rk20so38453965igc.1;
	Fri, 09 Oct 2015 08:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s1OaExeRP4yomyFpKNwXCj/H43F3bz2K/c+kcwFbFQI=;
	b=h9fgbOoBHHWK3GwefmAbjAzBtj25FRsfcsxYz0fsScFkLo5iffN2sNYjKDjQU03Z8l
	t5UMTHYIuY4mWCgebZXpQWFvbObEWlynCc93z4LqCvvHetcSVY8yklnHnVKhUhLlLxtg
	Y/MqX1IQaCszb3Ovjs1YKlzQ7Jwyg0QbtisFOVhkFJpX7QymufrkuRAP2i3QyIqJ/zQC
	5PIg4+jBLu+V4IX2id1x9kKDTJSjo8TB2jKIJxGuewPk685bXXf37TBFH1EI8HDieATm
	d6jEy2nUD3yxAqLZrPFnUMm9BrcrV0s9M6iyzFKCAehi+oCd7U6K+GkJPex6wVfbz8aJ
	YLwQ==
X-Received: by 10.50.117.100 with SMTP id kd4mr10429525igb.75.1444405974948;
	Fri, 09 Oct 2015 08:52:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Fri, 9 Oct 2015 08:52:25 -0700 (PDT)
In-Reply-To: <20151009151924.GC2384@jama>
References: <20151003133343.GC2381@jama>
	<CAJTo0LYSc3TV1D2OhmO4KN9ucJLm+d_U2BgrCq40Pk=+RiXqFA@mail.gmail.com>
	<20151009151924.GC2384@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Oct 2015 08:52:25 -0700
Message-ID: <CAMKF1spCYP4t+d79TiBvvmT0dtPTu+=nxG7P-n5Yd2mi30ZBuQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-02
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
X-List-Received-Date: Fri, 09 Oct 2015 15:52:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 9, 2015 at 8:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Oct 05, 2015 at 03:40:39PM +0100, Burton, Ross wrote:
>> On 3 October 2015 at 14:33, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> >     * /openembedded-core/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb,
>> > do_compile
>> >
>>
>> This fails with a giant number of assembler warnings, but works when I try
>> with current master.  Does your build change some tunes?
>
> Yes, it's caused by thumb(1).
>
> I thought it's caused by upgrade to gcc-5.2, but
> ARM_INSTRUCTION_SET = "arm"
> was removed by Alexander when importing libsecret from meta-oe to
> oe-core, without even mentioning it in commit message :/.
>
> The same with webkitgtk now failing to build for thumb.. old webkit-gtk
> already had ARM_INSTRUCTION_SET which was silently removed.
>
> I'll stop accepting recipe removals in meta-oe layers for recipes moved
> to oe-core unless the submitter proves that they weren't modified/broken
> in the process. I hate overlayed/duplicated recipes, but breaking them
> is even worse.
>

agreed. I think it would improve the migration process. Deletion
should be sent after it have been moved
and verified that functionality is not regressing.

> Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

