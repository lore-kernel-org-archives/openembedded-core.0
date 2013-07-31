Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 495D061619
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 11:41:58 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id l20so1235840oag.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 04:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=CL+bM4b6BSrsxy7Y/2YOU57TgLj2EvqRvmvjF+c/QnQ=;
	b=mNmKp6Yj+1SzIvgm9Te7MPm8l8Z7laPnmx+Qtk+rkDrJV6LZjnKESxj0XinODLHHhu
	/ppFN7m1JtvSfs0rtZqVE+SXKnnPa8rRmqg8vgUU6tAHlzanRqilEYfMADsyrkOcNBJi
	nTlNiw9RoL7kRTW4xgLy68zwDygsaXZXdMwNQHF/o4djs9X7qRJIg+1tcyUXJZzP5wSh
	wf7Xcp4T0H9b6G2cJPn2ltDvYDQdcMDF1XmyDq13olXKPz6dJka8a6zxKR5yGfNm8z49
	/vEY1I5s8IP8kYI7Oq6Atx/bJIF9iEEJHjzE4DMYfvztl9CdWDCQCxEKVoGbffLQkIzK
	DBJg==
MIME-Version: 1.0
X-Received: by 10.60.79.3 with SMTP id f3mr66765905oex.50.1375270918040; Wed,
	31 Jul 2013 04:41:58 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 31 Jul 2013 04:41:57 -0700 (PDT)
In-Reply-To: <CAJTo0LbO4f_PU+ecCVNT-AWiOcmVeR5ErXWNdmw4HrJaxe7bUw@mail.gmail.com>
References: <1375233090-5072-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbO4f_PU+ecCVNT-AWiOcmVeR5ErXWNdmw4HrJaxe7bUw@mail.gmail.com>
Date: Wed, 31 Jul 2013 08:41:57 -0300
X-Google-Sender-Auth: fO3zIgk9I5I2I6wuktxyDIGBNZo
Message-ID: <CAP9ODKr8NKnEux0kiuK=9bxhDt_x3rb1TzvXVjWwWhmg_2hmHw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Wed, 31 Jul 2013 11:41:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 31, 2013 at 5:51 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 31 July 2013 02:11, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> This allow the addition and removal of distro features easily. To add
>> a feature, use:
>>
>>  EXTRA_DISTRO_FEATURES += "wayland"
>>
>> and to remove, use '~' prefix, as:
>>
>>  EXTRA_DISTRO_FEATURES += "~x11"
>
> I'm not sure I like the use of "extra" and "remove", as they're
> contradictory.  It's too early to come up with a better suggestion
> though. :(

I agree but I couldn't also come up with better name for this.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

