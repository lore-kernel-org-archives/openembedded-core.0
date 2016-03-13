Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 18B3C70178
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 20:53:50 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id n190so201982000iof.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 13:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pYKd2Hv1PmGT2rJcu7qmerLcuqvePT/oJ7FBbjBlTNo=;
	b=oHuqpiC9PKD3YrWMmqSag1NNE5j65gWQ6PAbloDCVZfu6aNufXxhvN5/+29A4Qmc2J
	EQJKdQveM0zZO7KBvBGkYs9xFPAdWits1D0hPBRCOSQIdnGiDDP+E/ArycSXbqWuKQ+F
	6wlC3F9TJBR5vdecu1cePYN9K/YSAaX04EOGsvdM2oTIsD2tV3xBAk1M4h6aa45tDGJA
	bHPJ4KNsDownPGB5lUO2blILJDawBSc5Ug67uF8fUyGTQarQ06Y+QY+4FbUGiwrlhaVB
	HbFLSjjbP5YZDqXyuZNsbCDTzzdfAX25dIvta7UiD8LgBFHvGyx1GRhGpSrCfIBiFhuE
	t8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=pYKd2Hv1PmGT2rJcu7qmerLcuqvePT/oJ7FBbjBlTNo=;
	b=SokSywQF+Gprp27VxJgvY6t4XwX48/hvEYtP5bSx9wS2+QZZjiRsgQEV/Sle4QghgT
	mzh23jtz+SKaphw1XqmmUPeewqO6UYWOwUwBCVFigoEpyDidbnTxA64rJ4oIKu0ixj+D
	Y14Jd5aFex4vtTrrDUlDwIJX63t9lMVNWAMTqBxxO63bwC699Jp44aKMXPE+jQCsqxRX
	ykUIFB8ka7v2tKrxMbVKm5orullQ1c/S/XlcI9+5CfLFm2W2wbYCGieqXFzHxrkFQvJd
	4KNBQxhnNgPRi06NaYvk6xCaLbw8kKjSJ7i9gTqGt/Cr/7kU3BP7BJFxTtikTdlZG7we
	88fA==
X-Gm-Message-State: AD7BkJIxMmViCg6/WmQgIN5UPWFJZHOvL7ucioUy2V1YiiBSedlWtvXZJpuGHnOJ99oL3g==
X-Received: by 10.107.169.68 with SMTP id s65mr20865226ioe.126.1457902431374; 
	Sun, 13 Mar 2016 13:53:51 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	ee9sm5301898igb.7.2016.03.13.13.53.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Mar 2016 13:53:50 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E5D366.2020707@gmail.com>
Date: Sun, 13 Mar 2016 16:53:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Sun, 13 Mar 2016 20:53:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

(sorry about my previous reply, somehow the quoting got messed up and 
was hard to read. hopefully this one is better)

Hi Paul,

On 03/13/16 15:26, Paul Eggleton wrote:
> On Sat, 12 Mar 2016 21:35:29 Trevor Woerner wrote:
>> Provide many more details concerning the repositories that are used in a
>> particular build: the remote information, the layer, the local branch, the
>> remote branch the local branch tracks (if any), and the HEAD commit.
>>
>> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>> ---
>>   meta/classes/buildhistory.bbclass |  6 +++++-
>>   meta/classes/metadata_scm.bbclass | 18 ++++++++++++++++++
>>   2 files changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass
>> b/meta/classes/buildhistory.bbclass index b6b4324..1b0ae0e 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -615,9 +615,13 @@ def buildhistory_get_build_id(d):
>>
>>   def buildhistory_get_metadata_revs(d):
>>       # We want an easily machine-readable format here, so
>> get_layers_branch_rev isn't quite what we want +    import subprocess
>>       layers = (d.getVar("BBLAYERS", True) or "").split()
>> -    medadata_revs = ["%-17s = %s:%s" % (os.path.relpath(i,
>> d.getVar('BBLAYERS_FETCH_DIR', True)), \ +    medadata_revs = ["%s\tlayer:
>> %s\n\tbranch: %s\n\tremote: %s\n\tHEAD:   %s\n" % ( \ +
>> base_get_metadata_git_remote(i, None), \
>> +        os.path.relpath(i, d.getVar('BBLAYERS_FETCH_DIR', True)), \
>>           base_get_metadata_git_branch(i, None).strip(), \
>> +        base_get_metadata_git_remote_branch(i, None).strip(), \
>>           base_get_metadata_git_revision(i, None)) \
>>               for i in layers]
>>       return '\n'.join(medadata_revs)
>> diff --git a/meta/classes/metadata_scm.bbclass
>> b/meta/classes/metadata_scm.bbclass index 0f7f423..31a2c54 100644
>> --- a/meta/classes/metadata_scm.bbclass
>> +++ b/meta/classes/metadata_scm.bbclass
>> @@ -73,6 +73,15 @@ def base_get_metadata_git_branch(path, d):
>>           rev = '<unknown>'
>>       return rev.strip()
>>
>> +def base_get_metadata_git_remote_branch(path, d):
>> +    import bb.process
>> +
>> +    try:
>> +        rev, _ = bb.process.run('git rev-parse --abbrev-ref
>> --symbolic-full-name @{u}', cwd=path) +    except
>> bb.process.ExecutionError:
>> +        rev = '(HEAD does not point to a remote branch)'
>> +    return rev.strip()
>> +
>>   def base_get_metadata_git_revision(path, d):
>>       import bb.process
>>
>> @@ -81,3 +90,12 @@ def base_get_metadata_git_revision(path, d):
>>       except bb.process.ExecutionError:
>>           rev = '<unknown>'
>>       return rev.strip()
>> +
>> +def base_get_metadata_git_remote(path, d):
>> +    import bb.process
>> +
>> +    try:
>> +        lines, _ = bb.process.run('git remote -v', cwd=path)
>> +    except bb.process.ExecutionError:
>> +        return '<unknown>'
>> +    return lines
>
> As I mentioned in my other reply, metadata-revs was intended to be consumed by
> scripts rather than humans, so I'd rather not change its format unless
> absolutely necessary.


No problem, I had guessed that might be the case.

Would you (or anyone) be open to the possibility of the buildhistory 
task creating a second file that would contain this information?

I had been thinking about doing something like this for a long time. 
Having the two "meta" listings is what finally prompted me to actually 
do something about it. The fact that Ross pointed out that it was really 
the result of my own mistake is a little bit secondary to what I'm 
trying to accomplish.

I like to keep my build artifacts for a very long time. But I find when 
I'm looking through my old artifacts that I wish I had also kept the 
various configurations that led to that artifact's creation. ["Wait... I 
successfully built something for MACHINE XYZ back in June, how did I do 
that?"] So, along with the artifacts, I've also been keeping local.conf, 
auto.conf, bblayers.conf... and metadata-revs.

However, as I've pointed out, there are lots of clones around. Have you
taken a look at github recently? There are dozens of clones + tweaks to
many of the repositories we all know and love: beaglebone, odroid,
raspberrypi, browser. Sometimes it's one of these clones that works out
better for a given situation (MACHINE, board...) than the canonical. For 
example, if I want to add chromium to my DragonBoard410c build, I need 
to use Linaro's clone of meta-browser and not the canonical OSSystems' one.

The information currently provided by buildhistory/metadata-revs doesn't 
provide the level of detail required to distinguish between these two 
situations. In six months I would look at what I've built today, grab 
git://github.com/OSSystems/meta-browser.git, and then say: "how come 
there's no commit 5c00d0114c5963a178cb33f6d06181c588c03ae0?". It's not 
like there's any requirement to make the names of all layers universally 
unique.

That's the problem I'm trying to solve: how can I easily keep all the
information required to reproduce this build, exactly. The whole "two
meta's" thing was just a speed bump.

