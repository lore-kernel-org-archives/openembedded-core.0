Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 68D7C79023
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 17:02:45 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id n6-v6so16984293qtl.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 10:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NIPjeFNOc8jHpRtd5HTj9YkvLOwzlV+rps1wZQepiis=;
	b=Ae1Ui6EqDOy5zrq4bfAuUyr8UjwFyTELKBjisAFIOmtychJ7yJA/w40qHGKQ2XiEn8
	4pHkUQk2Oa7tj2Pbls9HRYWyPRBTlfQGwyTFImE7ufjnNAcvEnzeT22J7b8MEZG5Bkzl
	RDBbohLFfAHq2iqI/nRyrGGh/YxGgnM0541YkoWgv8i5WJIbVPKkK1ohKBwkTmDV+ctr
	j6NB5YuZ1nUiMNQb2OKi2Ns8amc7DfvRg/V1pqD3JnRxbqRUb6IOuZsxiZE18Fq/n5g4
	KJVcxAsj541aEIAwNcSUPf4OoK0Qz8cN5qMoIlOjqndDfiMF+IwVjjs+Nl8Ur9vqTZs+
	sNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NIPjeFNOc8jHpRtd5HTj9YkvLOwzlV+rps1wZQepiis=;
	b=q8VF/WyOC9z927CwmYgwD1bPYV09+Dj7+4KuphU1kX2fWM4t6RKqHljMdmQp5qSFh7
	mCLJWsudXYpOFzcZcSHd7k43Oqfoq5vSabrtQ9HPAJ3E1IWcdgdYi6CFMHC3R/9DoISL
	zqxf9SCF/mhrkJ7lv1DLGwclItyINhxc3ct2k/AqeDF93Yre1CzbPUNtF3/LmcBplpjV
	Wn9E+/dBhugYvtaAiCpaa2yriMTqa53I8wke9MaAOQZUHEQedJjy9bq4+q5gMXrrkinI
	6KAX16wn37CYNNTYyo5g25dqPeUfQSKd79r1j3SeeiIWfW7+QLcznXyzJ6M2W1C5cRS6
	cqCw==
X-Gm-Message-State: AOUpUlEEi71sncq4//LGsfGY15rFMp7z16X1x+WmWFfRsF3Xa+q3hAGc
	MmnYLEsJ/t9UMX4BZWVpOOzRQLhAshNY0LjY33U=
X-Google-Smtp-Source: AA+uWPzFvrbhez9qyyla4MwAg9XKhL7Ps5z8REdGF94gLA8MwsRjsw4yUhlfTFr/yxcff6fcgTd7dVTi6B1UGdtAfHQ=
X-Received: by 2002:a0c:f791:: with SMTP id
	s17-v6mr42463583qvn.194.1534784566018; 
	Mon, 20 Aug 2018 10:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534699224.git.raj.khem@gmail.com>
	<f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
	<45c972cc-6abf-8df2-e4db-ee84abd49dc9@geanix.com>
	<73a419cb40a67f5e2dfa71820c048645583a1d75.camel@linuxfoundation.org>
In-Reply-To: <73a419cb40a67f5e2dfa71820c048645583a1d75.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Aug 2018 10:02:19 -0700
Message-ID: <CAMKF1sqgKJ8-inLr3XHzgCLp5+kAHvFam0da5h65OE71c4NCpA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/9] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Mon, 20 Aug 2018 17:02:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 20, 2018 at 2:43 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2018-08-20 at 11:23 +0200, Martin Hundeb=C3=B8ll wrote:
> > Hi Khem,
> >
> > On 19/08/2018 19.23, Khem Raj wrote:
> > > - Import from meta-oe layer
> > >
> > > - This is useful for many packages where CR-LF
> > >    needs to be adjusted, many recipes depend on it
> > >    e.g. meta-multimedia libebml and so on.
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >   meta/classes/dos2unix.bbclass | 14 ++++++++++++++
> > >   1 file changed, 14 insertions(+)
> > >   create mode 100644 meta/classes/dos2unix.bbclass
> > >
> > > diff --git a/meta/classes/dos2unix.bbclass
> > > b/meta/classes/dos2unix.bbclass
> > > new file mode 100644
> > > index 0000000000..3fc17e2196
> > > --- /dev/null
> > > +++ b/meta/classes/dos2unix.bbclass
> > > @@ -0,0 +1,14 @@
> > > +# Class for use to convert all CRLF line terminators to LF
> > > +# provided that some projects are being developed/maintained
> > > +# on Windows so they have different line terminators(CRLF) vs
> > > +# on Linux(LF), which can cause annoying patching errors during
> > > +# git push/checkout processes.
> > > +
> > > +do_convert_crlf_to_lf[depends] +=3D "dos2unix-
> > > native:do_populate_sysroot"
> >
> > Shouldn't the dos2unix recipe live in oe-core also, when a class
> > depends upon it?
>
> Not necessarily, we do have a number of core classes which aren't
> directly used in OE-Core but are needed by many layers and having a
> common copy makes sense.
>
> I'd agree it is good to try and have something which tests them though.
>

in this case, I think it would make sense to bring in recipe as well, since=
 the
motivation to bring this into core is to unlink dependency on meta-oe layer

> Cheers,
>
> Richard

