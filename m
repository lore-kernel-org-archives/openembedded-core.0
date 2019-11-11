Return-Path: <andrei@gherzan.ro>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD187F367
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 11:18:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r10so14195551wrx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 03:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.ro; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tQpVpKvUc0PmGz1erBffUDLbq+sN0gx1f0zJjopWjm0=;
	b=b35Ch5zNhToOSzUGwYYrXjjGxg9LqiwY4Lt3QVHqZz/FDRhBNHRSQsZHhMeH9P2qTN
	hjKiwRFMOQhVBu8uAMSRUjBBA/YZM66JYwfLk3rna2djqSiIMKFgPwyc/9IkBbqpzwMk
	uTG+VoBa4jMWQLaylGdDRZ4m39Qjwnb7L1Ly3FXCQOTjTr8O5rL5Xce0Hq5J4aouyJWr
	2xBMTTdQ34d05+jlRSJAR8lcNWREBqWpdmJmvh7syJcf+DpxBjxm6FLf5pjcT6/i7MB6
	EM6NZHL3SCZJn7KDyYXbXnZjRoHJsbMOw339Fn7iA7qzW2d34K95cfV52lZRA0DYMJ04
	31bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tQpVpKvUc0PmGz1erBffUDLbq+sN0gx1f0zJjopWjm0=;
	b=dXIvJ057Mdx7bhxn1GfJ2PDFGvTVNABb9Y9sZR+N7QvcUuckKUZNl8mKAglsSoaePI
	OMKGsrGP0aVXJnmte1MyvSp2oylu6sYr5/pmIdFuQ+bOOhCeEJKMjFYknC43KP8uIE4I
	KYbA+PRcIk8iBSCJ95glu8Qtx0ut30tsf5cEdKHXNzqzhElyll3JUS4oM3EVi9nWGUXj
	E3SAPbnnKoZS1veIIjrkrhRD86AlFG+id7xDTX75RTy8LxOrcTP9ZpsqL/ygV5CO147k
	R6KX8IQ8iGxK1HeHImVS8O+Jmue6ohLIsjBGd02LbWYPSIl1LuTiQU4tggA7pbKDBylN
	c+nw==
X-Gm-Message-State: APjAAAXwMaBClyzvQrAfmBPGWvOPm9yALlgWegqpmH8eng1d04uz1c54
	zUzh+fUOtmAFA69Usdr44LR1Qw==
X-Google-Smtp-Source: APXvYqynRxzapM572i5IOvDY9nZ8mCDvqhGL61/7cO5qv0SaK2K9Qof4zrssAE4QSKiml2AXlVWsMA==
X-Received: by 2002:adf:ea8d:: with SMTP id s13mr20644543wrm.366.1573471135249;
	Mon, 11 Nov 2019 03:18:55 -0800 (PST)
Received: from [192.168.17.155]
	(host81-154-22-156.range81-154.btcentralplus.com. [81.154.22.156])
	by smtp.gmail.com with ESMTPSA id
	w81sm22929759wmg.5.2019.11.11.03.18.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Nov 2019 03:18:54 -0800 (PST)
To: "Grygorii Tertychnyi (gtertych)" <gtertych@cisco.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20191101071043.16558-1-gtertych@cisco.com>
	<CAK18fxFVpCbD38Y3FK2XMfvK_+pZF2-usf1xC5P2oR5FQhQC-Q@mail.gmail.com>
	<MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <8903613c-b2ea-f9f1-9e68-feb5302184d7@gherzan.ro>
Date: Mon, 11 Nov 2019 11:18:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1918D426CB1703852C320064C27F0@MWHPR11MB1918.namprd11.prod.outlook.com>
Cc: "xe-linux-external\(mailer list\)" <xe-linux-external@cisco.com>
Subject: Re: [PATCH] archiver: avoid empty incfile in ar_recipe
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
X-List-Received-Date: Mon, 11 Nov 2019 11:18:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Grygorii,

On 04/11/2019 15:09, Grygorii Tertychnyi (gtertych) wrote:
> Andrei,
> 
> From: Andrei Gherzan <andrei@gherzan.ro>
> Sent: Friday, November 1, 2019 13:28
> To: Grygorii Tertychnyi (gtertych); openembedded-core@lists.openembedded.org
> Cc: xe-linux-external(mailer list)
> Subject: Re: [OE-core] [PATCH] archiver: avoid empty incfile in ar_recipe
> 
>>> do_ar_recipe fails on perf recipe on line:
>>>
>>> include ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'perf-perl.inc', '', d)}
>>>
>>> 1. "${...}" part expands into empty string
>>> 2. bb.utils.which() takes empty string and returns first directory name from bbpath
> 
>> This doesn't sound sane. If the include directive has no argument,
>> incfile should end up None. That's what the code "assumes" at this
> 
> I agree.
> 
>> point. I would fix it either at the regex expression level or
>> stripping the matched string. I reckon the former makes more sense
>> (.*).
> 
> Not sure I understand. Archiver class does not interpret "include" directive.
> It just parses text files. The regular expression looks correct:
> 
> These lines:
> 
> 440         elif include_re.match(line):
> 441             incfile = include_re.match(line).group(1)
> 
> put "${...}" _string_ into "incfile" variable. So, "incfile" is not None at "this stage.

"${...}" it's already expanded to a white-space. So in that case it 
matches "include  ".

> Then,
> 
> 443             incfile = d.expand(incfile)
> 
> Now "incfile" is empty and nobody checks it.

incfile is not empty. It's actually a string containing one white-space.

> 
> 444             incfile = bb.utils.which(bbpath, incfile)
> 
> Now "incfile" is set to first directory name in BBPATH (wrong behavour?)
> 
> 445             if incfile:
> 446                 shutil.copy(incfile, outdir)
> 
> Exception here: "incfile" is directory, not a file.
> 

The include regex is the following:

include_re = re.compile( r"include\s+(.+)" )

The issue is that when this is matched on a string suffixed with only 
spaces, it will match the last space as group(1). This is because ".+" 
forces to match the last white-space. Changing that to ".*" will make 
the group(1) be an empty string and later the if will evaluate False.

-- 
Andrei Gherzan

