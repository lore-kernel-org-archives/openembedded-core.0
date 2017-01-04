Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 864C1719B2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 23:53:26 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 2so3695273uax.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 15:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HlHsHI+A1do6KNa06wkj7ldgUaSw8rsf6H1pOHIz+Lk=;
	b=DYLb20a/X1iTCjN7UJkCMxOlnPkrHeJN8Lez8hujG1W2pwhxK+c6mzmGKXyywYSpO3
	sLJ4gbIjOWGD1VqI4v2eW1Fxkh45RXUbqcgvgeB7zwjcXQJbAKovZVlzcAFwk6M6EmO+
	4G6m3VctH96mNSAWhH7aSW/IVfzWGuJXDJ0pFYEsGvt+psPWdiaEc5IuRPe9pHPPgy2O
	fN6JBCLK1mPXSHaRyDkpjRsFMNm71YqyyHkWJt72poAfzkITzw+aAc9LGXtvH82SFc/E
	O6j11Q+FsZu1vWA8VUdTKOtkgVL443hIad3xfAakyb78hOdOvuOBUiGVaab4j7ucuEYf
	fjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HlHsHI+A1do6KNa06wkj7ldgUaSw8rsf6H1pOHIz+Lk=;
	b=ZpP3qUyw1Wvccg0laooEMdiN1GFQxM1cziZfOVbLBcIKjpL5X18+RnibnWFnaJRfmW
	y7q3XYpLwlXWdUq2JRCsxBqjUXSB6DPSw9KB/45q3Ppn+OQGn/kX6NfqihATw5JIXywG
	z+aiC6fWh+9V6p5cjTRmAReerB/3cPssH1aopyh+gtcl94ygIl/eQwHrGFeuui/wPBjF
	XPD+aWWt6/yPa3v5YTdIsIpC7RMeh4v01cwcoS/ZvLnv+M4Q2Hshsv4K4AucyU0W+m/w
	vAMP+zykkbz/LR66JzYQJEz5A7wrLMyaAdpfBzQY28L2j6VmXfrCotF6RWEB1adHKP0M
	8Fcg==
X-Gm-Message-State: AIkVDXKpDYsvrYtP1Fy2M1jjVsdwByqRVz0SWKbQmPiz24tPQcOi/nia8hoIZWo1426ugtecC45FNthhXzGk1g==
X-Received: by 10.159.32.99 with SMTP id 90mr43641137uam.138.1483574006952;
	Wed, 04 Jan 2017 15:53:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 4 Jan 2017 15:52:56 -0800 (PST)
In-Reply-To: <3bafb872-955d-88a1-a627-243c8fe40fa3@linux.intel.com>
References: <cover.1482363237.git.alejandro.hernandez@linux.intel.com>
	<5e3840aa19de9b634469c852a7c1446262ab73ab.1482363237.git.alejandro.hernandez@linux.intel.com>
	<CAMKF1soP7afwicknqti_muFYwGrMgNZE+n3rfnVQ8Hg8NeU2aw@mail.gmail.com>
	<2122f031-db47-1dc5-7080-1271e6fc1527@linux.intel.com>
	<3bafb872-955d-88a1-a627-243c8fe40fa3@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jan 2017 15:52:56 -0800
Message-ID: <CAMKF1sq=P6PPt+LAHZg7RJvQcfUxyyxVDY6sjY_YdvUZ9LBGow@mail.gmail.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] ksize.py: Python 3 fixes
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
X-List-Received-Date: Wed, 04 Jan 2017 23:53:28 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2017 at 2:18 PM, Alejandro Hernandez
<alejandro.hernandez@linux.intel.com> wrote:
> Hey Khem,
>
> Ok, now I'm actually awake when reading this, are you saying these changes
> should go in the same patch as the one for ksum.py?
>

yes thats right.

>
>
> On 01/04/2017 12:21 PM, Alejandro Hernandez wrote:
>>
>> Hey Khem,
>>
>>
>> Its an old script fro Tom, but as far as I remember it worked fine on
>> python3, although thanks for checking and sending the patch!
>>
>> Cheers
>>
>> Alejandro
>>
>>
>> On 01/04/2017 12:39 AM, Khem Raj wrote:
>>>
>>> On Tue, Jan 3, 2017 at 2:30 PM, Alejandro Hernandez
>>> <alejandro.hernandez@linux.intel.com> wrote:
>>>>
>>>> From: Tom Zanussi <tom.zanussi@linux.intel.com>
>>>>
>>>> String errors and partial __cmp__ fix.
>>>
>>> may be fold it into previous patch.
>>>
>>>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>>>> ---
>>>>   scripts/tiny/ksize.py | 17 ++++++++++++-----
>>>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/scripts/tiny/ksize.py b/scripts/tiny/ksize.py
>>>> index b9d2b19..ea1ca7f 100755
>>>> --- a/scripts/tiny/ksize.py
>>>> +++ b/scripts/tiny/ksize.py
>>>> @@ -41,7 +41,7 @@ def usage():
>>>>   class Sizes:
>>>>       def __init__(self, glob):
>>>>           self.title = glob
>>>> -        p = Popen("size -t " + glob, shell=True, stdout=PIPE,
>>>> stderr=PIPE)
>>>> +        p = Popen("size -t " + str(glob), shell=True, stdout=PIPE,
>>>> stderr=PIPE)
>>>>           output = p.communicate()[0].splitlines()
>>>>           if len(output) > 2:
>>>>               sizes = output[-1].split()[0:4]
>>>> @@ -62,18 +62,18 @@ class Report:
>>>>           r = Report(filename, title)
>>>>           path = os.path.dirname(filename)
>>>>
>>>> -        p = Popen("ls " + path + "/*.o | grep -v built-in.o",
>>>> +        p = Popen("ls " + str(path) + "/*.o | grep -v built-in.o",
>>>>                     shell=True, stdout=PIPE, stderr=PIPE)
>>>>           glob = ' '.join(p.communicate()[0].splitlines())
>>>> -        oreport = Report(glob, path + "/*.o")
>>>> -        oreport.sizes.title = path + "/*.o"
>>>> +        oreport = Report(glob, str(path) + "/*.o")
>>>> +        oreport.sizes.title = str(path) + "/*.o"
>>>>           r.parts.append(oreport)
>>>>
>>>>           if subglob:
>>>>               p = Popen("ls " + subglob, shell=True, stdout=PIPE,
>>>> stderr=PIPE)
>>>>               for f in p.communicate()[0].splitlines():
>>>>                   path = os.path.dirname(f)
>>>> -                r.parts.append(Report.create(f, path, path +
>>>> "/*/built-in.o"))
>>>> +                r.parts.append(Report.create(f, path, str(path) +
>>>> "/*/built-in.o"))
>>>>               r.parts.sort(reverse=True)
>>>>
>>>>           for b in r.parts:
>>>> @@ -116,6 +116,13 @@ class Report:
>>>>                  self.deltas["data"], self.deltas["bss"]))
>>>>           print("\n")
>>>>
>>>> +    def __lt__(this, that):
>>>> +        if that is None:
>>>> +            return 1
>>>> +        if not isinstance(that, Report):
>>>> +            raise TypeError
>>>> +        return this.sizes.total < that.sizes.total
>>>> +
>>>>       def __cmp__(this, that):
>>>>           if that is None:
>>>>               return 1
>>>> --
>>>> 2.6.6
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

