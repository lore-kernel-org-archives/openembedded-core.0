Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8863F6FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 15:40:34 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 77so224895563ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=ArJ6+78prA4X8zXILV3BTjUB/VogCKIM0X17NUSO6vo=;
	b=Xbli6S0IaWAx0Co1HzvZlLJa4Rd5MLlpjIfagbvA6Kd4q4ClvfL82s8RTMtjSVAXej
	rDmqkhYl9b9Pa9eqAGdwnUuEzR6pKwS4QscJHQe7Li42T3ZXsYBsTnRdWafaLJQbH+yj
	SMPIwQlvWjU2XlvNnxj1UDxRF+TTcIDxKaJ5OYamxk0ON3YoQedFSBh7Uv1XBr0zv4Y5
	F4ICyl+xIEPEIRXgi1Hqv3GY8nnGExYUteayCIPVg1WSMgSl4KJEIkXC7TjdD5I5EX61
	Oqxq3+v2XDCjb2gaTSxqGu4Wri6Cfdcd1wVdH1XR01SHiXY/BWKyj8WenhzJzEzVlNeV
	L5fQ==
X-Received: by 10.107.167.9 with SMTP id q9mr98179078ioe.84.1452181234842;
	Thu, 07 Jan 2016 07:40:34 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	p8sm20086231ioe.38.2016.01.07.07.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jan 2016 07:40:34 -0800 (PST)
To: Robert Yang <liezhi.yang@windriver.com>,
	OE-core <openembedded-core@lists.openembedded.org>
References: <568DF5C6.90509@gmail.com> <568E1CB6.708@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <568E86EF.5050408@gmail.com>
Date: Thu, 7 Jan 2016 10:40:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <568E1CB6.708@windriver.com>
Subject: Re: invoking a native compiler (gcc)
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
X-List-Received-Date: Thu, 07 Jan 2016 15:40:34 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hi Robert,

On 01/07/16 03:07, Robert Yang wrote:
>
>
> On 01/07/2016 01:21 PM, Trevor Woerner wrote:
>> If a recipe needs to build some tool on the build machine which it later
>> wants to invoke, my understanding is that BUILD_CC should be used?
>
> Yes, you're right, use ${BUILD_CC}.
>

Ok, thanks. That's what I thought.

I was surprised to find that BUILD_CC is being set to whatever comes up
first in our build computer's PATH. But I guess the alternative would be
to make our builds longer by compiling our own native compiler for such
cases.

