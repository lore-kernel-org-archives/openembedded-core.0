Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5DF730B5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 18:48:02 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j127so28467713qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 10:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=P0Tfn1K5fzO55JcVX23YJ6MLJNypiD9RWeK5oipmUx0=;
	b=i+vBG0bi94AxQsnHDXTmMdAaZzSbQg/Fs2IcSWEeHIP5wFHRwivb2I28aSyvXWbtur
	TuyKZTW06LOnXS+ir9KVcf/UHeMaNM9urZcp00+jBtDPfdFBx/WJ4Y6vgca3sz4HGcT4
	dTqN4LEAgukhfNj/JuIWPV5gXH03AJoh1t3RofGRr8NCnUiXcyxpP7lgUu230hSYtg9o
	z/F8CUC/ngUAJ5w1jpmQZswFA0QEyGWY5f4XCT1dBYvVrcYpjG+TygLXgF8IgpGZSibC
	YF+5vU/k/+tIRQBnKfTpRRrTYcJgvrmsS0md+qEQ4pzHWC3dHejWyHPrsgF8mj5jaYY9
	rTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=P0Tfn1K5fzO55JcVX23YJ6MLJNypiD9RWeK5oipmUx0=;
	b=oKMyjbQ8DG9HmlAsTKuUnV7S1k4f7cSMNbOmRFNlmFSABzmgN+oxeim5Hp1inMFYc/
	MbY7C293bcxutW4EDshxqoUundgUw5E3jcJOj7dOSROgcURg+iDBcguyzL+BItwoxWuY
	Ab/Q+gRLKVNNxdYYWiNsSeR8wThVvOiGISkrvdVoV576h1YNi4U5iaNjN0fzhc/o93RD
	D6i0rau+uMG41v2v3R2ICvsKRxGItI0VQCU0UdkakvaBeF7JytpFD2lz3p1moMyO2/Se
	pUFjmpqsKl8ji2hEQbmqoMYfJf+D61HjWsHfl0jXeVVE0kJtCrPDy3BYkCoetGrRhjJp
	qUNg==
X-Gm-Message-State: AMke39nfJe+awLaufKmEgfn6C0hTb2YFBBebT36ar2QwAj1nfz2sYICSC7zTfsp77gNy5A==
X-Received: by 10.55.185.131 with SMTP id j125mr16366975qkf.115.1488826084342; 
	Mon, 06 Mar 2017 10:48:04 -0800 (PST)
Received: from [10.5.3.7] ([189.114.111.135]) by smtp.gmail.com with ESMTPSA id
	j11sm13872085qta.39.2017.03.06.10.48.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 10:48:03 -0800 (PST)
To: ed.bartosh@linux.intel.com
References: <20170223181309.13899-1-fabio.berton@ossystems.com.br>
	<CAJTo0LaFsWxaGy1Jwo9K92KTry+7Hyzn-MVHvMOpaqx+Q+qCGw@mail.gmail.com>
	<d2ccba14-ac14-1379-d5e1-ac799e9c120b@ossystems.com.br>
	<CAJTo0La=NDhfuMSYG3bjVYe2u6KA4TAZSNN_f1PyrsfVipoxBg@mail.gmail.com>
	<ccfcafd7-cd74-3330-2a64-ccd1e7a27984@ossystems.com.br>
	<20170306181327.GA18694@linux.intel.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Organization: OS Systems
Message-ID: <bad2d5fb-ee7d-e32f-7f97-da988d126f0f@ossystems.com.br>
Date: Mon, 6 Mar 2017 15:48:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170306181327.GA18694@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic: Prevent duplicate entries on fstab
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
X-List-Received-Date: Mon, 06 Mar 2017 18:48:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ed,

The main motivation to my patch is prevent to duplicate entries. For 
example, if I add to my fstab line:

LABEL=data           /data                auto defaults              0  1

and add to wsk file:

part /data --ondisk mmcblk0 --fstype=ext4 --label data --align 8192 
--size 500M --extra-space 0

Final fstab will have two entries for /data.

In most Linux distros mount /boot partition, if we have kernel image or 
boot script to update we need to mount /boot partition. Why the reason 
to not mount /boot?

I'll look into parser issue.

Fabio

On 03/06/2017 03:13 PM, Ed Bartosh wrote:
> On Mon, Mar 06, 2017 at 11:00:59AM -0300, Fabio Berton wrote:
>> Same error with poky-contrib:ed/wic/wip, we need to add --fstype= to
>> part /boot line in all wks files.
>>
> Only if we want boot partitions to be added to fstab. Currently / and
> /boot partitions are not added. Why do we want to change this?
>
> BTW, your patch will make wic to parse the same fstab file several
> times. Can you change this, please?
>
>> On 03/03/2017 10:49 AM, Burton, Ross wrote:
>>> On 3 March 2017 at 12:12, Fabio Berton
>>> <fabio.berton@ossystems.com.br
>>> <mailto:fabio.berton@ossystems.com.br>> wrote:
>>>
>>>     Sorry for delay. This error for qemux86 is because common.wks.inc
>>>     and directdisk-gpt.wks files in scripts/lib/wic/canned-wks
>>>     directory doesn't have option --fstype= for part /boot.
>>>
>>>     For qemuarm machines I get the error:
>>>
>>>     | DEBUG: Executing python function set_image_size
>>>     | DEBUG: Python function set_image_size finished
>>>     | DEBUG: Executing shell function do_image_wic
>>>     | Error: Please build syslinux first
>>>
>>>
>>> There's patches queued that will change the behaviour here and
>>> likely cause your patch to not apply - can you rebase on top of
>>> poky-contrib:ed/wic/wip and see what happens?  The build
>>> dependency is now wic-tools.
>>>
>>> Ross
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


