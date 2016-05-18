Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 36283731D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 19:40:12 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id c189so22206395pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=q8LyHCOAY7/eOSOP3s8WyfvklyzZ78TQqlnAievGmIg=;
	b=y3fpxqVwAF0q50sKuLIdlVMn+I5lxsvxEP6rsFYSQOCoZyYjwX3vSZjdVupk2YlFhT
	l5T9x58jH8DtTQElMLLXdKffaqVzeo3kS4aB6nEoycCjfAv6Zzp4rJ/OcgPADy8n1Y3Q
	YFnIlN8xCLuj67s9BidTUc01J0VbCHJoA5WvR2t08V90w+eM0tPpqLhOASg8BjvFi5CD
	tTG4HN0DQtuDjW+SHemqXc0Xlrp4/Cld2llv/d1F8ba1m4S6RnjmBHTHh3CmS2MvsVDM
	ZQgT3HRALPaHtNKiaNYvDdmBkpw5S96VteRghSD8JLQVE7kyBpNAg0HqxB0njegDoB/M
	AP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=q8LyHCOAY7/eOSOP3s8WyfvklyzZ78TQqlnAievGmIg=;
	b=epXuIoUKJqmxmNdUwcaz0u5FnsBlrjKhQqUeMLR3TI7RfoQjl775IxM7HUOWKEFABL
	Z9zysNjSgyPjdefdRP32OI92eTdP4W3abe5nOBR/EyI61AhSwTh7YtolMFBRvaumFIVB
	aWcJ3S1uauYxguiqji9y8rdS623X1o2y+enFxAgCfcZlkQ1ZIe1+Sd/vEYJwsjJbns8+
	RDswYkLnlx1/oGDotFZIsQJxHMTBUZM94rpPbSWV4ZK5lwGGp3+5hTSjERTK2AT5OLrO
	fU5fnFkbsCNzqr9OF8usZkydrL4vyVkMNy8HqakySMBd1bjH0QpBei2Ab0gxbR5VobBA
	9rWQ==
X-Gm-Message-State: AOPr4FXZcguFVB9KpvZ/rFHV4LsKYJ5iiRx2e1mC4N4+PJcZAttVaJogI6WHAnFqMbGk3Q==
X-Received: by 10.98.27.129 with SMTP id b123mr13498178pfb.111.1463600391645; 
	Wed, 18 May 2016 12:39:51 -0700 (PDT)
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com.
	[209.85.192.171]) by smtp.gmail.com with ESMTPSA id
	63sm14124544pff.43.2016.05.18.12.39.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 May 2016 12:39:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f171.google.com with SMTP id c189so22203179pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:39:50 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.36.132 with SMTP id k4mr13446542pfk.95.1463600389797;
	Wed, 18 May 2016 12:39:49 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Wed, 18 May 2016 12:39:49 -0700 (PDT)
In-Reply-To: <CAJTo0La+1imJmmC5-q6crW7GYDty3iLB77FgvreJ22doYoJ5FA@mail.gmail.com>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama>
	<CAJTo0La+1imJmmC5-q6crW7GYDty3iLB77FgvreJ22doYoJ5FA@mail.gmail.com>
Date: Wed, 18 May 2016 16:39:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoA2cHXgSt-AzhdKrhAbYE1MZCGZb4GP73fPZRr71JApw@mail.gmail.com>
Message-ID: <CAP9ODKoA2cHXgSt-AzhdKrhAbYE1MZCGZb4GP73fPZRr71JApw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 19:40:14 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 12:54 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 18 May 2016 at 15:14, Martin Jansa <martin.jansa@gmail.com> wrote:
>>
>> Use os.path.join instead of +
>
>
> I just went and edited the patch directly to do that, so no need to send it
> again.

From the previous message it seems it won't work.



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

