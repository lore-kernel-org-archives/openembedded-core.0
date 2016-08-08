Return-Path: <iwamatsu@nigauri.org>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75A4A770CD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 10:10:29 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id j124so5890433ith.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nigauri-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=pPS/c+YpxtPP7V5LM4bQYoPUduzQHSVo7P9zIdy4Ouo=;
	b=kpNpLWopTJPz6TeEIyXWYSHIRt/XbkdpdsZPfdTrZu2Un+waRzrY11rGKMTM6fM0zZ
	jUYyM3MPZ5j/gUAS/0Awiei3pqrb2LO0Z3YU2xXczNNvZ3jYsO+96B7T5ZYDJrV0o4D0
	oL74pjgVJ0wXxKeo35UWQKupjmtcjUiX8GVWDxyglwP/0AqeCmNr+CU17T667VFJFMCQ
	zM/VB6NFQLgLs0PHkpXYOVKqW+6cdOFwN+aPE+/DAMM9PKu0r7H0xVr+y2lauRLrraRj
	/4IyZjMuhDa9yCtYOpV/S0xaG2HL0Vge9MKHq/G3xAeD/u6cquMCfYWVufMUUc1BqUbZ
	yGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=pPS/c+YpxtPP7V5LM4bQYoPUduzQHSVo7P9zIdy4Ouo=;
	b=cd5BkANmOqmOVETDZAXjIlEELE4NmQXs2rX993aUR3F/S4W//zGcLXvWPpALG78G2l
	gIBj8VNJJSM9RuzHFRWKpMsZyrBQNklFVjH2ro/3g2GFvcWdtIhz3B5kDfepO4qsLQmx
	2gAOYTNs5UKskUyc5wfL5dqLgwQ9f61Azyxrlsp87pCN058nDdjfuM8ric/llirlIoeU
	46n7ZyWhhI9TUbxBGekQQYG4dfN29DZ2EfvKwgkuls4Z+P29mjaBNWQWGXlINQVi1Mmu
	lWaMwqMIkBwdqjJJbBGsPM8WsjRFPmmkkP6VxuLFmhSc7mDSJVbupKjdPRhtrZsws31U
	v6wA==
X-Gm-Message-State: AEkoouv8xYc9X0DytIpgNOPdDhvsvhSVgsQmI2a+uac1GFXpLbt6PikKUoFEZypJbX4BJuZCiiUyITI7tUZpyQ==
X-Received: by 10.36.3.193 with SMTP id e184mr17438862ite.34.1470651030441;
	Mon, 08 Aug 2016 03:10:30 -0700 (PDT)
MIME-Version: 1.0
Sender: iwamatsu@nigauri.org
Received: by 10.107.138.86 with HTTP; Mon, 8 Aug 2016 03:09:59 -0700 (PDT)
In-Reply-To: <1470604793.8166.21.camel@linuxfoundation.org>
References: <1470581318-33390-1-git-send-email-iwamatsu@debian.org>
	<1470604793.8166.21.camel@linuxfoundation.org>
From: Nobuhiro Iwamatsu <iwamatsu@debian.org>
Date: Mon, 8 Aug 2016 19:09:59 +0900
X-Google-Sender-Auth: 4eYqOQ9pgRZHNsJHe4mlU8KW0rA
Message-ID: <CABMQnVLd=-S__w==bheAeTwg_hkdy47F8=b+w0h0ZB7L65qNZw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mmc-utils: update to latest git revision
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
X-List-Received-Date: Mon, 08 Aug 2016 10:10:31 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2016-08-08 6:19 GMT+09:00 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Sun, 2016-08-07 at 23:48 +0900, Nobuhiro Iwamatsu wrote:
>> From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>>
>> This commit update to latest git revision and add SRCPV to PV.
>
> Why do we need a git revision of this rather than a released version?
>

mmc-utils will change the revision of Git in version 0.1. We are using
the now of any revision in PV,
we do not know from version of package.
Because I want to be seen that this revision from the package, I has
been added SRCPV to PV.

Best regards,
  Nobuhiro
-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6

