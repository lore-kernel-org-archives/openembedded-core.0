Return-Path: <raj.khem@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id CC1BA6F1A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 16:34:12 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so1218677oag.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 08:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=R6/U05r1UZkqGTxISEPr9iwzOaP99RN2vao/KZzevN0=;
	b=JUuGqRxIvY4pQyuMyv2b3Dj0n7OqHgr8jcLyDgmtFPIGRN+4rba1Mv2a3UsbvQv4sB
	7hNJ5cNUqmxAFhUR+Tieuc0d8DLainmcfZ8NgDZmuyGCLZScvODkgoQ322ZFdJmb/cu1
	1kb4od+vdJ1Q8tKx88rtvK47GJv3QvYKkg0Zq9w1gf6aL88q4xYb51oGFWqKFse7SFrv
	O02RrdejjvKH/osACJOM4UQXnSIUrRTUWchEWodw+UnWLsPmulwowX/7BRydiWYT4WZJ
	J8gUy4OMdqwgLEq7qEo7JaEgQbN3/w0yOeT0Ijn12g8xePHbhv2kK19k5WrR6aoBlsIn
	S7WQ==
X-Received: by 10.50.60.103 with SMTP id g7mr1066311igr.20.1393000452985; Fri,
	21 Feb 2014 08:34:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Fri, 21 Feb 2014 08:33:42 -0800 (PST)
In-Reply-To: <1392996116.1560.14.camel@ted>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 21 Feb 2014 08:33:42 -0800
Message-ID: <CAMKF1spukjj3Q1VECdKq5GpKR=wQOVjiqQp2+oCoGkHnX8by1w@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
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
X-List-Received-Date: Fri, 21 Feb 2014 16:34:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 21, 2014 at 7:21 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> FWIW the git recipe I was using enabled compat-libs...

I have tested both combinations. I would suggest that we drop compat-libs
if there are few packages needing it lests fix the packages instead

