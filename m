Return-Path: <h4nn35.work@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 239956FF73
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 22:22:56 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id l68so59019290wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 14:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=N2TI09qR4xS9xkqBm4Yr86aYC6CGl4ZsJiolI4NZMIw=;
	b=s6utsI3T+rvwInLjfdOuHTV26dTqMQ9gtTh9r8BpSV2phyVKRawerYBM/dBnvQkKLm
	bltINf3BVOI8RTN7/lSOFB0v6BsDkR9RYsoCBrral8te8va7QS8QDlswZsKyJZoSMIrW
	Dl7v3nOslsPWMfC3Av6s+5yxCeMBNeB+XO7Dqs783PuE7gmtIYaWGekY4TukwwEE2JW8
	5hrrNw7r6rCdXsru7R2cnWb+65lx3MuhC4jHwEtssYieoFKR5wT/djmzCWeO9T01ciUz
	EYrhCwhx9aaTxbcM67m+/X0jSGFHDIOdT/cPlpcneZrk4q3+EDrJEhC9w8vop4stM5iV
	pabw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=N2TI09qR4xS9xkqBm4Yr86aYC6CGl4ZsJiolI4NZMIw=;
	b=dZwc1DA0AGXiYr4nt+3rAT/VZ+f3Yvr6RuE1wknX/ZgQLaC8m33m65Ia8wjkmeOw0Z
	9wrWm+gSBS/dJoTVjdeOzxAthEXBp49uChHpg4NYFDndnRgtjNIVeBUtbLHVDZVfXwrJ
	mPwfMp35ccJW2nP+zky3ogz4fQQtSqNu8E0Folb6Rj5Fu3zmWZWICfYg+1iSdQWQlpN4
	jWtGOb5AFflO/BNpCwysoUUTVo4A9Blf1xU4ELL3sId7fGTpduTXq8JbQW1cvZ21v/qx
	E822kwso4rn301i1l20H827ObgjtBBvKhPRRvGIt7Snw9uwCnVpm3100ByLv9SySdI8F
	FOYQ==
X-Gm-Message-State: AD7BkJIveCYpEWME9gynWsjoM5InvwQwxwwwOle2GIKjPUQjTjcN0ckes/Itpz0bzDZyAoAzYmi2i4vsbH7krA==
MIME-Version: 1.0
X-Received: by 10.194.246.35 with SMTP id xt3mr25183158wjc.57.1456870976871;
	Tue, 01 Mar 2016 14:22:56 -0800 (PST)
Received: by 10.27.219.20 with HTTP; Tue, 1 Mar 2016 14:22:56 -0800 (PST)
In-Reply-To: <1456870035.25131.20.camel@linuxfoundation.org>
References: <1456868358-9326-1-git-send-email-johannes.pointner@gmail.com>
	<1456870035.25131.20.camel@linuxfoundation.org>
Date: Tue, 1 Mar 2016 23:22:56 +0100
Message-ID: <CAHvQdo3iDgR09e7RgS2BNwSYRWfeqOxbEmNO9HFSOVN_=Cwbyg@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [Patch][jethro][master] xcursor-transparent-theme: insert several cursors
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
X-List-Received-Date: Tue, 01 Mar 2016 22:22:57 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

sorry I forgot to add a description into the patch.
The upstream status is quite difficult to define because I don't know
if there is an upstream for this package.

I'm using Qt5 with X11 and have seen some cursor even if the
transparent-theme is set because of the missing cursors. But maybe
this is just something I should add by a bbappend file.
I thought it could be useful to other people which are using a similar setup.

Thanks,
Hannes


2016-03-01 23:07 GMT+01:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Tue, 2016-03-01 at 22:39 +0100, Johannes Pointner wrote:
>> This patch inserts several cursors which are used by Qt for example.
>>
>> Signed-off-by: Johannes Pointner <johannes.pointner@gmail.com>
>> ---
>>  .../insert_several_cursors.patch                   | 79
>> ++++++++++++++++++++++
>>  .../xcursor-transparent-theme_0.1.1.bb             |  3 +-
>>  2 files changed, 81 insertions(+), 1 deletion(-)
>>  create mode 100644 meta/recipes-graphics/xcursor-transparent
>> -theme/xcursor-transparent-theme-0.1.1/insert_several_cursors.patch
>>
>> diff --git a/meta/recipes-graphics/xcursor-transparent-theme/xcursor
>> -transparent-theme-0.1.1/insert_several_cursors.patch b/meta/recipes
>> -graphics/xcursor-transparent-theme/xcursor-transparent-theme
>> -0.1.1/insert_several_cursors.patch
>> new file mode 100644
>> index 0000000..861899e
>> --- /dev/null
>> +++ b/meta/recipes-graphics/xcursor-transparent-theme/xcursor
>> -transparent-theme-0.1.1/insert_several_cursors.patch
>> @@ -0,0 +1,79 @@
>
> There is no description of the patch here, what it does, who wrote it,
> what the upstream status is etc. Please read the patch submission
> guidelines.
>
> How have we survived so long without needing this if its so important?
>
> Cheers,
>
> Richard
>
>

