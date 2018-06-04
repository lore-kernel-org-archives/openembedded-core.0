Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 14312719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 18:47:21 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id n3-v6so26848019lfe.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2018 11:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Fc2s3HZ+emXv/kpGWgYCr4saqNsFSw478dwxck3ootE=;
	b=e1qqkuM4iPAssr+HsgNM4kj7ZXqE0DRT/ZWqwdXDsNXvQHE2RpSgmfgtfcCXTpQwa9
	ItG53BPv/qvV8gl0aRYgx6oGeQlPsk/caN02sYQZ6fCK2NG/nhnYZjh2JoVSqqKgEhoA
	j/WpoiwjlqAIjE/qoT1fkonpmlt0/sU0jcv5QoyFyfZPU6TlRLFkSpjfXGDhgFk33dKi
	yUdF+mOnpzvojXRudn1waWxNg4D9Z8f5mIV0uMEz0Jdz7HjAo72cx3+yoArg+CAXfDq2
	W3KxRq1gLvgvMgz72HTLr2SgudPhXxdW18Fd4spJPu855yfR9aZb5FAD31+mPUyvXx3V
	AXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Fc2s3HZ+emXv/kpGWgYCr4saqNsFSw478dwxck3ootE=;
	b=WPs5WKKG4l8CyS2063NOtmoG3A7k92kEPtqjUsWizJ8brruHltZJoODhu9xOIXuHjg
	tYoOr6CE9DjvBDemlk8yLnQfAdyox6JbkvYZ8SZ/uO+aQp/Xih0T4MuE71yLixxyUrMd
	1DO3vV1l8JJfW3wZs/Pyn/zF7H2w6oK9XsjYnyD0+Xi+0qgP16yghX5CXs+HFXtx+lWN
	Sp8MG5KCRCoVVcTGRKjyDygtXUNCbW4a6wWy2lINkcOR7qVL0A5Skce5PI0TTfBclQ62
	ce1pNVngVQzAykxGdmjutyqFZg8TaDjycNGqs4SluPDlkhCKxGb+nMYwcRYZTxUveBCs
	Ipmg==
X-Gm-Message-State: APt69E23Fg6bDYLCg2kWe+4h0STnMhjgqmzkK+fQuXIpFjBhAU5kx2aV
	6vgxzKVTa0CWnlJnoY1kOFR77RetZ3rqYszznmI=
X-Google-Smtp-Source: ADUXVKIHX+o/UBCnlGGpjUOO/wurYCZOLjLEIW2QP0nwwEfcXV7lCJCz199oV7ueCALE4l+ZoT1C+s/29/PMLnQcHZg=
X-Received: by 2002:a19:e218:: with SMTP id
	z24-v6mr10043223lfg.132.1528138042638; 
	Mon, 04 Jun 2018 11:47:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 11:46:52 -0700 (PDT)
In-Reply-To: <19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
References: <20180601221436.27162-1-alistair.francis@wdc.com>
	<20180601221436.27162-2-alistair.francis@wdc.com>
	<CAJTo0Laocxug2iUZjAD8bLqDN4ho7GPO=_c2ZOQQmvSErOXyyQ@mail.gmail.com>
	<CAKmqyKN=5JzrFhK0aLvzuxHJFO4PmK_Km2JnynrqKjfovQAokw@mail.gmail.com>
	<19c52d27-6206-5b80-a41b-f3a106d8d7fd@linux.intel.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 4 Jun 2018 11:46:52 -0700
Message-ID: <CAKmqyKO4STCUPJJE7+ZPwSMwGyoUAkcbTckSiByEipGMBDE-RQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] [meta] atk: Specify gettext-native dependency
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
X-List-Received-Date: Mon, 04 Jun 2018 18:47:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 4, 2018 at 10:20 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 06/04/2018 08:17 PM, Alistair Francis wrote:
>>
>> On Mon, Jun 4, 2018 at 3:06 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>>>
>>> So why isn't the inherit gettext sufficient?
>>
>>
>> I'm not sure. Here is the error I see when compiling for RISC-V before
>> this patch:
>
>
> So is the error specific to risc-v? You should dig deeper in that direction
> then.

Ok, it looks like the line: if d.getVar('INHIBIT_DEFAULT_DEPS') and
not oe.utils.inherits(d, 'cross-canadian'): is evaluating as true in
gettext.bbclass so we don't depend on gettext-native.

Do I need to ensure cross-canadian is set for RISC-V builds then?

Alistair

>
> Alex

