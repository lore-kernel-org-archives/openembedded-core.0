Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id C7B5860767
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 10:36:21 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id x19so17752068oix.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2016 03:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1tuRSeIDjwjC1VreX68XPXc1/ZvS6ybXO4qHKdnm3Qs=;
	b=QuivMv1mTOwFRH0tBpfi9I4KUOsfE9SGitXaaual4wKhYXp6nAnYszIU+Cl1YPG8pi
	OvRw8orn1g1/0HzkZeeyY/S9puD3MwE11C9wEtvq35b0UAwDL0pXhHPJMVNe8KCtLwE5
	6IztO59z7Kx9/nTfM435IZOO8l1GlFzmMuUkUlMyms2k9A3Eor27djuTGXrE+pE/g5hM
	t1Phhsf3uYgoP2lDuad8pszN+knMBajJgr7bgz44BAUqvdnjXiDN4uj2CkCA1JNjS9xt
	HxlKxMxGDMJCqXD91VZPL8vjR18pY8wwLqzYZkN6s8ADeLrIHFtHeDqpA9SwfsXJ0H4V
	nXyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1tuRSeIDjwjC1VreX68XPXc1/ZvS6ybXO4qHKdnm3Qs=;
	b=YerRJ13Ghy0l26oa+F3/ygbAH4lpQOShjXlVKXi7eWOAHuSxVMwk9wvM4D8YbZN5gI
	FU6mCpKkHAdD6rxgIsNraesT6XOKVQbunQN8hq9ElQElTKpbjC8Aw9k/SCsqygB8kH6o
	tkgYHTuGY7V5EJKCgB6OWU6rmBpwaYo6CF0InmBfbskzXKqVQlgMZhNrnBskpIUrwK2i
	TUizk+ZU2D0OuC1g3Q33KvqC7FPnxp1GAqdKmWbltAOVeA69h018tMGj+oBz5EEaMqr7
	IcLVwdkPws/QAuleAn+ajb0gE/WpC22p/P8D1IcDBRB+6b4b9f6fWoGSRS5pC7tY7LFP
	vPyA==
X-Gm-Message-State: AOPr4FWYc+cgnDlzKPTSudj0IhjGToYBeuQW/zCF42FsHwNtWM5AN3p2GIycvxYyZzCP7sJ3BYD/vHgcizRmzaoG
X-Received: by 10.157.14.236 with SMTP id 99mr223083otj.83.1463481381412; Tue,
	17 May 2016 03:36:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Tue, 17 May 2016 03:35:51 -0700 (PDT)
In-Reply-To: <1463470541.4578.7.camel@linuxfoundation.org>
References: <cover.1463404035.git.jussi.kukkonen@intel.com>
	<25872fbe16b6f36bee45fec3e7f088cd72507351.1463404035.git.jussi.kukkonen@intel.com>
	<1463470541.4578.7.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 17 May 2016 13:35:51 +0300
Message-ID: <CAHiDW_EY1U2Y44L5MQzdv8f9MrxJ_zUYmgqH7AD28o=WPmaiGQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/13] glib-2.0: Upgrade 2.46.2 -> 2.48.1
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
X-List-Received-Date: Tue, 17 May 2016 10:36:22 -0000
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 10:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-05-16 at 16:22 +0300, Jussi Kukkonen wrote:
>> * Remove now unnecessary readlink patches and
>>   ignore-format-nonliteral-warning.patch
>> * Port relocate-modules.patch
>> * Add ${datadir}/gettext/its to FILES_${PN}-dev: this could be done
>> in
>>   gettext.bbclass but so far glib is the first and only ITS rule
>>   installer
>
> I think, but I'm not 100% sure that this caused:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/buil
> ds/762/steps/BuildImages_1/logs/stdio
>
> which failed in this way in many different builds.

You are correct. These projects have their own copy of glib-gettext.m4
which changed in glib proper and m4_copy() now fails if this happens.
Amusingly the only change was that AM_GLIB_GNU_GETTEXT was marked
deprecated...

I'll do a world build to check if there are any other failures and
then send patches.

Thanks,
  Jussi


> Cheers,
>
> Richard

