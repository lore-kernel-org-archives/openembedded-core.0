Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9E6FC6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 07:29:43 +0000 (UTC)
Received: by labgq15 with SMTP id gq15so40610966lab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 23:29:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=oUZVSVXw34arDuaNZeSpcHNJX4LrMAQtfN89a6+yn5Y=;
	b=k9Ckvy0vIlUG1LqaoC0Kpe5cFxEGYVnJc9q61U30LJXy3q4WEwQBbiNCHhJWi52cEM
	dYIdNSfXuR4BBh4Jwnrl5pPg+DnfebA0HtiwOaHiKRqtRTLYtRfT7BdEmr024I+Mrw8o
	u4ZRlzkkoiJq7ZDhzLf9z81JvsVYTzhHUHzPbWag4BuL0f077Dlgact3BZT3dZbkBGN6
	JUdF/oM5ewLUBbsQYftiwUff9XIDdKdx++jaXtj3RYK5MD0OMskxkcEbpHsOwC/CEfjt
	2+tJjUNIzpKAYykhAScSG9FmaF9Y2XFfSTGRjeRZnY2x2Ecf+m9Mcd2SehXdpBf4/mAq
	s6uQ==
X-Gm-Message-State: ALoCoQnzhUDUVtA1yCBo66213pNu3/LE896pjTDCu69etjafuOuPzDzZRnXYcEqG4G9duQFiRImJ
MIME-Version: 1.0
X-Received: by 10.112.104.100 with SMTP id gd4mr25995995lbb.57.1424244583934; 
	Tue, 17 Feb 2015 23:29:43 -0800 (PST)
Received: by 10.112.235.195 with HTTP; Tue, 17 Feb 2015 23:29:43 -0800 (PST)
In-Reply-To: <CAMKF1sq8+-GSJcK_x8g_XvL81R=kyAaS=8C+W1KRArMBJCOB-A@mail.gmail.com>
References: <1424241885-9344-1-git-send-email-fathi.boudra@linaro.org>
	<CAMKF1sq8+-GSJcK_x8g_XvL81R=kyAaS=8C+W1KRArMBJCOB-A@mail.gmail.com>
Date: Wed, 18 Feb 2015 15:29:43 +0800
Message-ID: <CAGNsrLCe2ACR873KCFAhD4Vo1=H5aMkByFg-aR-kwmcj9OP54w@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox: update to 1.23.1 release
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
X-List-Received-Date: Wed, 18 Feb 2015 07:29:46 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2015 at 15:18, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 17, 2015 at 10:44 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> * Bump SRCREV/PV
>> * Drop PR
>> * Update SRC_URI md5sum/sha256sum
>> * Drop 0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch
>>   - applied upstream and available in 1.23.1 release
>>
>
> Trying my luck here. Does it fix the gold crash on arm ?

unfortunately, I can't tell :) I've used the GNU linker.
I've built and boot tested on ARMv7-A and ARMv8-A.

I guess you'll have to try by yourself.

Cheers,
Fathi

