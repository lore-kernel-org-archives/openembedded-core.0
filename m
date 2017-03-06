Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id C6B727308D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 22:42:42 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id u48so127134638wrc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 14:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+YxofRSttyCT67fy3li98uoOWM0BMew+3L1I+P+/wOI=;
	b=ngDCZV0XlxmIy1/oEK5zVF1LzTer0Mfedxxxdrn6a2itneU9A/mMCPMCFW70ZIOMa1
	z+7p/dpl+lfTCphhWUbpr22EYfuveOvfFMS/MZnS49/8+Lj7u96aBjqTvOzMeuI0ufw0
	3mQWPR+eSAAeWlykrvGC5gSFkJJmv5P40cNQ4F4ubOu3Tqhp37bIRhdAXIH8rCJW9v2k
	6tQjFMLbOHU3J8wRrb7YDrNEGqZxLNLBteL9YYY4brfUoCGV5B2Z5sr4C9ww+pu+v1h4
	HgKZRjiIDuSmfko+KNRGyLOKQC9CLeu3Cw44fEuZ5qQRrBxmpaxgOwZibkBQ8APRENzZ
	vB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+YxofRSttyCT67fy3li98uoOWM0BMew+3L1I+P+/wOI=;
	b=pc+eAsCaYEKniT2F1exmz2CELqwhhhUXWr3ZgtUuf76R4CNsQBSDcC9f/YkdLyTjQM
	NEwcsRqJ6Jv6zKN9W6VcUG0KktScyWupZyWKF4SHPyPPoYNLw8pQ2v6WXK7RClU4Pg+n
	g6x/gpltqtt2hZOxh8EK+adfg8qPVpHQ9C8t6Hf3MtrD/dKdH2FGb73CnNg/oC1l+PEq
	3zjE8/uNoCt02Svpe1ZPsp/nrrg99FmF/4I7Yt88ARlbWwo3JIsoiPbdCCQ7ENbosQce
	3w7HmgjfyCBreEdDoN5ZRIHrMRTCshRnLqUtZitxjbAbJy24njErkKsSdNCMbBmQhaI8
	LCTg==
X-Gm-Message-State: AMke39lOr6lX5ILCwJxn5C7fWcELX8RlcmyQN+uD5mRDA5n+ktnq2NiN9i9zqq2vVjI9VrG5j/I/KQoJyFRhRg==
X-Received: by 10.223.152.215 with SMTP id w81mr18439614wrb.151.1488840163192; 
	Mon, 06 Mar 2017 14:42:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.174.82 with HTTP; Mon, 6 Mar 2017 14:42:42 -0800 (PST)
In-Reply-To: <CAJTo0LaX_0msZv=MZRYCCLZGPQNN5SRL6tUCPpwp0LXW00ruZw@mail.gmail.com>
References: <1488839646-19178-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaX_0msZv=MZRYCCLZGPQNN5SRL6tUCPpwp0LXW00ruZw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 6 Mar 2017 14:42:42 -0800
Message-ID: <CAJ86T=XD69zVjUwCkW92nB1pwU1Mz_NK-co3qQ7ah3x=xQbtJw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity.bbclass: allow s3 protocol when sanity checking MIRRORS, etc
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
X-List-Received-Date: Mon, 06 Mar 2017 22:42:43 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 6, 2017 at 2:36 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 6 March 2017 at 22:34, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>>      protocols = ['http', 'ftp', 'file', 'https', \
>>                   'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
>> -                 'bzr', 'cvs', 'npm', 'sftp', 'ssh']
>> +                 'bzr', 'cvs', 'npm', 'sftp', 'ssh', 's3' ]
>
>
> Maybe bb.fetch2 needs a "list the protocols you support" method?

Yes. Although there should perhaps be a distinction between protocols
which can be used for MIRRORS etc and those which can not (I'm not
sure if the current list in the sanity.bbclass gets that right?).

> Ross

