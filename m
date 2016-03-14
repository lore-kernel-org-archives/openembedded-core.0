Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id D324E65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:23:30 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id fl4so164598119pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=S8yb3CMfDlGrgSSQzPeDpVxhoAxDCXhzcPEDbqDC8lw=;
	b=dqo9Ljb2Q9qA0a+4IVb+QZtY/UCa9ShAWqyIFAbx2JhpyoOr1/wQYrQi4gy80sdT07
	w/m2Oz6hoxUtwYxaAvm8e4n8AizxxQ1OzgkMYQpfQx6iECPX3awwB63wQ+76SLmz9ILw
	QcUXfq6+1Bo+seBdLeXw7VlkMjPVcSSaKiBl3HlJJ1U/K1iu+wXnuyN6NMFODOX4MEV6
	+elcN75BXBwn/O1tVVCNk4OQq6rofBXWMGWSptH3U4tk9Br3rYqtqHXdodejGPTSJu0D
	qWChkD1UxzTDxnJ9NxKi2Nrpm5PgiEw1IjdiZBeFrz/LOV+GE5dpkLbjAlBAmweuASQA
	iSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=S8yb3CMfDlGrgSSQzPeDpVxhoAxDCXhzcPEDbqDC8lw=;
	b=fXaqbTYEFTG8TzT86xh6blzmwd6e2iCXbHMSDquUwZbzsFbDyCebV+FDbvjXGVCsTH
	vkvi1iTrWgoTlPAUMxQsbFiQ73CGUvIU6CvTflhHtIF6Yb8z/ownKBHLfE6L+OVNsIn4
	KOEHaMkUe19sRIQI48xb4ZZ+V5lePTnFTRBRqJDOk5vgbS1OCkcuOkRchmL+HWthGOW1
	jarUrMxpMdLTcPL7hEpgejINsulTLyP5+wWUIAVq5f6CY3ZoYcb4rhtLbmIh7n41Ap6n
	2tt5cLwV7UIFI7uOy3UB5ILyoEd4BFENgIYandI2SBXQrtq8ps11C6JhZK52I0fuSow/
	yO1A==
X-Gm-Message-State: AD7BkJLsHoK2Zp8ia6a/q43V8GEnNMKMtzO547dYWF+3e2q6GZ+Pf5/Ygd+OP6PUzhx4Jg==
X-Received: by 10.66.90.226 with SMTP id bz2mr41519691pab.31.1457990611197;
	Mon, 14 Mar 2016 14:23:31 -0700 (PDT)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50]) by smtp.gmail.com with ESMTPSA id
	h2sm34291738pfd.91.2016.03.14.14.23.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Mar 2016 14:23:29 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f50.google.com with SMTP id td3so137975806pab.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:23:29 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.67.6.10 with SMTP id cq10mr41272580pad.120.1457990609313;
	Mon, 14 Mar 2016 14:23:29 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Mon, 14 Mar 2016 14:23:29 -0700 (PDT)
In-Reply-To: <CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
	<CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
	<CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
Date: Mon, 14 Mar 2016 18:23:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
Message-ID: <CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 21:23:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 6:21 PM, Christopher Larson <clarson@kergoth.com> wrote:
> On Mon, Mar 14, 2016 at 2:04 PM Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Mon, Mar 14, 2016 at 6:02 PM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> > On 14 March 2016 at 20:55, Otavio Salvador
>> > <otavio.salvador@ossystems.com.br> wrote:
>> >>
>> >> I know it however up to now we could know that native and nativesdk
>> >> might respect DISTRO_FEATURES and be in sync. Now this is not truth
>> >> anymore.
>> >
>> > It's been like this in master since December and the world hasn't
>> > exploded
>> > just yet :)
>>
>> Just because nobody complained, up to now, does not make it right.
>
>
> Personally, I agree wholeheartedly with Ross on this, I don't want my native
> recipes obeying DISTRO_FEATURES, the policy is entirely different.

Do you mind to explain to me why?

I would like to try to see your view on this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

