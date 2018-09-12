Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 268D579497
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 21:51:42 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so6861501ois.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=L0/nGFetBcRYXfjJ4ySH5/3SAsyPuBqZfDIYkmhFv4c=;
	b=1O1AmqTb4PJrzjii6WFWQEij+gQuQnfZ+Tg5j+SFapkCFiUoPKMkDfAhIYONEwVkX+
	CRgJa/JQonSCB/qzg90+B/GZnRnXYO93IJpInT4mlJehxJSHFHTlgC84nPrnzcQG5flq
	+/wKNfk3xDPGxuILM+lFc3ZefWPLCZ+VXxfTItWXR1MjUX3aJnILACnkbUphizGBcLKL
	gX02Qiv/mYBtx82BF402uIhtMh7OPkbLejSZslU5MOIN9eBxOsqp+r78jiRGPVivrLKl
	MFxJBMwkt80dioeUJQVefab7o8dnxWxFFUGRfABDvY82ZnGg/qhKgXbAOGxx4mrLfBMZ
	b9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=L0/nGFetBcRYXfjJ4ySH5/3SAsyPuBqZfDIYkmhFv4c=;
	b=dm2I4WFpQeYJTZ+xf+xsGV8hMCBf3Cgfavyi+u9XvhBsXcZe+ShTqdwH1h3lwAgahx
	40A8Hhibj3IR7qFSWDwS+h0Tu2+g4UmO13MfAtq3sMn9tbjoQKmSE3XZd4007h+D8q2z
	Mj/c7tYF/QGwPCWtsXTZbDpR0DMYo7Ov3dgpS5wWKrYQJy0+Bzoc0Qa/0Oa/WWFZIfJ8
	5874DpLAt8vMc58u6lOZMCYLodCZ/AUizyGfoLypVr4uFrD0E94HIpOxO5Yb/HAj6sqs
	KK2DGE2zPKifEJBAazBFXvQ+tB5IHCjG8MqDYRxH0fQVW5SJM+ZD1ioUghwDPz4NbU3e
	N1GQ==
X-Gm-Message-State: APzg51DzFQnMxb1t+O7+dJQlA3N0kUPjC93DyjAe4fqicZyIpn75P7Oz
	kVbLP3amviN5k+caiRV/rN2EXy1ycCeHuxV855Yp3g==
X-Google-Smtp-Source: ANB0VdbMHiBZUJFlY+PH0QpQxVwF2yxyfMwm7+TiMTLkBnvTQa6ADxhcNqyYtH9lO+I/1wp6YnFS/4ILXGDNIVKwF14=
X-Received: by 2002:aca:a04:: with SMTP id 4-v6mr4260763oik.203.1536789104007; 
	Wed, 12 Sep 2018 14:51:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Wed, 12 Sep 2018 14:51:23 -0700 (PDT)
In-Reply-To: <al431y00B0lLAyC01l43Xu@charter.net>
References: <al431y00B0lLAyC01l43Xu@charter.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Sep 2018 22:51:23 +0100
Message-ID: <CAJTo0LZHmq9s2LfqMyDOv1hii=tG3SEUofMxm6nUNCWTj13FEA@mail.gmail.com>
To: joseph-reynolds@charter.net
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] disable medium-strength dropbear ssh ciphers
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
X-List-Received-Date: Wed, 12 Sep 2018 21:51:43 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, I'm aware that dropbear looks for that, but it won't be looking
in the recipe folder. If you added it in SRC_URI then it would be in
WORKDIR which is almost the right place, but not quite.

Patching default_options does seem like the best idea moving forwards though.

Ross

On 12 September 2018 at 22:04,  <joseph-reynolds@charter.net> wrote:
>>From: "Burton, Ross"
>>To: joseph-reynolds@charter.net
>>Cc: "openembedded-core@lists.openembedded.org"
>>Sent: Wednesday September 12 2018 7:20:27AM
>>Subject: Re: [OE-core] [PATCH] disable medium-strength dropbear ssh ciphers
>>
>>Presumably this doesn't actually work as you're just adding a file to
>>git without actually referring to it anywhere.
>>
>
> Thanks for your email.  I am still trying to get the Dropbear patch
> upstreamed.  (This is my first patch, so I am a bit of an open source noob.)
>
> To address your concern: Dropbear version 2018.76 and later build process
> specifically looks for the localoptions.h file as the way to customize
> dropbear.  (Note the  2017.75 and earlier versions use a different mechanism
> to customize.)  See the Makefile.in file for details.
>
> However, now I am wondering if patching Dropbear's default_options.h file
> would be a better way to make this change.  Adding a localoption.h file is
> the way to customize dropbear.  But I want to change the *default* behavior
> of dropbear so that it uses the same encryption ciphers as OpenSSH.  I think
> patching default_options.h would be better way to accomplish that goal.  And
> that patch could be applied to the Dropbear project itself.
>
>>Ross
>>
>>On 7 September 2018 at 20:16, <joseph-reynolds@charter.net> wrote:
>> This changes the Dropbear SSH server configuration so it will not
>> accept medium-strength encryption ciphers including: CBC mode, MD5,
>> 96-bit MAC, and triple DES.
>>
>> Upstream-Status: Pending
>>
>> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
>> ---
>> meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++
>> 1 file changed, 8 insertions(+)
>> create mode 100644 meta/recipes-core/dropbear/dropbear/localoptions.h
>>
>> diff --git a/meta/recipes-core/dropbear/dropbear/localoptions.h
>> b/meta/recipes-core/dropbear/dropbear/localoptions.h
>> new file mode 100644
>> index 0000000..ec48c26
>> --- /dev/null
>> +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h
>> @@ -0,0 +1,8 @@
>> +/* Customize dropbear per default_options.h in the dropbear project */
>> +
>> +/* Disable insecure ciphers */
>> +#define DROPBEAR_TWOFISH256 0
>> +#define DROPBEAR_TWOFISH128 0
>> +#define DROPBEAR_ENABLE_CBC_MODE 0
>> +#define DROPBEAR_SHA1_HMAC 0
>> +#define DROPBEAR_SHA1_96_HMAC 0
>> --
>> 2.7.2
>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>>
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> /> >

