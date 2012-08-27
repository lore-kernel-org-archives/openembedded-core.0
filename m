Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6377-000462-9j
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 19:28:41 +0200
Received: by eaad12 with SMTP id d12so1031450eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2012 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=I/IP4h+BQ1fgq7N/GpBT/T6p0XsKHBGhhMnohJtGQvA=;
	b=LgMj4iCZy7EkK0Jch+X0SHiu6pMbGjfE9VN6pF7KCY3sAbQi4l7octvGtT/GCgUmRU
	b2ewbPnpdfPsKkZdvIM9pGQYfy/ikFyEn5E8A1dBDKglPl9tnyPAcb0uUJdUXH2pRM4w
	IaZtTk6SrDnSCfzhU67NrK7iZTZr6PjnyYD9RQligpCaLUDyXlWdjiqMb9pbSeVFMO8W
	aNeUceX2OIYOqAcPQoBn1tbPNKc/iEUupB2CfDrgNRnloXsK+4H+ybkQ64cXpgowQ8vH
	8ROED8E09uM2xJjPqdKi5q1Qxf88J/Cu0D49cZQJJg03Wy0+p6jP6sO6duwrJP403fDR
	4b4Q==
Received: by 10.14.202.131 with SMTP id d3mr18668888eeo.32.1346087780473; Mon,
	27 Aug 2012 10:16:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Mon, 27 Aug 2012 10:15:49 -0700 (PDT)
In-Reply-To: <CAOHjBZvhma=hbA0t6cdEM19QdfpNxDC0uAg-aT5xOiRLEPCk_g@mail.gmail.com>
References: <CAOHjBZtdvx616YgP-HeXE6xFgrP0y42BJEfPh5r6uTRmoCYQnw@mail.gmail.com>
	<1365367.9tL33RJjyz@helios>
	<CAOHjBZvhma=hbA0t6cdEM19QdfpNxDC0uAg-aT5xOiRLEPCk_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Aug 2012 10:15:49 -0700
Message-ID: <CAMKF1soVEBoUYvAt9J9rpEaoHvV80q-yk7jPYNMJG_y5ognb8w@mail.gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How can I append .inc files?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 27 Aug 2012 17:28:44 -0000
X-List-Received-Date: Mon, 27 Aug 2012 17:28:44 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 27, 2012 at 2:55 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Many thanks Paul for the clarification.
>
> Cheers,
> Giuseppe
>
> 2012/8/27 Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> On Monday 27 August 2012 10:05:15 Giuseppe Condorelli wrote:
>> > Is there a way to append (in private layer) the .inc files other than
>> > the
>> > .bb (bbappend)?
>>
>> You can't - you can only supply your own version of the inc file (provided
>> that
>> you can ensure your version is found first via BBPATH), or bbappend every
>> recipe that includes them - the latter is preferred.
>>


if you have a need to override an inc file then I would suggest that you see if
the change can be done to original .inc file and upstream it


>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


