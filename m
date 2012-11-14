Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYeil-0007ws-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:17:44 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 14 Nov 2012 07:03:46 -0800
Received: by mail-ob0-f197.google.com with SMTP id tb18so1868246obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 07:03:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TdyPZc8uppFLpkcZBLg2Ocup4BNlzVE0FCNn6CJdMdA=;
	b=m1iFNuzO5s7rsrzQJO6oojUMij9r1YgnN/E5B3bJSpuqeQY3xvT+JeK7stc+l+TVxL
	X8+V+cVT3srHIZ7Dsgv2pBI/5TtjQjPlz6mu4rtJKjW61osFQKswvw8EM2i3YIOcRg5h
	Us8bIR+BSLmbhyU5AtOA61AQJk1OVytNLTCFerdfQg34htJ2A7LHAS9hd0POU0X+Qr9A
	9byPSS+S2i7BOUkBaF++kgiu6SBTnMtoTWyYzdzUf4UPLMcz6On5BR1TBalTppPbdqXi
	KtERbwNJIUf5MS5ZH6F8n6i2hvEtQLEUirCanJPhk22ZMSiFoK2kCFVZG4M7NcbX0kAi
	Mq3w==
Received: by 10.60.10.201 with SMTP id k9mr9030934oeb.105.1352905425286;
	Wed, 14 Nov 2012 07:03:45 -0800 (PST)
Received: by 10.60.10.201 with SMTP id k9mr9030926oeb.105.1352905425203; Wed,
	14 Nov 2012 07:03:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.68.135 with HTTP; Wed, 14 Nov 2012 07:03:25 -0800 (PST)
In-Reply-To: <a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<a7f0c78da3a41c3d7a57966ba15b3013f3da1744.1352898505.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2012 15:03:25 +0000
Message-ID: <CAJTo0La_f26GzRCXGj-5fquqWheT_EnU_1Qu-ghjXz2Qdb1gpA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQkjLcSwU99NQWoyij9l8Iua9rFcq6CC3Ndpd0A9N26mHbnloIW+ab2S+kh5Db1Vjpgue+nNwgMfeZU+7gM375l2UJ3IunQ/fpmtzKAZmvzUUESDB1QMuD54XSbK50EwyrdP5GeYW2R69SgzxzRzz0WIDNZzVkgE79OxzUWXkLuCLag0XFUzk91gxGiJQ8gS/VMFXatz
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 08/12] xserver-xorg: upgrade to 1.13.0
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
X-List-Received-Date: Wed, 14 Nov 2012 15:17:44 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 13:21, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> The patch contains several aditional changes:
>  * removed one backported patch (included in the new release);
>  * changed mips64-compiler.patch to apply properly;
>  * licence checksum for COPYING file changed: some copyright years have
>    been changed
>
> The following external modules are now built-in:
>  * DBE
>  * DRI2
>  * DRI
>  * RECORD
>
> The extmod module was completely removed.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>

I'd like to see the upgrade path verified just to make sure we don't
have a repeat of the EXA farce...

Ross


