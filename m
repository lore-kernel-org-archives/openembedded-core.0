Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7517B6C45B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:49:28 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id g12so2860701wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=JqfSS5HMapyubErMKRoQkvAjP2xk/20bpJoRn2EM75g=;
	b=b0Znl7VvxEwkWo65bgjIwxvedcDme4JCu6CWDBDYvvGEgn2mQIbr42aWTJTkTuYaZp
	cVYPwl5JHdVdsqci1JX0dCpU04536sAU1Q6G4g6udASxIEFa2mvitcI3wDXK5NQY374t
	Ep8fNOCpWBkamDIM3RIIWg+xKuOlpdzV25e4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=JqfSS5HMapyubErMKRoQkvAjP2xk/20bpJoRn2EM75g=;
	b=sw4vq3pC+KE25hBY7LduxrEQI7RZuFoaBFBQPtkKNKv/L9feId7xnON0ccEnWvvyjh
	1N3TezZH+xu8v5LOh+OZvRgpNAGmgEReODgZpanqVzf3FC3Z3inTCo3sw2/xlQNAWKnJ
	BKdxYeuNQQ9vn/UZaDE4sRgJRo0aXgqqXfauwK/hhEz1Fwz4rRwySGdH8TSXsuKi9rQd
	VGPhIju0eabenxhjz3ZDLN2gNpD8OdAg8kEqMdm4pHYDVmjgDhZjM5oSljVqL2ng+dgG
	UXibNoCKbifAIS+yKqgMNLtCBy/dQ/4DozG1Mok2cP64sHN9vIHC3nZxdKsz0Li9s5XE
	+WfQ==
X-Gm-Message-State: APjAAAXFuf/NOKfHIk0aYSJTbAWK4Jdy3euelmKJFRYR6txKmtNdhyIb
	flOyIdq9izLZumd+GzhPSXP3fA==
X-Google-Smtp-Source: APXvYqxYZQ0wZC646E+N6/oj3FbdzFC3J49oal2USPljGT9vokA+A91kL6QqEKrhivMk+XH88Ry60g==
X-Received: by 2002:a5d:48ca:: with SMTP id p10mr23340015wrs.141.1553089769120;
	Wed, 20 Mar 2019 06:49:29 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 3sm2593777wrk.68.2019.03.20.06.49.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 20 Mar 2019 06:49:28 -0700 (PDT)
Message-ID: <403158219480ee625c2c964a13e34e86d39d75d7.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mike Looijmans <mike.looijmans@topicproducts.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2019 13:49:24 +0000
In-Reply-To: <DB7PR04MB5260B9653799DEC3007746D696410@DB7PR04MB5260.eurprd04.prod.outlook.com>
References: <c7b19826-0eb6-2e9d-1369-9d407895826b@topic.nl>
	,<3c87f366b69756abc62d37aac4e4683d75237c79.camel@linuxfoundation.org>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.a99fb5d8-cc6c-4a3e-a4ad-a9061f2e0005.dc07b4be-8b33-4a3d-b939-cd4cc47c7fd5@emailsignatures365.codetwo.com>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.763ce73e-6205-4019-bec9-01cad35df181.df7353f9-1420-4af9-920c-af948b3280d2@emailsignatures365.codetwo.com>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.820697f9-bebc-4872-bcbe-1b38e7cfdfbf.9c5c634b-6d16-4185-8819-dc9672664807@emailsignatures365.codetwo.com>
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.8b4a2dd3-a699-45a1-848d-b428d186e5a5.c66ff264-ed5d-41a9-af29-2418ad1b8346@emailsignatures365.codetwo.com>
	<DB7PR04MB5260B9653799DEC3007746D696410@DB7PR04MB5260.eurprd04.prod.outlook.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: Cannot get bitbake multiconfig to work
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
X-List-Received-Date: Wed, 20 Mar 2019 13:49:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-03-20 at 13:44 +0000, Mike Looijmans wrote:
> I tried providing MACHINE in local.conf, which just resulted in a
> build for that machine, and whatever multiconfig I passed on the
> commandline still got completely ignored. I even put "garbage" into
> the pmu.conf file and it was happy with that too.

Its hard for me to know what to say to that.

We have a test for multiconfig now:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=d9018a3d9c828551c465b68b27920ec4681524ae

If you configure a multiconfig and then try and build it with something
like "bitbake multiconfig:pmu:XXX" then it should build XXX for the
MACHINE set in the pmu multiconfig. You are hard setting things like
the MACHINE in the pmu.conf?

Does:

bitbake -e -b multiconfig:pmu:bash | grep MACHINE=

show what you'd expect?

If its still not working we need to be able to replicate the
configuration that isn't working or at least see the local.conf and
pmu.conf that don't work. We simply don't have enough info other than
to speculate on what might be wrong.

Cheers,

Richard


