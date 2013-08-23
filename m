Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id CE4FF608A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 15:11:09 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so864604oag.40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fhzymfmeC760X0AKV42jjt7b2+99G6E+SpmI3BBLN9E=;
	b=UVLHSQr5MygW2lXlm+6M/otQYCfO2SnpWzIUle3wZrKbhUE6eDsGzG2pyy9x+G01rf
	C/9SiGd8bdTaANc3LpBAVAP+bRaUqJJlRoeaPkfyHQzYPpgrnQevBnLSdCDR3MZj1Fn7
	evhD0uhNQ3L62ER7MVdBLbKs5sUxGgaZicnB0xlDXVxdKCmdXuy7isO2D1X3vyHiBL+h
	1iSP0TD1yGGtzv6yDQRNlQfGEDpoE/E2MAjKvC+bBeYo4SsWAgi4+EjKCbBMY84PSan2
	TilL+F21o/oEx9S21ZY1C/Mx/H8TnTQdJproel3SnmShgS7kvdtzIAzP4LhQVB3d+TXL
	lCOA==
MIME-Version: 1.0
X-Received: by 10.60.144.133 with SMTP id sm5mr39587oeb.103.1377270670014;
	Fri, 23 Aug 2013 08:11:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Fri, 23 Aug 2013 08:11:09 -0700 (PDT)
In-Reply-To: <1377269956.6762.92.camel@ted>
References: <1377269339-6139-1-git-send-email-otavio@ossystems.com.br>
	<1377269339-6139-2-git-send-email-otavio@ossystems.com.br>
	<1377269956.6762.92.camel@ted>
Date: Fri, 23 Aug 2013 12:11:09 -0300
X-Google-Sender-Auth: cx3_nc69zPzHLhp1n-4blN8zzKU
Message-ID: <CAP9ODKrtNQt7XeaXbOSTqGWFnna9soB+KRE6UAumoFGVTzr-Mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Christopher Larson <clarson@kergoth.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH v5 1/2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 23 Aug 2013 15:11:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Aug 23, 2013 at 11:59 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2013-08-23 at 11:48 -0300, Otavio Salvador wrote:
>> This allow the addition and removal of distro features easily. To add
>> a feature, use:
>>
>>  EXTRA_DISTRO_FEATURES += "wayland"
>>
>> and to remove, use '~' prefix, as:
>>
>>  EXTRA_DISTRO_FEATURES += "~x11"
>>
>> This code has been mostly copied from Mentor Graphics public layer but
>> changed the variable name for a more descriptive name. The original
>> code can be seen at user_feature.bbclass at:
>>
>>  http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> I discussed this with Otavio. My personal view is that we should hold
> off this right now. The removal issues he ran into with poky have been
> addressed in other ways so there is less of an immediate issue.
>
> The better fix for this kind of problem is -=/=- or more likely _remove
> override support in bitbake. I did propose a _remove patch a while back
> but Chris has some valid concerns about it, I don't remember the details
> offhand. I'd much rather we focused on fixing that and getting that
> merged than trying to add this functionality to every variable.

Chris, do you know the problems Richard's patch has? I can take a look
and try to fix it so we can get this in for 1.5.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

