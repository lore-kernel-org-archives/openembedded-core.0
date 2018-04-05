Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0D91571E5A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 01:33:59 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id c24so25672994wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 18:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hpeJo/146gXhuwmvEiBErxpCPyl3s6ZpbWtkVlNpS6Y=;
	b=E3DjMXjVSSyRm0Gv630vuArHK4lKFbftJ3QFVivsojOZyETQa13O8v5Z9o2/4z6c7L
	TPL/ioT5+Q2wB5MiiWcLfImym9ChntuDKzGRV2CTjDyB5hAsshQ2flueHkH27C2icTVs
	8cW9rTvrtl55aKCdMIFfMIfCk72qKaldEgVhrtalqwERjDM5bbYXjv/WupbOhelk/1qu
	0MHPWJ3vVnVZQG+ZuCSIC98nZLm9XyYqWJskNmLhcLpPBhuMDzh5aNPc+sMWKebuK3wc
	jq4peQm7iB71d4d08gKWi3OCkqZ76WueEYJKXp2GCLZ9eVsM7/0wsw1kVIQfUrUjRu8b
	v6Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hpeJo/146gXhuwmvEiBErxpCPyl3s6ZpbWtkVlNpS6Y=;
	b=lM2ernUndVNnegtZLXPkICu3hEzcPSTUpA7NeWgp/QQTGd8avZSvPtNOSegBQlwNRK
	Wy/+nzye76PgSvZQsWqjAvaPn+MdF1fI++qLGFiJjfFBovy1M0jdO+MVz7YMGbDZ8Anq
	Y1cG7bTu3h+az7ai0e4/WqW3syX9IhKwwN4XRZdGW5JWUvwGikkitMj+1izvX3DQmbsA
	wPtITeD0kV0+VmuSizFcfqmfz4KA9RcbINMBXR1GieBIxlSfG0yRPdPwP+BslpKYqNUr
	+wLcsrdTD8dW7BY7+a4+UlCBnu7DDXg/BEZDGyPsNEoO3DMNoMhD2aTeYD+PYjCissor
	91Kg==
X-Gm-Message-State: AElRT7ENcbdWXZPibPSYfO+nHd/5lVgByFPjLMy5UW/dc4zjrQDtCbio
	6T8nZX2TjoZw2IAwq/Zjc1lXieIkjlhxnjkWUuA=
X-Google-Smtp-Source: AIpwx49MR86ylY22lo2fNdTaXUE/xAFqEd2pX4dedoHjfKu2ICIhEefCfH44Iz+hOdAaztjSoZktybPvTt/OBrA+Y0M=
X-Received: by 10.223.177.213 with SMTP id r21mr15467692wra.89.1522892040342; 
	Wed, 04 Apr 2018 18:34:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Wed, 4 Apr 2018 18:33:59 -0700 (PDT)
In-Reply-To: <766f8165-b010-fd9f-d904-9b5c28b5d0c3@gmail.com>
References: <1519779977-9136-1-git-send-email-armccurdy@gmail.com>
	<CAJ86T=V=+cLpzMFoWS42NMDAuOrUMzsLCmUHfUhTrP8aEvcR2Q@mail.gmail.com>
	<CAJ86T=W_-BptfjFibUTj+Kd7jCaSmq_X4=uwa=+Xz0ZbrXWvaQ@mail.gmail.com>
	<766f8165-b010-fd9f-d904-9b5c28b5d0c3@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 4 Apr 2018 18:33:59 -0700
Message-ID: <CAJ86T=U1zX3LujzraYo=50FjK0b7+mNJAzT=qa5zMKK_A_ansA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [morty][PATCH] buildhistory: fix latest_srcrev in the common case
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
X-List-Received-Date: Thu, 05 Apr 2018 01:34:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 4, 2018 at 6:21 PM, akuster808 <akuster808@gmail.com> wrote:
> On 04/04/2018 05:54 PM, Andre McCurdy wrote:
>> On Wed, Mar 14, 2018 at 4:52 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Tue, Feb 27, 2018 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>>> From: Christopher Larson <chris_larson@mentor.com>
>>>>
>>>> buildhistory was writing srcrevs.values() as SRCREV when only one
>>>> srcrev/branch exists. This returns a view of the dictionary values in python
>>>> 3, and used to return a list in python 2, neither of which is an appropriate
>>>> value for SRCREV. It was resulting in latest_srcrev files like this:
>>>>
>>>>     # SRCREV = "346584bf6e38232be8773c24fd7dedcbd7b3d9ed"
>>>>     SRCREV = "dict_values(['346584bf6e38232be8773c24fd7dedcbd7b3d9ed'])"
>>>>
>>>> Which in turn would result in invalid output in buildhistory-collect-srcrevs.
>>>> Fix by calling `next(iter())` on the `.values()`
>>> Ping.
>> Ping again.
>>
>> This should be a very low risk backport fix for morty but if there are
>> any concerns then please let me know.
>
> its in
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stable/morty-next&id=92e7030eaf4618160cac4ef37b95fc3b7b83f9bd
>
> morty has been on hold for the new host glib 2.27 and sdk issues. Those
> issues have been finally addressed and we finally got a clean build. The
> backlog hold should be lifted and things should be flowing again shortly.

OK, thanks!

I checked oe-core/morty-next and oe-core-contrib/stable/morty-next and
didn't see it there. I forgot to check poky-contrib/stable/morty-next
as well... :-)

If poky-contrib is the official pre-staging area before oe-core
morty-next, then perhaps you could remove the oe-core-contrib
stable/morty-next branch to avoid confusion?

