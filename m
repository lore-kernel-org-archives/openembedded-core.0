Return-Path: <vladimir.molokov@gmail.com>
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com
	[209.85.161.44])
	by mail.openembedded.org (Postfix) with ESMTP id E1E1D7FA41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 23:22:28 +0000 (UTC)
Received: by mail-yw1-f44.google.com with SMTP id b186so13576798ywc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2020 15:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ymp/WvxNC20FRlE/uDv6Zu2afG9M7lNOx67MD9InHTk=;
	b=gL+caPfgnwh3/eQzbRWEuYTFJSalA+zq7mNuoWm5kWFGc11ID869OBusRnCXQnX5fX
	3spreRZl7sNFyZBIMCZSwuO8v9xp50TyDCKa2FnpgIce8jzEnCo7ou6dmV991lhLFvAI
	/lfWCvlfmClP9I3xzIAZrGg3pMN779KyAkARZhyIh2H9CHkIkJOCImr1IAoBSvXP8vPn
	SZBjDE3kBpY37pp9dCElNFfq3A8SicDrBs1xX3qbTr9HWCFHAxafYuIW5jf0+JJvOPpy
	RcVQJVzXt7VoqF5ZB3WvayK0eE+p5+NurNXGaNb2ZHE+1Vhk63g31QtpBixOLnm0puyG
	ya6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ymp/WvxNC20FRlE/uDv6Zu2afG9M7lNOx67MD9InHTk=;
	b=JapkQM8X26XInLhpiLlW3e6V/POIKcCzr1gGipASIoWcL8f0q801IdTixpe36gXfzu
	imUGeoz63fOhZYa5tnFJYAHjgTb8WqEUhiDgDIFAjiNS//ZN8iWjPAVV5OWBxziKtSsZ
	FQEo0f691n1wSQyjYpAMMT5FHgyDrupmBJJ/c+dKy5SLA1ClESDxOKC6tVF9Uw8UyZ93
	ObtA7aI48i0f9krp/udxabde3Mo1/YZNAe5UkZtnCMsXVC7cTeAAT0kPYNj+i8MV+EE5
	clJ2vF3Am6pjnc2TOeaBC3xIVlTi+Kxge/0lDq3Kyjlaxmt6534DpKuMuimIl69uCqOH
	QCww==
X-Gm-Message-State: APjAAAWVwlZ2xe3fkEpRgT5HvZ7CsKNAWgTt+8iQ2ylctTBhlf7kseAJ
	pC+qPz1yDt8UisNjA+ilJHlMJjKsbz9yjt9dzVibNIFa
X-Google-Smtp-Source: APXvYqwv8bsE4hcQwB1CxmVDDxYknkDgfqXhvwlQ2yrLHV8TCFRCsYqQLZQK7Y6qcgBdBkKpaeeWscWN9AJMbC+JpNI=
X-Received: by 2002:a81:1913:: with SMTP id 19mr28230497ywz.17.1579216949555; 
	Thu, 16 Jan 2020 15:22:29 -0800 (PST)
MIME-Version: 1.0
From: Vladimir Molokov <vladimir.molokov@gmail.com>
Date: Fri, 17 Jan 2020 00:22:18 +0100
Message-ID: <CAE2LOAym2eC+yJ9pFmGUGDaC9LjjO=RKr_TA_ON+m6GvRtW3YA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: attr dependency on linux-yocto
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
X-List-Received-Date: Thu, 16 Jan 2020 23:22:29 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

Question about attr. I'm not familiar with it.

On a clean poky is it normal(not a bug?) to have deps such as

"attr.do_build" -> "linux-libc-headers.do_package_write_rpm"
"attr.do_build" -> "linux-yocto.do_deploy"
"attr.do_build" -> "linux-yocto.do_package_write_rpm"

How they are appear? I didn't find anything in attr which could be the cause.
It's just a clean poky from a repo, after . oe-init-build-env and
bitbake -g attr.
Appreciate any hints.

BR,
Vladimir.

