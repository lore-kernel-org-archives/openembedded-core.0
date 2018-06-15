Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7883A753AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 22:25:26 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id l14-v6so3955123uao.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 15:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Q1pJ1E+Hzs0CzoP/OzlzWmwF4uBYIcMgG0n3y04tbUw=;
	b=VOUz/J7lxtr8b5bBf3wrVyCTWYzIokXiAtDhQ1c5KlbFMta8kDb9W+3uDsoLW/0dF+
	0D03a1lppJ3KN1IeLzC6+Zsy4g+pV+P+JJdPchRClkm/TzgFCOkQHlsqb0VaIqXU2lkY
	FWnS9QilmphUTb6uNfAaQ4N+9diJAzn9FAmAOuCqmpp4zNRueiqGOeK6OgK7BlsykKU3
	S5xyVMt+CMKy8NHDQ0Yfdh50/nVwndvx+k1jC2CN9tMKTxMv3E55sWdqvx6xLWGBHRiW
	r/CiB1zsUZt0j2D7N7jjUASjNEEBP1WgR/unOEwFnLIy3/+FTa2HSsSL6GBOCFiW2cnL
	s04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Q1pJ1E+Hzs0CzoP/OzlzWmwF4uBYIcMgG0n3y04tbUw=;
	b=tY44ZbHqBiyjoZJiiNyVNZEYQtTaB77rIKbYy+KgwoT4BkBkCwrlcHzlQsopUjG9jF
	j93g244AaB602VT/Kyz0jSD6yAd8PaPleuuHfcImJmwnHKY1FGYncIq/sLee8yIzoari
	eVEdR5st7kNUFtQP2DL5n1iIw3i765mLG11TGAdI/3N9rw2XpJk7gNqWfIAKiz1Of1Qh
	zHi8COrJQ/ki8c667mjZ8zZVtEhgbjA2H+KWCVY6C869Ln7tpefgISaGgzrMKDmymrGG
	vol2ywX4HQX6tbDvcaHHsX1hWk+Q0v8z1DRfwDxeAADvlLBbJLu52fzPDPp4xSADfpRn
	cSYA==
X-Gm-Message-State: APt69E0WequclfU+c1+7OkX9AoRZ+nHqak6GRInsiXE2IMb9XsiSVEte
	JoV4+Q35ismkR5WJGIR8j2MBnGLPu68O50h6rwg=
X-Google-Smtp-Source: ADUXVKLl+Q4t/Au5qPeDsh4peuRXu73XYlwNzhU0g3IC+/7u+bleyvhZ+Hau1EuNOLDmNZgtNjahGrU5g30HWJ2XIqE=
X-Received: by 2002:ab0:1048:: with SMTP id g8-v6mr2262772uab.52.1529101527281;
	Fri, 15 Jun 2018 15:25:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Fri, 15 Jun 2018 15:25:26 -0700 (PDT)
In-Reply-To: <22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
References: <1529093808-10025-1-git-send-email-armccurdy@gmail.com>
	<22e45738-aa92-24c7-a3fc-03a0918a1c3a@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 15 Jun 2018 15:25:26 -0700
Message-ID: <CAJ86T=WwBqJ7upMW=A3jVQOqYCd1Namrmvw62CELTrbcvrUmcw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@jci.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH] common-licenses: Add BSD-1-Clause
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
X-List-Received-Date: Fri, 15 Jun 2018 22:25:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2018 at 3:13 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/15/18 3:16 PM, Andre McCurdy wrote:
>> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>>
>> Some projects are starting to use it.
>>   https://spdx.org/licenses//BSD-1-Clause.html
>>
>> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> (cherry picked from commit 77f692ecb39d880b2cb420850a31534860eb2cc5)
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>>  meta/files/common-licenses/BSD-1-Clause | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>  create mode 100644 meta/files/common-licenses/BSD-1-Clause
>>
>> diff --git a/meta/files/common-licenses/BSD-1-Clause b/meta/files/common=
-licenses/BSD-1-Clause
>> new file mode 100644
>> index 0000000..ded8897
>> --- /dev/null
>> +++ b/meta/files/common-licenses/BSD-1-Clause
>> @@ -0,0 +1,9 @@
>> +
>> +Copyright (c) <YEAR>, <OWNER>
>> +All rights reserved.
>> +
>> +Redistribution and use in source and binary forms, with or without modi=
fication, are permitted provided that the following conditions are met:
>> +
>> +Redistributions of source code must retain the above copyright notice, =
this list of conditions and the following disclaimer.
>> +THIS SOFTWARE IS PROVIDED BY Berkeley Software Design, Inc. "AS IS" AND=
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
>
> Hate to nitpick, but isn't BSDi defunct?  I don't think it makes sense to=
 list
> BSDI, since as far as I know they never had a '1-Clause' license.

You're right.

There doesn't seem to be much consistency in the various BSD licenses
in meta/files/common-licenses. We currently have:

  BSD : THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''=
 ...

  BSD-0-Clause : THE SOFTWARE IS PROVIDED "AS IS" ...

  BSD-1-Clause : THIS SOFTWARE IS PROVIDED BY Berkeley Software
Design, Inc. "AS IS" ...

  BSD-2-Clause : THIS SOFTWARE IS PROVIDED BY THE FREEBSD PROJECT ``AS IS``=
 ...

  BSD-3-Clause : THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS
AND CONTRIBUTORS "AS IS" ...

  BSD-4-Clause : THIS SOFTWARE IS PROVIDED BY <COPYRIGHT HOLDER> ``AS IS`` =
...

Every one slightly different!

> Maybe a <Organization Here> would be more appropriate.
>
> --Mark
>
> IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOS=
E ARE
> DISCLAIMED. IN NO EVENT SHALL Berkeley Software Design, Inc. BE LIABLE FO=
R ANY
> DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGE=
S
> (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVIC=
ES;
> LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED A=
ND ON
> ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF =
THIS
> SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
>> +
>>
>

