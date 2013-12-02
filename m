Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id AD35A6D847
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2013 22:08:01 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id o6so13846650oag.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2013 14:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=5z6180czLu6ERYM/TIoT2sGCO9uwfGnKcr3sjPRESbI=;
	b=IGIVXqFF4425V64TTta54JQfnwOIgTiJspNV+OZYdCwOPxL4VSa92fDiseXfQ+VurE
	GMt8g7lE6litcUDkLVPe/UvcbbU+MfLPM9lHRLNYRsM+MMMBiZ3ipeR7C6XtjTb/A3jS
	nCrVRkKZThb8Xz/hVsPipvOqTsohsA94VRHTxh6czm1bFDb/Op4OwjTz7w++X98UEBCz
	sJJ+uTrDuug2Mjwo1V88HNzz5FeNxPOfVoo5qa4l/cMkTaYkfQngmvMIFDt/3uXoz7QQ
	LTZDssmkK9p/GvhxaTNDknGhSrv5qGNxEG/hqGJep1hT3JJguZvwOZrgve4a2+RnZQT1
	03fQ==
MIME-Version: 1.0
X-Received: by 10.60.146.229 with SMTP id tf5mr56301126oeb.27.1386022080968;
	Mon, 02 Dec 2013 14:08:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 2 Dec 2013 14:08:00 -0800 (PST)
In-Reply-To: <529CF916.5030703@windriver.com>
References: <1382561247-30349-1-git-send-email-kergoth@gmail.com>
	<529CF916.5030703@windriver.com>
Date: Mon, 2 Dec 2013 20:08:00 -0200
X-Google-Sender-Auth: hK4V1nN6SI5quBG6Z6wZ6I8kmbU
Message-ID: <CAP9ODKrEE+r=LeUdVWXW1Qy7dmWYNMUA7KNiSADQnXFOHO1UDA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: fix nondeterministic PACKAGECONFIG processing order
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
X-List-Received-Date: Mon, 02 Dec 2013 22:08:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 2, 2013 at 7:18 PM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 13-10-23 04:47 PM, Christopher Larson wrote:
>>
>> The PACKAGECONFIG flags were iterated over using dict.items(), but this
>> returns the items in an undefined order. As this order determines the
>> EXTRA_OECONF append order, we can get EXTRA_OECONF which are functionally
>> equivalent, but whose contents differ, resulting in not using shared state
>> archives we should be using.
>>
>> Signed-off-by: Christopher Larson <kergoth@gmail.com>
>
>
> Robert,
>
> Can this commit be pulled into dora?
> More deterministic behaviour is more supportable behaviour!
>
> It's:
>    843a5dd
>    base.bbclass: fix nondeterministic PACKAGECONFIG processing order
> on master.

I agree; this is a very good bugfix  and improve sstate-cache reuse.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

