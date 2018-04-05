Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1401C74E79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 16:53:41 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id s10-v6so18001531plp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zUbzdZwdg/4At1Hht2KoWDp7afkNpgI26U5Tdh4T/5U=;
	b=I56MDqSU8WitNVJ54cVPx0TqRBrapc86aXQ32CscLr4RF2VaBCVmgNkTDhkBqfL8PE
	uHHt29P5nne9jd4IcxbaXFZ4SP07TTxTEkA4U57jOnKHAMMMeKzIQOq1y6WEId0m2DqW
	VDjKOpJvxxVzKsiTVVCgZUPvAMT/RW89aUOuJJup7u+A3RP/e4+fb6anoFbC1UqAqic2
	NaIktd8gyUZLfSySKTacfnUkFTUBYXD1GWX4tdIFL3OWpSe+sE4Bk0kJ4V4+xopVl/qm
	qKv04wQSBycz0k9K4WkaK+3IBrroEdhndYAkIpQvngPy91fnkt4BrDfJ/zjPXvSYZ3WL
	rDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zUbzdZwdg/4At1Hht2KoWDp7afkNpgI26U5Tdh4T/5U=;
	b=L4KTT7zrTgJ61PzmRGiELS9gASZYjovAGEPaCGUUBkoyDYkgmVOlNJ5eZxbWWLJ7Q6
	UryLxSvQS3KLmXFwsdIHnEjMuFT5qtPMlctrlZ2fhONjtWD2QKvFtWXRwqpmpHmnjsuN
	XILpNz1z+b1ysKyIxeXKi+UaaPlVzCDA2RYOcbA9BN4cjLh2fW3UWB1vMXVK5DAgSVMi
	RuTlHnuKfbuwH1WOMu4uqzHlGTtCn832BoQjmzhngapOFSZf4qxakU8Dd4W8rx2G8zIL
	+fxOOetCQl6LleDNP++eZFXMjmwHwNzY9ffYmNbT9mVIlDE9RXS0bcihClCn1L+TxD49
	YCog==
X-Gm-Message-State: AElRT7Eo9KBvoCWlP6nG5uN1KrbTfwg0CHdDijCV3CVxlz9aaY73Qw4/
	FxcGGR/VgPDenhBARsrYZFArFJO2K+icGQRhaUg=
X-Google-Smtp-Source: AIpwx4/fiHE/AlH2CLrZe1RstgWAw0Z6W7vBYPMRYfXU2qTkq+blVCZlRZh0tc5T9sI0NV+N4zgfzO+M/3Aq+gbFhIk=
X-Received: by 2002:a17:902:43e4:: with SMTP id
	j91-v6mr23387163pld.118.1522947222446; 
	Thu, 05 Apr 2018 09:53:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.236.172.5 with HTTP; Thu, 5 Apr 2018 09:53:12 -0700 (PDT)
In-Reply-To: <a38abcfa-a505-e068-7265-7ba60fe88ae8@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-8-alexander.kanavin@linux.intel.com>
	<bac40368-2bea-05d5-63b7-2f887a1dce1c@gmail.com>
	<a38abcfa-a505-e068-7265-7ba60fe88ae8@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Apr 2018 09:53:12 -0700
Message-ID: <CAMKF1spsSPNVVvcyiUJc4wSnaQBdBOfVVDsH+MUQoK6kWoFQOQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/22] bash-completion: update to 2.8
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
X-List-Received-Date: Thu, 05 Apr 2018 16:53:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 5, 2018 at 2:27 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 04/05/2018 03:18 AM, Khem Raj wrote:
>>>
>>>         # Delete files already provided by util-linux
>>>         local i
>>> -       for i in mount umount rfkill; do
>>> +       for i in mount umount; do
>>
>>
>> where did rfkill go ?
>
>
> util-linux obviously. bash-completion no longer provides it in 2.8.

perhaps should be in commit message.

