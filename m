Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgyE9-0007hf-IC
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 14:44:30 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so1031948ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2012 05:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LZp/lb/zi97bxOXqytdMRjEgymyycBb2DFvMJ0JJThw=;
	b=gTHX+tS4H7LsWympj3fMYETWUU9Uuy5KrjxL/DZgXnyrOj6MRHXM1EJX6+r12dQsZX
	7Zm/QR4EKpRWP4jYEgauKgQJ2RWtpV7/l5EwWr7ZxR8GSWlWXzeJWNwICEDQp1TwPyli
	rKa2yfuEC4+sfmz2nDfBGKiA/LVCbJJSgcspM1K5JBYZGX2xr8DbHIvod3rwaiKxb6e6
	Q8670QraUASQjl/Mc+Pye19Apbr9g80CdxfcytfvzTeS57/nmjEVlxdf2G6CnKfC9Fwi
	n6YYH3bokTQIH65r3lknv4FZH2n1UHm3YexxS3LCoTF+09NLS3jl3uU59x9uTJ1u9aJL
	oGEQ==
MIME-Version: 1.0
Received: by 10.43.49.199 with SMTP id vb7mr4406578icb.6.1354887002352; Fri,
	07 Dec 2012 05:30:02 -0800 (PST)
Received: by 10.64.24.175 with HTTP; Fri, 7 Dec 2012 05:30:02 -0800 (PST)
In-Reply-To: <50C0E34E.8010108@linux.intel.com>
References: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
	<50C0E34E.8010108@linux.intel.com>
Date: Fri, 7 Dec 2012 15:30:02 +0200
Message-ID: <CAF6bG8dcfnhG_O1VYjV2Lw8XP63hCC3aUj1TqHw_gnYZ+WhHDw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: libpng-1.5.13
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 13:44:31 -0000
Content-Type: text/plain; charset=UTF-8

On 6 December 2012 20:26, Saul Wold <sgw@linux.intel.com> wrote:
> On 12/05/2012 12:40 PM, Marko Lindqvist wrote:
>>
>>
>> First preparatory patch makes it easier to add multiple major versions of
>> libpng. You may choose to commit this one only.
>>
>> Second patch adds 1.5.13 recipe. This produces library named libpng15,
>> while
>> old 1.2.50 recipe produces libpng12. Some older programs (and their
>> recipes)
>> may fail to find newer library. So far I'm aware of one such case in
>> meta-openembedded; libsdl-image-1.2.10 needs update. I've already
>> submitted
>> patch for that one.
>>
> Overall, it's great to see the recipes updated, but we don't typically keep
> the older versions of recipes around.  So if you want to preserve the older
> version, it should be moved meta-oe.  The only case we keep older recipes is
> for License changes from GPLv2 -> GPLv3 where it makes sense.
>
> So, the request would be a v2 that also removes the 1.2.50 recipe.

 I wanted to keep 1.2.x as an option for a while in case someone needs
it for building something not yet compatible with 1.5.x (cleaned up
API).

 As requested, I'll make a simple patch to update from 1.2.50 to
1.5.13, but I'll leave it to you to decide if time is ready for such
an API changing update.


 - ML


