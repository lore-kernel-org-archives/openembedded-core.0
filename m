Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 55C2C65CB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:18:38 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id z68so18279809vkg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 06:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=XwGxZxhDMbRH0ZWA51J6XGVor1y6fm4JXbqNBl6GySA=;
	b=f4H2skE3368v6ZBVLpmlNB1SsUDD6B3FNNSz61q4G2BfEGZproDZqKvapEAHMZQQNT
	SCRsWeV3rjaIZnlDxmKLs6z/hmeuXC2L0unj4HkMRBco63fpxPhA/dP+oe3WuHgq87Ra
	1cA0VTTEQo+b2oIg1inDNMI/qS+Fgkd1PEOqV75fu3OyVSe/2wZ0KjN0JQPgJfnwA07Y
	V0KGc1Sz4sksLjfdE6dMoc8Y8QYVPybRFNPaw+ZqPMHO3dfs8FqSm6o7j8b5vvvsaHeN
	A76muA/IwfiAZYwITRQXSIXgiVTCEu741f8/XHfCZj9P26QgxjhQi+QSYiIJ/C2JAZGQ
	uqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=XwGxZxhDMbRH0ZWA51J6XGVor1y6fm4JXbqNBl6GySA=;
	b=T8R5PyC+URA1Q5weg6GLSTG2p7OIpBSq5+tzeoLJWty8TDYMHY1EHVp6rmR17T6bNy
	L7olAdFPHVSKBvgn5kuLVterHnGBCiCY0HJm7kWHbzBkCWnmdKCGDDoLb/KaED2lKtoG
	MyHvSx7rhAu8Yeo0/E4aQCewxjOEhiXiRcLfYmDkV2mqrvb+VnZWPhdLIUpO2WUrRPIk
	GzoAYrW6GQbQtr4CidE/lHwP7x+7Nudl0jx+EX6Jp3J8CQJUWa9EhazbnMvmRurMxk2N
	kLHIGuuUUMaLWZsLABVvBEECPBdU7hlgkU5uwDzAsu93Q1+Mqmf7M/YxCMQOHh9tiXg0
	I//A==
X-Gm-Message-State: AD7BkJLfuu+8uSuuaqky1qrrMKF/ZjfbdLX8AvGVmqO9suQAk/wEP8/v1c8hqW4DJGlRAhvomtlAGif9jiB7EQ==
MIME-Version: 1.0
X-Received: by 10.159.39.42 with SMTP id a39mr1442279uaa.64.1458739118377;
	Wed, 23 Mar 2016 06:18:38 -0700 (PDT)
Received: by 10.103.84.156 with HTTP; Wed, 23 Mar 2016 06:18:38 -0700 (PDT)
In-Reply-To: <1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
References: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
	<1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
Date: Wed, 23 Mar 2016 07:18:38 -0600
Message-ID: <CACS+7ZRFa0j2tWsW2EyLhtHbBStsb8StE8EEt=LDGQ3eqP-_8g@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: =?UTF-8?Q?Ulrich_=C3=96lmann?= <u.oelmann@pengutronix.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Wed, 23 Mar 2016 13:18:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 23 March 2016 at 02:47, Ulrich =C3=96lmann <u.oelmann@pengutronix.de> wr=
ote:
> Hi Dan,
>
> On Tue, Mar 22, 2016 at 06:34:08PM -0600, Dan McGregor wrote:
>> On 17 Feb 2016 3:48 a.m., "Ulrich =C3=96lmann" <u.oelmann@pengutronix.de=
> wrote:
>> >
>> > Upstream nfs-utils use 'rpc-statd.service' and Yocto introduced
>> > 'nfs-statd.service' instead but forgot to update the mount.nfs helper
>> > 'start-statd' accordingly.
>> >
>> > Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
>> > ---
>> >  .../files/bugfix-adjust-statd-service-name.patch   | 34
>> ++++++++++++++++++++++
>> >  .../nfs-utils/nfs-utils_1.3.3.bb                   |  1 +
>> >  2 files changed, 35 insertions(+)
>> >  create mode 100644
>> meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-na=
me.patch
>
> [...]
>
>> I just got bit by this in jethro. Can it be backported?
>
> Backporting should be fairly simple, I assume you didn't give it a go.
> Try the patch that comes in my reply to this mail. It is untested as I do=
n't
> have the time at the moment, hence please report back if it works.
>

Oh, I did backport it locally, I was just hoping to get it into the
upstream jethro branch. Cherry picking your commit was pretty
straightforward.

Thanks,
Dan

> Regards
> Ulrich

