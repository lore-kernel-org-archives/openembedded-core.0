Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id C26B87E7D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 13:42:59 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i10so4735258iol.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 06:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IeLmdY3RVpEI8MrnHL8WBDz7RFBbJC4rmduAu8ZJgQU=;
	b=JOgbdTkueQLfSmsQlOiq9rGRiwoqIV0qBvRStLS9M1KeelAGhGX0l/Upr2Y+r6+8dW
	YLT0RQ8IRUrjYxyPGtMzlPXBI7b39JatQANOOxkm/BXvh/Ew4Yn4d1xb2HRKJ0MSyeSV
	1Qhi6qmQ4HjNTH9COvuEtYF0Ul8Q32YGFWdTiEsBq4Vi4mVkIPAs4TiT+eMBytJDzVml
	0ghtFz+7ef0RlxFbmZ4XnaokkXT9HR57WfagGcOLDTm+h6n3hJ2LM8R8dHhXjN088PYO
	RGeu3cCp9aXh1CrLpnWZbn8+9R2qkKGddoN24dWF8JvhP4jhAJzapPdh6A7tDLrYzqsz
	Kguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IeLmdY3RVpEI8MrnHL8WBDz7RFBbJC4rmduAu8ZJgQU=;
	b=ORBFz1IQ78uuIgk729IL9laXHJc2qavuR1Lgl5CKpZdB/FV4EomqX7Q95muDUYbE/0
	RwMYdrYvUmpMmkqOyGqZ1X/Lmymeku9m2YZguqTXAdMtum5m9GkldEA92+HZzkly7LGJ
	gdFa45jDA/yuYQXLQDPrmV8kk8vKscvaClVqn1zO1/GITxv6rNWW2mkGMmh9m6soLcPV
	3z+QPJnKOqWlIB8uv9C66kJt/hs/0qHunTogEC54UYafkYjby13nEEDtuiZatclHrUEK
	cxqwFYeeQIJEpNqVh7JZoZzWt5AmM+H6X98v2vjfajBBl9RSqbaxB0/+2V8le33U5ync
	uPYg==
X-Gm-Message-State: APjAAAXOeQcdYYFXJMxoYxc0fuDwNvWquJ8K06DsnEc0gS5BvY9nOA2n
	bGCvX7isfkfcxlwBoZnsKf1i+GovTIc7LtjP+gs=
X-Google-Smtp-Source: APXvYqzKGBJeMgz0qTPBOYmj5ALgBLR+Cu+JVVW/xSxYKvlJOYA0999Eb4P3NhjjE4OzhMS01TEVFTrSf4wncoaiI6s=
X-Received: by 2002:a5d:890d:: with SMTP id b13mr4451521ion.124.1561642980595; 
	Thu, 27 Jun 2019 06:43:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190627091115.5801-1-lemagoup@gmail.com>
	<0cac6cf6cad2694434b3c3f38f3458d6c9b80cc1.camel@linuxfoundation.org>
In-Reply-To: <0cac6cf6cad2694434b3c3f38f3458d6c9b80cc1.camel@linuxfoundation.org>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Thu, 27 Jun 2019 15:42:48 +0200
Message-ID: <CAEz4NHomfyPKEf95sjzPnEnE3X35TY9=qjBBnZwDpNaFnhD5QQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] cve-update-db: do_populate_cve_db depends on do_fetch
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
X-List-Received-Date: Thu, 27 Jun 2019 13:42:59 -0000
Content-Type: text/plain; charset="UTF-8"

> Thanks for the fast turnaround on the patch. This seems to move the
> problem to:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/990/steps/7/logs/step1b
>
> :(
>
> Perhaps we need to skip the recipe if the class isn't enabled? Is that
> the reason its failing like this?

It is failing with 'sqlite3.OperationalError' exception when opening
the sqlite3 db file.
I reproduced the bug by removing the ${DL_DIR}/CVE_CHECK directory

I forgot to check that the ${DL_DIR}/CVE_CHECK directory exists before
creating sqlite db file in it.
I'll send a v3 patch to fix this.

Pierre

