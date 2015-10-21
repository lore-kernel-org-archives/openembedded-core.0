Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 418BE72A78
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 12:36:21 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so96977801igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=bwRqxbtc/W52ggG0E+aExrRD5ZeZ4NvLS/ZtS2/U62E=;
	b=Lb6UE8Ygzjbn2F33LsVWEOcwh6DqG8gdj6whLESWxovrTMxANwCZW2v5sTrijoBy49
	pZ1c+3vnvON5JMr9kiltS70hukdXtuudN8U7r8DrQnvlz20gr6xm6l1oNyIOkX6yT8u+
	DINrAc1Nerfsao0j83SUCVb04aJhOlmblQEL4K0d41XWUibVa7juTkkphvQ4D0p1ttO3
	qfDGjlBfpuuXrszqUIZnReh1FwcLLsHJjgvat8jbvzAvUgkjGo86irv1B/vv/Ol2UrBQ
	iQPIg8bvFO7P8uaN8Aq4nYqw3GF/LksFzEB7h9OOxrETm9zY/bE/Xnep2mzuZtalaPpH
	TlVA==
X-Gm-Message-State: ALoCoQl/jc5B3QSo77G6o6nPLzw9fJxQZLa39g1jfnnH/Wm9yZPzTtwvV5+dyoZ87SYJki30Hwvt
X-Received: by 10.50.27.9 with SMTP id p9mr2048509igg.28.1445430981047;
	Wed, 21 Oct 2015 05:36:21 -0700 (PDT)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com.
	[209.85.223.174])
	by smtp.gmail.com with ESMTPSA id 68sm3581295ioz.5.2015.10.21.05.36.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 05:36:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioll68 with SMTP id l68so55601287iol.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Oct 2015 05:36:19 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.160.194 with SMTP id j185mr9176851ioe.37.1445430979855; 
	Wed, 21 Oct 2015 05:36:19 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Wed, 21 Oct 2015 05:36:19 -0700 (PDT)
In-Reply-To: <CAHiDW_Ep2_tkctPDR_A09EqG-15NS=pnC3w9evd7WiwZYnqdKA@mail.gmail.com>
References: <cover.1445415749.git.jussi.kukkonen@intel.com>
	<34b6f876ffd9463779923ec2297e060e893034f4.1445415749.git.jussi.kukkonen@intel.com>
	<CAJTo0LYxvYLQpeqVyR4HhzRJywUY5Ve_cHfsYo4VkV9otvJ5cA@mail.gmail.com>
	<CAHiDW_Ep2_tkctPDR_A09EqG-15NS=pnC3w9evd7WiwZYnqdKA@mail.gmail.com>
Date: Wed, 21 Oct 2015 10:36:19 -0200
Message-ID: <CAP9ODKre3aixXqNMSaAdqJvrgO+Hq4FkZkT7xMAELkt1Btmx8g@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gtk+3: Do not try to initialize GL without libgl
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
X-List-Received-Date: Wed, 21 Oct 2015 12:36:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 21, 2015 at 6:53 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 21 October 2015 at 11:43, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 21 October 2015 at 09:34, Jussi Kukkonen <jussi.kukkonen@intel.com>
>> wrote:
>>>
>>> +PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
>>
>>
>> This adds a RDEPENDS of libgl to libgtk3, so the explicit RDEPENDS on
>> gtk3-demo isn't required.  As GTK+ explicitly checks for GLX at startup I
>> guess you want to remove the explicit RDEPENDS on gtk3-demo and the advice
>> that applications should rdepend on libgl?
>
>
> The -demo RDEPENDS was now RRECOMMENDS but otherwise I guess that sounds
> correct for now: I imagine the gtk RDEPENDS will disappear once this is
> properly fixed upstream.
>
> Thanks, I'll wait a moment for any other comments and send V2,

Agreed; thanks for addressing this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

