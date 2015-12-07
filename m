Return-Path: <matt@madison.systems>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id B55CB60124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 15:49:01 +0000 (UTC)
Received: by lbbkw15 with SMTP id kw15so67702105lbb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 07:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tFfvKVUkPultgyG4eXbJ++TciTKWxdiZpSkKGCTVP4E=;
	b=J5nGX2fN+chYM/frxmfl7G84WFz67Hj6PLolTMU03HFhDunyuPMV6ydoqQBI/Qbiym
	A40l5rC8Dao8JOHIZjunLKLHQm55aP8IopupbeBuvvSWkcFLm6RASlt9HbLdqx7VxotS
	gq1i382rkdUniOgM6G6T1PpqG1VEgBet1605LbhjIGTKT20boHRTXYOZDnNfpzpU+3Vp
	94C4VlvOo+tuTU8q4UAolbN2k2YI+kpsMaPykezXdO5A4wEi0mtFFG0CBnkLCaTFDfwn
	iWHT40o8WSejJqG2pDqq30jB5wFP9bCe+r80ljPgRNefcPiKUyamsFRQZ/+S6fHOPLGR
	kf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=tFfvKVUkPultgyG4eXbJ++TciTKWxdiZpSkKGCTVP4E=;
	b=krD0adjwBRK8zRzPOzU/ye+uOyWBQdZeZyE8436qlZafOZEJg5gDFH46911d1fxnkG
	zYtkzW5YfYB1BTF7mnQbuKOQx9kf0D7ey2AJUb5fa1+yQFurLzLS06IaJWOZcDi0Cvoo
	C6MgZMWW7HuVdBDyo8++rGodLY3Uh9wzLkeuoi8wD2FsmFTtcc5UaEA7nGhKn0t9Xv9Z
	3hn2FLOKDBOT8P/Ob3NQUtoNe1+P3nQt3MA4vg4Vs8pVUVchpw5mAV0oAPS9dyevZofX
	D5p7Iykfu6F7/NjmmJ2H9GTs4ttrs7rPjTO/CGSCOFoEr7BKy6+BCJ2FPI9E2MZlpyYT
	9W/g==
X-Gm-Message-State: ALoCoQn+IWKTJZ7z6USWPerDyNw/ODzZwo+7fU+msehEN5AxF7EgRcvV6AIqL+ortfyYiTN9lB+f
MIME-Version: 1.0
X-Received: by 10.25.213.145 with SMTP id m139mr14494681lfg.150.1449503341608; 
	Mon, 07 Dec 2015 07:49:01 -0800 (PST)
Received: by 10.25.145.200 with HTTP; Mon, 7 Dec 2015 07:49:01 -0800 (PST)
In-Reply-To: <5665A30D.7010306@windriver.com>
References: <1449421751-12670-1-git-send-email-matt@madison.systems>
	<CA+chaQeA0AFTk3eTEckJnsc1jp-RLx-9LRde0BkrPnJHRp+AtA@mail.gmail.com>
	<CAGgRHJrZOA8+nGyfXQgFaeZ28M3uuLf7EziN2DK_dM2Hoe5J6A@mail.gmail.com>
	<CAJTo0LYNtGDhyZLJnRum7XveZJ4eG1m6wvgTe8H3Sb9fpburUg@mail.gmail.com>
	<5665A30D.7010306@windriver.com>
Date: Mon, 7 Dec 2015 07:49:01 -0800
Message-ID: <CAGgRHJpLm9A+M-APn8n8+ZTVpcBHjJ5W-UHCD_KRoTyOvLCqww@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] ARMPKGSFX_FP ordering
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
X-List-Received-Date: Mon, 07 Dec 2015 15:49:02 -0000
Content-Type: text/plain; charset=UTF-8

OK, I'll rework the patch to fix PACKAGE_EXTRA_ARCHS and rebase off
Martin's changes.

-Matt

On Mon, Dec 7, 2015 at 7:17 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 12/7/15 8:01 AM, Burton, Ross wrote:
>>
>> On 6 December 2015 at 18:22, Matt Madison <matt@madison.systems
>> <mailto:matt@madison.systems>> wrote:
>>
>>     Close, but not quite, I think.  It doesn't look like it addresses the
>>     ordering mismatch that occurs due to the -vfp include being processed
>>     before the -neon include, resulting vfpv4 preceding neon in
>>     ARMPKGSFX_FPU when both are enabled.
>>
>>
>> Martin's patch is in my ross/mut branch so will be in master soon, can you
>> rebase these patches please?
>>
>> Ross
>>
>>
>
> I would prefer we fix the package extra arch, and leave the ARMPKGSFX_FPU alone.
>  I believe that order is correct.
>
> --Mark

