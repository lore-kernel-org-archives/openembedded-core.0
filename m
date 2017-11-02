Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id C4309782A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 11:28:02 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id v105so1189075ota.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 04:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=UtpsX0jNhEuYHtDRaM+LwXRJ94Umdvtmlm4YvFJFmnQ=;
	b=AeKKNHLw3o6Hnl6CYkG4EmmiShSPrFKl8onrUyx9QoSFBTD2Jlw83ixTDgiZEP4gaD
	88Fv0u2zaIjQzV2NfTA5+moX7QSBFkgoTHq2xYsH8dwKQmKKuyD8KDtnTfVIIMQ8sPG7
	K1Vjob+OE5zVjGyY6WiFQb2iSpQNsBIpErORDpzKiwKGZWydLO37CeG4DVyTNMWxYehW
	nGrsypaZzGSnorOgsX78uCPqk6qmy3nKZ0R50GFz3ZrKgiiIV6o4v/USalsQxlaWtyUX
	5jENhb2AE1rDraHTX9lhQRuRRoDNVhtdvktzkBd9eeBuzd5bxoLDkTVsEzpd/g3kiAZd
	YjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=UtpsX0jNhEuYHtDRaM+LwXRJ94Umdvtmlm4YvFJFmnQ=;
	b=qyn/LC2PARN6bY6NRvnoMuE5Z3ZbPw6GGoLfH/FPi2OMZnerUV32Oe+vrrRewhqEyt
	ljdr2Iekze3yXCX+LDqwFJzt6Qki+eSigxzWq6IagkwIYJPhLXiwBX/S67od0EzsWeTv
	IAsWpjb9KlJIvzvWM9w3L5rM5wY2rW6mfPZH9N2eIH7QdINmYmwwsFaClgiGKHuTz0IS
	GECQCVXzN+exgi6tzcuDhmk4/8dhOQ9LM9XFrzpUyuu1BNgXyll/fcu67cwouubBbLkK
	kIRSNNoydySCKSdYaUxhoU7oghHAiwQS4uS0MUAFRsVWO4reqpHxV+8SSG6G8STkRJsS
	pM6Q==
X-Gm-Message-State: AJaThX4RUeCACZtn0pZwdTIlGSOGgxZ83WQ/1XkoOyddhn71n/H3Efq5
	nxcTFTx6fEfzMULbPXN2ROOtRzvR
X-Google-Smtp-Source: ABhQp+SJs0szzQYX77nHFsc91KDkOpYuuhe9f0b8DM5/wV+T+MPhpouBgv3w2Acscpu5uZbnQoSYwA==
X-Received: by 10.157.67.153 with SMTP id t25mr1988430ote.497.1509622083346;
	Thu, 02 Nov 2017 04:28:03 -0700 (PDT)
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com.
	[74.125.82.175]) by smtp.gmail.com with ESMTPSA id
	x35sm1403967oth.21.2017.11.02.04.28.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 04:28:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f175.google.com with SMTP id u41so1193120otf.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 04:28:01 -0700 (PDT)
X-Received: by 10.157.21.54 with SMTP id u51mr1941701otf.215.1509622080812;
	Thu, 02 Nov 2017 04:28:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Thu, 2 Nov 2017 04:28:00 -0700 (PDT)
In-Reply-To: <CAJTo0LZer8ptGnSavgbUcLhnt=YTBUzX-FJw47gthKnFtTKqHw@mail.gmail.com>
References: <1508587571-4733-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYFFZ-DOhZAepuJnXUgOTZDLcqxnWgj9F8-BLne_+wFvw@mail.gmail.com>
	<CAP9ODKoTc09+i4XOTwYfj9g+_=df13Gtk5TzyC2jSuxZqtZKsg@mail.gmail.com>
	<1509573880.28159.39.camel@linuxfoundation.org>
	<CAJTo0LZer8ptGnSavgbUcLhnt=YTBUzX-FJw47gthKnFtTKqHw@mail.gmail.com>
Date: Thu, 2 Nov 2017 09:28:00 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpnkn3L1CafiuU9JSaoJyq-QqZwnQXZ-RK_rn0pFnmbFA@mail.gmail.com>
Message-ID: <CAP9ODKpnkn3L1CafiuU9JSaoJyq-QqZwnQXZ-RK_rn0pFnmbFA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe-buildenv-internal: Fix finding build directory
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
X-List-Received-Date: Thu, 02 Nov 2017 11:28:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 1, 2017 at 10:51 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 1 November 2017 at 22:04, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2017-10-31 at 21:25 -0200, Otavio Salvador wrote:
>> > On Tue, Oct 31, 2017 at 9:16 PM, Burton, Ross <ross.burton@intel.com>
>> > wrote:
>> > >
>> > > On 21 October 2017 at 13:06, Richard Purdie
>> > > <richard.purdie@linuxfoundation.org> wrote:
>> > > >
>> > > > diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-
>> > > > internal
>> > > > index e6cd141..abc5aff 100755
>> > > > --- a/scripts/oe-buildenv-internal
>> > > > +++ b/scripts/oe-buildenv-internal
>> > > > @@ -105,6 +105,11 @@ fi
>> > > >
>> > > >  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
>> > > >  BUILDDIR=$(readlink -f "$BUILDDIR")
>> > > > +if [ -z "$BBPATH" ]; then
>> > > > +    BBPATH=$BUILDDIR
>> > > > +fi
>> > > > +
>> > > > +export BBPATH
>> > >
>> > > This breaks the use-case of the user switching between build
>> > > directories as
>> > > re-executing oe-init-build-env doesn't change BBPATH.
>> > I know and that's why I asked for a warning! ;-)
>>
>> My patch as it stands clearly can't go in.
>>
>> Our options are:
>>
>> a) make that codepath unconditional (which may be no bad thing) and
>>    use BBPATH
>> b) use a specific variable for bitbake, the script sets BUILDDIR
>> c) start allowing the external code to set TOPDIR directly
>>
>> I think I'm leaning towards a) or possibly c). I don't really like b).
>> I tried c) locally and its behaving oddly. a) is known to work.
>
>
> (a) seems like the right fix here.  At least, that's what I expected to
> happen...

+1


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

