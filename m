Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1CBC5619DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 09:57:43 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id cz10so9753380veb.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 02:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=nga8ZDK+YIz/xrwNm95dmqYrQjumJL8+CINS/l4bF+A=;
	b=UA+mrX7BVfTFsRoa4Ooajmd+YLixEDnqz+yAG+oyBRh9vy+WgdhPtfhlrr+RIW/Myh
	FXkES8wKHTmtGyG5B3283DvnkWc217aCHWm1S5tioe9ZbkEnV7wmzm66W9RX8Oydl7Px
	swd5qyHHDOHxFMbCDoWMCW6cHcvQERuQEpB6xPMduWJvcwnKZx+hKAoHh87CW2YqKOib
	sayg6ZMn0ljrN5EMWZB/8nc5uoERMK/+5xB6kc3aEkktOob5Pbj6a3hpLO/2/uUSGnNb
	AO4wwdUtObo8PTlW2IpTacHpCT1izMYU0tW+6Y+VbYvqgYqLJpU/JkSdfQGM+8wsywYF
	m7aw==
X-Received: by 10.58.171.4 with SMTP id aq4mr27838966vec.26.1373882263446;
	Mon, 15 Jul 2013 02:57:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 15 Jul 2013 02:57:23 -0700 (PDT)
In-Reply-To: <1510613.ezlYfIjzn1@helios>
References: <cover.1373872671.git.sgw@linux.intel.com>
	<1510613.ezlYfIjzn1@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 10:57:23 +0100
Message-ID: <CAJTo0LZcqo1ND1CTE91MU4jr0ovBggdhE2iXab1faCC+C1fROA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQm18dTAOrw5fnSmpV8xOaHLCUYPhM6oGBeg/hmDrr1tM3/odoJ7VtBewC49dzdv6nBtnkrP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/18] Final Review Pending
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
X-List-Received-Date: Mon, 15 Jul 2013 09:57:43 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2013 10:24, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> Hongxu Jia (5):
>>   pmount: add version 0.9.23
>>   udev-extraconf:fix xuser write to usb storage failed
>>   udev: fix invoking pmount failed based on sysvinit
>>   pmount: allow users in disk group to perform pmount/pumount
>>   xuser-account: add xuser to disk group
>
> I have some reservations about these changes. pmount is obsolete
> according to its author:
>
> https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/012421.html
>
> I appreciate it may solve the problem we're trying to solve but we need
> to be pretty confident about pulling this in before we do so since we'll
> likely be supporting it ourselves.

Agreed.  pmount solves a problem but it's unmaintained and going
forwards we need to sort out our at_console/polkit/etc story, and this
is part of it.  I'd been meaning to take a good look at this series
today, can we pull it for now?

Ross

