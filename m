Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4B5A7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 15:35:50 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id ez1so19478213pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Aug 2016 08:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=0fO4CUUQedWe7o8nGo7j/QnG3DIIIjtnLo2BQ76uZa0=;
	b=FrGuLeU5Zx1MrzvbEuW/5nXyOApuh4VAGU4+dAtHjiRc5AK5elR4LkY04OKIikClUw
	ZTkmLDsS77VLpkRVDp2GqCu1La3OadcdycLgb8Sg894iD9Kx4kqlpJmh2G5ax8NgzYcI
	lejTd1YK2hko3WJcARlsx6b4/PzMUVyOvDf5h++c+oHwliFP1VO+zTsCKeoXWnxbU/Hf
	gcufX3KfeaHt5MHlDwfXwC//Rygm4Ex2M5IGrYov1FDOTT3AQIvwFjTAVrhq0CPPhJD3
	K5vfvJY1k0B3JdMunsGgQg4AL2ileiwbIwpzpVlcN/vY/dUUoJARIcR/96PidFUCmyRm
	HkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=0fO4CUUQedWe7o8nGo7j/QnG3DIIIjtnLo2BQ76uZa0=;
	b=VKPOQXGGGDBNbNLpYXn5kTwxtQ9JMPSg3QusYBm1fol8j3paJjSUGht2J+rDYjOoxb
	rcWxA6OcSuhWTdBvy0MTLnnZ1oL+7t7H62mpxFZ4NddnrlfBvyvK+1kGBkYTGQNi+yeJ
	xH8ofOBkJ55gLWbQSwKYkLpRxXXTfauifGsJiFCzD7ERm8NnwASms4mvk06zbX1borb5
	vDPdohAWjpo4evE4c+5dwcAaioYbmSk4S3Y2glmDsuaR45CithtJw30USqheDBKrjolY
	uUdlWfd2pBhIXaG5wGlVSkRX3K/ddvyRQ5M96dIylyntCy/a9eZaFlCNoTLP/Vbz25q9
	tqEQ==
X-Gm-Message-State: AEkoouuClFHdJKWnnbgrPnF5fqDF/MIeD1uZmcwriGWJppCSlfIb4iM5qLMDArb1LWkyJg==
X-Received: by 10.66.25.135 with SMTP id c7mr34239500pag.24.1470411350690;
	Fri, 05 Aug 2016 08:35:50 -0700 (PDT)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:41d7:99c1:5cc6:c627])
	by smtp.gmail.com with ESMTPSA id
	a21sm28939765pfe.81.2016.08.05.08.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Aug 2016 08:35:49 -0700 (PDT)
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <alpine.LFD.2.20.1608051112190.18419@localhost.localdomain>
	<7beea6c4-ad50-25ae-a21a-41f113634d92@gmail.com>
	<alpine.LFD.2.20.1608051129390.18840@localhost.localdomain>
From: Khem Raj <raj.khem@gmail.com>
Organization: himvis.com
Message-ID: <158a8ce6-3c80-f979-8897-0904cee8cefa@gmail.com>
Date: Fri, 5 Aug 2016 08:36:09 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608051129390.18840@localhost.localdomain>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: where is the safest place to put a single-shot "run and reboot" script?
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
X-List-Received-Date: Fri, 05 Aug 2016 15:35:51 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 8/5/16 8:31 AM, Robert P. J. Day wrote:
> On Fri, 5 Aug 2016, Khem Raj wrote:
> 
>>
>>
>> On 8/5/16 8:14 AM, Robert P. J. Day wrote:
>>>
>>>   i have a systemd-based image that, after coming up normally, i want
>>> to fire off a one-time script which, after completion, reboots. i've
>>> been told that using systemd's run-postinsts is discouraged and, for
>>> now, i just want the simplest and quickest solution.
>>>
>>>   suggestions?
>>
>> https://github.com/systemd/systemd/blob/master/units/systemd-firstboot.service.in
> 
>   not sure if this makes a difference, but i don't need the
> "firstboot" functionality as this script is to be run out of a ramdisk
> so there is no need for it to keep track if it was ever run before. i
> just need to run the script once the rest of the system is up, then
> reboot, nothing more.

should this script be run on every reboot ? if thats the case then write
a normal service and hook it to your final target e.g. graphical.target
or wherever you want to insert it in boot sequence.

> 
> rday
> 

