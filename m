Return-Path: <patrick.ohly@intel.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE2F71A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:51:19 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id 73so94752751otj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 06:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=cyb2mmDQoggy0hGl9GF+kMsrT6y73Cr+mK735i25IT4=;
	b=rjNBe/JIoUDB/wYHj5WmpyrnYREYegfu6XS89BX24Xwto31TDO0bmU8lrIanJrNeMq
	jBj8V0YGS4q0Go/QySjhe4qFMBKFbftHc9UpkmnMFVyBn5uOmJjH88FjNR9U4rn/9TXL
	p2EuOcc8yl0/PDC1tatmMfZ1iqvh74xIHJxwMB8zm3rQcArE2HllHR4MQOfc94YcKwHp
	ugccFuZP7gbx/UXEN5uvuYs1CG0WH5v6SxZyk23Z50VeH6faJgIDz3R10K2nOsTexaPL
	2yp4CXw2TSjhDodcx09euHXgFAJ5t8+Tv9tg21WVrQjiDgSXO1WxeSXYfd2ol7cZ2lfj
	nc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=cyb2mmDQoggy0hGl9GF+kMsrT6y73Cr+mK735i25IT4=;
	b=UqQhAx+Vyphf285TahytatSYcHWwHJB98Ke+PNE6jWikZHvjE4ur1rLPAZO6T2KE8i
	lPM9Vl3pztRlcZNMqGOtPoOUo+wMvMrakr0yELhy9I//+oNYmzQ8FLn7mOM/DfLy9V+9
	oAFB7i+hIc20OVUSLYM5Kjlxu6LtkZMbs6XDsDuBYYvpwJ/FqgQJFwJccb74c9W3+Gdm
	jWCNRGm6VCLa0EH4vTk+JlFieVaU6uQiW4Wmh1edUZkZS/uFWQnjecg/FtJd9N3taAhF
	IvhIAnA1+VQWUNW382mDJCKKLaEdE/H0onWsWOHb1y1j/ebae6yevqcCLW4xh62vZ7l+
	s2Zw==
X-Gm-Message-State: AMke39kcPNwtM3mhjMY+RYmeohO7Uer8MW2rl5tWnTigDsR0fIrHg0ixw7vqFcD0S21Quf7k
X-Received: by 10.107.164.147 with SMTP id d19mr27243255ioj.79.1487083879481; 
	Tue, 14 Feb 2017 06:51:19 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E015.dip0.t-ipconnect.de. [93.232.224.21])
	by smtp.gmail.com with ESMTPSA id 197sm419738ita.14.2017.02.14.06.51.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 06:51:18 -0800 (PST)
Message-ID: <1487083875.13854.331.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Tue, 14 Feb 2017 15:51:15 +0100
In-Reply-To: <alpine.LFD.2.20.1702140930180.28864@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702140930180.28864@uk63952.mitel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to select for non-volatile /var/log?
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
X-List-Received-Date: Tue, 14 Feb 2017 14:51:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-02-14 at 09:31 -0500, Robert P. J. Day wrote:
>   i recall, once upon a time, a discussion of how to best support a
> non-volatile /var/log directory:
> 
> https://patchwork.openembedded.org/patch/90151/

A more recent, but also still unmerged patch for this functionality is
here: https://patchwork.openembedded.org/patch/90839/

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




