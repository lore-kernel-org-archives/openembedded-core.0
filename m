Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3CF76104
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Nov 2015 22:38:39 +0000 (UTC)
Received: by qkas77 with SMTP id s77so9774603qka.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Nov 2015 14:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Vw/qCgGjTpcUQ1nE8SThpR3wp6ScVyPp2WgJ1IEwJ7g=;
	b=GQprpWU+cEaFvz8p432zJguWQvA1/3ABfnlohSFsNQFfLXtQP9tSbNECm5YNdiqWyu
	u3iz4OfZIz4H920n9hNzJiKQgEdoqpKgu8k98q/QWuh5Ym9bfPxLThTC6gtyyPOrhEVV
	+CiChv8NaFDwXAyyB2YEPqB6ja+r+bhomvPnKYTWFfWwispcL9iHTNzz+XWGtPzYukge
	x47fRtn5RdjliLPMzzR0PVfDLsLEr8+929q8c7Qx3PPZPCPwAa7FQE+Mg36js7+fIGnh
	hRlli+Cifxg1uzwbVgs7wGsKubzbl0o8WFYiAgUDJKPrJNYaSfWSXA7xeCwnv1+tQE1F
	QXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Vw/qCgGjTpcUQ1nE8SThpR3wp6ScVyPp2WgJ1IEwJ7g=;
	b=DBtkVEkCskAVvuVvGHrlOJk+t4OhjfGVDgLHbexHH52vFPHoS4L7xwtByhCwOUyRc5
	wrkyupgBc9meYjsku/t0lJajhKd3zBSPNEGzGRO5TlHwUhKqzXZXyuW0VuxgMzcUjB2E
	JL6cGmcCIt55mrmkD/HEc/HtVGkk5zHNu0yEqGMhxB8TwuCb5iqLlMAbZsDcvn2F1O5d
	PyKQUoLZeo7MGHMfAOsFBSHIPavviXBTOJMiO38ivNjmVIbUoFnYoj+Ulq/BRi+Uqgq3
	ARdvabZj+gCEUBU6olg00Xicw9mFgwmdj1mOZ+G7/m0q5EEBu/1PeBaUrUlPdonbT6aM
	7gXw==
X-Gm-Message-State: ALoCoQmU9h9ZoUpnrh1usMN6tUp5YbqG4ICzSBj2dV/tqwmO7PqLkOCjtoFCUCK1wLTWEfu/O2Bl
X-Received: by 10.55.72.70 with SMTP id v67mr40050423qka.83.1446590319155;
	Tue, 03 Nov 2015 14:38:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Tue, 3 Nov 2015 14:38:19 -0800 (PST)
In-Reply-To: <87d1vqk67s.fsf@babayev.com>
References: <87d1vqk67s.fsf@babayev.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Nov 2015 22:38:19 +0000
Message-ID: <CAJTo0LbrjPSFEdc0q1yZmSsCyPQ0gPUxkCodiaUrve9B8ybKoA@mail.gmail.com>
To: Ruslan Babayev <ruslan@babayev.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LibreSSL support
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
X-List-Received-Date: Tue, 03 Nov 2015 22:38:39 -0000
Content-Type: multipart/alternative; boundary=001a114a97f61c066b0523aa8e05

--001a114a97f61c066b0523aa8e05
Content-Type: text/plain; charset=UTF-8

On 3 November 2015 at 23:34, Ruslan Babayev <ruslan@babayev.com> wrote:

> Please find attached the patch to add support for LibreSSL.
>

I think I'd prefer oe-core to have just the one provider of the openssl
APIs, so if oe-core sticks with openssl then libressl should go into
another layer, meta-networking maybe?

Ross

--001a114a97f61c066b0523aa8e05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2015 at 23:34, Ruslan Babayev <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ruslan@babayev.com" target=3D"_blank">ruslan@babayev.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3me" class=3D"=
a3s" style=3D"overflow:hidden">Please find attached the patch to add suppor=
t for LibreSSL.<br></div></blockquote></div><br>I think I&#39;d prefer oe-c=
ore to have just the one provider of the openssl APIs, so if oe-core sticks=
 with openssl then libressl should go into another layer, meta-networking m=
aybe?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a114a97f61c066b0523aa8e05--
