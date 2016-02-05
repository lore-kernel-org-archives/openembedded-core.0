Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6B500770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:52:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id p63so4444386wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tf9huzsX58XH7Rmcus0whPmSoOaqCqfYFZdADIoDBAI=;
	b=L9Mpg/7d1pgardkFPnI0g0XCCL8oRhJmkBb/Wwl6C6jeSDpcVQ2Qzw0gX085LkpwS5
	jjGiSZZ4A/Ce32cp2g2mQKn4hENOj6ZJe4TrZfVjjEfYk8eI2H+EiKpivZHnwQn11eWn
	G9ne6Lecllve/UjgNuc7ko4NT2zM3kYL43G4YoiL1mmtSQbLoklUeamaDIpNYPA2HdHq
	SPdtxcHRIVX3temObXrBRLK78gJk8u9Mx1Lh6+7h0Q7HUUCBdLB/JIsGmILEyfIXJNQx
	q8y31Vh2RoGcJTGND1dd3wbvu8+QwFCDf3wsVhau7F9IlmGDxUFTv1L2fjyYQ9sb4ve3
	bCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tf9huzsX58XH7Rmcus0whPmSoOaqCqfYFZdADIoDBAI=;
	b=hgD1mp7nIAYBoi70keFd8yEQYuUL9juL3mZWv95C7hqNIMvrVswaAC1mpBxTKMxRhB
	YM0327tkOGWo99//UaLAl/wrH6aJ2U2ITtaBj3pSIXYplkcxxSvL5YciAfUu1iPd2ubb
	aYfF3gMzLaiGTRJwQTXaXOcAQ6dDlW6sDPK4E7dVsQiKUWa605b89opuiu5QLGwpcdl3
	GaBbxlY18XvoQ9EcYakxjQyM0HwI8vOVqXx04K6xdXlaMyc/fcI/yFpUZcdY8WnThQpT
	5kHPcEOsZXR/7L3BnFh5iBJj7Avh/HbVx/8yLJ6++oEFAugoJ+me3iQgHAR0pExO/LWe
	vHMg==
X-Gm-Message-State: AG10YOSHt2ZFbbCMrcUjnWRsqXgWRr6NTinBMpqn3AFtn8r/qws+BbTu0uQ4iKWQf/DzfLMpwp70rEZN1NJRlA==
MIME-Version: 1.0
X-Received: by 10.194.156.199 with SMTP id wg7mr18257605wjb.114.1454701930087; 
	Fri, 05 Feb 2016 11:52:10 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 5 Feb 2016 11:52:10 -0800 (PST)
In-Reply-To: <20160205145545.GD2575@jama>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
	<1454627058-26663-6-git-send-email-armccurdy@gmail.com>
	<20160205145545.GD2575@jama>
Date: Fri, 5 Feb 2016 11:52:10 -0800
Message-ID: <CAJ86T=VXWnusJ3_bEv8QpoXnKDnCqdzTvpCG0w=TZq9u7gSx6g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] gstreamer1.0-plugins-base_git: drop obsolete dependency on freetype
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
X-List-Received-Date: Fri, 05 Feb 2016 19:52:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 6:55 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 04, 2016 at 03:04:18PM -0800, Andre McCurdy wrote:
>> The dependency on freetype was dropped shortly after the 1.7.1 release
>>
>>   http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
>> index 956b24a..06afb04 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_git.bb
>> @@ -20,6 +20,11 @@ SRCREV_FORMAT = "base"
>>
>>  S = "${WORKDIR}/git"
>>
>> +# The dependency on freetype was dropped shortly after the 1.7.1 release
>> +# http://cgit.freedesktop.org/gstreamer/gst-plugins-base/commit/?id=183610c035dd6955c9b3540b940aec50474af031
>> +DEPENDS_remove = "freetype"
>> +EXTRA_OECONF_remove = "--disable-freetypetest"
>
> Please remove both in:
> meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
> and add them only to 1.6*bb recipe
>
> If you keep the comment like this, then there is small change that the next
> time the automated package upgrade will bump the main recipe, someone
> will notice and remove this.

Good point. I'll send a v2.

>>  do_configure_prepend() {
>>
>>       # Temp solution for git snapshot: relax version checks so we can build against GStreamer 1.7.1
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

