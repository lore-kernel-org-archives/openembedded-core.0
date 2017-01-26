Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6706003C;
	Thu, 26 Jan 2017 21:39:17 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 96so23186476uaq.2;
	Thu, 26 Jan 2017 13:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5qp0jFO8uKNptB5l3gwMrNOHwahflaawd+bmPe6X2aQ=;
	b=qN4/c7ZcMkxXvqdnhVudVmiVSu0wznyL10xWZwAiSPFOI87irpU6+a7xfU9nfEvdEe
	fL/ZrDs8WnoNxd8HG09TwgtAnHClo925szGtVOnElv9IRpdCXzU8y1zxl1JerdWktzGF
	Irpofxkkdo3YiVXtCMcIMA83Ds6cvghTg4oKkmrZW4JLPFTh+PkmOTIVR62HxIZ4eD3o
	S+iG7RTN8cgbiQLH2IZCGMdv+854BVg99BxZNPAtxFYeI5kuzfD6Mbk7jle55h8qOjMy
	A0upJRrwROEpZdEK9ySCotcv7vn7rqoJjZiliBYIPBAEfWPTch6DpU1hqfQqVs5H83P+
	OfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5qp0jFO8uKNptB5l3gwMrNOHwahflaawd+bmPe6X2aQ=;
	b=GnZDWr0neJRs7lnmrQcRA5HV0FDsDyl8jq4igxu2bOgYquT6OVfmy/qF6o84ooU+GA
	kol+L2/6NCGoopocyV9u5TpXo3fG/Nhn8Jc2lzCSaA2P3BX8J4Ugx+BK71I5DeFkSjjl
	LjZllZDk9yPoleVQSAz7VALOpOQjeqmX++OqiiTq+j9xEb9XYQsK/tkDXkXkejUuF/vh
	iubH/SSx0Vb1dnme8XLlg8fPpE+cJBKeo0HTewYAAMT/y0zAaiJx7BjZ8F1P+YmjEGJO
	1JC9OUJbyoZwg4nKm9lwRTIobsO621Pigo6bv/W71iDJFC2Xb4Q+IsVBZ0u6t2Rzhxxk
	NCwQ==
X-Gm-Message-State: AIkVDXIENqpKyrgyFZvI+tCw4xQDiXQsD6OpumpYLpeylWN8DSbtYvJtWO6pyMzwcSmbQ6UQJSXQecnR0ZOiBg==
X-Received: by 10.176.0.149 with SMTP id 21mr2760698uaj.81.1485466758020; Thu,
	26 Jan 2017 13:39:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Thu, 26 Jan 2017 13:39:17 -0800 (PST)
In-Reply-To: <bbd8fb9d-8215-c73f-f4aa-b20523291ec0@balister.org>
References: <65082de4-2ba6-3b18-1845-00b2d637404e@balister.org>
	<CALbNGRSrXLdfUK3U2bXr20P+fFm4ROArGPRi9Ag=AhXbGjUv+g@mail.gmail.com>
	<bbd8fb9d-8215-c73f-f4aa-b20523291ec0@balister.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 26 Jan 2017 22:39:17 +0100
Message-ID: <CALbNGRT_H_Vz8b6vcfgJGWYEyVw6og4+zKmLjLZ6P+2O0oY6eA@mail.gmail.com>
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
X-List-Received-Date: Thu, 26 Jan 2017 21:39:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2017 at 4:30 PM, Philip Balister <philip@balister.org> wrote=
:
> On 01/03/2017 08:13 PM, Andreas M=C3=BCller wrote:
>> On Tue, Jan 3, 2017 at 4:32 PM, Philip Balister <philip@balister.org> wr=
ote:
>>> Every year since 2007, OpenEmbedded has a stand at FOSDEM
>>> (http://www.fosdem.org)
>>>
>>> From the first year:
>>>
>>> https://www.flickr.com/photos/32615155@N00/405229708/in/album-721575945=
61002629/
>>>
>>> Belen and I are sort of organizing this, but both of us are also
>>> involved in devrooms, so we will need a lot of help manning the stand
>>> and getting some demos together.
>>>
>>> Demos should try and show how the project makes embedded work easier, b=
y
>>> showing tools and/or cool examples of devices using Linux built with
>>> OpenEmbedded. In previous years, we've shown toaster with data collecte=
d
>>> from demos on the table. Collections of devices running images built
>>> from the same recipe and interesting products using Linux by OpenEmbedd=
ed.
>>>
>>> I'm happy to try and organize demos and staffing, but I could really us=
e
>>> some help this year, so if you are in a position to tak ethe lead on
>>> operating the stand, that would be a huge help to me and the rest of th=
e
>>> project.
>>>
>>> Thanks,
>>>
>>> Philip
Nobody?

Andreas

