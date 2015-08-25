Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 2A8A376B1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:08:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8754120B87
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 12:08:33 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Tue, 25 Aug 2015 12:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=2JY4ztFpj6TkJfQ
	E3rJM2FId7lo=; b=N5ipHvnuwinA6+LyZznYbGRnupbAbhf6VxmeOFwexyA3shN
	Kh1yCk04cZqkXbRjnQW46fFDEQ89Lld/lxnN9esO2hNOF/XSg7Qv9nr0XuhhQZZa
	W5ej0HyB6Y45QcaOjSp5egp55NsANv8EIfNn9r+TM/1LyMQQz3xO8AmpOlHM=
X-Sasl-enc: dx4NZSW6JLxG9GiQEeuPT4LqpOeRkRjzkbKhBt/D5yHY 1440518912
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id B7021C0001F;
	Tue, 25 Aug 2015 12:08:32 -0400 (EDT)
Message-ID: <1440518911.1644.14.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Aug 2015 19:08:31 +0300
In-Reply-To: <CABcZANk9XTsf7km9HYK_NYv_MpfE3LkkgvFyWXTjRQjmb+yY4A@mail.gmail.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
	<b22733643db015ebedf00241ab7ef40a0ee50a7b.1440454579.git.chris_larson@mentor.com>
	<1440491751.5373.27.camel@iki.fi>
	<CABcZANk9XTsf7km9HYK_NYv_MpfE3LkkgvFyWXTjRQjmb+yY4A@mail.gmail.com>
X-Mailer: Evolution 3.16.3-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
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
X-List-Received-Date: Tue, 25 Aug 2015 16:08:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-25 at 07:26 -0700, Christopher Larson wrote:
> On Tue, Aug 25, 2015 at 1:35 AM, Tanu Kaskinen <tanuk@iki.fi> wrote:
> 
> > I think a configure option like --allow-autospawn-for-root-by-default
> > would be nicer than patching configuration files like this. What do you
> > (and others) think? I'm not against applying this patch for now, but if
> > I'm not alone with this preference, I'll add the configure option later
> > myself.
> 
> 
> It needs to stay a runtime configuration file option for administrators,
> no? We're just changing the default. So I'm not sure that having a
> configure option do it or us do it really changes all that much,
> particularly since it's probably unlikely that upstream would be interested
> in such a patch.

Yes, the configure option would not change things much, the only point
would be to make it slightly easier for embedded system builders to
change the configuration. Setting a configure option should be simpler
than patching the configuration file. Having this in upstream would
make sense, because this issue is not specific to OpenEmbedded.

-- 
Tanu

