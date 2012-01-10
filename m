Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Rkdpu-00059b-GS
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 16:42:09 +0100
Received: by qcqw6 with SMTP id w6so2581714qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=/ez1FLe+ukzRh7XvhjfoWQ1BeBWTeb131ZbCRrHB2ZA=;
	b=QeTgvFxGp4zBvtBGddgWMM+M6uRATXKbgmRxl0u5BiWHS2fbWyaBjoEP3M0fYCa1k0
	OD3EGZKg/aa9vpCrnTJ9+D1WJynXcteOU3OkOwaq52ITZmW97QQ9pIfjHPp/FPfXi6Qh
	AP43NUdGA7SvevdpY1obpXXDEc6mPJZpGvPe4=
Received: by 10.229.78.211 with SMTP id m19mr7585179qck.156.1326209673704;
	Tue, 10 Jan 2012 07:34:33 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Tue, 10 Jan 2012 07:34:12 -0800 (PST)
In-Reply-To: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
References: <1326208678-17244-1-git-send-email-andrei@gherzan.ro>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 10 Jan 2012 08:34:12 -0700
X-Google-Sender-Auth: ktSVPbj1iWR6ejUYK7baowZv1O0
Message-ID: <CABcZANnzU_5LTeRV=UjPiUWn6rqnZS6RR_yhsUKE_C_ap-PZ9g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: flocirel@gmail.com, Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: Re: [PATCH] license.bbclass base.bbclass: support for 'or' operand in LICENSE and for SPDX license names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 15:42:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2012 at 8:17 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> From: Andrei Gherzan <andrei.gherzan@windriver.com>
>
> A new function was defined in license.bbclass in order to correctly exclude packages where OE-Style licence naming
> is used. In this way licenses as GPL-3, GPLv3, GPLv3.0 etc will be excluded from a non-GPLv3 build. This function
> takes into consideration if 'or' operand is used.
> The function defined in license.bbclass is called in base.bbclass where packages are excluded based on
> INCOMPATIBLE_LICENSE variable.
>
> [YOCTO #1884]
> [YOCTO #1844]
>
> Signed-off-by: Andrei Gherzan <andrei at gherzan.ro>


Out of curiosity, why are we using regex for this when we already have
license parsing in the oe.license module which can handle the OR case?
-- 
Christopher Larson


