Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id C07B0731A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 16:49:22 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id b67so137538861qgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Feb 2016 08:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=grIXnRgbzOsSB/AiXl3GQxOw4PkWoBDPXL3j2YWhOHM=;
	b=kxpFeCKfXmj4uwgHB6TJ5jUWpoRKplwpb6idEKTJBgaE692+9WNgiAJiJa/tqsbTJo
	3GFZoNmlstl3qGLgJ6YOJz6CZtlh0blQIM/xfYRXCxjmB5Bp/ZxEU/w1UmZElbzmOkR4
	tWAPDAkT72x7bSAXpfSJu51ulwjDp+FJ2dmGAgKXg53plc6HmBZTsw8DzMV+IbONXT9Q
	zTRLzIpdtw1epcQm5A0mamKT1zBnR+ou68IEQbH2eyYdHzIgreeUMny8W4h6DXu40SE3
	6yIObDPt45du1QlpBrajbKoQzKjuGoMQQR5hDEL47xQrJqmiISlm54kPOC6DDYMLHNvU
	Ij+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=grIXnRgbzOsSB/AiXl3GQxOw4PkWoBDPXL3j2YWhOHM=;
	b=gzQmbG9NkiaCKDdshrXygdMYiTbopW4tzItwNHzds56Fx80ne205nAhc4pzt4z1JHa
	c6vo4gbB0wMfHAZJx/HW8Dtxiv4OlqtKCDKiBGh0bMJ8luKtavTKJ+r/q76t1vCRqoTn
	zS4VHYSv40nImQ06HmTwLvPc6gBCwBTyN3klKpGY2MKRSxkp7FIYZm5huzKq2faO1+bu
	CEKmb+sBHV8LWLE8va4SYOU0RvFDqaFpwtoysAJakWi0Dfy7ghlC8Bkg9NmvyHw/xK8a
	LBdqPsXNGLS8FDgk1b6D8JZEbFeJ3ZEAnxmBd+qRPeXfPB+FCg8QxNn3Qc02kVYPb3nN
	OBTA==
X-Gm-Message-State: AG10YOTuKASi84BUNeODT+xV+A1Kikl1S+3++KoRohZXLgzTQWatM3AmVpdn0qFShTq519Rdv1ewliCJMSSwCA==
X-Received: by 10.140.100.244 with SMTP id s107mr27940033qge.19.1455641362925; 
	Tue, 16 Feb 2016 08:49:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 16 Feb 2016 08:48:53 -0800 (PST)
In-Reply-To: <cover.1455612645.git.hongxu.jia@windriver.com>
References: <cover.1455612645.git.hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Feb 2016 08:48:53 -0800
Message-ID: <CAMKF1spadaYvAUVuXjtkGs9zQs_VJUXgvTq6roX1NfCbQP5jEA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 0/2] use target path to replace build ones in debugging info
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
X-List-Received-Date: Tue, 16 Feb 2016 16:49:23 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 16, 2016 at 1:14 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> Changed in V4:
> *) Discuss with upstream maintainer, backport from GCC 6 to ignore
>    '-fdebug-prefix-map' in producer string rather than add a new
>    option. (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=69821)
> *) Also backport to gcc 4.9
>

This looks ok now.


> Changed in V3:
> *) Move entry from base.bbclass to bitbake.conf
>
> //Hongxu
>
> The following changes since commit da13f0bce5d1b3c52f5716ae8d104372a820e5f9:
>
>   buildhistory.bbclass: remove out-dated information on request (2016-02-15 17:47:08 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath
>
> Hongxu Jia (2):
>   gcc-4.9/5.3: Ignore -fdebug-prefix-map in producer string
>   bitbake.conf: use target path as compile dir in debugging info
>
>  meta/conf/bitbake.conf                             |  8 +++++-
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
>  ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
>  ...ug-prefix-map-in-producer-string-by-Danie.patch | 31 ++++++++++++++++++++++
>  5 files changed, 71 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0071-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-Ignore-fdebug-prefix-map-in-producer-string-by-Danie.patch
>
> --
> 1.9.1
>

