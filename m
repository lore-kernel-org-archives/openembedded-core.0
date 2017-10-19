Return-Path: <will.newton@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1A077B39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 19:33:26 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id f187so11544139itb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Oct 2017 12:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TDmDabFMG4hA0mfN1GDLydVRGXj6g+4FV2e3eanw2FM=;
	b=vU3oPfI9he2SUjCi4gFE+0tBsRICBEXMZQ5AoCpPS2mXfvaQ6JL4s4ZdHOThkN18Sk
	rM9K1Bo/03iVYEBExqT01dSBw3O8c7XPuW1mx3obO6yXJmnBIi95ILv7OLQu7Bqf9rRw
	Ep/juL2cAWb7k5O6wah5ZFssoFSOlOeyqiUPj/tYBHn2FS2j0APUi9vLmMAXCXMWHrLL
	Dg+WkL6Hhl1+Ax5fv/eUV7gkGLDLhDKiRFHJkFjDVNUreZcEE/wEqVWLxG65cL13KeAu
	tpYuGk16fw1NhBtF3XiaWPIEm1CrS1754DlZKKd3ljuMJTVhmVO2pC0o8+IM0Nh2LFQI
	H5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TDmDabFMG4hA0mfN1GDLydVRGXj6g+4FV2e3eanw2FM=;
	b=Ew0WL8LLJO7Ita1h7LJhKiGFXLU9lwU5YSESJ9LzcpMRPGep+OjpuBoWV8XQVRhXxu
	grSuYX936N//EXjNmw/2WEElhniondgfX29awK5ZKqsvWU2jSm/7VSuWdRvUceJgrnUo
	x+p6vwi4/b77KGAkxIFVh3A0ayLm5k4u+6FWB6mYgxCod+6jli6JwX5+lWm67vMYWOzg
	ZyoSN0zRcpuRnCLy9xZTai7Ptv4caMLWc0Oh2ocUMZJBrFC9uvpJLFKmo0zDomjoZkVd
	TfJRWpIMuw0IoFoAb+RgnQAU2KiAo16nVYDa+9MJVHjKxxOZ+R4E/Xrii8S/bO8yItho
	CV1Q==
X-Gm-Message-State: AMCzsaW59B5ilx/UEHpNNODcjHw3EDtKQMABQFk2cPhgDJGGjMMWEDNk
	Q0C/VTrddmqS+I/YlyjnCnRm4julAsVfIB2+ttk=
X-Google-Smtp-Source: ABhQp+SRdRLarPIIerNyfRZAvDhNOAFo+pm4UwsRA3pAc+Sqh3seFV6ouLSXorvVA1KNMBUiseWOhaFJoNlGhCDGU6U=
X-Received: by 10.36.246.74 with SMTP id u71mr3916532ith.104.1508441608021;
	Thu, 19 Oct 2017 12:33:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.108.135 with HTTP; Thu, 19 Oct 2017 12:33:27 -0700 (PDT)
In-Reply-To: <117f7ca7-527d-0146-99eb-84cbb3c3aa44@gmail.com>
References: <20170918134356.16124-1-willn@resin.io>
	<CAFbHwiQnvfGDk2xxHcOhZhLGhi15xkaNRAMFqak4vBVcXAGoDg@mail.gmail.com>
	<117f7ca7-527d-0146-99eb-84cbb3c3aa44@gmail.com>
From: Will Newton <will.newton@gmail.com>
Date: Thu, 19 Oct 2017 20:33:27 +0100
Message-ID: <CAFbHwiTMrWFXY-SH+VPz+0GR=pqZfCdEegS64Ng9hwH40Op0xw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [pyro][PATCH] goarch.bbclass: Replace logic for setting GOARM
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
X-List-Received-Date: Thu, 19 Oct 2017 19:33:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 27, 2017 at 4:08 AM, akuster808 <akuster808@gmail.com> wrote:

Hi Armin,

> On 09/26/2017 09:36 AM, Will Newton wrote:
>> Hi,
>>
>> Is this change ok for the stable branch?
> merged into staging.

Do you have a feel for when these changes might make their way to the
pyro branch?

Thanks,

>> On Mon, Sep 18, 2017 at 4:43 PM, Will Newton <will.newton@gmail.com> wrote:
>>> From: Will Newton <will.newton@gmail.com>
>>>
>>> The previous logic applied a regex to TUNE_FEATURES which could
>>> set the GOARM value to 7 incorrectly, for example when dealing
>>> with an arm1176 core. Simplify to check for the presence of
>>> "armv7" instead. At the same time add a check for "armv6" and
>>> set GOARM to 6 in that case.
>>>
>>> (From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3b9c50a336d)
>>>
>>> Signed-off-by: Will Newton <willn@resin.io>
>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/classes/goarch.bbclass | 7 +++++--
>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
>>> index 4a5b2ec787..12df88f8c4 100644
>>> --- a/meta/classes/goarch.bbclass
>>> +++ b/meta/classes/goarch.bbclass
>>> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>>>
>>>  def go_map_arm(a, f, d):
>>>      import re
>>> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
>>> -        return '7'
>>> +    if re.match('arm.*', a):
>>> +        if 'armv7' in f:
>>> +            return '7'
>>> +        elif 'armv6' in f:
>>> +            return '6'
>>>      return ''
>>>
>>>  def go_map_os(o, d):
>>> --
>>> 2.13.5
>>>
>

