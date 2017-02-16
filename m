Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 4C74B71E3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 12:10:23 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id z134so7129100lff.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 04:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XGv1hXL8oFzquY7bP/lnxAvltHekaWRpRdHGEzaBnZ4=;
	b=mZ2y4cyd9Soix/U+VzJ2azA4qevTSQlSvGXhB4nxT/kZ2rXP+udexfDgoXA964KlOu
	sqJSkGIUc/Zq31eBeCyd2uUDCkBnAziBXlbLPG+4hvIT+fRumqW5fMAlC5scs0NR+hXn
	O3c88EIWZyva/0oWLhjyD1UXnBE4xIr94yuVkjU9LB/yB8Puv1Qe561SVrN+1NLx09BP
	jcgPtGOF8BdKt8QbibIiVorGuXjcXckZ1E9pL8oXOvILqocRM4vS3ePoKtzkpBO++FW7
	3qX3L1B8r4tQigAynYmzpycyQCxrvSNB0p04VebRL7nZs2q92XuR1L4xT8cddt3tcdLX
	lKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XGv1hXL8oFzquY7bP/lnxAvltHekaWRpRdHGEzaBnZ4=;
	b=Ld0FHi1xEWr+NAsfYbS8Qg8pTmasS1iKaC5drsfOg2vwOOV99ERkpwquSSjJHzzB4c
	8kuvZZzxKDHfXweaDbqgJ+bY9L7c0nfx5pqYU62vv6czbGwcgQ9IkNUAZ33sSBR2qBP3
	ZdIjnu/xBYgh3NaLQdXNBuizKKj66jSBSE0lXc04xBu4sPCtYX2bV0TOSDwoOqGQxnVn
	hnp5RvrFUoqX5Iud+K/2LN3WFNqPRzNW881BvW5O2+Tb8eTFxY48wbKXwr0fhDGcro1H
	A3DyYJlw/N+zVlFQdToUgOvfE6rIUY6mxZFdLxQ+PZpMpVJTgVCZI1R8hFlj7C9lldGz
	zifg==
X-Gm-Message-State: AMke39nOZDNVQj7vPjNK3g792t0DFUS1/svzNpt2rjAlB8pcyzyM/CS2P5BIije4jQalwg==
X-Received: by 10.25.157.146 with SMTP id g140mr659998lfe.123.1487247023387;
	Thu, 16 Feb 2017 04:10:23 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	f188sm1674575lfe.12.2017.02.16.04.10.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 04:10:22 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <CAJTo0LYBSzN4ga5qyMU=ZxAn6rYGye5vaTMHQ7MSeS25TsVXoQ@mail.gmail.com>
	<1487241012-8486-1-git-send-email-kristian.amlie@mender.io>
	<20170216114040.GA26465@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <2f34f5fc-ae61-d25a-2d55-5061158344e4@mender.io>
Date: Thu, 16 Feb 2017 13:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <20170216114040.GA26465@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Thu, 16 Feb 2017 12:10:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 16/02/17 12:40, Ed Bartosh wrote:
> Hi Kristian,
> 
> Thank you for the patch. It looks good to me. Just one thing needs to be
> changed. See my comment below.
> 
> On Thu, Feb 16, 2017 at 11:30:12AM +0100, Kristian Amlie wrote:
>> We don't need the gap that the extended partition occupies if we
>> already know that we have less than five partitions. Saves up to one
>> full alignment of space.
>>
>> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
>> ---
>>  scripts/lib/wic/plugins/imager/direct.py | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
>> index 481d24d..bc2d620 100644
>> --- a/scripts/lib/wic/plugins/imager/direct.py
>> +++ b/scripts/lib/wic/plugins/imager/direct.py
>> @@ -344,6 +344,10 @@ class PartitionedImage():
>>  
>>          msger.debug("Assigning %s partitions to disks" % self.ptable_format)
>>  
>> +        # The number of primary and logical partitions. Extended partition and
>> +        # partitions not listed in the table are not included.
>> +        num_real_partitions = len([p for p in self.partitions if not p['no_table']])
>> +
> Hm... shouldn't it be 'if p.no_table'?
> 
> Did you run 'oe-selftest -r wic' btw? I'd be surprised if it doesn't
> fail at least some test cases with this change.

Hmm, you caught me. Since the code block looked virtually identical (but
indeed wasn't) I didn't rerun. But I think you're right, I will rerun them.

-- 
Kristian

