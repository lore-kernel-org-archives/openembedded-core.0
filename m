Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id C65CF65C91
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Nov 2014 23:10:08 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so5778274pab.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Nov 2014 15:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=X1Q5A3o5jYahJUb1kgdGMJQrldzYAruJv/uPQuIFT/8=;
	b=TuZyBJrp2Co77fedkcaE3qR65Sxk5+tQ+PFMnlgf9KcaIhCRDMbyGTvep78AuHfqco
	SWHoFnQdOKeoo+GpZsy7yl1jRw9uH615+7wKTHzfvDQYHlO4ZTDO6QoSEKVYhfTvyzAv
	tpYfeQeuiSbwZVbNMz63Hu37Rs6ULVlqZAz7OdGwrqrmyzsQs+oh3eF8yH8B3bDE0Iza
	ekwWRGWqFOtO9ztMFM4hE2IN37GGLRS8G6dDWA5td04T7tkcBPOC5MZHxh6Ndc2GZgPN
	ITZGl4OJrIpoZq3fgCooD4eIl1/DCr62Ws/kIJ42RZUHEnKzP76ge41c6b2JdNa0GD82
	wXWw==
X-Received: by 10.68.234.202 with SMTP id ug10mr30169pbc.134.1415488208623;
	Sat, 08 Nov 2014 15:10:08 -0800 (PST)
Received: from ?IPv6:2601:c:9380:601:b485:392c:8ef7:2b2?
	([2601:c:9380:601:b485:392c:8ef7:2b2])
	by mx.google.com with ESMTPSA id
	jt12sm12330318pbb.89.2014.11.08.15.10.06 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Nov 2014 15:10:07 -0800 (PST)
Message-ID: <545EA2CB.9070600@gmail.com>
Date: Sat, 08 Nov 2014 15:10:03 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Armin Kuster <akuster808@gmail.com>
References: <1412173418-32141-1-git-send-email-akuster808@gmail.com>
	<CAJTo0La7oYuqFVBm7S3ta1mHxroYA_tJSV+f-s+PR+f+bGoywA@mail.gmail.com>
In-Reply-To: <CAJTo0La7oYuqFVBm7S3ta1mHxroYA_tJSV+f-s+PR+f+bGoywA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: update to version r123
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
X-List-Received-Date: Sat, 08 Nov 2014 23:10:10 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 11/07/2014 04:00 AM, Burton, Ross wrote:
>
> On 1 October 2014 15:23, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     Makefile md5sum changed since version is hardcode in it.
>
>
> In the future, changing the license checksum so that it only checksums
> the section of the Makefile that has the license instead of the entire
> file would mean it doesn't need to be updated.  Then again the makefile
> is a strange choice of file to checksum, I'd have expected it to be
> checksuming the source.

I will make that change the next time I update or remove the check all 
together.

- Armin

> Ross
>
>

