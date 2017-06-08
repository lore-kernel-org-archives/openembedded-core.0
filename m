Return-Path: <net147@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 82B18781F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 11:21:52 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 185so736547itv.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/kvnY6wGfRJKYJ4Wl/pNCWP1cSVFMnrWcu4PDzZX59w=;
	b=twAMvhO7xkBDe2EKcZBySCv9jMK0tNwm94ycif+Ski9NBmQNjlOOkldXr1R4Uqe1IJ
	EXH8vZNLzOOKbscLETwexNr86kkegWqlQAGeX7ApK800GufQXdUxMpBFb2hTdkFF7YDq
	MI9svoJWliQlI4v/CGRZbe+dbE3O6g97cztfbWqkxLtCfPwpTL8TmztFkB3lF0xvJyEe
	wtji/diOOPzt+DNyggWO34MwNfrbl47j8VlW6UXy53LnttjTCSpC8LvOyFCiJzYbvoFL
	sNLl0vTN+JjKOwm5a7duAF/j90K2QTDhFcy+2cp402jMJkpuMg2sUqn1St+WKO6uwW2N
	IXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/kvnY6wGfRJKYJ4Wl/pNCWP1cSVFMnrWcu4PDzZX59w=;
	b=cTw8o3j4ffECkCOTbKq0HUBsMUFoqfpnxWfXbK/Tx8jk0TgJG+gZGa0+iMnt0b19b8
	NYGOmI05w5wXye47LnB+jDnk9Q9cNyCxF47pldwO041StWFu+6mQnSdk0jvWo/4VtDcB
	SgwmxG5C1vNf1WUQiBx1pc8uYON/KEv9POqcNMYrCdBMuUQGhmtqkq3M1etItdRKU9pJ
	KSAgGDt/PIgsdmLh3QOo9jyua7YJqEyZWZV6z9RuVvDWajnbRJ8UxhgOeBdwCKCBcAVD
	1Y7Z6Mi3ckrQcXebsE9uE7KE1l2DxvTwUA0ndLLxIpy1e/XNJ+2vCFYRiF3dMZV+/039
	H5Bw==
X-Gm-Message-State: AODbwcC1OTD17saFuDvLjJNxCkOSlrkdPycmo7oymG5uItVoLZRIpnqj
	4e8dz4ez7zAQhQwgoB9tJy0SzRNTMQ==
X-Received: by 10.36.107.201 with SMTP id v192mr4875503itc.81.1496920913479;
	Thu, 08 Jun 2017 04:21:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.131.68 with HTTP; Thu, 8 Jun 2017 04:21:52 -0700 (PDT)
In-Reply-To: <CAJTo0LZcKVgrHp4M+7JizD+KM2S-qCxi=yKDnGBJ9AvziLikuQ@mail.gmail.com>
References: <20170608110754.32445-1-net147@gmail.com>
	<CAJTo0LZcKVgrHp4M+7JizD+KM2S-qCxi=yKDnGBJ9AvziLikuQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
Date: Thu, 8 Jun 2017 21:21:52 +1000
Message-ID: <CANwerB08=Ae416bR-HQXcJ2-yJ=0ezfu51YSKexcDxzHSUfw-Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][pyro][PATCH] image-vm: Avoid use of fold, tac and paste commands for DISK_SIGNATURE
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
X-List-Received-Date: Thu, 08 Jun 2017 11:21:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Ross,

It is the shell not awk.

For example:
$ echo $(false)

$ echo $?
0

Regards,
Jonathan

On 8 June 2017 at 21:18, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 June 2017 at 12:07, Jonathan Liu <net147@gmail.com> wrote:
>>
>> These commands are not whitelisted by the HOSTTOOLS variable which
>> silently prevents the MBR disk signature from being written to the
>> image.
>
>
> Silently, ouch.  Thanks, awk.
>
> Ross

