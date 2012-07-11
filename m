Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SoqzA-0008EK-Jw
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 09:05:20 +0200
Received: by obcva7 with SMTP id va7so1098420obc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ul1wOQLlk7oKNgKzoJZjngERM5EMO3Y/jkZMNR7OLUY=;
	b=fFvxisxeJIEb0LJK2zy0q+ovrKCiT/8endj0BOQVNm8L4KB3NyVKeV3O3RxqTp3TUj
	DVAz6QC7mM3Fl20++RCHZJtFI82nCHUbPZcNP+X5/2UgT4odyyNhqJ/165noTcGPTLjP
	dSekzyiqt19EIIx6k/QhCRPvf4LxmFFIHZaJhVUG19BjECqzLd1KaoSNa6Su11K+aaRG
	wFaU/RTfLHpZKVhPOf/09knkvzgt5k8hZPMly1Sdp4lNdwvOXS02d9zRL/lebY8jo0b7
	2enlBesdx7ny7ljcqwrFHcQvuyVvWwgQeZrx4qQt+tRfqWO3V8eR3ARhLgIrPL37ZCqY
	a3sg==
MIME-Version: 1.0
Received: by 10.182.160.10 with SMTP id xg10mr43246532obb.76.1341989648488;
	Tue, 10 Jul 2012 23:54:08 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Tue, 10 Jul 2012 23:54:08 -0700 (PDT)
In-Reply-To: <CAF1ZMEfHzvtM35g_PSigbyVCKysTbJY=UODmnKNU6aoncU8YfA@mail.gmail.com>
References: <CAF1ZMEfHzvtM35g_PSigbyVCKysTbJY=UODmnKNU6aoncU8YfA@mail.gmail.com>
Date: Wed, 11 Jul 2012 14:54:08 +0800
Message-ID: <CAF1ZMEf4avBTsecguqG0k302DpCMpFmbtyzJf3OnJezaOtTi1g@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: build directfb-1.6.1 fail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jul 2012 07:05:20 -0000
Content-Type: text/plain; charset=UTF-8

anyone has the same problem with me?
either should we fix this problem, or revert following commit
actually revert this commit works here (better to fix)


commit 47800f9bff7a799489851156c341151ee9cf364f
Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date:   Tue Jul 3 12:34:59 2012 +0300

    directfb: upgrade to 1.6.1

    Removed two backported patches that already exist in the current
    version and fixed a compilation issue when zlib is used.

    Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>


On Wed, Jul 11, 2012 at 12:34 PM, Dennis.Yxun <dennis.yxun@gmail.com> wrote:
> hi All:
>  Have problem build directfb, seems imlib2 library is missing
>  Attached file is full compile log
>
> Dennis
>
>
> g2.lo idirectfbimageprovider_mpeg2.c
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_dfiff.la" && ln -s "../libidirectfbimageprovider_dfiff.la" "libidirectfbimagep
> rovider_dfiff.la" )
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_gif.la" && ln -s "../libidirectfbimageprovider_gif.la" "libidirectfbimageprovi
> der_gif.la" )
> | idirectfbimageprovider_imlib2.c:64:20: fatal error: Imlib2.h: No such file or
> directory
> | compilation terminated.
> | make[4]: *** [idirectfbimageprovider_imlib2.lo] Error 1
> | make[4]: *** Waiting for unfinished jobs....
> | mipsel-oe-linux-libtool: link: ( cd ".libs" && rm -f "libidirectfbimageprovide
> r_pnm.la" && ln -s "../libidirectfbimageprovider_pnm.la" "libidirectfbimageprovi
> der_pnm.la" )


