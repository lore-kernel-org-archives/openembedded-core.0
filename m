Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id E3BE8608BF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 16:55:18 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n12so3438932oag.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Aug 2013 09:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=evmJzLnJytdOnhH/m3WVxfQyI5Qq5YYDLRr2ICf8cvs=;
	b=ZJEssUovciMp1fRi+LFHpcEjOhB2vztYe366Rk+N/EnO3PghyzaRE8GwDZyHC1amS9
	jyfKTEMZdKtSoRlIU5/1IVQSR+t/0hDbIQquDR8QNeRGZClefiaK4IugnKBgScfz1uU+
	rzK1cD/s7/yAFHRkOCZ4G2f5x2exU+MlqlP/aCJ7Xaqv9HmxLfzl0z3u5lcZxFQ2NziR
	wDE8XVuKAk5eEx7mEAE8CxRKBcv19PbgPb8As2ohNxONqFY5NIYQNwHyMYUmxpuLSadt
	P13jaZHxJBE9YcwOrXSFhIWZ97RJQRq065hSaN6k6ABZwZ0vmblLlt8QDsxpKhaqph3w
	uDEA==
MIME-Version: 1.0
X-Received: by 10.60.124.228 with SMTP id ml4mr2464012oeb.47.1375548918001;
	Sat, 03 Aug 2013 09:55:18 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Sat, 3 Aug 2013 09:55:17 -0700 (PDT)
In-Reply-To: <CABcZANnvpMCNKyncpct+FTiHrcGid4_hpKQvH=DQ=YwD4LFYJA@mail.gmail.com>
References: <1375395237-17840-1-git-send-email-otavio@ossystems.com.br>
	<CABcZANnvpMCNKyncpct+FTiHrcGid4_hpKQvH=DQ=YwD4LFYJA@mail.gmail.com>
Date: Sat, 3 Aug 2013 13:55:17 -0300
X-Google-Sender-Auth: 1ZVq0rf2rhaGgFKiCjG4_xkaqEM
Message-ID: <CAP9ODKqjwDuMNM1aj6TgX6-S10fZC1qBU9O58RdCioTiV0XL-A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chris Larson <clarson@kergoth.com>
Cc: Evan Kotara <evan.kotara@freescale.com>,
	Lauren Post <lauren.post@freescale.com>,
	Daiane Angolini <daiane.angolini@freescale.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] distro_features_check.bbclass: Allow checking of required/conflicting features
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
X-List-Received-Date: Sat, 03 Aug 2013 16:55:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 2, 2013 at 6:16 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Thu, Aug 1, 2013 at 3:13 PM, Otavio Salvador <otavio@ossystems.com.br>
> wrote:
>>
>> This add support to list required/confliting distro features for a
>> recipe; this avoids user mistake when building recipes/images which
>> would not work depending on DISTRO_FEATURES option set.
>>
>> Adding:
>>
>> ,----[ Use example ]
>> | inherit distro_features_check
>> |
>> | REQUIRED_DISTRO_FEATURES = "x11"
>> | CONFLICT_DISTRO_FEATURES_mx6 = "wayland"
>
>
> I wonder if it would be worth doing this like PNBLACKLIST to let the recipe
> provide its reasoning as a message, or if that would add too much overhead.
> I don't know enough about this use case, but something to consider if it
> hasn't been already.

I did a look now on PNBLACKLIST and while I see the value of a custom
message I didn't come up with a way to do it using overrides as well.
So, as the example in the commit log, it'd be harder to make a mx6
specific conflict.

CONFLICT_DISTRO_FEATURES[wayland]_mx6 = "Vivante GPU driver for
Wayland is incompatible with X11"

Would the above work with current BitBake code?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

