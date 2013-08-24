Return-Path: <eric.nelson@boundarydevices.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id A254E6B8D5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 19:51:49 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id q10so1940699pdj.34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 12:51:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=mDoEBk51tewpGm5EIYP/fooZPr7lUf43iNytmD5vjDU=;
	b=EhefTJoeXizbdOlilD7/drXc6adRqZkNo2CQEvuNzM/3jHUAIdF/mFnIZCZX8HOggi
	9CWWAq0gkmfxfktpmDIILWSV/Q1NMCMv+MhuSTEfN3pZgCEJCCzrk4IubJ4a4YP1cxG5
	cP+I20L9zZ28SYZY/b4jR8w3wFlI4MlXmuu7EPpImpISGLAzkRIeXR2mEHsxPR57Divs
	qf28EuwIpf2wr8AeJiai2/bFP6eYHoMcVy3Iv3XBzGiPUZ3d6pFZiiNA2Rj8gwrQOGYZ
	OL3LCDKjAzw0UKJdG1XLEtWZLHYorKwCKewEn9qzn6+lEqYte7vRo22+t3tMgtL8iVcU
	RXDg==
X-Gm-Message-State: ALoCoQnsJ/jX6yqEs5Xb+TBhbABQwwt7E9bUGK+Y/STi18PsB41IU/tq0jCnyZXwlm+X7S9LvHVb
X-Received: by 10.68.204.165 with SMTP id kz5mr6406073pbc.159.1377373910290;
	Sat, 24 Aug 2013 12:51:50 -0700 (PDT)
Received: from [192.168.1.8] (ip98-167-230-131.ph.ph.cox.net. [98.167.230.131])
	by mx.google.com with ESMTPSA id zq10sm9410247pab.6.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 24 Aug 2013 12:51:49 -0700 (PDT)
Message-ID: <52190ED2.8090605@boundarydevices.com>
Date: Sat, 24 Aug 2013 12:51:46 -0700
From: Eric Nelson <eric.nelson@boundarydevices.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Laszlo Papp <lpapp@kde.org>
References: <1377362952-29061-1-git-send-email-eric.nelson@boundarydevices.com>
	<521905BF.4010908@linux.intel.com>
	<CAOMwXhOGuSNGHJogiDewqnd-_-JtahNwb6xxDPO3fgnkXNTGnw@mail.gmail.com>
	<52190895.3010208@boundarydevices.com>
	<CAOMwXhM+U5gQvgKcPXoovsxuCTfhKqb+PBH_F85j9v0KksuE=g@mail.gmail.com>
In-Reply-To: <CAOMwXhM+U5gQvgKcPXoovsxuCTfhKqb+PBH_F85j9v0KksuE=g@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-qt: add fix for QWSLock on qt4e
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
X-List-Received-Date: Sat, 24 Aug 2013 19:51:49 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks Laszlo,

On 08/24/2013 12:28 PM, Laszlo Papp wrote:
> Well, you should ask upstream about it... maybe it ended up in a
> decision it is the wrong way, and something better went in, or being
> planned to go in. I think a change should not be integrated like this in
> grey area.
>

I just posted to development@qt-project.org. Is that the right place?


