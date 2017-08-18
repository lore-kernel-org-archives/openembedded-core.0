Return-Path: <dvorkin@tibbo.com>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74D0C78572
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 06:16:50 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id t128so38628845lff.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 23:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tibbo-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language;
	bh=Yyo8TCQC8C5Vwz2PzCxCP2KF32WWEc4QCVTbVgTQszw=;
	b=Gmp4CB4l0zaT8pOBk4/q4/XCcCwAGUR9LQIWRJPE7Up7E4IvmcDeYR9XwrM1zkv92G
	wFKBCtSjxVppABD4j1XA58IXLf4sASiwvWyhVpcG7KpNfpOCE+nj0Oof3KfWNlVIhqBQ
	p5RG4MsPJ9BJA0h3sKFBHO6uiNa8VnoL5bIxGv5SOx/4h+T3ohJK5UXBCGjrcAuNgoiM
	76WyfODz2jjuyvebgiBLJWqgj5sYPii3fN1BWPyxUeTCSZohHvkOigsxWHapot0lfQe5
	zdpcAX/eAMIYFgqunRG0XSq7FCxJLPBCzjJ1Z5PhpxRk6Tn/t6s/9e2Ie7R9nA6JUKeo
	ekSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Yyo8TCQC8C5Vwz2PzCxCP2KF32WWEc4QCVTbVgTQszw=;
	b=KNcFoWkHuEDsSnEXQxSXx6T5QVgfeUVqPOR5RSBxmQcoQR/GVj/3C0vsN3qxTa8eJB
	tJs8adoFhjSp8hYaE3+X803jUjM+yb10dP1tIcapqZjZFHscw9WsFpwQoAXsilM4rgGk
	z2V9fRO7BkG4CFio4uuleDVwIYTFC5Dc/GQq+9FKVORIGfV++2b6rF3bv6Yfdk0YSE7+
	Zd/bPsDl+DgKs0uc9SMKKVGtzfyURL4TcL/pSPA9mGzoEWbYc6xkj2n2X7T13EaZLAWt
	Af5lDHVME7U+Bzr8BNxUH0TBl60/G1KsZolg7MXqGdVG2Ur3h0ed8fRqsaBRCy7ahSgE
	LVIw==
X-Gm-Message-State: AHYfb5gxhSwSvBMGn6KugHDzm1D3jknQkq/hJOIg90QpVHrwm0vwuc4r
	HBhgR4aTvYRF/NQfyhVS6Q==
X-Received: by 10.46.87.19 with SMTP id l19mr2872904ljb.50.1503037011497;
	Thu, 17 Aug 2017 23:16:51 -0700 (PDT)
Received: from [192.168.75.150] ([176.114.204.12])
	by smtp.gmail.com with ESMTPSA id
	c64sm1114830lfe.40.2017.08.17.23.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Aug 2017 23:16:50 -0700 (PDT)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <1503655141-1302-1-git-send-email-stefan@agner.ch>
	<3ce69269-11b4-34b8-68fe-0ce8ac9bd103@tibbo.com>
	<5574f618-9b75-43a2-8bdd-e6b45340ee0b@linux.intel.com>
	<a8241b56-7927-fba3-70eb-296125f7b8c3@tibbo.com>
	<3eba804b-52e7-4f1d-7b9d-705731d36ccd@linux.intel.com>
From: Dvorkin Dmitry <dvorkin@tibbo.com>
Message-ID: <4e5f3ca1-cfc0-1b43-84ba-28e9e3630cb3@tibbo.com>
Date: Fri, 18 Aug 2017 09:16:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <3eba804b-52e7-4f1d-7b9d-705731d36ccd@linux.intel.com>
Subject: Re: two recipes, one replaces files of another
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
X-List-Received-Date: Fri, 18 Aug 2017 06:16:51 -0000
X-Groupsio-MsgNum: 101597
Content-Type: multipart/mixed; boundary="------------165D0DE6E0073BA2C037A345"
Content-Language: en-US

--------------165D0DE6E0073BA2C037A345
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks!

The problem is that this two machines are the same, except only one 
configuration file.
Bootloader files are build for two machines with the same image. Linux 
kernel is the same the small  difference is in two separate DTS files only.
Everything else is the same.
I don't like dirty hacks. If somebody knows the good way to set 
preference in non-root configuration files - please, advice me.

On 15.08.2017 17:38, Alexander Kanavin wrote:
> On 08/15/2017 05:21 PM, Dvorkin Dmitry wrote:
>> Thank you, Alexander!
>>
>> But according to this
>>
>> https://lists.yoctoproject.org/pipermail/yocto/2013-January/011855.html
>>
>> PREFERRED_PROVIDER_... can't be used in image recipes, only at 
>> top-level configuration files.
>>
>> I can't make it work...
>
>
> I think you can solve this by defining two machines: brdRevA and 
> brdRevB. Then set PREFERRED_PROVIDER in the machine definitions.
> And have just one recipe for the image.
>
> You should not make image recipes hardware-specific anyway; any image 
> recipe should work on any hardware, and details specific to the 
> hardware are abstracted to the machine definition.
>
> Alex


--------------165D0DE6E0073BA2C037A345
Content-Type: text/x-vcard; charset=utf-8;
 name="dvorkin.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="dvorkin.vcf"

begin:vcard
fn:Dmitry Dvorkin
n:Dvorkin;Dmitry
org:Tibbo Technology Inc.;Tibbo Engeneering
adr:;;9F-3, No.31, Lane 169, Kang-Ning St., Hsi-Chih, New Taipei City;Taipei;Taipei;22180;Taiwan
email;internet:dvorkin@tibbo.com
title:Embedded Linux System Architect
url:http://tibbo.com/
version:2.1
end:vcard


--------------165D0DE6E0073BA2C037A345--
