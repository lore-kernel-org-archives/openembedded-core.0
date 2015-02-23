Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3642671633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 19:41:40 +0000 (UTC)
Received: by wesx3 with SMTP id x3so20875131wes.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 11:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=MKckWCdkLVtkGLg4nZWyzrZkuAHcQvNkYvquQOUQGd0=;
	b=IE0n5RylTmUnlfTHisrJ4IC4fxi1f0Y6cmlJZqyfwdn1idfEG6BL6qGPJOJZs9znTQ
	ToGiYDo3anTaAZudDV+qP8wq/ketl5ZbgLDFPu8Mv3aeyMQUDCAqn3yWhyqUkLtsNson
	yI9eFEAUwWtRhYcnjhqOliashhBbxjFvSlxangAb8y0rgaBxCnsDJKxjG9dVHQme/ZEo
	eI3B39lhjfJordsWfE1KYs+h6tSJKbgvi1pje+qwhU+EskTofwY3GZ1uwuL3pf0n40Ib
	JRFZnkqyimOPaHwf7/D6zfBGFdwlf/PHdeq321QTOGAoHZ7tHtzL3PcCKcMoqrf86AGO
	fy7w==
X-Received: by 10.194.187.236 with SMTP id fv12mr25668406wjc.131.1424720501076;
	Mon, 23 Feb 2015 11:41:41 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251]) by mx.google.com with ESMTPSA id
	gi3sm17254041wic.15.2015.02.23.11.41.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 11:41:40 -0800 (PST)
Message-ID: <54EB8286.10101@gmail.com>
Date: Mon, 23 Feb 2015 20:41:58 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1424515460-52075-1-git-send-email-sven.ebenfeld@gmail.com>
	<CAJTo0LYY0Gh2p6p-vofrXxYQnfjKRwazoz+khs7HpyG==3Zvsg@mail.gmail.com>
In-Reply-To: <CAJTo0LYY0Gh2p6p-vofrXxYQnfjKRwazoz+khs7HpyG==3Zvsg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] terminal.py: No --disable-factory for gnome-terminal >= 3.10
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
X-List-Received-Date: Mon, 23 Feb 2015 19:41:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Ross,

Thank you for your replies!
I've reworked my patch and submitted it again.

Cheers,
Sven

Am 23.02.2015 um 14:34 schrieb Burton, Ross:
> Hi again,
> 
> On 21 February 2015 at 10:44, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
> 
>> +        vernum = check_konsole_version("gnome-terminal")
>> +        if vernum:
>> +            major = int(vernum.split('.')[0])
>> +            minor = int(vernum.split('.')[1])
>>
> 
> And whilst you're editing this code, doing the split inside
> check_terminal_version and returning a tuple would clean it up nicely:
> 
> def get_terminal_version():
>     ...
>     return ver.split()[-1].split('.')[:2]
> (major, minor) = get_terminal_version()
> 
> Ross
> 

