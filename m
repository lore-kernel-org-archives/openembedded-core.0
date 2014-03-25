Return-Path: <trevor.woerner@linaro.org>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAF76F907
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 00:11:21 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 142so16698656ykq.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 17:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=alaEu1pOhlqd9a3XnyekC/NbdLo61xTjBlNWSklTgPo=;
	b=Zmea5FrGDBjzyB4xxnSFHS0qILjYdWO9boiI0T8zDWGdgNVagxWG7g6+uRYb1FcDjE
	JzvbaSUhreAE0nZp/1kEfXmTVh8KNQAiQ3hDNA/9RkLbhHlBBmI2CxvWN+jIPnWidtxd
	DiHHdLwcbDemP+OqSZqIvC+Z7F1HA9+q74+dhhUBXysO08bOp5omTf+MS74LIrm/C0gn
	yccBe4F8SatQXTY/AM/Sasr9vDsI/bRfDV9RHSyn9Bpzg9NqgODYjRcRbIWl6qToyyVT
	hExSThfg7F09Cx3l4rK28uCW54uUpz303fcFocbG+J2lXMA5avd9rqaZ5gcTRGqiROlA
	EIcw==
X-Gm-Message-State: ALoCoQlwhbd4Y0Yd0KmzT6dpbJag5DprLe3nbfWdu1Kc1+2uqAo+yxGjnW8QjNspd6dpmXimK70D
X-Received: by 10.236.61.45 with SMTP id v33mr69209632yhc.20.1395706282426;
	Mon, 24 Mar 2014 17:11:22 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158]) by mx.google.com with ESMTPSA id
	u21sm25797984yhb.24.2014.03.24.17.11.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 24 Mar 2014 17:11:21 -0700 (PDT)
Message-ID: <5330C9A8.904@linaro.org>
Date: Mon, 24 Mar 2014 20:11:20 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>,
	yocto <yocto@yoctoproject.org>
References: <1395676843.24890.7.camel@ted>
In-Reply-To: <1395676843.24890.7.camel@ted>
Subject: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Tue, 25 Mar 2014 00:11:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/24/14 12:00, Richard Purdie wrote:
> I think from my perspective, in 1.7 I'd like to see us looking at
> "Developer Workflow".

Maybe I'm using things incorrectly :-)

But I often find that I'm switching between building different images.
For example, one moment I might be building core-image-minimal (CIM),
then later I'll want to build a GUI image with Wayland.

Switching between CIM and the GUI image requires changes to both
conf/local.conf and conf/bblayers.conf. I will either have two separate
sets of files and symlink between them, or I'll need to edit them by
hand to comment/uncomment out various blocks. I often get this wrong and
will need to restart a couple times before the build can hope to
complete successfully.

If I could wish for one workflow change, it would be the ability to
switch between various build configurations with the minimum of fuss:
- maybe the layer information could be contained within the
configuration file, then on the bitbake cmdline I could just say
"bitbake --conf wayland" or "bitbake --conf mycim" and it would know to
find and use conf/wayland.conf or conf/mycim.conf?
- maybe the local.conf could be renamed wayland.conf and the
bblayers.conf could be renamed wayland.bblayers then I could type
"bitbake --conf wayland" and it would know to look for wayland.conf and
wayland.bblayers?

Does this sort of workflow make sense to others? Or have people noticed
this and solved it in some clever way?

