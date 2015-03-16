Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 50EC06AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 11:53:21 +0000 (UTC)
Received: by labjg1 with SMTP id jg1so37231059lab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 04:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=voxhChHEQuozPuZbQutTZuFPh/PijRm40RVRSpESetY=;
	b=lLT8OOty9MyZKR/EPpAvHeWiTY/D+NldnQOm0ta6MOPT50VoZ+3ba8TyVnbTwRuLEy
	xapAA70UQCjxqR+FFc2hjLLrwHrYaWghsKsnvl4tYMs7NbGs7N6mJI2SOkeo96zvH7ba
	lOeeR/6dJVo8JORPuQ9MFmRf1BZGAr1cgS3N32qEx9hMEC29vbG3zjyIiMXgFTJQSSkC
	PfDkIEQ6c8srfInKrjnnT5Ut0gbBoIiDDHoK7+QwCZZjIY3bIMipIf0CYVF43G1C1odQ
	0nwQ3zM8yRgl4c/4T36pCFFoLeVyYqhLJOsE4ZH9bgJnJ8WVwXgMq00zcRv9lDA/0i09
	gJ9g==
MIME-Version: 1.0
X-Received: by 10.112.154.163 with SMTP id vp3mr30291697lbb.93.1426506801834; 
	Mon, 16 Mar 2015 04:53:21 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Mon, 16 Mar 2015 04:53:21 -0700 (PDT)
In-Reply-To: <CAJTo0LZA7zJvE-8QKcsSc4_o1LOnYqOEWcOL+pKre7Z1CexFEg@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<CAJTo0La-P0daO2k0UWFjcYgHwjMGHnqrsj6gid=6-0oFZEe9Vw@mail.gmail.com>
	<CAC1BbcQU=b3FH7QqanMTu6c5PYYQ3ftJ_pVgYy6Z_tpbDRhYqA@mail.gmail.com>
	<CAJTo0LZA7zJvE-8QKcsSc4_o1LOnYqOEWcOL+pKre7Z1CexFEg@mail.gmail.com>
Date: Mon, 16 Mar 2015 12:53:21 +0100
Message-ID: <CAC1BbcT6v5Dwa+jDmePaXwto-M2dK8QgX4FvBf1XJ5qOfFEWGg@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libtirpc: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 11:53:21 -0000
Content-Type: text/plain; charset=UTF-8

On 16 March 2015 at 12:52, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 March 2015 at 13:49, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> wrote:
>>
>> yea, i'm not changing anything from installed binaries perspective, right?
>>
>
> Even if you were we haven't needed explicit PR bumps for quite a while now.
> The PR service will automatically increase the PR if required.

k, thanks!

