Return-Path: <gizero@gmail.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id CEDC86C0E9
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jan 2019 09:13:30 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id g76so4780627itg.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Jan 2019 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=KWGJyr8Jue63KgHmhO9/b3O6IcIxCv4CCeDJhgqmR+Y=;
	b=WUb0VYmj4SyzjZDDU0jNNV7PMxhvu+ubu4eJsOAhe0cwqZ9FTJM306QczHn9WUvJ3I
	G7AQfa9kIvTRiDdWd6X68SFzYm5LAPxugUaJAcriREk39wtNZd2d2UpAoJpotK7Ug5MP
	/Ta+6EfGcgQaYHfVHlfgVO9FobOdZLfmt46vf4v30DTgiclfXDO+CiZnduHDzeJdYdPI
	MIteuAa8HQBqUVJ1pQbQqhRd62nL2aAe8flSNHyz0h4cL68AUajbcc4bS+69YSlPaqeV
	Ly5f3PYNEdTtTODkbKby3j1+djpPl34zZ6yBPYxlc5AXgAMtN9KjcduML60h2heN4/c0
	Vcig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=KWGJyr8Jue63KgHmhO9/b3O6IcIxCv4CCeDJhgqmR+Y=;
	b=dBuGjvvC2sbmWhYqoMN3vcvbNs14TUQX6k+M3O8GJ6ZB6sF8EdQUoBGdBooPBThvUz
	8WAA+FbIe6y2dYZRBRMXmF9QSvod/SoW3g/arjOLqJ9gY6RKJ9x8JnTpxLEw5Ld9MvGq
	DnsC9xEiFSfdfIAFYqcr5y+4RQH4OiYQa8UhwhGP5oeICqdTUsJHxo8vKiziTqm74Rfx
	3/IKT8nFqf12vrRtorwgCP4RY4PkEhFnLX+s08+foCb0H7kbC21z8ymfOfuLogrQYGJ3
	QoZ5ydnFMpZuAwSMbDsntGNimPNYx0wXm+dVepsDQGwz7Qllh73zGjqP36pGuZeog8uj
	DEJg==
X-Gm-Message-State: AJcUukd/iMyNqdHb35jHxwp+fh/WQPP7+BieI9ZFZgvaeSGaso3PLx2c
	G61MwqZywGOVrzu8JDNuwZH597rmmRAPb74Rloc=
X-Google-Smtp-Source: ALg8bN4dNRvyZ2rRUIE4mCU95RdRNvlMFdmn0uEHQjn4z9dBiQLYTs6GYGzB3OKrlkFXQRVZs4Q3CYZ13hNlvwmGfFg=
X-Received: by 2002:a24:5d08:: with SMTP id w8mr2885758ita.90.1546679611601;
	Sat, 05 Jan 2019 01:13:31 -0800 (PST)
MIME-Version: 1.0
References: <CAPphmgbFBpuix8sEEY4AdWeY3Kb6-R=3t3ubVd93Usrm323CEw@mail.gmail.com>
In-Reply-To: <CAPphmgbFBpuix8sEEY4AdWeY3Kb6-R=3t3ubVd93Usrm323CEw@mail.gmail.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Sat, 5 Jan 2019 10:13:20 +0100
Message-ID: <CAC+thW2DsP8KHuU7-uC4XrROZcYKbM_pyUmQS_e2YSSD9rLmMA@mail.gmail.com>
To: Jate Sujjavanich <jatedev@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Official sstate premirrors and builds
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
X-List-Received-Date: Sat, 05 Jan 2019 09:13:31 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

On Sat, Jan 5, 2019 at 4:21 AM Jate Sujjavanich <jatedev@gmail.com> wrote:
>
> I setup a machine on AWS and wanted to use the sstate cache mirror at sstate.yoctoproject.org in my site.conf.
>
> Bitbake does not pull the artifacts from the mirror despite the uninative C library. I have tried checking out several tags and then pointed to the appropriate directory on sstate mirror. For example, yocto-2.2.2 and http://sstate.yoctoproject.org/2.2.2.
>
> Bitbake populates several license setscene tasks, but no native packages.
>
> Does anyone have this working?

I remember I tried this some time ago and similarly had no luck with
"official" mirrors... I guess it was after sumo release on an Ubuntu
16.04 host. I remember I used default local.conf and tried both tagged
commits and release branch tips, but I always ended up with full
builds with no sstate object being fetched from the mirror.

