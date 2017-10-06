Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E5374601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 13:23:53 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id m28so16693154pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 06:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/zOI5LJ3YY+BJd0/bNdLEhSqHuVPoIgcjyorC25VHBI=;
	b=q6zWrVAVPxzw7Q4mM7dANX5WX63ufMWxOWvmvkKoHilechwt0RvrKVrji6IhujhPTX
	SHUJC2zuCztSw8NuP4a44XG2CjE3GmD6hZQJC5dK+OhPqGhKGNBgwzEfWd/+soxEaK4t
	OIpU1iN6usHvIuCfEiFlnzK/2oOtOOPbV39c8nav99kyvxP5SFbfhv6Ah//yju3DB8lB
	jEI4CtdjhZxuSv4QqTY73rER8tsSL5u6uP33rODobnvOYAWLPmNQp3a9VWjwOoCJ8B0f
	ZfmKYZIzBZU1O8mqfogXjSXIDyUX3yeWR0/maAP0qpcq2Us1Y/xgXxQE5v4lP4ysaLLA
	k/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/zOI5LJ3YY+BJd0/bNdLEhSqHuVPoIgcjyorC25VHBI=;
	b=COvBXMwfDA9DCH5ih7rkZXjMzfdF0/Hz7ib88c+tFw8CIzmG9LuScx/WACEESNi7EK
	/MjhwO3CqWhuGzM75sMi+klRnZwMQIhIukMbLW0FWCf48+SyZFsHN0Ixjk4S0uyg+2SV
	AN3Iouz2M2bsCbB77jq2N3yQZuC0yedzYxICc0Ixnh2cPzq6LQVkl0JZGoDWtjSShk2W
	VkF6YyYWsLqpi1QTzuPdmv36xIpl4/Ys3SgjQTyKksdtCGUSMYeBvOWwpAvKiBDkXrR3
	Hg6yoEVGtN2IqFO1OazCNayBpGUkGfoQpgDtHt7zG4MGB3FjRdZxA7vV+xw5Iv1yyGQH
	2+1w==
X-Gm-Message-State: AMCzsaXWY6i4yN4c91V4clk9u+3LzyRiMB1MIG/kgzGkhsV83WCsvygN
	oTxYWBwTYgTwT6FgZnca7cQ9YzVt8Nco+Cv3Vz8=
X-Google-Smtp-Source: AOwi7QC3KjN3t4lAHQbyppENhRHn3iqYZ0C10zC6Qo8N53nDyDv7/GH75YL6y5MzAJp+3xcWP36o/KkcmAOsfDnIZSM=
X-Received: by 10.98.2.200 with SMTP id 191mr2222555pfc.285.1507296235166;
	Fri, 06 Oct 2017 06:23:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 06:23:24 -0700 (PDT)
In-Reply-To: <CAJTo0Lb=YeOC-B5xQa8jPPsja+DCTdq9SAAOm4FfWzsMdcisvw@mail.gmail.com>
References: <cover.1507250774.git.raj.khem@gmail.com>
	<1231bf23c001d44632edf9061b87ac6629d2fc83.1507250774.git.raj.khem@gmail.com>
	<CAJTo0Lb=YeOC-B5xQa8jPPsja+DCTdq9SAAOm4FfWzsMdcisvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 06:23:24 -0700
Message-ID: <CAMKF1sr=UP1-5v++XyVi7KfcTzRuUGpOzB=xJVcQ6DEZsXh9jg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 06/10] binutils: Convert SRC_URI and SRCREV to weak defines
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
X-List-Received-Date: Fri, 06 Oct 2017 13:23:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 6, 2017 at 3:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 6 October 2017 at 01:50, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> This makes it easy to override them in bbappends
>
>
> Doesn't a straight forward assignment work in a bbappend?
>

It doesnt work for rhe case when just git location is desired to be changed
and we still need to apply the patches from oe-core.

> Ross

