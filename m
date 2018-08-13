Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 414AE78F5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 18:05:03 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id s198-v6so28826093oih.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 11:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OdZZ+wYwZ5wUJt7ohRxBrjNtb719liIEGk/CBgckCcc=;
	b=i507XzYH1NfZclg7Fq3ARa7jjFrGkTQ2jkhB4ajvLNBvbiJVKgqy9VNr/vCEzUN/Dv
	dtvjY2dHB1pi9p0iGAQMF6QTfx9Ak7rEqNnZKciw6nY1bSQ+Z7nyPnFtqR9kTOjWOa9F
	8OHQgR7ayiswMy9beR1MPsB/W6UsLcNZjIqiLiy8gFZt2ddpP6kREiS+tVjIeB+hkOul
	j9CjjcMxPeCVoQPuU2pYlyxb0jrUVt+Vw5w+RP8Y6dCY2qiulZfzqExIvcBbuLaM6J8k
	b3WG2YuSbp2vOcEmQGhtlabRD1Le/m9218mFU05qbSyeKP1gzCjQdv6Fc2t062QSepCA
	/7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OdZZ+wYwZ5wUJt7ohRxBrjNtb719liIEGk/CBgckCcc=;
	b=mODTBaJe4kLqbMY23TXnkgqH0b8Th/K97Xkan2m7IkAySMcrqYbqJGPm/8/ggh9kfc
	mc8KCNs6x0WVNNX5mibH/aMOJsJQoRRRnw1X018PkWg5Aj9UEyO+mI/h4TyxIa0ePFuv
	Tvp1w9DeqHiXquiqxLfYOjWdkNWT7Vqm4+ojpenUASId5sAq/jKHaAAQNPNi4E+bxvNe
	ZNVYbmU+Pt0D6EPfQgUTNszIahWm5wiVPlRmRO6DJfcieicnkdCU+pq7gIE5w7fSpoTS
	e+N2ptcEkfgsUPqc1r5a4pOzF8BJFAihJJUlPgplu6VZbSVAlaYJyfatEfq0MhGR80xw
	vBiw==
X-Gm-Message-State: AOUpUlEORsew6IfgP5P1rSqUbd9iILbRokhPOIzNiXqkoZyigqiVriVq
	AZTT/cP0uyJHm4/lza7JKEZ4luVDcyJNhujuXlsl9HeT
X-Google-Smtp-Source: AA+uWPyqYQoDKjXKU+Ok28CPSwrtrYlb7O4LpaY7GK4rzt7hDGso8mjf3Ay1SNcix/buY9dDTz+dY+xph7dIdAAfhd4=
X-Received: by 2002:aca:b256:: with SMTP id
	b83-v6mr19949939oif.235.1534183504106; 
	Mon, 13 Aug 2018 11:05:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Mon, 13 Aug 2018 11:04:43
	-0700 (PDT)
In-Reply-To: <bb9584cf-513d-16de-7b99-b40e5a9b7622@gmail.com>
References: <20180813172054.17767-1-ross.burton@intel.com>
	<bb9584cf-513d-16de-7b99-b40e5a9b7622@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Aug 2018 19:04:43 +0100
Message-ID: <CAJTo0LaHxpmeyn+GHoZ7_s0Q4cMH9d3UgtRTz87oOxTmEnsDyA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] utils/md5_file: don't iterate line-by-line
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
X-List-Received-Date: Mon, 13 Aug 2018 18:05:03 -0000
Content-Type: text/plain; charset="UTF-8"

Yeah, just sent it there,  sorry

On 13 August 2018 at 19:03, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 08/13/2018 10:20 AM, Ross Burton wrote:
>> Opening a file in binary mode and iterating it seems like the simple solution
>> but will still break on newlines, which for binary files isn't really useful as
>> the size of the chunks could be huge or tiny.
>>
>> Instead, let's be a bit more clever: we'll be MD5ing lots of files, but we don't
>> want to fill up memory: use mmap() to open the file and read the file in 8k
>> blocks.
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> shouldn't this go to the bitbake mailing list ?
>> ---
>>  bitbake/lib/bb/utils.py | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/bitbake/lib/bb/utils.py b/bitbake/lib/bb/utils.py
>> index 9903183213b..b20cdabcf01 100644
>> --- a/bitbake/lib/bb/utils.py
>> +++ b/bitbake/lib/bb/utils.py
>> @@ -524,12 +524,17 @@ def md5_file(filename):
>>      """
>>      Return the hex string representation of the MD5 checksum of filename.
>>      """
>> -    import hashlib
>> -    m = hashlib.md5()
>> +    import hashlib, mmap
>>
>>      with open(filename, "rb") as f:
>> -        for line in f:
>> -            m.update(line)
>> +        m = hashlib.md5()
>> +        try:
>> +            with mmap.mmap(f.fileno(), 0, access=mmap.ACCESS_READ) as mm:
>> +                for chunk in iter(lambda: mm.read(8192), b''):
>> +                    m.update(chunk)
>> +        except ValueError:
>> +            # You can't mmap() an empty file so silence this exception
>> +            pass
>>      return m.hexdigest()
>>
>>  def sha256_file(filename):
>

