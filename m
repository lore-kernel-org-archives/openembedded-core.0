Return-Path: <nickaein.i@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 54FE079179
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 10:17:53 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id x192-v6so397972qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Z+zQoB87SOt2Z0N3zRCsvvEgGFHMGKcGBQea4M+Antw=;
	b=e8yC/N72vK2kHImYK7aakJjY5Cf/qHK9+o5LZuV10wvhD2tLRbCBKXDM5gmGk9thso
	nlVIedoSHJfotWXP+dj2n7GVNE5qQNPEJeTcbe+fKpIxjSz+jUKE8n1MO/MfrbFm2W9b
	pZpb0yL3ScRVYPmG/JIcCxUEr+qfk0NVE5Rsfaq9cLtm+iree7aZoL10ssWv+/2ksBXW
	5TsLcIgL4t+OeFJPFoYn2GPxcmq6veOBKk+slWcUJB4KMI4ADAkQ18P0eTSL4Q7jupNc
	A9aYWvHApgQjd0R6O85TdwO3qLU61VcYdOhX7K0iFl3/HZTNh7Uw5ms4svvxBiR/z/5l
	PijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Z+zQoB87SOt2Z0N3zRCsvvEgGFHMGKcGBQea4M+Antw=;
	b=tHW5h9lIOz9Bst7FUjSPktWveyMaIRrC/Sq/zBqJcb+m/nF+TvSHueEF49fxfb7dRI
	r/zIUiRSuU3x4llLBJ3dajE2ZKq90uccKh2sZPA+6NUiHov/lpYITR9hL2a8OSaEowvR
	dQPZgstmMBKj7GmW2/4lSMicWvr257i2s3BdO1Rg3aBCVSymmb8S9UvUCNCDdiglDM1Y
	T9aybKpEkO8WEXlnEekaQ+t1aMgQL8GYPgI143KioG5wl3Pj4TEDJqEA5DLb0ImPvnVn
	uoF/mtQCyS6mHMEmWM23pobIBCq/dClwKr2lBAuDKhNCTIdP2Dj4XvWXMstdiMP7yvWz
	xaXw==
X-Gm-Message-State: AOUpUlGp4M98wbTV9Onqgt/z62i0kH1EHlkJPnmWXoyeDFrrYBa7HqLU
	NV8v2y8QbOmT9NQEp7CCcuzWrg1Yr+HDz/6l+LI=
X-Google-Smtp-Source: AA+uWPw6nEyLczbd5qWIgewCuTtG9PaNxOmQDetsZrdfMzvjFME1UJB4oWxPS4lfSOJgh5ZZZ7RmCHnoEX0u1c71HtI=
X-Received: by 2002:a37:c946:: with SMTP id
	q67-v6mr24418694qki.148.1534328274029; 
	Wed, 15 Aug 2018 03:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <CA+NJmkes2FzO3OvTVxjL075A5G_UMUjj_J-oc1BtjThTQ=YiZg@mail.gmail.com>
	<CAJTo0LaSOFApbGM6OpBWhkQUEdPk9qvXy-q+HWyiSVMku7G4=g@mail.gmail.com>
	<CA+NJmkdCRHgRLUZz0bm3sALnCt+o91g=rDG4Rht+Q8H5MVBj6Q@mail.gmail.com>
	<7746978f9f822c10c4236f96c1af43f6cd6ad735.camel@linuxfoundation.org>
In-Reply-To: <7746978f9f822c10c4236f96c1af43f6cd6ad735.camel@linuxfoundation.org>
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Wed, 15 Aug 2018 14:46:04 +0430
Message-ID: <CA+NJmkdCbUJeQrHqpZicsF0J8e-f4Ax1CnekxZdKAg666Rq3Hg@mail.gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: iotop: failure, python module subprocess is missing
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
X-List-Received-Date: Wed, 15 Aug 2018 10:17:53 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks. I submitted my very contribution the patch to oe!
http://lists.openembedded.org/pipermail/openembedded-devel/2018-August/119970.html

I forgot the --subject-prefix="meta-oe][PATCH" part tough. My bad.

I've also written a recipe for Agent++ SNMP library
(https://agentpp.com/download.html) which oe lacked.
Should I submit it as a patch too? (to meta-networking).



On Wed, Aug 15, 2018 at 1:32 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2018-08-15 at 13:03 +0430, Isaac Nickaein wrote:
> > > Yes.  Should be a simple fix. :)
> >
> > As a workaround, I added  iotop_%.bbappend to my layer with following
> > content:
> >
> > RDEPENDS_${PN} += " python-subprocess "
> >
> > This fixed the issue but I'm not sure if this is the *correct* fix.
> > There could be some other bug or some other higher-level missing
> > dependency that could be overseen.
>
> I think Ross is implying you should send a patch to OE-Core so we can
> fix the main recipe by adding the missing dependency.
>
> Cheers,
>
> Richard

