Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 39008771C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 22:33:22 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id 4so256520218oih.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 15:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=MHXEOybkwY5xMsSJzIoCmxGQhUosdCXOsbOvERijhAQ=;
	b=RGikSrUi0QfNX2qzd0mpzVM6qiUm86RIYoJY0efoNRwY5lmKhaVKl8FpqC/zGIhThO
	Ig/Zl5Y0HMYn1dkNs33EEvSrG8daviFcXnn/ULySwmu1XTTQ2chVLWpAxGxODOuDQwX3
	SQAmzWBHCPba1VP3FBrWSA32zRdnh19dwBqmUceIPcHpZhkXAVLItmK7ITRY0edjLo2C
	VJg0NtzCfLao8gTfgjNqJwMLBzdGesWi8wQ01NLg/NwZ58u0iYeiBx/ANyoC5/v4Sp6y
	6CY5DOHgwvrwcVvRvgVtCXaqMbLO6JQUgZfb39lu2mkdlbyLMIcxTo4pEcObuORqB2xW
	MWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=MHXEOybkwY5xMsSJzIoCmxGQhUosdCXOsbOvERijhAQ=;
	b=WmP1p6y5idG+3lEXi442nLFAH7lEJzd4Ehv6W3RRmtqHnNi5Led8m2rzO0BqwqaE2E
	WscQPf4BdLUZkB6i0AFo9RpmuVXJwZwictTlA4kWRuzaW84BiE3uN5hKxptcHoVsZEJS
	8ZD0mTKd93cIeDYyHSbq0VsjPvgQDErPuv612E5SlUQM6z6DLUlPcHSSnxCCyRBGqkEx
	EHTe9JU0N1LJeBsySGlFeasv9Cs/t7pCOOj5seTw8E8zdomLzqFrQdVlnOcnwrqLiWKC
	RogCSwmGqjlSivUEgcWl5SwkjsVJrZRiBFeR5LGgDz9d/WnUl8ItnyJRPIwv+tdtu5rG
	oG0A==
X-Gm-Message-State: AEkoouuMZzpg4OFcod97Q6jJ8Mpr8YfcrXv6oisRhiUFVhl8hQn6RCr5sQ8OXOlaicLUdkE01EdQc+zqDIFSzw==
X-Received: by 10.202.239.4 with SMTP id n4mr50636313oih.32.1470695603233;
	Mon, 08 Aug 2016 15:33:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.114.197 with HTTP; Mon, 8 Aug 2016 15:33:22 -0700 (PDT)
In-Reply-To: <CAJTo0LZrzSuTUpCiSAq42y_MJdOXajEH6HJ3KvXt+cCStzwWmA@mail.gmail.com>
References: <1470049297-6520-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAOLEWZVAjfydiq7GwgDKWydZyL_CXDL7+dgn5gsjt+QMhBQzgA@mail.gmail.com>
	<CAJTo0La6G0jmhMVKu1rGjjWrDkACFWNX70hrgY9rnyk2ifXKFg@mail.gmail.com>
	<CAOLEWZWbyZXc53TgQijWtxRbTQ9bEnTULpM9uUa4Hp5Px4AYKw@mail.gmail.com>
	<CAJTo0LbwrLtSG+wv=_379TeQOAAqBHVUet=bD0kfdUUg6_c-yw@mail.gmail.com>
	<8ff3e451-c185-6b95-03e0-9669b838b0dc@jp.fujitsu.com>
	<CAOLEWZX0tzxjWu=xq9+_R87uFWfH9DOMminYBMEu2M-7igcxyg@mail.gmail.com>
	<3cdfa22c-ed0b-1e92-7d82-bc81c2e5ee3d@jp.fujitsu.com>
	<CAOLEWZUjdu23AnHkJzjomH7RqddxaF749UH1cr5vLk0LaPRz9w@mail.gmail.com>
	<113e4cdc-2c4b-6878-b9ca-d4fb21a68122@jp.fujitsu.com>
	<CAJTo0LZrzSuTUpCiSAq42y_MJdOXajEH6HJ3KvXt+cCStzwWmA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Mon, 8 Aug 2016 15:33:22 -0700
Message-ID: <CAOLEWZVvpguS9sZTaLHZ_6mKOkhnW_HhP-9CWdL3iNrv0MxCPQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH v2] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Mon, 08 Aug 2016 22:33:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sorry, I kinda needed something that worked.  I'll go back to slacking now.=
..

Steve

On Mon, Aug 8, 2016 at 5:58 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi Fan, you're now added to the repo too.  Progress looks good!
>
> Ross
>
> On 3 August 2016 at 02:42, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>>
>>
>>
>> On 2016=E5=B9=B408=E6=9C=8803=E6=97=A5 10:12, Stephen Arnold wrote:
>>>
>>> sorry, you missed a couple of replies I guess...
>>>
>>> It's in the Ross repo now:
>>>
>>> https://github.com/rossburton/meta-printing
>>>
>>> Steve
>>>
>>
>> Hey, Ross
>>
>> If possible, please also add me.
>> Thanks.
>>
>> Fan
>
>

