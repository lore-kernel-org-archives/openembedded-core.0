Return-Path: <msm-oss@mcclintock.net>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 1C15F77CE4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 19:17:22 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id 21so44248015pgg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 12:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mcclintock.net; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z7Kmgl4HHHMB2+f8PT1NaJoLXNc1uhZbp73o5DOgiIk=;
	b=FCCp5PMaQKs59loOo2YG9SFVDnuZsIe508NMUsJQ3O9LI6sDMXz+Aj5zFKnqSpF30Q
	PyzY2nEEWN9YkHrvzVnCGzE2NK5+HbIbCcPsAh2MH8Wny3WKTzfJ7gwPPcixy28bqs+M
	3cylilTfHEPieCioP/jOdgr6F2M81CQ4Bu2Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z7Kmgl4HHHMB2+f8PT1NaJoLXNc1uhZbp73o5DOgiIk=;
	b=MqPxtECRHyjpRgvVzU1T+OdFvy2FXEeKEqbXDSXb4Qym8JohwQLb9gejIOoENslkKw
	miSlckDr910mJZzqQ934ea3YIULtM8/0Q0eEaM2HEG2BY4cnynr6le4umuqh5b/Vih3v
	QvXGfx/xpwgwbW+ZA2S1edz0hDmWlj3nL1z91Jk/gxIn2MXlGcBwKgFaa1tVHCWDL5j4
	DyE/TBndir/Uw5NVZ+pU4PhdwKTxuoncc9LDJ8OAGQ1l6gctossoRX3NlPB4O4JmWTQI
	PRMIf5/ZvEASc/k60jlInYx3wKSaG0n4D/YTXBWfR5KeR0TAgMZgJd+pjR2cpTaFYzi6
	HyEA==
X-Gm-Message-State: AFeK/H39Nq3zvFsum6fi14w5iD09aIsUCIGxGCGQpU6XSbyVbFvD3vLgvcBmXb3773IarEbL35IMADPt08o/3Q==
X-Received: by 10.99.219.21 with SMTP id e21mr37437450pgg.70.1491506244193;
	Thu, 06 Apr 2017 12:17:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.153.197 with HTTP; Thu, 6 Apr 2017 12:17:03 -0700 (PDT)
In-Reply-To: <CAGQ4JX27J_dh=2wPJ=1Gp_=1T6KL2rcL3EhxNTx4BF=ukLwxJA@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
	<CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
	<CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
	<CAGQ4JX1ibcWeYV7NfYSB8cCOYH=83XEON1=sf4U9S378A16p8w@mail.gmail.com>
	<CAGQ4JX27J_dh=2wPJ=1Gp_=1T6KL2rcL3EhxNTx4BF=ukLwxJA@mail.gmail.com>
From: Matthew McClintock <msm-oss@mcclintock.net>
Date: Thu, 6 Apr 2017 14:17:03 -0500
Message-ID: <CAEsOVNf_wSreuAQk7mGMAbWN44PGo35WfcshbggzJ14OjvYVog@mail.gmail.com>
To: Ravi chandra reddy <vlsireddy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Thu, 06 Apr 2017 19:17:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy <vlsireddy@gmail.com> wrote:
> Hi,
>      Is there any hidden pointer within these static dev packages. i
> expected the library to be .a format. what can i understand from these
> static dev packages, plz let me know.

Can you expand on what you're trying to accomplish? Are you trying to
build a static binary? I don't think you actually are trying to
install libxml2.a on the running image are you? Maybe you really want
an SDK with a sysroot populated with static libraries so you can link
against them?

-M

