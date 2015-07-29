Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0453C75A60
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 16:27:34 +0000 (UTC)
Received: by padck2 with SMTP id ck2so8172025pad.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=h+LR4XdAEadTK45+tmtO0hBB6+kP/2eDBRPyUKlqJh8=;
	b=H9QYFBhVdYmJm34s72MXUAnfQWg7oS6iQTCKHL0hbUF4Qx2g/vy7Oo2c/fOWsJ5oXj
	FclaXp4gqdv0EcvEoQdvz1Wdi6go/QEWb5nhBjFPywI4K+FGWdNZHV84ThKeC9ke0PwQ
	wO/jXHNrLoeQbiPlM+uVUZmqf+G0kSeUjeScMuV5urmJCc37VHC8Ub909MXMEs2JAnaU
	89WQUttueOgJymZb2vhruoFJONsYTkzzrkVUQ4MWiJ+coR3LQFko+y1USKVh/REK+a3U
	4tdrdw7ISY1M1IE8krX2YPPHUZcKJUlThJf0sbY1UZ7OIlpDnRJFXc5CEpLkhLxR5ZAI
	Avvw==
X-Gm-Message-State: ALoCoQn5hI65keUbp9iHizLD9zlGh6m7jKDX7I6AzmLSekZ+eNe2OVMa4+H061KoYlclSa48nnjD
X-Received: by 10.66.157.167 with SMTP id wn7mr95442803pab.119.1438187254736; 
	Wed, 29 Jul 2015 09:27:34 -0700 (PDT)
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com.
	[209.85.192.179]) by smtp.gmail.com with ESMTPSA id
	bg7sm41661587pdb.29.2015.07.29.09.27.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 09:27:33 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbnt7 with SMTP id nt7so8552829pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:27:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.135.104 with SMTP id pr8mr94415472pdb.129.1438187252300; 
	Wed, 29 Jul 2015 09:27:32 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 09:27:32 -0700 (PDT)
In-Reply-To: <1438170429-sup-8609@axis.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com> <1438170429-sup-8609@axis.com>
Date: Wed, 29 Jul 2015 13:27:32 -0300
Message-ID: <CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
To: Olof Johansson <olof.johansson@axis.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Wed, 29 Jul 2015 16:27:39 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 8:48 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> Excerpts from Robert Yang's message of 2015-07-29 12:19:06 +0200:
>> It is just like what GNOME_GIT, GNU_MIRROR and others did.
>
> Tbh, I don't understand them either, but maybe that's just me. What is
> the reason? I think it makes it harder to see what is happening.

It allows for people to add local mirrors for example and even remap
fetching without touching the recipes. It is a good addition IMO.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

