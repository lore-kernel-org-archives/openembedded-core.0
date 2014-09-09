Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id C23466B8F6
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 05:03:31 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id g10so9325702pdj.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Sep 2014 22:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=eK/4uOqwtRvhi5hMFW+KzKrZaWAqaCryU8UKvVTMlOc=;
	b=HJ+TReQfcxCMaHkKm5mEb8Eq3N396JfPVn81Y52e1aKDjDMkyZbW5SBEh//jO/U84s
	ugvoxhbxKlm2ve2ZrCQPDitpPDaud85/d+a/QKsvh++WVY1R6DmGFUz8lTmJTGDnw4w0
	HdIjCeSya185kNyZjz5hEjCmCRsUnKqqzHD+qPGVZxEMt4WWYzgqSe4LRQup3PaTmw6B
	IF0HfHtbSNIMybw24MjjiaHscwTqZ376TpYFosMd1SGpS6TqkAbLtvAxRWZVe09l9kNo
	u4mJsfO8+W82L3ZRp1MXM44UM5v9nETcpPY3k0vTpYIAUpUcvtbFpk1whVlUi0L4jv/h
	x3/g==
X-Received: by 10.70.140.163 with SMTP id rh3mr35183303pdb.53.1410239012287;
	Mon, 08 Sep 2014 22:03:32 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:fdfa:dfad:1b06:d652?
	([2601:c:9380:601:fdfa:dfad:1b06:d652])
	by mx.google.com with ESMTPSA id
	om6sm10425985pdb.89.2014.09.08.22.03.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Sep 2014 22:03:30 -0700 (PDT)
Message-ID: <540E8A1F.2010800@gmail.com>
Date: Mon, 08 Sep 2014 22:03:27 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1410227590-14190-1-git-send-email-akuster808@gmail.com>
Subject: Re: [PATCH] Adding new qemuppc64 machine config
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
X-List-Received-Date: Tue, 09 Sep 2014 05:03:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I forgot to mention. I will update linux-yocto_3.1x.bb too.

- Armin

On 09/08/2014 06:53 PM, Armin Kuster wrote:
> apply after "linux-yocto/3.14: configuration updates and feature merges."
>
>
> Armin Kuster (1):
>    qemuppc64: add machine
>
>   meta/conf/machine/qemuppc64.conf | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta/conf/machine/qemuppc64.conf
>

