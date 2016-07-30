Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id AE50560746
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 22:47:36 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l72so150426436oig.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2016 15:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YI2R2P46VSV9Cd8MiWzVo1eyskljBhtvY6ZNNxEeQS0=;
	b=HqUxj7imrXRwkgzI91R7qbhL73tAk9UswNVpklppV2LibW2/tgcoN8QyPWoyoArCOn
	PPQfL3cWNi4u4ugjGPVVvPAlTKx3fGhqDrWjJtLONXBJzcSx8ZWGsiaBkcRUER3NaJrC
	sZaId5plz7/xTNcsEXdTm97W2dgx58k50xplY7CbPTXCP7ncs4SIL0bKK/ZbjkJLclTs
	l0aN/rYDgK4d6MpQpxNGTicuh+m1vNZnlt5RXdmPK0T+ebzT4Xx6NGNykDVSeysOu8Ma
	6co8bhYxZkgF8JGnVB8H0Ld1dYkgFI6l1GBh+rHDaVuYSAISZGBBJ1v14PKdSgh7VWJi
	hp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YI2R2P46VSV9Cd8MiWzVo1eyskljBhtvY6ZNNxEeQS0=;
	b=SPjQ188Gj3sI4syqb/iOhUEPWCir1cT17lyoVreAaa+Djc6JeKIGS7yQQOeIiM2svQ
	7kdEOKh6HkeBERhfIp9u9TEvbZrWv2mwC4hfU+1xX/VBp4xwkilo78EIMAqDTDGsXytW
	y2Xb6ou+mLuVTpLGqRQmDfA45htDHev0dAIVW7qiBXWWouqUto/5eRYGAyJsPCa/ReIr
	8VjgrlD3QGHnyv2h+zGkStcjlJ1ad7TrvAP2DjZ/l+tRUcwiRL09kv8c6dLVg4+CLMRt
	uf0gDqErklLxIRQX0MYHzSsgtYMSPwxYWO3MJpBjyAYyMTDGxkZVUyAm4AbhUX2wVAPN
	8ldQ==
X-Gm-Message-State: AEkoous935iyO8wc1RqH8dVOMeeYud+EYxbi9vJDMOxSYCanT4IXsYu+Li9v+mN+fTk/znAenO7i4V5v9U42sA==
X-Received: by 10.157.46.75 with SMTP id c11mr31385824otd.46.1469918857226;
	Sat, 30 Jul 2016 15:47:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.248.164 with HTTP; Sat, 30 Jul 2016 15:47:36 -0700 (PDT)
In-Reply-To: <CAJTo0LZ8QS01A4eni=Ou5Yi_w7c=FZN0sRzaTaiaj5jQ5oEBEA@mail.gmail.com>
References: <1461215114-5062-1-git-send-email-fan.xin@jp.fujitsu.com>
	<CAJTo0LZ8QS01A4eni=Ou5Yi_w7c=FZN0sRzaTaiaj5jQ5oEBEA@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Sat, 30 Jul 2016 15:47:36 -0700
Message-ID: <CAOLEWZUfn=oGHCLmwKneiDNp_xYQXUqWjNSZDGny5=Rku-GUSA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Fan Xin <fan.xin@jp.fujitsu.com>
Subject: Re: [PATCH] Replace foomatic-filters with cups-filters
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
X-List-Received-Date: Sat, 30 Jul 2016 22:47:37 -0000
Content-Type: text/plain; charset=UTF-8

No answer to this?  cups-filters would be kinda important for actual
printing, especially since the existing ghostscript/cups/poppler
packages have all been gutted of anything called *toraster.  The
current state (on krogoth at least) is completely broken; is there
something on another branch somewhere?  If so, I can't see it with
google...

Steve

On Fri, Apr 22, 2016 at 4:47 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 April 2016 at 06:05, Fan Xin <fan.xin@jp.fujitsu.com> wrote:
>>
>> +    cups-filters \
>
>
> What recipe provides this package?
>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

