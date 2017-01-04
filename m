Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id CF52E71978;
	Wed,  4 Jan 2017 01:13:11 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 2so751485uax.3;
	Tue, 03 Jan 2017 17:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3obOw5r5mIbxNSqRVInmALHpvRjZtXv4N6n6gKT0J0w=;
	b=DD423+WcYBaY3I48uctFCOW7wNiZgv2VmYfeiKUx0sEX5E42i++K/xCELZLhg5+L1N
	Mg3EuJroVoWE9dhI+BIg1dWvkeepUhfef3l5P//I+H7G3itJgWfCyoL/0eNgSNFpPYnr
	UPKkgJn18O+BXUKs7TXcPNtjsq001/TfQFLRiuj4/DJAdQpgtIXEUDv14TWNfJhK0cMx
	ZAXWEyjmB2YKsx6Cim2MiwhEmq2p9mVBMEhUZf5fFfMCnP78Lja92bsrkovWy0zhjSUX
	3QzPnnn9k0hAuetoWhzEVBgZM8uBiVKdo4/lVliNHvBmh+pfG3EDPqoGsxzAln2Qe+Sf
	cLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3obOw5r5mIbxNSqRVInmALHpvRjZtXv4N6n6gKT0J0w=;
	b=b2RCpnRUcVBwOZpjOj9pYq1wI5z3zGkAphvZJdqYJD53r76GSuAOxAiM+ITwfnLa4Y
	oReKosutPBmaGiEgzgYt8m7VhdtMo3SXtRA4AkfVSGWdZc2U6zsd65MnxeV7GgTle/+s
	PPxpYhB657TskzAhzHGKaUdSEAZEVG5SNqEOR1GerWHALdYdmZubLmvzbwDS0Y8x+wUc
	CB2DpOjI26fQZgzAMxH+/yvfnZOjCWUfWviu+2uPYK82KScbeLfkn6cZ7XahJzuYYnZk
	GBxzYp8jDf8U3UqHihdH806fryX+418+2NwvI5tSDTA28qi7al3RRShpJNVjyZzAkxZ5
	LCdA==
X-Gm-Message-State: AIkVDXJliWKAXQgtOrcP4A7m+CWVLN99a1probEKemhv3IVEesW6Fc+cJqeRVaLFtnLeVEPbE5gSnaqR3fVq/g==
X-Received: by 10.159.37.227 with SMTP id 90mr47837279uaf.67.1483492391633;
	Tue, 03 Jan 2017 17:13:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Tue, 3 Jan 2017 17:13:11 -0800 (PST)
In-Reply-To: <65082de4-2ba6-3b18-1845-00b2d637404e@balister.org>
References: <65082de4-2ba6-3b18-1845-00b2d637404e@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Wed, 4 Jan 2017 02:13:11 +0100
Message-ID: <CALbNGRSrXLdfUK3U2bXr20P+fFm4ROArGPRi9Ag=AhXbGjUv+g@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-members@lists.openembedded.org"
	<openembedded-members@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Stand at FOSDEM
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
X-List-Received-Date: Wed, 04 Jan 2017 01:13:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 3, 2017 at 4:32 PM, Philip Balister <philip@balister.org> wrote:
> Every year since 2007, OpenEmbedded has a stand at FOSDEM
> (http://www.fosdem.org)
>
> From the first year:
>
> https://www.flickr.com/photos/32615155@N00/405229708/in/album-72157594561002629/
>
> Belen and I are sort of organizing this, but both of us are also
> involved in devrooms, so we will need a lot of help manning the stand
> and getting some demos together.
>
> Demos should try and show how the project makes embedded work easier, by
> showing tools and/or cool examples of devices using Linux built with
> OpenEmbedded. In previous years, we've shown toaster with data collected
> from demos on the table. Collections of devices running images built
> from the same recipe and interesting products using Linux by OpenEmbedded.
>
> I'm happy to try and organize demos and staffing, but I could really use
> some help this year, so if you are in a position to tak ethe lead on
> operating the stand, that would be a huge help to me and the rest of the
> project.
>
> Thanks,
>
> Philip
> --
I could bring along

1. Raspi2 + Hifiberry + Speakers + Midi-Keyboard + Xbox-controller
2. a SDCard full of desktops/multimedia/office/games using 1.
3. 2 days time
4. ?? - let me know

Andreas

