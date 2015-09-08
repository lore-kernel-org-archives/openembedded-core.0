Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3E96565C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 19:38:37 +0000 (UTC)
Received: by iofb144 with SMTP id b144so131560177iof.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y/w92+u/TRjjdf/1bd8Kc0zI45xP5tiLi1pnRc+awN0=;
	b=xN5SJxWcd7GPtWwW47neEPer09aGOdsS7DA+vURj+qiICSMH0qBp92grzkV5gpB3Qw
	orpReGZxoRbHuBZKDoCz+gxfbiTWOIv1aezJKozY1ryTE00Dijn2aWkZrnyeIzsOSsay
	BDYVB4NrEo0Q2ylRD06xrnaCWhG8ZjGRAsb8DzzANnCpv0ZGqQ6O8gDbMuECb6I9s3V5
	Bp8aJYMhkaKicwLa4ucOAlctA9LHl++eYVJFA3iZ0RSbK7HuC+entcJ20hwq3+ySIOrb
	OYeK522ypWyhwqAW2JIm4E3YVq21aqajUiPNcJ8jT0YQgxWY+3y7/umOCMd5OkJlBIlu
	MoNA==
X-Received: by 10.107.34.149 with SMTP id i143mr12657405ioi.195.1441741117647; 
	Tue, 08 Sep 2015 12:38:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.142.130 with HTTP; Tue, 8 Sep 2015 12:38:08 -0700 (PDT)
In-Reply-To: <434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
References: <d16024c043abcd21b162f7f93a5bdf29d91c8317.1441552859.git.raj.khem@gmail.com>
	<a234814e2ad213dc69b90a3450d79b778c0e4c7c.1441552859.git.raj.khem@gmail.com>
	<1441654609.1680.79.camel@pbcl.net>
	<EC219B31-F312-41D6-81C9-D13213CB2759@gmail.com>
	<1441662490.1680.82.camel@pbcl.net>
	<434A343A-193D-4D65-BDE0-FC1BD2D79F28@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Sep 2015 12:38:08 -0700
Message-ID: <CAMKF1srrc_mumugSUWW5mhdip5mqK8J_OQkvuzwMY8O1Rjvzmg@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] rootfs: Do not uninstall update-rc.d
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
X-List-Received-Date: Tue, 08 Sep 2015 19:38:40 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 8, 2015 at 12:03 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sep 7, 2015, at 2:48 PM, Phil Blundell <pb@pbcl.net> wrote:
>>
>> On Mon, 2015-09-07 at 14:15 -0700, Khem Raj wrote:
>>>> On Sep 7, 2015, at 12:36 PM, Phil Blundell <pb@pbcl.net> wrote:
>>>>
>>>> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>>>>> update-rc.d is now needed by systemd to interact with sysv
>>>>> scripts, so if we have a mixed system, then we can not uninstall
>>>>> update-rc.d as it is going to break systemd functionality
>>>>
>>>> The description above implies that you will only uninstall update-rc.d
>>>> if systemd is present, but that doesn't seem to be what the patch does.
>>>
>>> I meant to not say its only for systemd. but that systemd now needs it.
>>> so update-rc.d is no longer forcefully removed from image depchain.
>>
>> Well, right.  But wouldn't it be better only to leave it in there if
>> it's actually necessary, i.e. if you have systemd and you also have sysv
>> scripts and the rootfs isn't read-only?  As it stands, your patch will
>> cause update-rc.d to be left around for people who aren't using systemd,
>> which seems like a retrograde step.
>>
>
> makes sense. I can improvise on it and check for all constraints in a follow up.


I have updates this patch in pull branch
https://github.com/kraj/openembedded-core/commit/c4c574dff9ef689c7694a6055907083e7a018d48

>
>> p.
>>
>>
>

