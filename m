Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 5160D72130
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 11:15:24 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id z60so5498056qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2015 03:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pp9icTqdSYmkulDRwNbGyYtPT0P9lxJYmm6tgyAP3co=;
	b=gNvfVefHqP4ENd7vUDPHionE5P/YlrxP63n4NC/BE219t557Yahx5KNbOOmH7EGQF+
	ruwMBtk3RpNyhWdHkkjxM/5DWZ/e28ZZeLJGixdVh1MaQ6Cv/QAFdlIMFoGNztpf2Ul7
	XvccwH2KCvF/phK7rl+YUxExtl9fFortKCqXcdt0f+Q5b+Wdov3IgYMESz/roeIohZwk
	4JueNtIVSgktgWbyuMuZyCvZQBzU8mV7AuTTYFq7BiLO/dirnOL4Nj1cRpCkkWFXvKs9
	qeE1w/o7EeW1PH+uqrlKQjnMpxiKSx+EUVFATKdWOYbJn4VUWX44/EEKUDd2gh0j8JIX
	rDXQ==
X-Gm-Message-State: ALoCoQnptFRmCLADdheQYJAjHoCQVrM7E7lAvRK8oK7NZA3PWCHqR++veUhyEDKtt/+cSvRG54GW
X-Received: by 10.55.50.74 with SMTP id y71mr5545385qky.51.1425294925972; Mon,
	02 Mar 2015 03:15:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Mon, 2 Mar 2015 03:15:04 -0800 (PST)
In-Reply-To: <54F43BA5.8010101@urbanec.net>
References: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
	<54F0756E.7020205@urbanec.net>
	<CAJTo0LbPVzhW9C7e3-2J45Yc5HiTEsby=c95PuaCRhF+bV01tQ@mail.gmail.com>
	<54F43BA5.8010101@urbanec.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 2 Mar 2015 11:15:04 +0000
Message-ID: <CAJTo0LZehYsqOWkR+EzMGxo21azq+7T+ftcT6pb3XRwtfVUzbg@mail.gmail.com>
To: Peter Urbanec <openembedded-devel@urbanec.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/1] Python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Mon, 02 Mar 2015 11:15:25 -0000
Content-Type: multipart/alternative; boundary=001a11470ce2c362de05104c5544

--001a11470ce2c362de05104c5544
Content-Type: text/plain; charset=UTF-8

On 2 March 2015 at 10:29, Peter Urbanec <openembedded-devel@urbanec.net>
wrote:

> I'm completely in favour of this change from the security point of view.
> However, it is likely to trip up a few people, so the change in behaviour
> should be prominently highlighted in the release notes. I also think that
> it may be a good idea to keep 2.7.3 around so that it is possible to move
> to new oe-core and keep the old python around.


Yes, this is an important change and I'll ensure it's in the release notes.

Ross

--001a11470ce2c362de05104c5544
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 March 2015 at 10:29, Peter Urbanec <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:openembedded-devel@urbanec.net" target=3D"_blank">openembedded-devel@u=
rbanec.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">I&#39;m =
completely in favour of this change from the security point of view. Howeve=
r, it is likely to trip up a few people, so the change in behaviour should =
be prominently highlighted in the release notes. I also think that it may b=
e a good idea to keep 2.7.3 around so that it is possible to move to new oe=
-core and keep the old python around.</blockquote></div><br></div><div clas=
s=3D"gmail_extra">Yes, this is an important change and I&#39;ll ensure it&#=
39;s in the release notes.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">Ross</div></div>

--001a11470ce2c362de05104c5544--
