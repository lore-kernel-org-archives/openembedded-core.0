Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id A08FF6C1DE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:02:55 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id v11so3078890itj.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 05:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=byMWsPyDy0qHgpof/EDGwggsfKEnNoR0FEr170kuJlU=;
	b=PDipLfCU3WdIZ8E4USZgtTaT0nLRXMWUxW3qEqHutBxYTG2mhDk5x2FjRBrTJqms7p
	nCKE8VzsnfOXE/2mR3oBvlBP0qDRF1Rn94o4ySbTGjEK6bLLyVMJHC45yNv9xjf8Sdm/
	wO88Z4fGABhP90PQGKwHdoueqxiu2cU6QPrevNLo8jdhmK4QfGmrsRAV4Quf+Z+UdAIX
	IhGeI9a+hyyi71VY8YfyB5Ez3Dl8nWaqQO2BQhBaI5HK2JGHXZ72lBmKqG/BDnIsrgX4
	v2QytFPUy+N+MHJdH8TtoG+M6Pt8qSv07Ow3WN+gaBC26oyJ6Mxd1o+J4c50xVXB0/Bq
	uNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=byMWsPyDy0qHgpof/EDGwggsfKEnNoR0FEr170kuJlU=;
	b=lINHPw13fdFCtajOgyrejp4TiCxEGVaLqqmUmuQ+TITmkH/w16ZebkxFnm/9Fiolpv
	jC8peJBPgAwXLyr44b4WX1CPNo745HlHgEqsZUgKNTh96QS0mXo9entzuQheInolZ3gQ
	ggQsVH++UP/oY1gH+I3vTH356mu3LZ2vmdTgCl6UdYa7ORSQ5AQKcSJYgZi8lhDbK63J
	hj0dhEHlsP//5BGaNr5ZJtXx4JtTzNgLRmyUKVQZIH5fvQUDdy4o9v/QDV2VzKDoCqNl
	18Vy6hgRrI0yQsEu5Xq1DZNUryPDVEbnJF8LQAKzfe1l9SzSR6GjEtQJsrc2AxJ7hcla
	6gNw==
X-Gm-Message-State: AGRZ1gLpmTcqlSHd6gYs6JjOeLx1xMMJg4LEZr1hjngQUuGzpYs361eS
	olkdAFDxAHBuKh3Q0OCIgXMk2MbjzaOPiSgwWztP9w==
X-Google-Smtp-Source: AJdET5cl8hQbGtxlB3jC7hAnh1gRF3qC/ptf1/7wVIW9mRZSPujCEOPAdEz85Su9N9m0LltBZotam2KdZ2lrd4R3/Vk=
X-Received: by 2002:a24:ce45:: with SMTP id
	v66-v6mr1938946itg.26.1541768576775; 
	Fri, 09 Nov 2018 05:02:56 -0800 (PST)
MIME-Version: 1.0
References: <1541657297-30997-1-git-send-email-mingli.yu@windriver.com>
	<1541657297-30997-3-git-send-email-mingli.yu@windriver.com>
	<CAJTo0La+u72y4JiB9dGKGw==FR_8Uwu31pO19eJ78bVfnHj08Q@mail.gmail.com>
	<5BE4E504.4010809@windriver.com>
In-Reply-To: <5BE4E504.4010809@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Nov 2018 13:02:44 +0000
Message-ID: <CAJTo0LZcL0H=sEdc7n7BRw+u-R3fHNb=2ooJO1hkPsp404PLqg@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] python3: add tk support
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
X-List-Received-Date: Fri, 09 Nov 2018 13:02:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Nov 2018 at 01:39, Yu, Mingli <mingli.yu@windriver.com> wrote:
> > Why is this here and not in the manifest?
>
> It's because we can optionally enable or disable tk via PACKAGECONFIG,
> if add it to manifest then we need to always enable tk which is also the
> implement in v1.

Are you sure?  As I understand it there won't be any errors if the
contents don't exist.  And to be honest if there are, then the
manifest tooling should handle that neatly without special-casing.

Ross

