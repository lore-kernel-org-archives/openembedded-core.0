Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2AA6C7F7B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2019 06:02:39 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g7so724989wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 23:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ajTrkzl2+JAwZ2ba6oCoy0lh6IenR4e9wMmxLCzFWlk=;
	b=QDbWAxjOGXMq7zDJZXhYYeajKb1pejJM+qkGpR19FuTloRaXM8BJLfruY+4NiwRZy4
	E9GucQmSP8P2iwEI4SgrnhPn44otjuvWIc/lSLW39FGR5GSYyj+jtYw+GWe6f0kXjsU3
	euwpVUaGNvpVcZB534iAxJYEsxeb13tDwD8F8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ajTrkzl2+JAwZ2ba6oCoy0lh6IenR4e9wMmxLCzFWlk=;
	b=XA9VJxkFIMOzXanM/F6tHzAyGG4TPjx00afvSdVrF/TbXg9tGY9EyNE4/Eymmm3PML
	6xEcd1F8UKj02GcJt/AJQrTFYJznniTmeSe3qy7o1p4VONbqksKvOf11Oh/tqeQ+cqXK
	M2cBNyLnHVzb05JXvnb/gZcbrLJM2G6qe5PF93LYJuxojIDfy9EWTttMwnjnbFydGcf8
	sLgt5fKmKyafYdNQ8g+mo9S91zu9Nr8NsZcO8HMcSDlEDLCR6q51Mrmvl3lYFFEEfoFb
	Syq7/UXI6e78pNtdW9tyQHkZlnE9gnrFw8+rx+0HzY/7W/30sBGKPICc36dgEgS5bCnW
	RHdg==
X-Gm-Message-State: APjAAAWPbDLjrncbhTV2iLjTlLvXOSKe9hfkH4VMMSaraBuUnSuiwipj
	e7tNv3JpiJgNsWjpo5LXX5FNgQ==
X-Google-Smtp-Source: APXvYqwFk3wh/dZhYgq/qXt/fe+hYIk4DtoTau3WAVqln8LyU49b+rDL3ku416iBTZYO+c0MjYrS2Q==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr7333767wme.100.1572415359937; 
	Tue, 29 Oct 2019 23:02:39 -0700 (PDT)
Received: from hex ([158.255.104.250]) by smtp.gmail.com with ESMTPSA id
	d202sm948122wmd.47.2019.10.29.23.02.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 23:02:39 -0700 (PDT)
Message-ID: <49bbbfd6d2718f94b3ccea5577163a87e91e058f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2019 06:02:38 +0000
In-Reply-To: <5a0f6604-1517-4fb0-2a5c-6707bc9b68d5@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
	<beec8a52a8738b0a88cc81dc7898fa38b5088b68.1572072422.git.akuster808@gmail.com>
	<100fd9d42893f3ea7683fb70281d0622f1896259.camel@linuxfoundation.org>
	<CAMKF1so131wZ80vgLm3KRu9DnBa=P08B=eJFwSNUb-BpAYJbnw@mail.gmail.com>
	<5a0f6604-1517-4fb0-2a5c-6707bc9b68d5@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [zeus 18/28] cmake.bbclass: add HOSTTOOLS_DIR to CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Wed, 30 Oct 2019 06:02:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-30 at 05:29 +0100, akuster808 wrote:
> 
> 
> On 10/29/19 9:31 PM, Khem Raj wrote:
> > 
> > On Tue, Oct 29, 2019 at 9:19 AM Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > 
> > > Given the fallout in meta-oe, I don't plan to take this.
> >  
> > +1
>  
> So is this why to took me on a 3 mile walk up a hill?

What would have happened if I merged it?! :)

Cheers,

Richard


