Return-Path: <vomegaz@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6417273D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 22:37:39 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so97028902wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=CW2SXIyd2lFzb67o9yHMCgvH13TaKR0wEDXF86efn5o=;
	b=jLtzKDO3j8EvZxjwM58BNCnDrQwjDncYfjOZ0kE6iQSf6xbbEDmKL6fBJIjHkVNvsu
	PxOJZVMNK2hlsIaZ95VbvWiLoI0LM6jY/FIphgyxJnQP7CaZ4rL2xCOLxUpEKgzA3NDR
	jwQUjDh6v6/SR6Kih0frhdTe/4xmP6V7sStTCq24XtoFXi0Lj3F+F7szCza6HOJhfIs/
	4qIhoInj1xCGno+SjsSscUZ5x7LdBU76EnJazQ1vRPxZ4/AwmZYtQCvrrx/oH0O08jw8
	yWIcyGp0UhX6pDlKHd5e2FEuyJ2oLeJ97RnRdWa1I72jUgaeIyzORpOUZOimKCzyLx36
	+lLg==
X-Received: by 10.180.88.72 with SMTP id be8mr6910309wib.42.1428964660273;
	Mon, 13 Apr 2015 15:37:40 -0700 (PDT)
MIME-Version: 1.0
Sender: vomegaz@gmail.com
Received: by 10.28.170.72 with HTTP; Mon, 13 Apr 2015 15:36:59 -0700 (PDT)
In-Reply-To: <CAJTo0Lbb5STVkmLomVrypmukoivRkhLhvX+hPcjfdv3LTx9uAw@mail.gmail.com>
References: <1428962883-26803-1-git-send-email-thomas.perrot@tupi.fr>
	<CAJTo0Lbb5STVkmLomVrypmukoivRkhLhvX+hPcjfdv3LTx9uAw@mail.gmail.com>
From: Thomas PERROT <thomas.perrot@tupi.fr>
Date: Tue, 14 Apr 2015 00:36:59 +0200
X-Google-Sender-Auth: 9g99ukKRxIxgi-afYqgmHV_TjeM
Message-ID: <CAGXeWgkeWZ4K686nrA5Qa=2jfs2GqPwak62E0BURpRdhAVPzVg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: tprrt <tprrt@tupi.fr>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] zap_empty_root_password doesn't work with toybox, /etc/passwd isn't never edit if /etc/shadow exist.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: thomas.perrot@tupi.fr
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Apr 2015 22:37:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi Ross,

Yes, It's a logic bug, but I don't if there are another cases with this issue.

Best regards,
Thomas P.


On Tue, Apr 14, 2015 at 12:12 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 April 2015 at 23:08, Thomas Perrot <thomas.perrot@tupi.fr> wrote:
>>
>> -       elif [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>> +        fi
>> +       if [ -e ${IMAGE_ROOTFS}/etc/passwd ]; then
>
>
> So this is a logic bug and has nothing to do with toybox?
>
> Ross

