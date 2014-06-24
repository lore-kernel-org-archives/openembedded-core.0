Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id F10A261FE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 20:24:12 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id x3so818345qcv.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 13:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=iZdi2VOO4+2kw4E2uBVkbUgWs7EupCmlVqdyKy5ISJQ=;
	b=XavgFVit4T6xae83uIJ1GSPPjmtNzhkGClq6hxntJ7cSRoOQ0mGBoay+t2toJYBo2p
	fIgryAtPkGnUAwCbk5sabGO9W4r5yK03gHZX4h+Hv4wj0beqKrkPET53+XQpKlsc4JYP
	dA3qNg5S7+V0/RuUGz1XDLUBZSKvzOOKjHIEHYUSGV6z8v7kWprG06luLtaN9k/0Mkp4
	75xz4TJY3CJ+JsNJj6JKM1FmwbyPDDjfl2lGIWQkfpCEhvWXS2dd27OstH0TXgEb5MNY
	50m011lNC0ddQyBnRI36t+8qI1uMk2oXXZ/4dQyKm18+IyGUguuID/pkizwkwYR2waCD
	D6Gg==
X-Gm-Message-State: ALoCoQlgTvxwo2e9pIVb5pgIb+AYrw+oaVmqyNBsaRLSF5FhS6/9RuHm535KRzZv9R3irLxyb8A0
X-Received: by 10.140.91.226 with SMTP id z89mr5023158qgd.65.1403641453003;
	Tue, 24 Jun 2014 13:24:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.40 with HTTP; Tue, 24 Jun 2014 13:23:51 -0700 (PDT)
In-Reply-To: <53A33C63.9040209@gmail.com>
References: <539B27F0.90109@gmail.com>
	<CAJTo0Lauenh9=Mep+4ZUVPnjf0yJDdaCxbrNcB5vXEmtjn5-iA@mail.gmail.com>
	<53A0A2F0.2020701@gmail.com> <53A0A6D1.7010206@linux.intel.com>
	<53A33C63.9040209@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Jun 2014 21:23:51 +0100
Message-ID: <CAJTo0Lb_QXvNwGVi+p5feR9kYwSxXfL8k5kcfrHoPU7sdNXvVQ@mail.gmail.com>
To: =?UTF-8?Q?Miroslav_Ke=C5=A1?= <miroslav.kes@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cmake: respect ${S} and ${B} patch problem
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
X-List-Received-Date: Tue, 24 Jun 2014 20:24:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 June 2014 20:39, Miroslav Ke=C5=A1 <miroslav.kes@gmail.com> wrote:
> I'm doing it first time in my life. Hoping I understood the instructions =
correctly.

The best way to send the patch would be something like:

git send-email --to oe-core HEAD^ --subject-prefix=3DPATCH][V2

(send to oe-core the current commit, marking the subject with PATCH and V2)

However the patch as attached doesn't apply to master for some reason,
so as it's so small I re-created it and have just submitted it.
Ross

