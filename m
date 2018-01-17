Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 613D071DEE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 02:15:31 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id f3so12507748wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 18:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=nXxz7sLQg0kPCpRDJDN7Y6RxOcGLKpkczzLCE0L2LXI=;
	b=Moe5bcVVAaxZkFLtCN+vSca8JeIJXIqcFXiZ1INzCJpdFuBZDbgZ1JixQmaKMIdKsW
	eIGjV9YrKn74YQpj0/E8r8i1gB5JDvMdoqx01VREPpP68jxhim2ZhFu2/gpSg2I1ArzC
	qjasCs+8S4bX4RSYH3qP4tzluS3KvmwbKXs3kI1/ei3Ks+fEFnGfB0CV3GrE7+mldVbB
	MKU9rzQFhH7VSwZV/NQSri5jRs+ikbnvbBuIMAzoEYH7oW+p1eWZq+KZ/KVTmH0KOZUm
	nK5PiIPLY3MfeA8ozmeqMQIkVQdRktkBYEulek8WFywmk/JwSffnSHHZKT9m4okLoWUN
	1LYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=nXxz7sLQg0kPCpRDJDN7Y6RxOcGLKpkczzLCE0L2LXI=;
	b=Z9crMJko0Po66OboNuhM7FNjldLAFvPDlxZnSwJ9m9p3xwHWp7gyVuNm93L3TSeeds
	CGs+OMpn/D+/LdibDC8JE0x/A6gSlJrGzLNf31KPDxBwhyiXAB2CzjlGsFN5hzQk7EvY
	SbdLVU+FMUYJT5OkbHQxZTI9io4mobulJaqD/vw7lDBW2DeGDjvi8yEIoiXkZvwOEUz6
	r7OUvce6u0X3nGT69c76wEWI5Z4Ap2SkN/ZKuc0fCOvoxfxVFKzx1hZxfArLOCxE4UqO
	DQdaVLpcadPDC0g7dkN2B5KmeV9qzggfRTLhHP4eBrphWP8NopljFcsZy31I/CbOCCcs
	N2Fw==
X-Gm-Message-State: AKwxytc6NxutJogwk7+rZgYQdvqa2NgInmvml2D/b59qve4hOys7S+3A
	YXq56u8OcHApI2pzwkGh52dK4bkUN5ifq9OzAh6WUQ==
X-Google-Smtp-Source: ACJfBou6Zd/esbBp3cHzP3PvHhssvZJ+MoOtURWqkEMq1ioTNZ88XbFYeb82KUiCGIAmfhBJtuCXH/GG9/UWetommy8=
X-Received: by 10.28.247.25 with SMTP id v25mr881400wmh.10.1516155332046; Tue,
	16 Jan 2018 18:15:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.190.132 with HTTP; Tue, 16 Jan 2018 18:15:31 -0800 (PST)
In-Reply-To: <20180117004018.21928440002@auh.yoctoproject.org>
References: <20180117004018.21928440002@auh.yoctoproject.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 16 Jan 2018 18:15:31 -0800
Message-ID: <CAJ86T=X=KXEZ9BxNkkKcdbwNyqwNktwjohOenKdurt9u8ZfOTA@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] Upgrade status: 2018-01-16
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
X-List-Received-Date: Wed, 17 Jan 2018 02:15:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 16, 2018 at 4:40 PM,  <auh@auh.yoctoproject.org> wrote:
> Recipe upgrade statistics:
> ...
>
>     TOTAL: attempted=120 succeeded=45(37.50%) failed=75(62.50%)

Giving these percentages to two decimal places seems a little over the top.

Perhaps the stats could be made even more readable by just giving the
pass rate, instead of both pass and failure rates, e.g.

  xxx: attempted=120 succeeded=45 failed=75 (success rate 37%)

Sorting the lists for each category would improve readability too.

