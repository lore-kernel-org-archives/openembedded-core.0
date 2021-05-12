Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web08.3809.1620852253511254236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 13:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=m30vBef6;
 spf=none, err=SPF record not found (domain: verbum.org, ip: 64.147.123.24, mailfrom: walters@verbum.org)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id A6DF816F1;
	Wed, 12 May 2021 16:44:12 -0400 (EDT)
Received: from imap10 ([10.202.2.60])
  by compute1.internal (MEProxy); Wed, 12 May 2021 16:44:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NvzMZk
	rRcOK9BETrFhNKu5TiLFOOo0q8+uy05JHjNRE=; b=m30vBef6vnBzpgoooqJJRF
	3PLh9Rk57hy1GwfW1I5rXgEpmdUDF3/JJmiZp3tksTdFCrUDHVu2cLKeS6773RYh
	togFo3Jm19h/qC69ssq9G6d0rp/npbwGEUU+VA6orvT6ZIb/klYesoJQAypE/zn+
	oTSeR0TevxMPnp4VR91vOUvagGgdUzThRdA4IGwh/tXd/Sd1xXykAHJjGSwJOq8C
	O8lkOUL9hFa1VfVryVV8Nwb/a55p1L+cYGX078nWonhKPAjgt5T7/kzbx2qG/Upy
	us7yVMV9zqPKp9DpTOq6bplLa7vPGCWEgWjDos58tG/ody4TzKsChqNanXmC9OEQ
	==
X-ME-Sender: <xms:HD6cYAreXbeyuxkeFfKl54meoYSihTAv_mcKIirfwkDfiucH_f-UcQ>
    <xme:HD6cYGqiog2xIRHZgHB20P_gky80sqNQMLAE5WcZN2rNOaipzAWu8sU2VWSzMpwGO
    _zuSyBy7XI3pKlJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdehvddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfveho
    lhhinhcuhggrlhhtvghrshdfuceofigrlhhtvghrshesvhgvrhgsuhhmrdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeeutdetleeutdeileevjefgveeiteffueeuvdeiieefkeettefg
    leevveevleevhfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfigrlhhtvghr
    shesvhgvrhgsuhhmrdhorhhg
X-ME-Proxy: <xmx:HD6cYFO7QomYHu2x9CeoSDPm83D4ZAO-lPxEdLARxUqZxXtiMW8Pwg>
    <xmx:HD6cYH7AHVUyoPY4TxfAyktOgBro6-eE7GWlsLSlgfwDcmknfP8Z3g>
    <xmx:HD6cYP7tB-3dRleeM_N1xVsd81ONkfZdxazsnRsum50vbIk9NWXYtA>
    <xmx:HD6cYBFAxMm49xtyQD9AAdAv7JLXlYq5fZe1LhMAgFcbpNgjX86PFQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0B0BC4E00C8; Wed, 12 May 2021 16:44:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com>
In-Reply-To: 
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
Date: Wed, 12 May 2021 16:43:51 -0400
From: "colin walters" <walters@verbum.org>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] master/main branch renaming and bitbake
Content-Type: text/plain



On Wed, May 12, 2021, at 4:40 PM, Alexander Kanavin wrote:
> For ostree, yes:
> http://git.openembedded.org/meta-openembedded/log/?h=master-next
> 
> For the generic case, no. It's not a good idea to start guessing what 
> the upstream did.

What is the goal of the `branch=` specification?  I can understand it being *informative* for humans specifically when things like non-master/main branches e.g. `release-4.x`, `lts-`, `stable-` etc. are involved.

But why is bitbake explicitly checking it?  Is it to validate what the human expressed, or is it to try to cover some security aspect?  Something else?



