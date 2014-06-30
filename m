Return-Path: <scerveau@connected-labs.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id A4F73601A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 15:11:12 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id b13so8246315wgh.23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 08:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=haoFC3PPUaRetOqiLvywwrO5zN08kH5l8s1TFc9IhR4=;
	b=HAOKtH1tmh1IOOsK18JRqKr/5ieJoUamym8XGIsN1Uxiqg1Ti5nZqH15PqnwiWC4Pr
	TQjqCZM/cpSDURzaet4YQaqm2txfprBFWeglIej4rImZ14+ruIHFPmCiD05AsFP0Yf/N
	XYzfaxlGiBj8hq+MvPmNicCEvRBmaMxdDBg+jjYJa4Hr902xVouZKKdYdqnIzBLp8DQw
	pWebgN0y0TPNMPG9qeKMgQwqx+frtGbLB0tH8Y6HI1FmRjjBapRsg/6yd8NxsUZNX598
	T2NGsyhxSzcXbwwn8vX66nsn2JFEivKzhlDhhDM7+9N7ZBxGDEWgX+Jxvmmh8ztrSE94
	0z3Q==
X-Gm-Message-State: ALoCoQmVGcF3Px0jFeHIuBPH+cT3Nt86tm3fhz0sysQ238u1bweVCa+vsTUJ027WAifNU8AhO6Wt
X-Received: by 10.180.90.233 with SMTP id bz9mr29622993wib.42.1404141073451;
	Mon, 30 Jun 2014 08:11:13 -0700 (PDT)
Received: from [172.24.63.14]
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id s14sm10848949wij.1.2014.06.30.08.11.12
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 30 Jun 2014 08:11:12 -0700 (PDT)
Message-ID: <53B17E06.9060500@connected-labs.com>
Date: Mon, 30 Jun 2014 17:11:02 +0200
From: Stephane Cerveau <scerveau@connected-labs.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1404137924-14085-1-git-send-email-scerveau@connected-labs.com>	<53B17224.4050602@connected-labs.com>	<1404139876.6362.13.camel@ted>	<53B17CF5.9020008@connected-labs.com>
	<CAP9ODKpXm4ZT-4Dye-bY1gMnaznnQmS3FJ_u0_n8VX8tW0BQZA@mail.gmail.com>
In-Reply-To: <CAP9ODKpXm4ZT-4Dye-bY1gMnaznnQmS3FJ_u0_n8VX8tW0BQZA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dora][PATCH] e2fsprogs: Fix populate-extfs.sh
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
X-List-Received-Date: Mon, 30 Jun 2014 15:11:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Otavio,

I have been testing on dora branch.
I havent been testing on master and daisy, my mistake :(

On 06/30/2014 05:08 PM, Otavio Salvador wrote:
> On Mon, Jun 30, 2014 at 12:06 PM, Stephane Cerveau
> <scerveau@connected-labs.com> wrote:
>> Sorry i have been fooled by the poky web interface :(
>> Anyway the bug is real on dora branch.
> Which branch did you test it?
>
> You shouldn't say for backport something you didn't test.
>


